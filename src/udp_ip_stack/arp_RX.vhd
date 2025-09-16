----------------------------------------------------------------------------------
-- Company: 
-- Engineer:            Peter Fall
-- 
-- Create Date:    12:00:04 05/31/2011 
-- Design Name: 
-- Module Name:    arp_rx - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:
--              handle receipt of arp pkt
--              ignores other types of pkt
--
--              When it receives an ARP pkt that is either addressed to our IP or is a global request,
--              it outputs for a single clock cycle either recv_who_has or recv_I_have along
--              with associated mac or arp entry data.
--
--              Note that if recv who_has and we have it, then we also assert I_have so that we can cache the rev lookup
--              on the expectation that we will want to reply to this host.
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created - refactored from arp v0.02 module
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.arp_types.all;

entity arp_rx is
  port (
    -- MAC layer RX signals
    data_in               : in  std_logic_vector (7 downto 0);  -- ethernet frame (from dst mac addr through to last byte of frame)
    data_in_valid         : in  std_logic;    -- indicates data_in valid on clock
    data_in_last          : in  std_logic;    -- indicates last data in frame
    -- ARP output signals
    recv_who_has          : out std_logic;    -- pulse will be latched
    arp_entry_for_who_has : out arp_entry_t;  -- target for who_has msg (Iie, who to reply to)
    recv_I_have           : out std_logic;    -- pulse will be latched
    arp_entry_for_I_have  : out arp_entry_t;  -- arp target for I_have msg
    -- control and status signals
    req_count             : out std_logic_vector(7 downto 0);   -- count of arp pkts received
    -- system signals
    our_ip_address        : in  std_logic_vector (31 downto 0);
    rx_clk                : in  std_logic;
    reset                 : in  std_logic
    );
end arp_rx;


architecture Behavioral of arp_rx is

  type rx_state_t is (IDLE, PARSE, PROCESS_ARP, WAIT_END);
  type rx_event_t is (NO_EVENT, DATA);
  type count_mode_t is (RST, INCR, HOLD);
  type arp_oper_t is (NOP, REQUEST, REPLY);

  type tx_state_type is (IDLE, WAIT_MAC, SEND);

  -- state variables
  signal send_request_needed : std_logic;
  signal tx_mac_chn_reqd     : std_logic;

  signal rx_state      : rx_state_t;
  -- signal rx_count      : unsigned (7 downto 0);
  signal arp_operation : arp_oper_t;
  signal arp_req_count : unsigned (7 downto 0);
  signal new_arp_entry : arp_entry_t;

-- FIXME        - remove these debug state signals
  signal arp_err_data : std_logic_vector (7 downto 0);
  signal set_err_data : std_logic;

  attribute keep                 : string;
  attribute keep of arp_err_data : signal is "true";


  -- rx control signals
  -- signal rx_event         : rx_event_t;
  -- signal rx_count_mode    : count_mode_t;
  signal set_arp_oper     : std_logic;
  signal arp_oper_set_val : arp_oper_t;
  signal dataval          : std_logic_vector (7 downto 0);
  signal count_arp_rcvd   : std_logic;

  signal set_mac5 : std_logic;
  signal set_mac4 : std_logic;
  signal set_mac3 : std_logic;
  signal set_mac2 : std_logic;
  signal set_mac1 : std_logic;
  signal set_mac0 : std_logic;

  signal set_ip3 : std_logic;
  signal set_ip2 : std_logic;
  signal set_ip1 : std_logic;
  signal set_ip0 : std_logic;



  -- function to determine whether the rx pkt is an arp pkt and whether we want to process it
  -- Returns 1 if we should discard
  -- The following will make us ignore the frame (all values hexadecimal):
  -- PDU type /= 0806
  -- Protocol Type /= 0800
  -- Hardware Type /= 1
  -- Hardware Length /= 6
  -- Protocol Length /= 4
  -- Operation /= 1 or 2
  -- Target IP /= our IP (i.er. message is not meant for us)
  --
  function not_our_arp(data : std_logic_vector; count : unsigned; our_ip : std_logic_vector) return std_logic is
  begin
    if
      (count = 12 and data /= x"08") or                 -- PDU type 0806 : ARP
      (count = 13 and data /= x"06") or
      (count = 14 and data /= x"00") or                 -- HW type 1 : eth
      (count = 15 and data /= x"01") or
      (count = 16 and data /= x"08") or                 -- Protocol 0800 : IP
      (count = 17 and data /= x"00") or
      (count = 18 and data /= x"06") or                 -- HW Length 6
      (count = 19 and data /= x"04") or                 -- protocol length 4
      (count = 20 and data /= x"00") or                 -- operation 1 or 2 (req or reply)
      (count = 21 and data /= x"01" and data /= x"02") or
      (count = 38 and data /= our_ip(31 downto 24)) or  -- target IP is ours
      (count = 39 and data /= our_ip(23 downto 16)) or
      (count = 40 and data /= our_ip(15 downto 8)) or
      (count = 41 and data /= our_ip(7 downto 0))
    then
      return '1';
    else
      return '0';
    end if;
  end function not_our_arp;

begin

  req_count <= std_logic_vector(arp_req_count);

  rx_seq_proc: process(rx_clk)
    variable rx_count: unsigned (7 downto 0);
    variable rx_count_mode: count_mode_t;
    variable rx_event: rx_event_t;
  begin
    if rising_edge(rx_clk) then
      if reset = '1' then
        recv_who_has <= '0';
        arp_entry_for_who_has.ip  <= (others => '0');
        arp_entry_for_who_has.mac <= (others => '0');
        recv_I_have               <= '0';
        arp_entry_for_I_have.ip   <= (others => '0');
        arp_entry_for_I_have.mac  <= (others => '0');
        -- set signal defaults
        rx_event         := NO_EVENT;
        set_arp_oper     <= '0';
        arp_oper_set_val <= NOP;
        dataval          <= (others => '0');
        set_mac5         <= '0';
        set_mac4         <= '0';
        set_mac3         <= '0';
        set_mac2         <= '0';
        set_mac1         <= '0';
        set_mac0         <= '0';
        set_ip3          <= '0';
        set_ip2          <= '0';
        set_ip1          <= '0';
        set_ip0          <= '0';
        count_arp_rcvd   <= '0';
        set_err_data     <= '0';

        rx_count_mode := RST;
        rx_count := (others => '0');
      else
        recv_who_has <= '0';
        recv_I_have <= '0';
        set_mac5         <= '0';
        set_mac4         <= '0';
        set_mac3         <= '0';
        set_mac2         <= '0';
        set_mac1         <= '0';
        set_mac0         <= '0';
        set_ip3          <= '0';
        set_ip2          <= '0';
        set_ip1          <= '0';
        set_ip0          <= '0';
        count_arp_rcvd   <= '0';
        set_err_data     <= '0';
        dataval          <= (others => '0');
        set_arp_oper     <= '0';
        arp_oper_set_val <= NOP;

        rx_event := NO_EVENT;
        if data_in_valid = '1' then
          rx_event := DATA;
        end if;
        case rx_state is
          when IDLE =>
            rx_count_mode := RST;
            case rx_event is
              when NO_EVENT =>
              when DATA =>
                rx_state <= PARSE;
                rx_count_mode := INCR;
            end case;
          when PARSE =>
            case rx_event is
              when NO_EVENT =>
              when DATA =>
                rx_count_mode := INCR;
                if data_in_last = '1' then
                  rx_state <= IDLE;
                  rx_count_mode := RST;
                end if;

                if not_our_arp(data_in, rx_count, our_ip_address) = '1' then
                  dataval       <= data_in;
                  set_err_data  <= '1';
                  rx_state <= WAIT_END;

                else
                  case (to_integer(rx_count)) is
                    when 41 =>
                      rx_state <= PROCESS_ARP;
                    when 21 =>       -- capture ARP operation
                      case (data_in) is
                        when x"01" =>
                          arp_oper_set_val <= REQUEST;
                          set_arp_oper     <= '1';
                        when x"02" =>
                          arp_oper_set_val <= REPLY;
                          set_arp_oper     <= '1';
                        when others =>        -- ignore other values
                      end case;
                    -- capture source mac addr
                    when 22 =>
                      set_mac5 <= '1';
                      dataval  <= data_in;
                    when 23 =>
                      set_mac4 <= '1';
                      dataval  <= data_in;
                    when 24 =>
                      set_mac3 <= '1';
                      dataval  <= data_in;
                    when 25 =>
                      set_mac2 <= '1';
                      dataval  <= data_in;
                    when 26 =>
                      set_mac1 <= '1';
                      dataval  <= data_in;
                    when 27 =>
                      set_mac0 <= '1';
                      dataval  <= data_in;
                    when 28 =>              -- capture source ip addr
                      set_ip3 <= '1';
                      dataval <= data_in;
                    when 29 =>
                      set_ip2 <= '1';
                      dataval <= data_in;
                    when 30 =>
                      set_ip1 <= '1';
                      dataval <= data_in;
                    when 31 =>
                      set_ip0 <= '1';
                      dataval <= data_in;
                    when others =>  -- do nothing
                  end case;
                end if;
            end case;
          when PROCESS_ARP =>
            rx_state    <= WAIT_END;
            arp_oper_set_val <= NOP;
            set_arp_oper     <= '1';
            case arp_operation is
              when NOP =>                   -- (nothing to do)
              when REQUEST =>
                count_arp_rcvd        <= '1';
                recv_who_has          <= '1';
                arp_entry_for_who_has <= new_arp_entry;
                -- setting I_Have as well allows us to cache the remote node's entry immediately
                recv_I_have           <= '1';
                arp_entry_for_I_have  <= new_arp_entry;
              when REPLY =>
                count_arp_rcvd       <= '1';
                recv_I_have          <= '1';
                arp_entry_for_I_have <= new_arp_entry;
            end case;
          when WAIT_END =>
            case rx_event is
              when NO_EVENT =>              -- (nothing to do)
              when DATA =>
                if data_in_last = '1' then
                  rx_state <= IDLE;
                  rx_count_mode := RST;
                end if;
            end case;
        end case;
      end if; -- reset = '1'

      case rx_count_mode is
        when RST =>
          rx_count := x"00";
        when INCR =>
          rx_count := rx_count + 1;
        when HOLD =>
          rx_count := rx_count;
      end case;

    end if; -- rising_edge(rx_clk)
  end process;

  rx_set_mac_seq_proc: process(rx_clk)
  begin
    if rising_edge(rx_clk) then
      if reset = '1' then
        new_arp_entry.mac <= (others => '0');
        new_arp_entry.ip <= (others => '0');
      else
        -- source mac capture
        if (set_mac5 = '1') then new_arp_entry.mac(47 downto 40) <= dataval; end if;
        if (set_mac4 = '1') then new_arp_entry.mac(39 downto 32) <= dataval; end if;
        if (set_mac3 = '1') then new_arp_entry.mac(31 downto 24) <= dataval; end if;
        if (set_mac2 = '1') then new_arp_entry.mac(23 downto 16) <= dataval; end if;
        if (set_mac1 = '1') then new_arp_entry.mac(15 downto 8)  <= dataval; end if;
        if (set_mac0 = '1') then new_arp_entry.mac(7 downto 0)   <= dataval; end if;

        -- source ip capture
        if (set_ip3 = '1') then new_arp_entry.ip(31 downto 24) <= dataval; end if;
        if (set_ip2 = '1') then new_arp_entry.ip(23 downto 16) <= dataval; end if;
        if (set_ip1 = '1') then new_arp_entry.ip(15 downto 8)  <= dataval; end if;
        if (set_ip0 = '1') then new_arp_entry.ip(7 downto 0)   <= dataval; end if;
      end if;
    end if;
  end process;

  arp_err_data_proc: process(rx_clk)
  begin
    if rising_edge(rx_clk) then
      if reset = '1' then
        arp_err_data  <= (others => '0');
      else
        -- err data
        if set_err_data = '1' then
          arp_err_data <= data_in;
        else
          arp_err_data <= arp_err_data;
        end if;
      end if;
    end if;
  end process;

  arp_op_proc: process(rx_clk)
  begin
    if rising_edge(rx_clk) then
      if reset = '1' then
        arp_operation <= NOP;
      else
        -- arp operation processing
        if set_arp_oper = '1' then
          arp_operation <= arp_oper_set_val;
        else
          arp_operation <= arp_operation;
        end if;
      end if;
    end if;
  end process;

  arp_req_coun_proc: process(rx_clk)
  begin
    if rising_edge(rx_clk) then
      if reset = '1' then
        arp_req_count <= x"00";
      else
        -- set arp entry request
        if count_arp_rcvd = '1' then
                                        -- count another ARP pkt received
          arp_req_count <= arp_req_count + 1;
        else
          arp_req_count <= arp_req_count;
        end if;
      end if;
    end if;
  end process;

end Behavioral;

