----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:09:01 02/20/2012 
-- Design Name: 
-- Module Name:    arp_SYNC - Behavioral - synchronises between rx and tx clock domains
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.arp_types.all;

entity arp_SYNC is
  port (
    -- REQ to TX
    arp_nwk_req           : in  arp_nwk_request_t;  -- request for a translation from IP to MAC
    send_who_has          : out std_logic;
    ip_entry              : out std_logic_vector (31 downto 0);

    -- IPv4_TX to REQ
    arp_req_req_in        : in arp_req_req_type;
    arp_req_req_out       : out arp_req_req_type;

    -- REQ to IPv4_TX
    arp_req_rslt_in       : in arp_req_rslt_type;
    arp_req_rslt_out      : out arp_req_rslt_type;

    -- RX to TX
    recv_who_has          : in  std_logic;          -- this is for us, we will respond
    arp_entry_for_who_has : in  arp_entry_t;
    send_I_have           : out std_logic;
    arp_entry             : out arp_entry_t;
    -- RX to REQ
    I_have_received       : in  std_logic;
    nwk_result_status     : out arp_nwk_rslt_t;
    -- System Signals
    rx_clk                : in  std_logic;
    tx_clk                : in  std_logic;
    reset                 : in  std_logic
    );
end arp_SYNC;

architecture Behavioral of arp_SYNC is

  component macaddr_fifo
	port (
      Data: in std_logic_vector(47 downto 0);
      Reset: in std_logic;
      WrClk: in std_logic;
      RdClk: in std_logic;
      WrEn: in std_logic;
      RdEn: in std_logic;
      Q: out std_logic_vector(47 downto 0);
      Empty: out std_logic;
      Full: out std_logic
      );
  end component;

  component fifo_32bit
	port (
      Data: in std_logic_vector(31 downto 0);
      Reset: in std_logic;
      WrClk: in std_logic;
      RdClk: in std_logic;
      WrEn: in std_logic;
      RdEn: in std_logic;
      Q: out std_logic_vector(31 downto 0);
      Empty: out std_logic;
      Full: out std_logic
      );
  end component;

  type sync_state_t is (IDLE, HOLD1, HOLD2);

  -- state registers
  signal ip_entry_state  : sync_state_t;
  signal arp_entry_state : sync_state_t;
  signal ip_entry_reg    : std_logic_vector (31 downto 0);
  signal arp_entry_reg   : arp_entry_t;

  -- synchronisation registers  
  signal send_who_has_r1 : std_logic;
  signal send_who_has_r2 : std_logic;
  signal send_I_have_r1  : std_logic;
  signal send_I_have_r2  : std_logic;

  signal recv_who_has_int: std_logic;
  signal arp_entry_for_who_has_int : arp_entry_t;
  signal arp_entry_for_who_has_reg : arp_entry_t;
  signal latch_recv_who_has_int: std_logic;

  signal arp_req_req: arp_req_req_type; -- in RX domain
  signal arp_req_req_r1: arp_req_req_type;
  signal arp_req_req_r2: arp_req_req_type;
  signal arp_req_ipaddr_fifo_empty: std_logic;
  signal arp_req_ipaddr_fifo_full: std_logic;
  signal arp_req_ipaddr_fifo_rd_en: std_logic;

  signal ipaddr_entry_fifo_empty: std_logic;
  signal ipaddr_entry_fifo_full: std_logic;
  signal ipaddr_entry_fifo_rd_en: std_logic;

  signal arp_entry_macaddr_fifo_empty: std_logic;
  signal arp_entry_macaddr_fifo_full: std_logic;
  signal arp_entry_macaddr_fifo_rd_en: std_logic;

  signal arp_entry_ipaddr_fifo_empty: std_logic;
  signal arp_entry_ipaddr_fifo_full: std_logic;

  signal arp_req_rslt: arp_req_rslt_type; -- in RX domain
  signal arp_req_rslt_r1: arp_req_rslt_type;
  signal arp_req_rslt_r2: arp_req_rslt_type;

  -- mac address fifo controls
  signal mac_address_sync_empty: std_logic;
  signal mac_address_sync_full: std_logic;
  signal mac_address_sync_rd_en: std_logic;
begin

  combinatorial : process (
    -- input signals
    arp_nwk_req, recv_who_has, arp_entry_for_who_has_int, I_have_received, reset,
    -- state
    ip_entry_state, ip_entry_reg, arp_entry_state, arp_entry_reg,
    -- synchronisation registers
    send_who_has_r1, send_who_has_r2,
    send_I_have_r1, send_I_have_r2
    )
  begin
    -- set output followers
    -- send_who_has <= send_who_has_r2;
    -- ip_entry     <= ip_entry_reg;
    -- arp_entry    <= arp_entry_reg;

    -- combinaltorial outputs
    if I_have_received = '1' then
      nwk_result_status <= RECEIVED;
    else
      nwk_result_status <= IDLE;
    end if;
  end process;

  -- process for stablisising RX clock domain data registers
  -- essentially holds data registers ip_entry and arp_entry static for 2 rx clk cycles
  -- during transfer to TX clk domain
  rx_sequential : process (tx_clk)
    variable ip_entry_counter: unsigned(2 downto 0);
    variable arp_entry_counter: unsigned(2 downto 0);
  begin
    if rising_edge(tx_clk) then
      if reset = '1' then
        -- reset state variables
        ip_entry_reg      <= (others => '0');
        arp_entry_reg.ip  <= (others => '0');
        arp_entry_reg.mac <= (others => '0');
        ip_entry_counter := (others => '0');
        arp_entry_counter := (others => '0');
        ipaddr_entry_fifo_rd_en <= '0';
        arp_entry_macaddr_fifo_rd_en <= '0';
        send_I_have <= '0';
        send_who_has <= '0';
      else
        ipaddr_entry_fifo_rd_en <= '0';
        -- normal (non reset) processing
        case ip_entry_state is
          when IDLE =>
            if send_who_has_r2 = '1' then
              ip_entry_reg   <= arp_nwk_req.ip;
              ip_entry_state <= HOLD1;
            else
              ip_entry_reg   <= ip_entry_reg;
              ip_entry_state <= IDLE;
            end if;
          when HOLD1 =>
            ipaddr_entry_fifo_rd_en <= '1';
            ip_entry_counter := 3x"1";
            ip_entry_reg   <= ip_entry_reg;
            ip_entry_state <= HOLD2;
          when HOLD2 =>
            ip_entry_reg   <= ip_entry_reg;
            ip_entry_state <= IDLE;
        end case;

        send_who_has <= '0';
        if ip_entry_counter /= 0 then
          ip_entry_counter := ip_entry_counter + 1;
          if ip_entry_counter = 3x"4" then
            send_who_has <= '1';
            ip_entry_counter := 3x"0";
          end if;
        end if;

        arp_entry_macaddr_fifo_rd_en <= '0';
        case arp_entry_state is
          when IDLE =>
            -- if recv_who_has = '1' then
            if send_I_have_r2 = '1' then
              arp_entry_reg   <= arp_entry_for_who_has_int;
              arp_entry_state <= HOLD1;
            else
              arp_entry_reg.ip   <= (others => '0');
              arp_entry_reg.mac   <= (others => '0');
              -- arp_entry_reg   <= arp_entry_reg;
              arp_entry_state <= IDLE;
            end if;
          when HOLD1 =>
            arp_entry_macaddr_fifo_rd_en <= '1';
            arp_entry_counter := 3x"1";
            arp_entry_reg   <= arp_entry_reg;
            arp_entry_state <= HOLD2;
          when HOLD2 =>
            arp_entry_reg   <= arp_entry_reg;
            arp_entry_state <= IDLE;
        end case;

        send_I_have <= '0';
        if arp_entry_counter /= 0 then
          arp_entry_counter := arp_entry_counter + 1;
          if arp_entry_counter = 3x"4" then
            send_I_have <= '1';
            arp_entry_counter := (others => '0');
          end if;
        end if;
      end if;
    end if;
  end process;

  arp_nwk_req_to_ip_entry_fifo: fifo_32bit
    port map (
      Data => arp_nwk_req.ip,
      Reset => reset,
      WrClk => rx_clk,
      RdClk => tx_clk,
      WrEn => arp_nwk_req.req,
      RdEn => ipaddr_entry_fifo_rd_en,
      Q => ip_entry,
      Empty => ipaddr_entry_fifo_empty,
      Full => ipaddr_entry_fifo_full
      );

  arp_entry_macaddr_fifo: macaddr_fifo
	port map (
      Data => arp_entry_for_who_has.mac,
      Reset => reset,
      WrClk => rx_clk,
      RdClk => tx_clk,
      WrEn => recv_who_has,
      RdEn => arp_entry_macaddr_fifo_rd_en,
      Q => arp_entry.mac,
      Empty => arp_entry_macaddr_fifo_empty,
      Full => arp_entry_macaddr_fifo_full
      );
  arp_entry_ip_entry_fifo: fifo_32bit
    port map (
      Data => arp_entry_for_who_has.ip,
      Reset => reset,
      WrClk => rx_clk,
      RdClk => tx_clk,
      WrEn => recv_who_has,
      RdEn => arp_entry_macaddr_fifo_rd_en,
      Q => arp_entry.ip,
      Empty => arp_entry_ipaddr_fifo_empty,
      Full => arp_entry_ipaddr_fifo_full
      );

  recv_who_has_combinatorial_proc: process(
    latch_recv_who_has_int,
    recv_who_has,
    arp_entry_for_who_has_reg.ip,
    arp_entry_for_who_has_reg.mac
    )
  begin
    if latch_recv_who_has_int = '0' then
      recv_who_has_int <= '0';
      arp_entry_for_who_has_int.ip <= (others => '0');
      arp_entry_for_who_has_int.mac <= (others => '0');
    else
      recv_who_has_int <= '1';
      arp_entry_for_who_has_int.ip <= arp_entry_for_who_has_reg.ip;
      arp_entry_for_who_has_int.mac <= arp_entry_for_who_has_reg.mac;
    end if;
  end process;

  recv_who_has_latch_proc: process(rx_clk)
    variable counter: unsigned(1 downto 0) := (others => '0');
  begin
    if rising_edge(rx_clk) then
      if reset = '1' then
        counter := (others => '0');
        latch_recv_who_has_int <= '0';
        arp_entry_for_who_has_reg.ip <= (others => '0');
        arp_entry_for_who_has_reg.mac <= (others => '0');
      else
        latch_recv_who_has_int <= '0';
        arp_entry_for_who_has_reg.ip <= (others => '0');
        arp_entry_for_who_has_reg.mac <= (others => '0');
        if (recv_who_has = '1') and (0 = counter) then
          counter := counter + 1;
          latch_recv_who_has_int <= '1';
          arp_entry_for_who_has_reg.ip <= arp_entry_for_who_has.ip;
          arp_entry_for_who_has_reg.mac <= arp_entry_for_who_has.mac;
        elsif ( 0 /= counter ) then
          latch_recv_who_has_int <= '1';
          arp_entry_for_who_has_reg.ip <= arp_entry_for_who_has_reg.ip;
          arp_entry_for_who_has_reg.mac <= arp_entry_for_who_has_reg.mac;
          if (2 = counter) then
            latch_recv_who_has_int <= '0';
            counter := to_unsigned(0, 2);
          else
            counter := counter + 1;
          end if;
        end if;
      end if;
    end if;
  end process;

  -- process for syncing to the TX clock domain
  -- clocks control signals through 2 layers of tx clocking
  tx_sequential : process (tx_clk)
  begin
    if rising_edge(tx_clk) then
      if reset = '1' then
        -- reset state variables
        send_who_has_r1 <= '0';
        send_who_has_r2 <= '0';
        send_I_have_r1  <= '0';
        send_I_have_r2  <= '0';
      else
        -- normal (non reset) processing
        
        send_who_has_r1 <= arp_nwk_req.req;
        send_who_has_r2 <= send_who_has_r1;

        send_I_have_r1 <= recv_who_has;
        send_I_have_r2 <= send_I_have_r1;

      end if;
    end if;
  end process;

  arp_req_req_tx_to_rx_sync_proc: process(rx_clk)
    variable counter: unsigned(3 downto 0);
  begin
    if rising_edge(rx_clk) then
      if reset = '1' then
        arp_req_req_r1.lookup_req <= '0';
        arp_req_req_r1.ip <= (others => '0');
        arp_req_req_r2.lookup_req <= '0';
        arp_req_req_r2.ip <= (others => '0');
        counter := (others => '0');
        arp_req_ipaddr_fifo_rd_en <= '0';
      else
        arp_req_ipaddr_fifo_rd_en <= '0';

        arp_req_req_r1 <= arp_req_req_in;
        arp_req_req_r2 <= arp_req_req_r1;

        arp_req_req_out.lookup_req <= '0';

        if (counter /= 0) then
          counter := counter + 1;
          if counter = 4x"4" then
            arp_req_req_out.lookup_req <= '1';
            counter := 4x"0";
          elsif counter = 4x"2" then
            arp_req_ipaddr_fifo_rd_en <= '1';
          end if;
        elsif arp_req_req_r2.lookup_req = '1' then
            counter := 4x"01";
        end if; -- (counter /= 0)
      end if; -- reset = '1'
    end if; -- rising_edge(rx_clk)
  end process;

  arp_req_req_out_ipaddr_fifo: fifo_32bit
	port map (
      Data => arp_req_req_in.ip,
      Reset => reset,
      WrClk => tx_clk,
      RdClk => rx_clk,
      WrEn => arp_req_req_in.lookup_req,
      RdEn => arp_req_ipaddr_fifo_rd_en,
      Q => arp_req_req_out.ip,
      Empty => arp_req_ipaddr_fifo_empty,
      Full => arp_req_ipaddr_fifo_full
      );
  
  arp_req_rslt_rx_latch_proc: process(rx_clk)
  begin
    if rising_edge(rx_clk) then
      if reset = '1' then
        arp_req_rslt.got_mac <= '0';        -- set initial value of request result outputs
        arp_req_rslt.got_err <= '0';
        arp_req_rslt.mac     <= (others => '0');
      else
        arp_req_rslt.got_mac <= '0';        -- set initial value of request result outputs
        arp_req_rslt.got_err <= '0';
        arp_req_rslt.mac     <= (others => '0');

        if arp_req_rslt_in.got_mac = '1' then
          arp_req_rslt.got_mac <= '1';
          arp_req_rslt.mac <= arp_req_rslt_in.mac;
        elsif arp_req_rslt_in.got_err = '1' then
          arp_req_rslt.got_err <= '1';
        end if;
      end if;
    end if;
  end process;

  arp_req_rslt_rx_to_tx_sync_proc: process(tx_clk)
    variable counter : unsigned(1 downto 0);
  begin
    if rising_edge(tx_clk) then
      if reset = '1' then
        arp_req_rslt_r1.got_mac <= '0';        -- set initial value of request result outputs
        arp_req_rslt_r1.got_err <= '0';
        arp_req_rslt_r1.mac     <= (others => '0');

        arp_req_rslt_r2.got_mac <= '0';        -- set initial value of request result outputs
        arp_req_rslt_r2.got_err <= '0';
        arp_req_rslt_r2.mac     <= (others => '0');

        arp_req_rslt_out.got_mac <= '0';        -- set initial value of request result outputs
        arp_req_rslt_out.got_err <= '0';
        -- sync data to fifo
        -- arp_req_rslt_out.mac     <= (others => '0');
        counter := (others => '0');

        mac_address_sync_rd_en <= '0';
      else
        mac_address_sync_rd_en <= '0';

        arp_req_rslt_r1 <= arp_req_rslt;
        arp_req_rslt_r2 <= arp_req_rslt_r1;

        arp_req_rslt_out.got_mac <= '0';        -- set initial value of request result outputs
        arp_req_rslt_out.got_err <= '0';
        -- delay 2 cycles to match output of FIFO with reg
        if counter /= 0 then
          if counter = 2 then
            arp_req_rslt_out.got_mac <= '1';
            counter := "00";
          else
            counter := counter + 1;
          end if;
        elsif mac_address_sync_empty = '0' then
          mac_address_sync_rd_en <= '1';
          counter := "01";
        end if;
      end if;
    end if;
  end process;

  arp_req_rslt_macaddr_fifo: macaddr_fifo
	port map (
      Data => arp_req_rslt.mac,
      Reset => reset,
      WrClk => rx_clk,
      RdClk => tx_clk,
      WrEn => arp_req_rslt.got_mac,
      RdEn => mac_address_sync_rd_en,
      Q => arp_req_rslt_out.mac,
      Empty => mac_address_sync_empty,
      Full => mac_address_sync_full
      );
end Behavioral;

