----------------------------------------------------------------------------------
-- Company: 
-- Engineer:            Peter Fall
-- 
-- Create Date:    16:20:42 06/01/2011 
-- Design Name: 
-- Module Name:    IPv4_RX - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--              handle simple IP RX
--              doesnt handle reassembly
--              checks and filters for IP protocol
--              checks and filters for IP addr
--              Handle IPv4 protocol
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Revision 0.02 - Improved error handling
-- Revision 0.03 - Added handling of broadcast address
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.axi.all;
use work.ipv4_types.all;
use work.arp_types.all;

entity IPv4_RX is
  port (
    -- IP Layer signals
    ip_rx             : out ipv4_rx_type;
    ip_rx_start       : out std_logic;  -- indicates receipt of ip frame.
    -- system signals
    clk               : in  std_logic;  -- same clock used to clock mac data and ip data
    reset             : in  std_logic;
    our_ip_address    : in  std_logic_vector (31 downto 0);
    rx_pkt_count      : out std_logic_vector(7 downto 0);   -- number of IP pkts received for us
    -- MAC layer RX signals
    mac_data_in       : in  std_logic_vector (7 downto 0);  -- ethernet frame (from dst mac addr through to last byte of frame)
    mac_data_in_valid : in  std_logic;  -- indicates data_in valid on clock
    mac_data_in_last  : in  std_logic   -- indicates last data in frame
    );                  
end IPv4_RX;

architecture Behavioral of IPv4_RX is

  type rx_state_type is (IDLE, ETH_HDR, IP_HDR, USER_DATA, WAIT_END, ERR);

  type rx_event_type is (NO_EVENT, DATA);
  type count_mode_type is (RST, INCR, HOLD);
  type settable_count_mode_type is (RST, INCR, SET_VAL, HOLD);
  type set_clr_type is (SET, CLR, HOLD);


  -- state variables
  signal rx_state         : rx_state_type;
  -- signal rx_count         : unsigned (15 downto 0);
  signal src_ip           : std_logic_vector (31 downto 0);  -- src IP captured from input
  signal is_broadcast_reg : std_logic;
  signal protocol         : std_logic_vector (7 downto 0);   -- src protocol captured from input
  signal data_len         : std_logic_vector (15 downto 0);  -- src data length captured from input
  signal ip_rx_start_reg  : std_logic;  -- indicates start of user data
  signal hdr_valid_reg    : std_logic;  -- indicates that hdr data is valid
  signal frame_err_cnt    : unsigned (7 downto 0);  -- number of frame errors
  signal error_code_reg   : std_logic_vector (3 downto 0);
  signal rx_pkt_counter   : unsigned (7 downto 0);  -- number of rx frames received for us

  -- rx control signals
  signal rx_event          : rx_event_type;
  signal set_frame_err_cnt : count_mode_type;
  signal dataval           : std_logic_vector (7 downto 0);
  signal set_pkt_cnt       : count_mode_type;
  signal set_data_last     : std_logic;
  signal dst_ip_rx         : std_logic_vector (31 downto 0);
  -- signal set_is_broadcast  : set_clr_type;

  signal ip_mac_in_last: std_logic;
  signal ip_mac_in_valid: std_logic;

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

  ip_rx_start                <= ip_rx_start_reg;
  ip_rx.hdr.is_valid         <= hdr_valid_reg;
  ip_rx.hdr.protocol         <= protocol;
  ip_rx.hdr.data_length      <= data_len;
  ip_rx.hdr.src_ip_addr      <= src_ip;
  ip_rx.hdr.num_frame_errors <= std_logic_vector(frame_err_cnt);
  ip_rx.hdr.last_error_code  <= error_code_reg;
  ip_rx.hdr.is_broadcast     <= is_broadcast_reg;
  rx_pkt_count               <= std_logic_vector(rx_pkt_counter);
  ip_rx.data.data_in_last    <= set_data_last;

  -----------------------------------------------------------------------------
  -- sequential process to action control signals and change states and outputs
  -----------------------------------------------------------------------------

  rx_sequential : process (clk)--, reset)
    variable rx_count         : unsigned (15 downto 0);
    variable rx_count_mode     : count_mode_type;
  begin
    if rising_edge(clk) then
      if reset = '1' then
        -- reset state variables
        rx_state         <= IDLE;
        protocol         <= (others => '0');
        hdr_valid_reg    <= '0';
        is_broadcast_reg <= '0';
        error_code_reg   <= RX_EC_NONE;

        rx_event          <= NO_EVENT;
        rx_count_mode     := RST;
        rx_count          := x"0000";
        protocol          <= (others => '0');
        set_pkt_cnt       <= HOLD;
        dataval           <= (others => '0');
        data_len          <= (others => '0');
        src_ip            <= (others => '0');
        set_data_last     <= '0';
        dst_ip_rx         <= (others => '0');
        -- set_is_broadcast  <= HOLD;
        is_broadcast_reg <= '0';
        ip_rx_start_reg <= '0';

        set_frame_err_cnt <= RST;
        ip_rx.data.data_in       <= (others => '0');
        ip_rx.data.data_in_valid <= '0';

        ip_mac_in_last <= '0';
        ip_mac_in_valid <= '0';
      else
        rx_event          <= NO_EVENT;
        set_frame_err_cnt <= HOLD;
        set_pkt_cnt       <= HOLD;
        dataval           <= (others => '0');
        set_data_last     <= '0';
        ip_rx.data.data_in       <= (others => '0');
        ip_rx.data.data_in_valid <= '0';

        -- rx_event and dataval is registered
        -- so data_in_last is needed to be registered too
        ip_mac_in_last <= mac_data_in_last;
        ip_mac_in_valid <= mac_data_in_valid;

        -- determine event (if any)
        if mac_data_in_valid = '1' then
          rx_event <= DATA;
          dataval  <= mac_data_in;
        end if;

        case rx_count_mode is
          when RST     => rx_count := x"0000";
          when INCR    => rx_count := rx_count + 1;
          when HOLD    => -- rx_count := rx_count;
        end case;

        -- RX FSM
        case rx_state is
          when IDLE =>
            dst_ip_rx         <= (others => '0');
            src_ip            <= (others => '0');
            protocol          <= (others => '0');
            data_len          <= (others => '0');
            is_broadcast_reg <= '0';
            rx_count_mode := RST;
            case rx_event is
              when NO_EVENT =>              -- (nothing to do)
              when DATA =>
                rx_count      := x"0001";
                rx_count_mode := HOLD;
                hdr_valid_reg <= '0';
                rx_state <= ETH_HDR;
            end case;

          when ETH_HDR =>
            case rx_event is
              when NO_EVENT =>                      -- (nothing to do)
              when DATA =>
                -- handle early frame termination
                rx_count_mode := INCR;
                if ip_mac_in_last = '1' then
                  error_code_reg    <= RX_EC_ET_ETH;
                  set_frame_err_cnt <= INCR;
                  ip_rx_start_reg <= '0';
                  set_data_last     <= '1';
                  rx_state          <= IDLE;
                  rx_count_mode     := RST;    
                else
                  case rx_count is
                    when x"000c" =>
                      if dataval /= x"08" then  -- ignore pkts that are not type=IP
                        rx_count_mode := RST;
                        rx_state       <= WAIT_END;
                      end if;
                    when x"000d" =>
                      if dataval = x"00" then
                        rx_count_mode := RST;
                        rx_state      <= IP_HDR;
                      else  -- ignore pkts that are not type=IP
                        rx_state      <= WAIT_END;
                      end if;
                    when others =>          -- ignore other bytes in eth header
                  end case;
                end if;
            end case;

          when IP_HDR =>
            case rx_event is
              when NO_EVENT =>              -- (nothing to do)
              when DATA =>
                rx_count_mode := INCR;
                -- handle early frame termination
                if ip_mac_in_last = '1' then
                  error_code_reg    <= RX_EC_ET_IP;
                  set_frame_err_cnt <= INCR;
                  ip_rx_start_reg <= '0';
                  set_data_last     <= '1';
                  rx_state          <= IDLE;
                  rx_count_mode     := RST;
                else
                  case rx_count is
                    when x"0000" =>
                      if dataval /= x"45" then  -- ignore pkts that are not v4 with 5 header words
                        rx_state <= WAIT_END;
                      end if;
                      
                    when x"0002" =>
                      data_len (15 downto 8) <= dataval;
                      data_len (7 downto 0)  <= x"00";
                    when x"0003" =>
                      data_len <= std_logic_vector(unsigned(data_len(15 downto 8) & dataval) - 20);
                    when x"0006" =>
                      if (dataval(7) = '1') or (dataval (4 downto 0) /= "00000") then
                                        -- ignore pkts that require reassembly (MF=1 or frag offst /= 0)
                        rx_state <= WAIT_END;
                      end if;
                    when x"0007" =>
                      if dataval /= x"00" then  -- ignore pkts that require reassembly (frag offst /= 0)
                        rx_state <= WAIT_END;
                      end if;
                    when x"0009" => protocol <= dataval;
                    when x"000c" => src_ip <= (31 downto 24 => dataval, others => '0');
                    when x"000d" => src_ip(23 downto 16) <= dataval;
                    when x"000e" => src_ip(15 downto 8)  <= dataval;
                    when x"000f" => src_ip(7 downto 0)   <= dataval;
                    when x"0010" =>
                      dst_ip_rx <= (31 downto 24 => dataval, others => '0');
                      if ((dataval /= our_ip_address(31 downto 24)) and
                          (dataval /= IP_BC_ADDR(31 downto 24)))then  -- ignore pkts that are not addressed to us
                        rx_state <= WAIT_END;
                      end if;
                    when x"0011" =>
                      dst_ip_rx(23 downto 16)  <= dataval;
                      if ((dataval /= our_ip_address(23 downto 16)) and
                          (dataval /= IP_BC_ADDR(23 downto 16)))then  -- ignore pkts that are not addressed to us
                        rx_state <= WAIT_END;
                      end if;
                    when x"0012" =>
                      dst_ip_rx(15 downto 8)   <= dataval;
                      if ((dataval /= our_ip_address(15 downto 8)) and
                          (dataval /= IP_BC_ADDR(15 downto 8)))then  -- ignore pkts that are not addressed to us
                        rx_state <= WAIT_END;
                      end if;

                    when x"0013" =>
                      if ((dataval /= our_ip_address(7 downto 0)) and
                          (dataval /= IP_BC_ADDR(7 downto 0)))then  -- ignore pkts that are not addressed to us
                        rx_count_mode   := RST;
                        rx_state <= WAIT_END;
                      else
                        rx_state   <= USER_DATA;
                        set_pkt_cnt     <= INCR;                         -- count another pkt
                        ip_rx_start_reg <= '1';
                        rx_count        := x"0001";
                        rx_count_mode   := HOLD;
                      end if;

                      -- now have the dst IP addr
                      dst_ip_rx(7 downto 0) <= dataval;
                      if dst_ip_rx(31 downto 8) & dataval = IP_BC_ADDR then
                        is_broadcast_reg <= '1';
                      else
                        is_broadcast_reg <= '0';
                      end if;
                      -- header values are now valid, although the pkt may not be for us
                      hdr_valid_reg <= '1';

                      --if dst_ip_rx = our_ip_address or dst_ip_rx = IP_BC_ADDR then
                      --  next_rx_state   <= USER_DATA;
                      --  set_pkt_cnt     <= INCR;  -- count another pkt received
                      --  set_rx_state    <= '1';
                      --  set_ip_rx_start <= SET;
                      --else
                      --  next_rx_state <= WAIT_END;
                      --  set_rx_state  <= '1';
                      --end if;
                      
                    when others =>  -- ignore other bytes in ip header                                                                               
                  end case;
                end if;
            end case;
            
          when USER_DATA =>
            case rx_event is
              when NO_EVENT => -- (nothing to do)
              when DATA =>
                -- note: data gets transfered upstream as part of "output followers" processing
                ip_rx_start_reg          <= '1';
                ip_rx.data.data_in       <= dataval;
                ip_rx.data.data_in_valid <= ip_mac_in_valid;

                if rx_count = unsigned(data_len) then
                  ip_rx_start_reg <= '0';
                  rx_count_mode   := RST;
                  set_data_last   <= '1';
                  if ip_mac_in_last = '1' then
                    rx_state   <= IDLE;
                    rx_count_mode   := RST;
                    ip_rx_start_reg <= '0';
                  else
                    rx_state <= WAIT_END;
                  end if;
                else
                  rx_count_mode := INCR;
                                        -- check for early frame termination
                  if ip_mac_in_last = '1' then
                    error_code_reg    <= RX_EC_ET_USER;
                    set_frame_err_cnt <= INCR;
                    ip_rx_start_reg <= '0';
                    set_data_last     <= '1';
                    rx_state          <= IDLE;
                    rx_count_mode     := RST;
                  end if;
                end if;
            end case;

          when ERR =>
            set_frame_err_cnt <= INCR;
            ip_rx_start_reg <= '0';
            if ip_mac_in_last = '0' then
              set_data_last <= '1';
              rx_state <= WAIT_END;
            else
              rx_state <= IDLE;
              rx_count_mode := RST;
            end if;

          when WAIT_END =>
            case rx_event is
              when NO_EVENT =>              -- (nothing to do)
              when DATA =>
                rx_count_mode   := INCR;
                if ip_mac_in_last = '1' then
                  set_data_last   <= '1';
                  rx_state   <= IDLE;
                  rx_count_mode   := RST;
                  ip_rx_start_reg <= '0';
                end if;
            end case;
        end case; -- rx_state

      end if; -- reset
    end if; -- rising_edge
  end process;

  frame_err_cnt_seq_proc: process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        frame_err_cnt    <= (others => '0');
      else
        -- frame error count processing
        case set_frame_err_cnt is
          when RST  => frame_err_cnt <= x"00";
          when INCR => frame_err_cnt <= frame_err_cnt + 1;
          when HOLD => frame_err_cnt <= frame_err_cnt;
        end case;
      end if;
    end if;
  end process frame_err_cnt_seq_proc;

  rx_pkt_counter_seq_proc: process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        rx_pkt_counter   <= x"00";
      else
        -- ip pkt processing
        case set_pkt_cnt is
          when RST  => rx_pkt_counter <= x"00";
          when INCR => rx_pkt_counter <= rx_pkt_counter + 1;
          when HOLD => rx_pkt_counter <= rx_pkt_counter;
        end case;
      end if;
    end if;
  end process;
  
end Behavioral;

