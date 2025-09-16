library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_app is
  port (
    rstn: in std_logic;
    clk: in std_logic;

    uart_serial_out: out std_logic;
    uart_serial_in: in std_logic);
end uart_app;

architecture behaviour of uart_app is
  component UART_MASTER_Top
	port (
      I_CLK: in std_logic;
      I_RESETN: in std_logic;
      I_TX_EN: in std_logic;
      I_WADDR: in std_logic_vector(2 downto 0);
      I_WDATA: in std_logic_vector(7 downto 0);
      I_RX_EN: in std_logic;
      I_RADDR: in std_logic_vector(2 downto 0);
      O_RDATA: out std_logic_vector(7 downto 0);
      SIN: in std_logic;
      RxRDYn: out std_logic;
      SOUT: out std_logic;
      TxRDYn: out std_logic;
      DDIS: out std_logic;
      INTR: out std_logic;
      DCDn: in std_logic;
      CTSn: in std_logic;
      DSRn: in std_logic;
      RIn: in std_logic;
      DTRn: out std_logic;
      RTSn: out std_logic
      );
  end component;

  type tx_fsm_state_t is (
    TX_IDLE, TX_INIT, TX_WAITING_ST, TX);

  type rd_fsm_state_t is (
    RD_IDLE, RD_INT, RD_ST);

  signal uart_tx_en: std_logic;
  signal uart_wr_addr: std_logic_vector(2 downto 0);
  signal uart_wr_data: std_logic_vector(7 downto 0);
  signal uart_rx_en: std_logic;
  signal uart_rd_addr: std_logic_vector(2 downto 0);
  signal uart_rd_data: std_logic_vector(7 downto 0);
  signal uart_rx_ready_n: std_logic;

  signal uart_tx_ready_n: std_logic;
  signal uart_disable_driver: std_logic;
  signal uart_interrupt: std_logic;
  signal uart_dcd_n: std_logic;
  signal uart_cts_n: std_logic;
  signal uart_dsr_n: std_logic;
  signal uart_ri_n: std_logic;
  signal uart_dtr_n: std_logic;
  signal uart_rts_n: std_logic;

  signal read_status: std_logic;
  signal tx_avail: std_logic;
  signal status_done: std_logic;
  signal clear_status: std_logic;
  
  signal status: unsigned(7 downto 0) := (others => '0');

  -- signal int_data: unsigned(7 downto 0) := (others => '0');

  signal tx_state: tx_fsm_state_t;
  signal rd_state: rd_fsm_state_t;
  
  constant UART_LCR_ADDR: unsigned(2 downto 0) := "011";
  constant UART_LSR_ADDR: unsigned(2 downto 0) := "101";
  constant UART_RBR_ADDR: unsigned(2 downto 0) := "000";
  constant UART_THR_ADDR: unsigned(2 downto 0) := "000";
  constant UART_IER_ADDR: unsigned(2 downto 0) := "001";
  constant UART_IIR_ADDR: unsigned(2 downto 0) := "010";

begin
  uart_master_top1: UART_MASTER_Top
	port map (
		I_CLK => clk,
		I_RESETN => rstn,
		I_TX_EN => uart_tx_en,
		I_WADDR => uart_wr_addr,
		I_WDATA => uart_wr_data,
		I_RX_EN => uart_rx_en,
		I_RADDR => uart_rd_addr,
		O_RDATA => uart_rd_data,
		SIN => uart_serial_in,
		RxRDYn => uart_rx_ready_n,
		SOUT => uart_serial_out,
		TxRDYn => uart_tx_ready_n,
		DDIS => uart_disable_driver,
		INTR => uart_interrupt,
		DCDn => uart_dcd_n,
		CTSn => uart_cts_n,
		DSRn => uart_dsr_n,
		RIn => uart_ri_n,
		DTRn => uart_dtr_n,
		RTSn => uart_rts_n
	);

  -- uart_serial_in <= uart_serial_out;
  
  process(clk, rstn)
    -- variable state: tx_fsm_state_t := TX_IDLE;
    variable counter: natural := 0;
  begin
    if not rstn then
      tx_state <= TX_IDLE;
      uart_wr_addr <= "000";
      uart_wr_data <= 8b"0000_0000";
      counter := 0;
      uart_tx_en <= '0';
      read_status <= '0';
      -- int_data <= "00000000";
      -- status_data <= "00000000";
      uart_dcd_n <= '0';
      uart_cts_n <= '0';
      uart_dsr_n <= '0';
    elsif rising_edge(clk) then
      case tx_state is
        when TX_IDLE =>
          counter := counter + 1;
          if counter = 5 then
            counter := 0;
            tx_state <= TX_INIT;
          end if;
        when TX_INIT =>
          counter := counter + 1;
          if counter = 1 then
            uart_tx_en <= '1';
            uart_wr_addr <= std_logic_vector(UART_IER_ADDR);
            -- THRI, RBRI
            uart_wr_data <= b"0000_0011";
          elsif counter = 2 then
            uart_tx_en <= '0';
            uart_wr_addr <= 3b"000";
            uart_wr_data <= 8b"0000_0000";
          elsif counter = 3 then
            uart_tx_en <= '1';
            uart_wr_addr <= std_logic_vector(UART_LCR_ADDR);
            -- 8 databits, N parity, 1 stopbit,
            -- BIT 6 is Break Control, not Enable Interrupt
            uart_wr_data <= b"0000_0011";
            read_status <= '1';
            tx_state <= TX_WAITING_ST;
            counter := 0;
          end if;
        when TX_WAITING_ST =>
          uart_tx_en <= '0';
          uart_wr_addr <= 3b"000";
          uart_wr_data <= 8b"0000_0000";
          if (tx_avail = '1') then
            read_status <= '0';
            tx_state <= TX;
            counter := 0;
          end if;
          if (clear_status) then
          end if;
        when TX =>
          counter := counter + 1;
          if counter = 1 then
            uart_tx_en <= '1';
            uart_wr_addr <= std_logic_vector(UART_THR_ADDR);
            -- uart_wr_data <= 8b"0110_1010";
            uart_wr_data <= 8b"0100_0001"; -- 'A'
          elsif counter = 2 then
            uart_tx_en <= '0';
            -- uart_wr_addr <= 3b"000";
            -- uart_wr_data <= 8b"0000_0000";
          elsif counter = 3 then
            counter := 0;
            tx_state <= TX_WAITING_ST;
          end if;
      end case;
    end if;
  end process;

  -- handling interrupt and reading status
  process (clk, rstn)
    variable counter: natural;
    variable status_data: unsigned(7 downto 0);
    variable int_data: unsigned(7 downto 0);
  begin
    if not rstn then
      rd_state <= RD_IDLE;
      uart_rx_en <= '0';
      counter := 0;
      tx_avail <= '0';
      status_data := (others => '0');
      int_data := (others => '0');
      status_done <= '0';
      clear_status <= '0';
    elsif rising_edge(clk) then
      case rd_state is
        when RD_IDLE =>
          if uart_interrupt then
            rd_state <= RD_INT;
            counter := 0;
            uart_rx_en <= '1';
            uart_rd_addr <= std_logic_vector(UART_IIR_ADDR);
          elsif read_status then
            uart_rd_addr <= std_logic_vector(UART_LSR_ADDR);
            rd_state <= RD_ST;
            counter := 0;
            uart_rx_en <= '1';
            status_done <= '0';
            tx_avail <= '0';
          end if;
        when RD_INT =>
          counter := counter + 1;
          -- wait 2 cycles to read uart_rd_data
          if counter = 1 then
            uart_rx_en <= '0';
          elsif counter = 3 then
            int_data := unsigned(uart_rd_data);
            if (int_data(0) = '0') and (int_data(1) = '1') and (int_data(2) = '0') then
              tx_avail <= '1';
            end if;
          elsif counter = 4 then
            -- tx_avail <= '0';
            -- rd_state <= RD_IDLE;

            uart_rd_addr <= std_logic_vector(UART_LSR_ADDR);
            rd_state <= RD_ST;
            counter := 0;
            uart_rx_en <= '1';
            status_done <= '0';
            tx_avail <= '0';
          end if;
        when RD_ST =>
          counter := counter + 1;
          if counter = 1 then
            uart_rx_en <= '0';
          elsif counter = 2 then
            status_data := unsigned(uart_rd_data);
            status <= status_data;
            if status(3) then
              clear_status <= '1';
            end if;
            if status(6) or status(5) then
              tx_avail <= '1';
            end if;
            status_done <= '1';
          elsif counter = 3 then
            rd_state <= RD_IDLE;
            -- read_status <= '0';
          end if;
      end case;
    end if;
  end process;

  -- process(clk, rst)
  --   variable counter: natural := 0;
  --   variable state: lsr_fsm_state_t := LSR_IDLE;
  --   variable data: unsigned(7 downto 0) := (others => '0');
  -- begin
  --   if rst then
  --     counter := 0;
  --     state := LSR_IDLE;
  --   elsif rising_edge(clk) then
  --     case state is
  --       when LSR_IDLE =>
  --         uart_rx_en <= '1';
  --         uart_rd_addr <= std_logic_vector(UART_LSR_ADDR);
  --         state := LSR_RD;
  --         counter := 0;
  --       when LSR_RD =>
  --         counter := counter + 1;
  --         if counter = 1 then
  --           uart_rx_en <= '0';
  --         elsif counter = 2 then
  --           data := unsigned(uart_rd_data);
  --         elsif counter = 3 then
  --           state := LSR_IDLE;
  --         else
  --         end if;
  --     end case;
  --   end if;
  -- end process;
end;
