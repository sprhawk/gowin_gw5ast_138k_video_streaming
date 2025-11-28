----------------------------------------------------------------------------------
-- Company: 
-- Engineer:            Peter Fall
-- 
-- Create Date:    16:20:42 06/01/2011 
-- Design Name: 
-- Module Name:    IPv4_TX - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--              handle simple IP TX
--              doesnt handle segmentation
--              dest MAC addr resolution through ARP layer
--              Handle IPv4 protocol
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Revision 0.02 - fixed up setting of tx_result control defaults
-- Revision 0.03 - Added data_out_first
-- Revision 0.04 - Added handling of broadcast address
-- Revision 0.05 - Fix cks calc when add of high bits causes another ovf
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.axi.all;
use work.ipv4_types.all;
use work.arp_types.all;

entity IPv4_TX is
  port (
    -- IP Layer signals
    ip_tx_start          : in  std_logic;
    ip_tx                : in  ipv4_tx_type;                   -- IP tx cxns
    ip_tx_result         : out std_logic_vector (1 downto 0);  -- tx status (changes during transmission)
    ip_tx_data_out_ready : out std_logic;  -- indicates IP TX is ready to take data

    -- system signals
    clk                : in  std_logic;  -- same clock used to clock mac data and ip data
    reset              : in  std_logic;
    our_ip_address     : in  std_logic_vector (31 downto 0);
    our_mac_address    : in  std_logic_vector (47 downto 0);
    -- ARP lookup signals
    arp_req_req        : out arp_req_req_type;
    arp_req_rslt       : in  arp_req_rslt_type;
    -- MAC layer TX signals
    mac_tx_req         : out std_logic;  -- indicates that ip wants access to channel (stays up for as long as tx)
    mac_tx_granted     : in  std_logic;  -- indicates that access to channel has been granted            
    mac_data_out_ready : in  std_logic;  -- indicates system ready to consume data
    mac_data_out_valid : out std_logic;  -- indicates data out is valid
    mac_data_out_first : out std_logic;  -- with data out valid indicates the first byte of a frame
    mac_data_out_last  : out std_logic;  -- with data out valid indicates the last byte of a frame
    mac_data_out       : out std_logic_vector (7 downto 0)  -- ethernet frame (from dst mac addr through to last byte of frame)      
    );
end IPv4_TX;

architecture Behavioral of IPv4_TX is

  type tx_state_type is (
    IDLE,
    WAIT_MAC,                           -- waiting for response from ARP for mac lookup
    WAIT_CHN,                           -- waiting for tx access to MAC channel
    SEND_ETH_HDR,                       -- sending the ethernet header
    SEND_IP_HDR,                        -- sending the IP header
    SEND_USER_DATA                      -- sending the users data
    );

  type crc_state_type is (IDLE, TOT_LEN, ID, FLAGS, TTL, CKS, SAH, SAL, DAH, DAL, ADDOVF, FINAL, WAIT_END);

  type count_mode_type is (RST, INCR, HOLD);
  type settable_cnt_type is (RST, SET, INCR, HOLD);
  type set_clr_type is (SET, CLR, HOLD);

  -- Configuration

  constant IP_TTL : std_logic_vector (7 downto 0) := x"80";

  -- TX state variables
  signal tx_state               : tx_state_type;
  signal tx_count               : unsigned (11 downto 0);
  signal tx_result_reg          : std_logic_vector (1 downto 0);
  signal tx_mac                 : std_logic_vector (47 downto 0);
  signal tx_mac_chn_reqd        : std_logic;
  signal tx_hdr_cks             : std_logic_vector (23 downto 0);
  signal mac_lookup_req         : std_logic;
  signal crc_state              : crc_state_type;
  signal arp_req_ip_reg         : std_logic_vector (31 downto 0);
  signal mac_data_out_ready_reg : std_logic;
  signal tx_data                : std_logic_vector(7 downto 0);

  -- tx control signals
  signal next_tx_state   : tx_state_type;
  signal set_tx_state    : std_logic;
  signal next_tx_result  : std_logic_vector (1 downto 0);
  signal set_tx_result   : std_logic;
  signal tx_mac_value    : std_logic_vector (47 downto 0);
  signal set_tx_mac      : std_logic;
  -- signal tx_count_val    : unsigned (11 downto 0);
  -- signal tx_count_mode   : settable_cnt_type;
  signal set_chn_reqd    : set_clr_type;
  signal set_mac_lku_req : set_clr_type;
  signal tx_data_valid   : std_logic;   -- indicates whether data is valid to tx or not
  signal data_out_first_done: std_logic;

  -- tx temp signals
  signal total_length : std_logic_vector (15 downto 0);  -- computed combinatorially from header size


  function inv_if_one(s1 : std_logic_vector; en : std_logic) return std_logic_vector is
    --this function inverts all the bits of a vector if
    --'en' is '1'.
    variable Z : std_logic_vector(s1'high downto s1'low);
  begin
    for i in (s1'low) to s1'high loop
      Z(i) := en xor s1(i);
    end loop;
    return Z;
  end inv_if_one;  -- end function


-- IP datagram header format
--
--      0          4          8                      16      19             24                    31
--      --------------------------------------------------------------------------------------------
--      | Version  | *Header  |    Service Type      |        Total Length including header        |
--      |   (4)    |  Length  |     (ignored)        |                 (in bytes)                  |
--      --------------------------------------------------------------------------------------------
--      |           Identification                   | Flags |       Fragment Offset               |
--      |                                            |       |      (in 32 bit words)              |
--      --------------------------------------------------------------------------------------------
--      |    Time To Live     |       Protocol       |             Header Checksum                 |
--      |     (ignored)       |                      |                                             |
--      --------------------------------------------------------------------------------------------
--      |                                   Source IP Address                                      |
--      |                                                                                          |
--      --------------------------------------------------------------------------------------------
--      |                                 Destination IP Address                                   |
--      |                                                                                          |
--      --------------------------------------------------------------------------------------------
--      |                          Options (if any - ignored)               |       Padding        |
--      |                                                                   |      (if needed)     |
--      --------------------------------------------------------------------------------------------
--      |                                          Data                                            |
--      |                                                                                          |
--      --------------------------------------------------------------------------------------------
--      |                                          ....                                            |
--      |                                                                                          |
--      --------------------------------------------------------------------------------------------
--
-- * - in 32 bit words 
  
begin
  -----------------------------------------------------------------------
  -- combinatorial process to implement FSM and determine control signals
  -----------------------------------------------------------------------

  tx_data_combinatorial_proc: process(
    tx_state,
    mac_data_out_ready,
    data_out_first_done,
    ip_tx)
  begin
    mac_data_out_first <= '0';
    mac_data_out_last <= '0';
    ip_tx_data_out_ready <= '0';
    -- total length = user data length + header length (bytes)
    -- total_length <= std_logic_vector(unsigned(ip_tx.hdr.data_length) + 20);
    case tx_state is
      when SEND_ETH_HDR | SEND_IP_HDR =>
        if (mac_data_out_ready = '1') and (data_out_first_done = '0') then
          mac_data_out_first <= mac_data_out_ready;
        end if;
      when SEND_USER_DATA =>
        mac_data_out_last <= ip_tx.data.data_out_last;
        ip_tx_data_out_ready <= mac_data_out_ready;
      when others =>
    end case;

  end process;

  -----------------------------------------------------------------------------
  -- sequential process to action control signals and change states and outputs
  -----------------------------------------------------------------------------

  arp_req_req.lookup_req <= mac_lookup_req;
  arp_req_req.ip <= arp_req_ip_reg;
  mac_tx_req <= tx_mac_chn_reqd;
  ip_tx_result <= tx_result_reg;
  mac_data_out_valid <= tx_data_valid; -- and mac_data_out_ready;
  mac_data_out <= tx_data;
  
  
  tx_data_seq_proc: process(clk)
    -- variable tx_count: unsigned(11 downto 0) := (others => '0');
    variable tx_count_mode: count_mode_type;
    variable first_done: std_logic;
  begin
    if rising_edge(clk) then
      if reset = '1' then
        tx_count <= (others => '0');
        tx_count_mode := RST;
        set_chn_reqd <= CLR;
        -- tx_count_val <= (others => '0');
        tx_result_reg <= IPTX_RESULT_NONE;
        tx_state <= IDLE;
        tx_mac <= (others => '0');
        tx_data <= (others => '0');
        tx_data_valid <= '0';
        data_out_first_done <= '0';
        first_done := '0';
        mac_lookup_req <= '0';
      else
        mac_lookup_req <= '0';
        tx_data <= (others => '0');
        set_chn_reqd <= HOLD;
        tx_data_valid <= '0';

        case tx_state is
          when IDLE =>
            set_chn_reqd <= CLR;
            tx_count_mode := RST;
            data_out_first_done <= '0';
            tx_state <= IDLE;
            first_done := '0';
            if ip_tx_start = '1' then
              -- total length = user data length + header length (bytes)
              total_length <= std_logic_vector(unsigned(ip_tx.hdr.data_length) + 20);
              if unsigned(ip_tx.hdr.data_length) > 1480 then
                tx_result_reg <= IPTX_RESULT_ERR;
              else
                tx_result_reg <= IPTX_RESULT_SENDING;
                -- TODO - check if we already have the mac addr for this ip, if so, bypass the WAIT_MAC state
                if ip_tx.hdr.dst_ip_addr = IP_BC_ADDR then
                  -- for IP broadcast, dont need to look up the MAC addr
                  tx_mac <= MAC_BC_ADDR;
                  tx_state <= WAIT_CHN;
                else
                  -- need to req the mac address for this ip
                  arp_req_ip_reg <= ip_tx.hdr.dst_ip_addr;
                  mac_lookup_req <= '1';
                  tx_state <= WAIT_MAC;
                end if; -- ip_tx.hdr.dst_ip_addr = IP_BC_ADDR
              end if; -- unsigned(ip_tx.hdr.data_length) > 1480
            end if; -- ip_tx_start = '1'
          when WAIT_MAC =>
            if arp_req_rslt.got_mac = '1' then
              tx_mac <= arp_req_rslt.mac;
              set_chn_reqd <= SET;
              tx_state <= WAIT_CHN;
            elsif arp_req_rslt.got_err = '1' then
              tx_result_reg  <= IPTX_RESULT_ERR;
              tx_state   <= IDLE;
            end if;
          when WAIT_CHN =>
            if mac_tx_granted = '1' then
              -- ready to send data
              tx_state <= SEND_ETH_HDR;
            end if;
          -- probably should handle a timeout here
          when SEND_ETH_HDR =>
            tx_data_valid <= '1';
            if mac_data_out_ready = '1' then
              tx_count_mode := INCR;
              case tx_count is
                when x"000" => tx_data <= tx_mac (39 downto 32);
                when x"001" => tx_data <= tx_mac (31 downto 24);
                when x"002" => tx_data <= tx_mac (23 downto 16);
                when x"003" => tx_data <= tx_mac (15 downto 8);
                when x"004" => tx_data <= tx_mac (7 downto 0);
                when x"005" => tx_data <= our_mac_address (47 downto 40);  -- src = our mac
                when x"006" => tx_data <= our_mac_address (39 downto 32);
                when x"007" => tx_data <= our_mac_address (31 downto 24);
                when x"008" => tx_data <= our_mac_address (23 downto 16);
                when x"009" => tx_data <= our_mac_address (15 downto 8);
                when x"00a" => tx_data <= our_mac_address (7 downto 0);
                when x"00b" => tx_data <= x"08";  -- pkt type = 0800 : IP
                when x"00c" => tx_data <= x"00";
                               tx_count_mode := RST;
                               tx_state <= SEND_IP_HDR;
                when others =>
                  tx_result_reg <= IPTX_RESULT_ERR;
                  tx_state <= IDLE;
              end case;
            else
              tx_data <= tx_mac (47 downto 40);  -- trg = mac from ARP lookup
            end if;
              
          when SEND_IP_HDR =>
            tx_data_valid <= '1';
            if mac_data_out_ready = '1' then
              tx_count_mode := INCR;
              case tx_count is
                when x"000" => tx_data <= x"45";  -- v4, 5 words in hdr
                when x"001" => tx_data <= x"00";  -- service type
                when x"002" => tx_data <= total_length (15 downto 8);            -- total length
                when x"003" => tx_data <= total_length (7 downto 0);
                when x"004" => tx_data <= x"00";  -- identification
                when x"005" => tx_data <= x"00";
                when x"006" => tx_data <= x"00";  -- flags and fragment offset
                when x"007" => tx_data <= x"00";
                when x"008" => tx_data <= IP_TTL;                                -- TTL
                when x"009" => tx_data <= ip_tx.hdr.protocol;                    -- protocol
                when x"00a" => tx_data <= tx_hdr_cks (15 downto 8);              -- HDR checksum
                when x"00b" => tx_data <= tx_hdr_cks (7 downto 0);               -- HDR checksum
                when x"00c" => tx_data <= our_ip_address (31 downto 24);         -- src ip
                when x"00d" => tx_data <= our_ip_address (23 downto 16);
                when x"00e" => tx_data <= our_ip_address (15 downto 8);
                when x"00f" => tx_data <= our_ip_address (7 downto 0);
                when x"010" => tx_data <= ip_tx.hdr.dst_ip_addr (31 downto 24);  -- dst ip
                when x"011" => tx_data <= ip_tx.hdr.dst_ip_addr (23 downto 16);
                when x"012" => tx_data <= ip_tx.hdr.dst_ip_addr (15 downto 8);
                when x"013" => tx_data <= ip_tx.hdr.dst_ip_addr (7 downto 0);
                               tx_state <= SEND_USER_DATA;
                               tx_count_mode := RST;
                when others =>
                  tx_result_reg <= IPTX_RESULT_ERR;
                  tx_state <= IDLE;
              end case;
            else
              tx_result_reg <= IPTX_RESULT_ERR;
              tx_state <= IDLE;
            end if;
          when SEND_USER_DATA =>
            tx_data_valid <= '1';
            if mac_data_out_ready = '1' then
              tx_count_mode := INCR;
              if ip_tx.data.data_out_valid = '1' then
                tx_data <= ip_tx.data.data_out;

                if unsigned(tx_count) = unsigned(ip_tx.hdr.data_length) then
                  -- TX terminated due to count - end normally
                  tx_data_valid <= '0';
                  set_chn_reqd <= CLR;
                  tx_state <= IDLE;
                  if ip_tx.data.data_out_last = '1' then
                    tx_result_reg <= IPTX_RESULT_SENT;
                  else
                    tx_result_reg <= IPTX_RESULT_ERR;
                  end if;
                elsif ip_tx.data.data_out_last = '1' then
                  -- TX terminated due to receiving last indication from upstream - end with error
                  tx_data_valid <= '0';
                  set_chn_reqd <= CLR;
                  tx_state <= IDLE;
                  tx_result_reg <= IPTX_RESULT_ERR;
                  tx_data_valid <= '0';
                else
                  -- TX continues
                end if;
              end if;
            else
              tx_data_valid <= '0';
              tx_result_reg <= IPTX_RESULT_ERR;
              tx_state <= IDLE;              
            end if;
          when others =>
            tx_state <= IDLE;
        end case; -- tx_state

        case tx_count_mode is
          when RST  => tx_count <= x"000";
          when INCR => tx_count <= tx_count + 1;
          when HOLD => tx_count <= tx_count;
        end case;

      end if; -- reset
    end if; -- rising_edge(clk)
  end process;

  set_chn_reqd_proc: process(clk)
  begin
    -- control access request to mac tx chn
    if rising_edge(clk) then
      if reset = '1' then
        tx_mac_chn_reqd <= '0';
      else
        -- control access request to mac tx chn
        case set_chn_reqd is
          when SET  => tx_mac_chn_reqd <= '1';
          when CLR  => tx_mac_chn_reqd <= '0';
          when HOLD => tx_mac_chn_reqd <= tx_mac_chn_reqd;
        end case;
      end if;
    end if;
  end process;

  -----------------------------------------------------------------------------
  -- Process to calculate CRC in parallel with pkt out processing
  -- this process must yield a valid CRC before it is required to be used in the hdr
  -----------------------------------------------------------------------------

  crc : process (clk)--, reset)
  begin
    if rising_edge(clk) then
      case crc_state is
        when IDLE =>
          if ip_tx_start = '1' then
            tx_hdr_cks <= x"004500";    -- vers & hdr len & service
            crc_state  <= TOT_LEN;
          end if;
          
        when TOT_LEN =>
          tx_hdr_cks <= std_logic_vector (unsigned(tx_hdr_cks) + unsigned(total_length));
          crc_state  <= ID;
          
        when ID =>
          tx_hdr_cks <= tx_hdr_cks;
          crc_state  <= FLAGS;
          
        when FLAGS =>
          tx_hdr_cks <= tx_hdr_cks;
          crc_state  <= TTL;
          
        when TTL =>
          tx_hdr_cks <= std_logic_vector (unsigned(tx_hdr_cks) + unsigned(IP_TTL & ip_tx.hdr.protocol));
          crc_state  <= CKS;
          
        when CKS =>
          tx_hdr_cks <= tx_hdr_cks;
          crc_state  <= SAH;
          
        when SAH =>
          tx_hdr_cks <= std_logic_vector (unsigned(tx_hdr_cks) + unsigned(our_ip_address(31 downto 16)));
          crc_state  <= SAL;
          
        when SAL =>
          tx_hdr_cks <= std_logic_vector (unsigned(tx_hdr_cks) + unsigned(our_ip_address(15 downto 0)));
          crc_state  <= DAH;
          
        when DAH =>
          tx_hdr_cks <= std_logic_vector (unsigned(tx_hdr_cks) + unsigned(ip_tx.hdr.dst_ip_addr(31 downto 16)));
          crc_state  <= DAL;
          
        when DAL =>
          tx_hdr_cks <= std_logic_vector (unsigned(tx_hdr_cks) + unsigned(ip_tx.hdr.dst_ip_addr(15 downto 0)));
          crc_state  <= ADDOVF;

        when ADDOVF =>
          tx_hdr_cks <= std_logic_vector ((unsigned(tx_hdr_cks) and x"00ffff")+ unsigned(tx_hdr_cks(23 downto 16)));
          crc_state  <= FINAL;

        when FINAL =>
          tx_hdr_cks <= inv_if_one(std_logic_vector (unsigned(tx_hdr_cks) + unsigned(tx_hdr_cks(23 downto 16))), '1');
          crc_state  <= WAIT_END;
          
        when WAIT_END =>
          tx_hdr_cks <= tx_hdr_cks;
          if ip_tx_start = '0' then
            crc_state <= IDLE;
          else
            crc_state <= WAIT_END;
          end if;
          

      end case;
    end if;
  end process;


end Behavioral;

