----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		Peter Fall
-- 
-- Create Date:    5 June 2011 
-- Design Name: 
-- Module Name:    UDP_TX - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--		handle simple UDP TX
--		doesnt generate the checksum(supposedly optional)
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Revision 0.02 - Added abort of tx when receive last from upstream
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.axi.all;
use work.ipv4_types.all;

entity UDP_TX is
    Port (
			-- UDP Layer signals
			udp_tx_start			: in std_logic;							-- indicates req to tx UDP
			udp_txi					: in udp_tx_type;							-- UDP tx cxns
			udp_tx_result			: out std_logic_vector (1 downto 0);-- tx status (changes during transmission)
			udp_tx_data_out_ready: out std_logic;							-- indicates udp_tx is ready to take data
			-- system signals
			clk 						: in  STD_LOGIC;							-- same clock used to clock mac data and ip data
			reset 					: in  STD_LOGIC;
			-- IP layer TX signals
			ip_tx_start				: out std_logic;
			ip_tx						: out ipv4_tx_type;							-- IP tx cxns
			ip_tx_result			: in std_logic_vector (1 downto 0);		-- tx status (changes during transmission)
			ip_tx_data_out_ready	: in std_logic									-- indicates IP TX is ready to take data
			);
end UDP_TX;

architecture Behavioral of UDP_TX is
	type tx_state_type is (IDLE, PAUSE, SEND_UDP_HDR, SEND_USER_DATA, IDLE_WAIT);
			
	type count_mode_type is (RST, INCR, HOLD);
	type cnt_type is (RST, INCR, HOLD);
	type settable_cnt_type is (RST, SET, INCR, HOLD);
	type set_clr_type is (SET, CLR, HOLD);

	-- TX state variables
	signal udp_tx_state		: tx_state_type;
	signal tx_count 			: unsigned (15 downto 0);
	signal tx_result_reg		: std_logic_vector (1 downto 0);
	signal ip_tx_start_reg	: std_logic;
	signal data_out_ready_reg	: std_logic;

	signal tx_data			: std_logic_vector (7 downto 0);
	signal set_last			: std_logic;

	signal tx_data_valid	: std_logic;			-- indicates whether data is valid to tx or not

	signal udp_hdr_first_done: std_logic;
	-- tx temp signals
	signal total_length		: std_logic_vector (15 downto 0);	-- computed combinatorially from header size
	

-- IP datagram header format
--
--	0          4          8                      16      19             24                    31
--	--------------------------------------------------------------------------------------------
--	|              source port number            |              dest port number               |
--	|                                            |                                             |
--	--------------------------------------------------------------------------------------------
--	|                length (bytes)              |                checksum                     |
--	|          (header and data combined)        |                                             |
--	--------------------------------------------------------------------------------------------
--	|                                          Data                                            |
--	|                                                                                          |
--	--------------------------------------------------------------------------------------------
--	|                                          ....                                            |
--	|                                                                                          |
--	--------------------------------------------------------------------------------------------
		
begin
	-----------------------------------------------------------------------
	-- combinatorial process to implement FSM and determine control signals
	-----------------------------------------------------------------------

  udp_tx_result <= UDPTX_RESULT_NONE when (udp_tx_start = '1') and (ip_tx_start_reg = '0') else
                   tx_result_reg;

  ip_tx.data.data_out_valid <= tx_data_valid; -- and ip_tx_data_out_ready;
  udp_tx_data_combinatorial_proc: process(
    udp_tx_state, total_length, udp_txi,
    ip_tx_start_reg,
    tx_data, ip_tx_data_out_ready, set_last)
  begin
    -- total length = user data length + header length (bytes)
    total_length <= std_logic_vector(unsigned(udp_txi.hdr.data_length) + 8);
    ip_tx_start <= ip_tx_start_reg;
    ip_tx.hdr.data_length <= total_length;
    ip_tx.hdr.dst_ip_addr <= udp_txi.hdr.dst_ip_addr;
    ip_tx.hdr.protocol <= x"11";	-- UDP protocol
    ip_tx.data.data_out_last <= set_last;
    udp_tx_data_out_ready <= '0';

    case udp_tx_state is
      when SEND_USER_DATA =>
        -- ip_tx.data.data_out <= udp_txi.data.data_out;
        udp_tx_data_out_ready <= ip_tx_data_out_ready;	-- in this state, we can accept user data if IP TX rdy
        ip_tx.data.data_out <= tx_data;
      when SEND_UDP_HDR =>
        ip_tx.data.data_out <= tx_data;
      when others =>
        ip_tx.data.data_out <= (others => '0');
    end case;
  end process;

	-----------------------------------------------------------------------------
	-- sequential process to action control signals and change states and outputs
	-----------------------------------------------------------------------------

  udp_tx_data_proc: process(clk)
    -- variable tx_count: unsigned(15 downto 0) := (others => '0');
    variable tx_count_mode: cnt_type;
  begin
    if rising_edge(clk) then
      if reset = '1' then
        tx_data <= (others => '0');
        tx_count <= (others => '0');
        tx_count_mode := RST;
        tx_result_reg <= UDPTX_RESULT_NONE;
        set_last <= '0';
        udp_hdr_first_done <= '0';
        ip_tx_start_reg <= '0';
        tx_data_valid <= '0';
        udp_tx_state <= IDLE;
      else
        set_last <= '0';
        tx_data_valid <= '0';
        ip_tx_start_reg <= '0';

        case udp_tx_state is
          when IDLE =>
            tx_data <= (others => '0');
            tx_count <= (others => '0');
            tx_count_mode := RST;
            tx_result_reg <= UDPTX_RESULT_NONE;
            udp_hdr_first_done <= '0';
            ip_tx_start_reg <= '0';
            -- in this state, we are unable to accept user data for tx
            if udp_tx_start = '1' then
              if unsigned(udp_txi.hdr.data_length) > 1472 then
                tx_result_reg <= UDPTX_RESULT_ERR;
              else
                tx_result_reg <= UDPTX_RESULT_SENDING;
                udp_tx_state <= PAUSE;
              end if;
            end if; -- udp_tx_start = '1'
          when PAUSE =>
            -- delay one clock for IP layer to respond to ip_tx_start and remove any tx error result
            udp_tx_state <= SEND_UDP_HDR;
            -- udp_tx_data_out_ready <= '0';		-- in this state, we are unable to accept user data for tx
          when SEND_UDP_HDR =>
            ip_tx_start_reg <= '1';
            -- udp_tx_data_out_ready <= '0';		-- in this state, we are unable to accept user data for tx
            tx_data_valid <= '1';
            if ip_tx_result = IPTX_RESULT_ERR then
              ip_tx_start_reg <= '0';
              tx_result_reg <= UDPTX_RESULT_ERR;
              udp_tx_state <= IDLE_WAIT;
              tx_data_valid <= '0';
            elsif ip_tx_data_out_ready = '1' then
              tx_count_mode := INCR;
              case tx_count is
                when x"0000"  => tx_data <= udp_txi.hdr.src_port (7 downto 0);
                when x"0001"  => tx_data <= udp_txi.hdr.dst_port (15 downto 8);	-- dst port
                when x"0002"  => tx_data <= udp_txi.hdr.dst_port (7 downto 0);
                when x"0003"  => tx_data <= total_length (15 downto 8);				-- length
                when x"0004"  => tx_data <= total_length (7 downto 0);
                when x"0005"  => tx_data <= udp_txi.hdr.checksum (15 downto 8);	-- checksum (set by upstream)
                when x"0006"  => tx_data <= udp_txi.hdr.checksum (7 downto 0);
                                 udp_tx_state <= SEND_USER_DATA;
                                 tx_count_mode := RST;
                when others =>
                  tx_result_reg <= UDPTX_RESULT_ERR;
                  udp_tx_state <= IDLE_WAIT;
              end case;
            else
              tx_count_mode := HOLD;
              tx_data <= udp_txi.hdr.src_port (15 downto 8);	-- src port
            end if; -- ip_tx_data_out_ready = '1'
          when SEND_USER_DATA =>
            -- udp_tx_data_out_ready <= ip_tx_data_out_ready;	-- in this state, we can accept user data if IP TX rdy
            tx_data <= udp_txi.data.data_out;
            tx_data_valid <= udp_txi.data.data_out_valid;
            if ip_tx_data_out_ready = '1' then
              if udp_txi.data.data_out_valid = '1' or tx_count = x"000" then
                -- only increment if ready and valid has been subsequently established, otherwise data count moves on too fast
                if unsigned(tx_count) = unsigned(udp_txi.hdr.data_length) then
                  -- TX terminated due to count - end normally
                  set_last <= '1';
                  udp_tx_state <= IDLE_WAIT;
                  ip_tx_start_reg <= '0';

                  if udp_txi.data.data_out_last = '1' then
                    tx_result_reg <= UDPTX_RESULT_SENT;
                  else
                    tx_result_reg <= UDPTX_RESULT_ERR;
                  end if;
                elsif udp_txi.data.data_out_last = '1' then
                  -- terminate tx with error as got last from upstream before exhausting count
                  set_last <= '1';
                  tx_result_reg <= UDPTX_RESULT_ERR;
                  ip_tx_start_reg <= '0';
                  udp_tx_state <= IDLE_WAIT;
                else
                  -- TX continues
                  tx_count_mode := INCR;
                end if;
              end if; -- udp_txi.data.data_out_valid = '1' or tx_count = x"000"
            elsif ip_tx_result = IPTX_RESULT_ERR then
              ip_tx_start_reg <= '0';
              tx_result_reg <= UDPTX_RESULT_ERR;
              udp_tx_state <= IDLE_WAIT;
            end if; -- ip_tx_data_out_ready = '1'
          when IDLE_WAIT =>
            --if udp_tx_start isn't set to '0' with 1 clock earlier, the
            --transition of udp_tx_state to IDLE will cause a wrong restart of
            -- another udp start
            udp_tx_state <= IDLE;
        end case; -- udp_tx_state

        case tx_count_mode is
          when RST  => tx_count <= x"0000";
          when INCR => tx_count <= tx_count + 1;
          when HOLD => tx_count <= tx_count;
        end case;

      end if; -- reset = '1'
    end if; -- rising_edge(clk)
  end process;

  tx_sequential : process (clk,reset,data_out_ready_reg)
  begin
    if rising_edge(clk) then
      data_out_ready_reg <= ip_tx_data_out_ready;
    else
      data_out_ready_reg <= data_out_ready_reg;
    end if;

  end process;

end Behavioral;

