library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.axi.all;
use work.ipv4_types.all;

entity udp_app is
  port (
    rstn: in std_logic;
    sys_clk: in std_logic;

    -- MAC related
    mac_rx_clk: in std_logic;
    mac_rx_data: in std_logic_vector(7 downto 0);
    mac_rx_last: in std_logic;
    mac_rx_error: in std_logic;
    mac_rx_statis_valid: in std_logic;
    mac_rx_statis_vector: in std_logic_vector(26 downto 0);
    mac_rx_valid: in std_logic;

    mac_tx_clk: in std_logic;
    mac_tx_valid: out std_logic;
    mac_tx_last: out std_logic;
    mac_tx_data: out std_logic_vector(7 downto 0);
    mac_tx_ready: in std_logic;
    mac_tx_error: out std_logic;

    -- UDP related
    udp_mac_rx_ready: out std_logic;

    link_up: in std_logic;
    negotiation_complete: in std_logic);

end udp_app;


architecture behaviour of udp_app is
  component UDP_Complete_nomac
    Port (
      -- UDP TX signals
      udp_tx_start			: in std_logic;							-- indicates req to tx UDP
      udp_txi					: in udp_tx_type;							-- UDP tx cxns
      udp_tx_result			: out std_logic_vector (1 downto 0);-- tx status (changes during transmission)
      udp_tx_data_out_ready: out std_logic;							-- indicates udp_tx is ready to take data
      -- UDP RX signals
      udp_rx_start			: out std_logic;							-- indicates receipt of udp header
      udp_rxo					: out udp_rx_type;
      -- IP RX signals
      ip_rx_hdr				: out ipv4_rx_header_type;
      -- system signals
      rx_clk					: in  STD_LOGIC;
      tx_clk					: in  STD_LOGIC;
      reset 					: in  STD_LOGIC;
      our_ip_address 		: in STD_LOGIC_VECTOR (31 downto 0);
      our_mac_address 		: in std_logic_vector (47 downto 0);
      control					: in udp_control_type;
      -- status signals
      arp_pkt_count			: out STD_LOGIC_VECTOR(7 downto 0);			-- count of arp pkts received
      ip_pkt_count			: out STD_LOGIC_VECTOR(7 downto 0);			-- number of IP pkts received for us
      -- MAC Transmitter
      mac_tx_tdata         : out  std_logic_vector(7 downto 0);	-- data byte to tx
      mac_tx_tvalid        : out  std_logic;							-- tdata is valid
      mac_tx_tready        : in std_logic;							-- mac is ready to accept data
      mac_tx_tfirst        : out  std_logic;							-- indicates first byte of frame
      mac_tx_tlast         : out  std_logic;							-- indicates last byte of frame
      -- MAC Receiver
      mac_rx_tdata         : in std_logic_vector(7 downto 0);	-- data byte received
      mac_rx_tvalid        : in std_logic;							-- indicates tdata is valid
      mac_rx_tready        : out  std_logic;							-- tells mac that we are ready to take data
      mac_rx_tlast         : in std_logic								-- indicates last byte of the trame
      );
  end component;

  component udp_app_store is
    generic(
      MAX_DATA_ENTRIES: integer := 10240);
    port (
      reset: in std_logic;

      -- MAC related
      clk: in std_logic;
      data_in_valid: in std_logic;
      data_in: in std_logic_vector(7 downto 0);

      data_out_ready: in std_logic;
      data_out: out std_logic_vector(7 downto 0);
      data_out_valid: out std_logic;

      write_overflow: out std_logic;
      read_available: out std_logic);
  end component;

  component xy2_pll
    port (
      clkin: in std_logic;
      init_clk: in std_logic;
      clkout0: out std_logic;
      clkout1: out std_logic;
      lock: out std_logic;
      reset: in std_logic
      );
  end component;

  component xy2_ctrl_fifo
	port (
      Data: in std_logic_vector(7 downto 0);
      Reset: in std_logic;
      WrClk: in std_logic;
      RdClk: in std_logic;
      WrEn: in std_logic;
      RdEn: in std_logic;
      AlmostEmptySetTh: in std_logic_vector(1 downto 0);
      AlmostEmptyClrTh: in std_logic_vector(1 downto 0);
      AlmostFullSetTh: in std_logic_vector(3 downto 0);
      AlmostFullClrTh: in std_logic_vector(3 downto 0);
      Wnum: out std_logic_vector(4 downto 0);
      Rnum: out std_logic_vector(2 downto 0);
      Almost_Empty: out std_logic;
      Almost_Full: out std_logic;
      Q: out std_logic_vector(31 downto 0);
      Empty: out std_logic;
      Full: out std_logic
      );
  end component;

  signal reset: std_logic;

  signal data_store_reset: std_logic;
  signal data_store_write: std_logic;
  signal data_store_write_data: std_logic_vector(7 downto 0);
  signal data_store_read_ready: std_logic;
  signal data_store_read_data: std_logic_vector(7 downto 0);
  signal data_store_read_valid: std_logic;
  signal data_store_write_overflow: std_logic;
  signal data_store_read_available: std_logic;

  signal xy2_pll_lock: std_logic;
  signal xy2_pll_clk_8M: std_logic;
  signal xy2_pll_clk_100M: std_logic;

  signal xy2_ctrl_fifo_wr_en: std_logic;
  signal xy2_ctrl_fifo_rd_en: std_logic;
  signal xy2_ctrl_fifo_wr_num: std_logic_vector(4 downto 0);
  signal xy2_ctrl_fifo_rd_num: std_logic_vector(2 downto 0);
  signal xy2_ctrl_fifo_almost_empty_2M: std_logic;
  signal xy2_ctrl_fifo_almost_empty_r1: std_logic;
  signal xy2_ctrl_fifo_almost_empty: std_logic;
  signal xy2_ctrl_fifo_almost_full: std_logic;
  signal xy2_ctrl_fifo_data_out: std_logic_vector(31 downto 0);
  signal xy2_ctrl_fifo_empty_2M: std_logic;
  signal xy2_ctrl_fifo_empty_r1: std_logic;
  signal xy2_ctrl_fifo_empty: std_logic;
  signal xy2_ctrl_fifo_full: std_logic;

  signal our_ip_address: std_logic_vector(31 downto 0);
  signal our_mac_address: std_logic_vector(47 downto 0);

  signal udp_tx_start: std_logic;
  signal udp_txi: udp_tx_type;
  signal udp_tx_result: std_logic_vector( 1 downto 0);
  signal udp_tx_data_out_ready: std_logic;
  signal udp_rx_start: std_logic;
  signal udp_rxo: udp_rx_type;
  signal ip_rx_hdr: ipv4_rx_header_type;

  -- signal udp_mac_tx_valid: std_logic;
  signal udp_mac_tx_first: std_logic;
  signal udp_control: udp_control_type;

  signal udp_arp_pkt_count: std_logic_vector(7 downto 0);
  signal udp_ip_pkt_count: std_logic_vector(7 downto 0);

  -- signal mac_tx_tfirst: std_logic;
  signal mac_rx_tready: std_logic;

  -- signal start_tx: std_logic;

  type tx_count_state_t is (RST, INCR, HOLD);
  -- signal tx_count_state: tx_count_state_t;
  -- signal tx_count: unsigned (15 downto 0);
  -- signal data_length: unsigned (15 downto 0); -- data length to be sent

  signal set_udp_txi_hdr: std_logic;
  signal data_out: std_logic_vector(7 downto 0);

  signal xy2_rd_done: std_logic;
  signal xy2_rstn: std_logic;

  type rx_state_t is (IDLE, RX_OTHER, RX_REQ_NUM, RX_RESP_DATA);
  signal rx_state: rx_state_t;

  type counter_mode_t is (CLR, INCR, HOLD);

  -- code from xy2_controller
  -- parsing udp request from the host
  -- type udp_req_fsm_t is (IDLE, CHECK_PREFIX, REQ_NUM, UNHANDLED);
  -- signal udp_req_fsm: udp_req_fsm_t;
  -- signal set_udp_req_fsm: std_logic;
  -- signal next_udp_req_fsm: udp_req_fsm_t;
  signal udp_req_data: unsigned (7 downto 0);

  signal start_resp_num: std_logic;

  -- udp tx
  signal udp_tx_cnt: unsigned(9 downto 0);
  signal udp_tx_cnt_instr: counter_mode_t;

  type udp_tx_fsm_t is (IDLE, TX_RESP_NUM);
  signal udp_tx_fsm: udp_tx_fsm_t;
  -- signal set_udp_tx_fsm: std_logic;
  -- signal next_udp_tx_fsm: udp_tx_fsm_t;

  signal recv_req_num: std_logic;
  signal recv_req_num_hold: std_logic; -- extend recv_req_num signal to 2 clocks
  signal set_udp_tx_resp_num_r1: std_logic;
  signal set_udp_tx_resp_num: std_logic;

  constant host_port: unsigned (15 downto 0) := to_unsigned(12346, 16);
  constant dst_port: unsigned (15 downto 0) := to_unsigned(12347, 16);
  constant src_port: unsigned (15 downto 0) := to_unsigned(33445, 16);

  constant udp_cmd_req_num: unsigned (7 downto 0) := x"01";
  constant udp_cmd_resp_num: unsigned (7 downto 0) := x"02";
  constant udp_cmd_resp_data: unsigned (7 downto 0) := x"03";

  signal udp_reset_reg1: std_logic;
  signal udp_reset: std_logic;

  signal tx_rstn_reg1: std_logic;
  signal tx_rstn: std_logic;
  signal rx_rstn_reg1: std_logic;
  signal rx_rstn: std_logic;

  signal set_udp_tx_done: std_logic;

  signal tx_data_index: unsigned(31 downto 0);

  signal rx_data_index: unsigned(31 downto 0);
  signal rx_data_length: unsigned(15 downto 0);

  signal active_send_r1: std_logic;
  signal active_send_r2: std_logic;

  signal set_send_data: std_logic;
  signal end_of_rx: std_logic;
  signal is_working: std_logic;

begin
  our_ip_address <= x"c0a80309";	-- 192.168.3.9
  our_mac_address <= x"002320212223";

  udp_reset_proc: process(mac_tx_clk)
  begin
    if rising_edge(mac_tx_clk) then
      udp_reset_reg1 <= not rstn;
      udp_reset <= udp_reset_reg1;
    end if;
  end process udp_reset_proc;

  reset <= not rstn;

  tx_rstn <= rstn;
  rx_rstn <= rstn;
  
  tx_seq_proc: process(mac_tx_clk)
    variable tx_count_state: tx_count_state_t;
    variable tx_count: unsigned (15 downto 0);
    constant max_data_length: unsigned(15 downto 0) := to_unsigned(10240, 16);
    variable first_done: std_logic;
    variable data_length: unsigned (15 downto 0); -- data length to be sent
    variable timeout_count_mode: tx_count_state_t;
    variable timeout_count: unsigned(31 downto 0);
    constant timeout_limit: unsigned(31 downto 0) := x"01000000";

    variable active_send_flag: std_logic;
  begin
    if rising_edge(mac_tx_clk) then
      if not tx_rstn then
        udp_tx_fsm <= IDLE;
        tx_count := (others => '0');
        tx_count_state := RST;
        first_done := '0';
        data_length := to_unsigned(0, 16);
        udp_tx_start <= '0';

        set_udp_txi_hdr <= '0';
        udp_txi.hdr.dst_ip_addr <= (others => '0');
        udp_txi.hdr.dst_port <= (others => '0');
        udp_txi.hdr.src_port <= (others => '0');
        udp_txi.hdr.data_length <= (others => '0');
        udp_txi.hdr.checksum <= (others => '0');
        udp_txi.data.data_out_valid <= '0';
        udp_txi.data.data_out_last <= '0';
        udp_txi.data.data_out <= x"00";

        tx_data_index <= (others => '0');

        timeout_count := (others => '0');
        timeout_count_mode := RST;
        set_send_data <= '0';
        active_send_flag := '0';
      else

        -- active_send_r1 <= active_send;
        active_send_r1 <= '0';
        active_send_r2 <= active_send_r1;
        set_send_data <= '0';

        if (active_send_r2 = '1') and (active_send_flag = '0') then
          set_send_data <= '1';
          active_send_flag := '1';
        elsif (active_send_r2 = '0') then
          active_send_flag := '0';
        end if;

        case udp_tx_fsm is
          when IDLE =>
            udp_tx_start <= '0';
            set_udp_txi_hdr <= '0';
            first_done := '0';
            set_udp_tx_done <= '0';
            data_length := to_unsigned(0, 16);

            udp_txi.hdr.dst_ip_addr <= (others => '0');
            udp_txi.hdr.dst_port <= (others => '0');
            udp_txi.hdr.src_port <= (others => '0');
            udp_txi.hdr.data_length <= (others => '0');
            udp_txi.hdr.checksum <= (others => '0');
            udp_txi.data.data_out_valid <= '0';
            udp_txi.data.data_out_last <= '0';
            udp_txi.data.data_out <= x"00";
            tx_count_state := RST;
            timeout_count_mode := RST;

            if (set_send_data = '1') or (set_udp_tx_resp_num = '1') then
              udp_tx_fsm <= TX_RESP_NUM;
            end if;
          when TX_RESP_NUM =>
            udp_tx_start <= '1';

            data_length := to_unsigned(7, 16);

            udp_txi.hdr.dst_ip_addr <= x"c0a80303"; -- 192.168.3.3
            udp_txi.hdr.dst_port <= std_logic_vector(dst_port);
            udp_txi.hdr.src_port <= std_logic_vector(src_port);
            udp_txi.hdr.data_length <= std_logic_vector(data_length);
            udp_txi.hdr.checksum <= x"0000";

            -- udp_txi.data.data_out <= std_logic_vector(tx_count(7 downto 0));
            timeout_count_mode := INCR;
            tx_count_state := HOLD;

            if ( udp_tx_data_out_ready = '1' ) then
              tx_count_state := INCR;
              timeout_count_mode := HOLD;
              if first_done = '0' then
                tx_count := x"0001";
                first_done := '1';
              end if;
            elsif (timeout_limit = timeout_count) then
              udp_tx_fsm <= IDLE;
            end if;

            udp_txi.data.data_out_valid <= '1';
            udp_txi.data.data_out_last <= '0';

            case tx_count is
              when x"0000" =>
                udp_txi.data.data_out <= std_logic_vector(udp_cmd_resp_num);
              when x"0001" =>
                udp_txi.data.data_out <= std_logic_vector(tx_data_index(31 downto 24));
              when x"0002" =>
                udp_txi.data.data_out <= std_logic_vector(tx_data_index(23 downto 16));
              when x"0003" =>
                udp_txi.data.data_out <= std_logic_vector(tx_data_index(15 downto 8));
              when x"0004" =>
                udp_txi.data.data_out <= std_logic_vector(tx_data_index(7 downto 0));
              when x"0005" =>
                udp_txi.data.data_out <= std_logic_vector(max_data_length(15 downto 8));
              when x"0006" =>
                udp_txi.data.data_out <= std_logic_vector(max_data_length(7 downto 0));
              when x"0007" =>
                udp_txi.data.data_out_last <= '1';
              when x"0008" =>
                udp_tx_start <= '0';
                udp_txi.data.data_out <= x"00";
                udp_txi.data.data_out_valid <= '0';
                set_udp_tx_done <= '1';
                udp_tx_fsm <= IDLE;
                tx_data_index <= tx_data_index + 1;
              when others =>
                udp_txi.data.data_out <= (others => '0');
            end case;
        end case;

        case tx_count_state is
          when RST =>
            tx_count := (others => '0');
          when INCR =>
            tx_count := tx_count + 1;
          when HOLD =>
            tx_count := tx_count;
        end case;

        case timeout_count_mode is
          when RST =>
            timeout_count := (others => '0');
          when INCR =>
            timeout_count := timeout_count + 1;
          when HOLD =>
            timeout_count := timeout_count;
        end case;

      end if; -- not tx_rstn
    end if; -- rising_edge(mac_tx_clk)
  end process;

  data_store_read_ready <= data_store_read_available
                           and (xy2_ctrl_fifo_empty or xy2_ctrl_fifo_almost_empty)
                           and (not xy2_ctrl_fifo_almost_full);

  rx_proc: process(mac_rx_clk)
    variable req_data: unsigned(7 downto 0);
    variable rx_data: std_logic_vector(7 downto 0);

    variable rx_counter_mode: counter_mode_t;
    variable rx_count: unsigned(15 downto 0);
    variable rx_left: unsigned (7 downto 0);
  begin
    if rising_edge(mac_rx_clk) then
      if not rstn then
        rx_counter_mode := CLR;
        rx_count := (others => '0');
        req_data := (others => '0');
        rx_data := (others => '0');

        rx_state <= IDLE;
        recv_req_num <= '0';
        rx_data_index <= (others => '0');
        data_store_write <= '0';
        data_store_write_data <= (others => '0');
        data_store_reset <= '1';

        rx_left := (others => '0');
        end_of_rx <= '0';
        is_working <= '0';
      else
        rx_counter_mode := HOLD;
        recv_req_num <= '0';

        data_store_write <= '0';
        data_store_write_data <= (others => '0');
        data_store_reset <= '0';

        end_of_rx <= '0';

        case rx_state is
          when IDLE =>
            recv_req_num <= '0';
            rx_counter_mode := CLR;

            if udp_rx_start = '1' and udp_rxo.data.data_in_valid = '1' then
              req_data := unsigned(udp_rxo.data.data_in);
              if ((unsigned(udp_rxo.hdr.dst_port) >= host_port)
                  and (unsigned(udp_rxo.hdr.dst_port) < (host_port + 10))) then
                case req_data is
                  when udp_cmd_req_num =>
                    -- notify tx_proc to start tx
                    -- here is cross domain clock problem
                    if (unsigned(udp_rxo.hdr.dst_port) = host_port) then
                      rx_count        := x"0001";
                      rx_counter_mode := HOLD;
                      rx_state <= RX_REQ_NUM;
                    end if;
                  when udp_cmd_resp_data =>
                    if (unsigned(udp_rxo.hdr.dst_port) = host_port) then
                      rx_count        := x"0001";
                      rx_counter_mode := HOLD;
                      rx_state <= RX_RESP_DATA;
                    end if;
                  when others =>
                end case; -- req_data
              else
              end if;
            end if;
          when RX_OTHER =>
            if udp_rx_start = '1' then
              if udp_rxo.data.data_in_valid = '1' then
                rx_counter_mode := INCR;
              else
                rx_counter_mode := HOLD;
              end if;
            else
              rx_counter_mode := HOLD;
              rx_state <= IDLE;
            end if;
          when RX_REQ_NUM =>
            if udp_rx_start = '1' then
              if udp_rxo.data.data_in_valid = '1' then
                rx_counter_mode := INCR;
              else
                rx_counter_mode := HOLD;
              end if;
            else
              rx_counter_mode := HOLD;
              recv_req_num <= '1';
              rx_state <= IDLE;
            end if;
          when RX_RESP_DATA =>
            if udp_rx_start = '1' then
              if udp_rxo.data.data_in_valid = '1' then
                rx_counter_mode := INCR;
                rx_data := udp_rxo.data.data_in;
                case rx_count is
                  when x"0001" =>
                    rx_data_index(31 downto 24) <= unsigned(rx_data);
                  when x"0002" =>
                    rx_data_index(23 downto 16) <= unsigned(rx_data);
                  when x"0003" =>
                    rx_data_index(15 downto 8) <= unsigned(rx_data);
                  when x"0004" =>
                    rx_data_index(7 downto 0) <= unsigned(rx_data);
                  when x"0005" =>
                    rx_data_length(15 downto 8) <= unsigned(rx_data);
                  when x"0006" =>
                    rx_data_length(7 downto 0) <= unsigned(rx_data);
                  when x"0007" =>
                    rx_left := unsigned(rx_data);
                  when others =>
                    data_store_write <= '1';
                    data_store_write_data <= rx_data;
                end case;
                if rx_count = 10 then
                  is_working <= '1';
                end if;
              else
                rx_counter_mode := HOLD;
              end if;
            else
              rx_counter_mode := HOLD;
              if rx_left = 0 then
                end_of_rx <= '1';
                -- recv_req_num <= '1';
              end if;

              rx_state <= IDLE;
            end if;
        end case;
        if (is_working = '1')
          and (data_store_read_available = '0') then
          -- all data store is read out
          data_store_reset <= '1';
          recv_req_num <= '1';
          is_working <= '0';
        end if;
      end if; -- not rstn

      case rx_counter_mode is
        when CLR =>
          rx_count := (others => '0');
        when INCR =>
          rx_count := rx_count + 1;
        when HOLD =>
          rx_count := rx_count;
      end case;
    end if; -- rising_edge
  end process;

  -- Clock Domain Crossing from RX to TX
  rx_to_tx_proc: process(mac_tx_clk)
  begin
    if rising_edge(mac_tx_clk) then
      if not rx_rstn then
        set_udp_tx_resp_num_r1 <= '0';
        set_udp_tx_resp_num <= '0';
      else
        set_udp_tx_resp_num_r1 <= recv_req_num_hold;
        set_udp_tx_resp_num <= set_udp_tx_resp_num_r1;
      end if;
    end if;
  end process;

  -- Clock Domain Crossing from RX to TX
  recv_req_num_rx_to_tx_proc: process(mac_rx_clk)
    variable hold_cnt: unsigned(1 downto 0) := (others => '0');
  begin
    if rising_edge(mac_rx_clk) then
      if not rx_rstn then
        hold_cnt := (others => '0');
      else
        recv_req_num_hold <= '0';
        if recv_req_num = '1' then
          hold_cnt := to_unsigned(1, 2);
        end if;

        if hold_cnt /= 0 then
          recv_req_num_hold <= '1';
          hold_cnt := hold_cnt + 1;
          if hold_cnt = 3 then
            hold_cnt := (others => '0');
          end if;
        end if;
      end if; -- not rstn
    end if; -- rising_edge(mac_rx_clk)
  end process;

  -- rx_counter_proc: process(mac_rx_clk)
  -- begin
  --   if rising_edge(mac_rx_clk) then
  --     if not rx_rstn then
  --       rx_count <= (others => '0');
  --     else
  --       case rx_counter_mode is
  --         when CLR =>
  --           rx_count <= (others => '0');
  --         when INC =>
  --           rx_count <= rx_count + 1;
  --         when DEC =>
  --           rx_count <= rx_count - 1;
  --         when HOLD =>
  --           rx_count <= rx_count;
  --       end case;
  --     end if;
  --   end if; -- rising_edge(clk)
  -- end process rx_counter_proc;

  udp_tx_result_proc: process(mac_tx_clk)
  begin
    if rising_edge(mac_tx_clk) then
      case udp_tx_result is
        when IPTX_RESULT_ERR =>
          mac_tx_error <= '1';
        when others =>
          mac_tx_error <= '0';
      end case;
    end if;
  end process;

  udp_tx1: UDP_Complete_nomac
    port map (
      udp_tx_start => udp_tx_start,
      udp_txi => udp_txi,
      udp_tx_result => udp_tx_result,
      udp_tx_data_out_ready => udp_tx_data_out_ready,
      udp_rx_start => udp_rx_start,
      udp_rxo => udp_rxo,
      ip_rx_hdr => ip_rx_hdr,
      
      rx_clk => mac_rx_clk,
      tx_clk => mac_tx_clk,
      
      reset => udp_reset,

      our_ip_address => our_ip_address,
      our_mac_address => our_mac_address,

      control => udp_control,

      arp_pkt_count =>udp_arp_pkt_count,
      ip_pkt_count => udp_ip_pkt_count,

      mac_tx_tdata => mac_tx_data,
      mac_tx_tvalid => mac_tx_valid,
      mac_tx_tready => mac_tx_ready,
      mac_tx_tfirst => udp_mac_tx_first,
      mac_tx_tlast => mac_tx_last,

      mac_rx_tdata => mac_rx_data,
      mac_rx_tvalid => mac_rx_valid,
      mac_rx_tready => udp_mac_rx_ready,
      mac_rx_tlast => mac_rx_last);

  data_store: udp_app_store
    generic map (
      MAX_DATA_ENTRIES => 10240)
    port map (
      reset => data_store_reset,
      clk => mac_rx_clk,
      data_in_valid => data_store_write,
      data_in => data_store_write_data,
      data_out_ready => data_store_read_ready,
      data_out => data_store_read_data,
      data_out_valid => data_store_read_valid,

      write_overflow => data_store_write_overflow,
      read_available => data_store_read_available);

  xy2_pll1: xy2_pll
    port map (
      clkin => sys_clk,
      init_clk => sys_clk,
      clkout0 => xy2_pll_clk_8M,
      clkout1 => xy2_pll_clk_100M,
      lock => xy2_pll_lock,
      reset => reset
      );

  sync_almost_empty_to_rx_clk: process(mac_rx_clk)
  begin
    if rising_edge(mac_rx_clk) then
      if reset = '1' then
        xy2_ctrl_fifo_almost_empty <= '0';
        xy2_ctrl_fifo_almost_empty_r1 <= '0';
        xy2_ctrl_fifo_empty <= '0';
        xy2_ctrl_fifo_empty_r1 <= '0';
      else
        xy2_ctrl_fifo_almost_empty_r1 <= xy2_ctrl_fifo_almost_empty_2M;
        xy2_ctrl_fifo_almost_empty <= xy2_ctrl_fifo_almost_empty_r1;

        xy2_ctrl_fifo_empty_r1 <= xy2_ctrl_fifo_empty_2M;
        xy2_ctrl_fifo_empty <= xy2_ctrl_fifo_empty_r1;

      end if;
    end if;
  end process;

  xy2_ctrl_fifo_wr_en <= data_store_read_valid;

  xy2_ctrl_fifo_rd_en <= not xy2_ctrl_fifo_empty_2M;

  xy2_ctrl_fifo1: xy2_ctrl_fifo
	port map (
      Data => data_store_read_data,
      Reset => reset,
      WrClk => mac_rx_clk,
      RdClk => xy2_pll_clk_8M,
      WrEn => xy2_ctrl_fifo_wr_en,
      RdEn => xy2_ctrl_fifo_rd_en,
      AlmostEmptySetTh => std_logic_vector(to_unsigned(1, 2)),
      AlmostEmptyClrTh => std_logic_vector(to_unsigned(2, 2)),
      AlmostFullSetTh => std_logic_vector(to_unsigned(15, 4)),
      AlmostFullClrTh => std_logic_vector(to_unsigned(7, 4)),
      Wnum => xy2_ctrl_fifo_wr_num,
      Rnum => xy2_ctrl_fifo_rd_num,
      Almost_Empty => xy2_ctrl_fifo_almost_empty_2M,
      Almost_Full => xy2_ctrl_fifo_almost_full,
      Q => xy2_ctrl_fifo_data_out,
      Empty => xy2_ctrl_fifo_empty_2M,
      Full => xy2_ctrl_fifo_full
      );
  
end;
