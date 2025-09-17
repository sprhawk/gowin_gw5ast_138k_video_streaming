library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
  port (
    sys_clk: in std_logic;

    key0_n: in std_logic;
    key1_n: in std_logic;
    key2_n: in std_logic;
    key3_n: in std_logic;

    -- Ethernet MAC
    phy_clk: out std_logic; -- to 1G Eth Phy
    phy_rstn: out std_logic;
    
    rgmii_rxc: in std_logic;
    rgmii_rx_ctl: in std_logic;
    rgmii_rxd: in std_logic_vector(3 downto 0);

    rgmii_txc: out std_logic;
    rgmii_tx_ctl: out std_logic;
    rgmii_txd: out std_logic_vector(3 downto 0);

    mdc: out std_logic;
    mdio: inout std_logic;

    -- UART MASTER
    tx: out std_logic;
    rx: in std_logic);

end top;

architecture behaviour of top is
  component Gowin_PLL
    port (
      clkin: in std_logic;
      init_clk: in std_logic;
      clkout0: out std_logic; -- 125 Mhz
      clkout1: out std_logic; -- 25 Mhz
      lock: out std_logic;
      reset: in std_logic
      );
  end component;

  component Triple_Speed_Ethernet_MAC_Top
	port (
      rgmii_rxc: in std_logic;
      rgmii_rx_ctl: in std_logic;
      rgmii_rxd: in std_logic_vector(3 downto 0);
      gtx_clk: in std_logic;
      rgmii_txc: out std_logic;
      rgmii_tx_ctl: out std_logic;
      rgmii_txd: out std_logic_vector(3 downto 0);
      speedis1000: in std_logic;
      speedis10: in std_logic;
      duplex_status: in std_logic;
      rstn: in std_logic;
      rx_mac_clk: out std_logic;
      rx_mac_valid: out std_logic;
      rx_mac_data: out std_logic_vector(7 downto 0);
      rx_mac_last: out std_logic;
      rx_mac_error: out std_logic;
      rx_statistics_valid: out std_logic;
      rx_statistics_vector: out std_logic_vector(26 downto 0);
      tx_mac_clk: out std_logic;
      tx_mac_valid: in std_logic;
      tx_mac_data: in std_logic_vector(7 downto 0);
      tx_mac_last: in std_logic;
      tx_mac_error: in std_logic;
      tx_mac_ready: out std_logic;
      tx_collision: out std_logic;
      tx_retransmit: out std_logic;
      tx_statistics_valid: out std_logic;
      tx_statistics_vector: out std_logic_vector(28 downto 0);
      rx_fcs_fwd_ena: in std_logic;
      rx_jumbo_ena: in std_logic;
      rx_pause_req: out std_logic;
      rx_pause_val: out std_logic_vector(15 downto 0);
      tx_fcs_fwd_ena: in std_logic;
      tx_ifg_delay_ena: in std_logic;
      tx_ifg_delay: in std_logic_vector(7 downto 0);
      tx_pause_req: in std_logic;
      tx_pause_val: in std_logic_vector(15 downto 0);
      tx_pause_source_addr: in std_logic_vector(47 downto 0);
      clk: in std_logic;
      miim_phyad: in std_logic_vector(4 downto 0);
      miim_regad: in std_logic_vector(4 downto 0);
      miim_wrdata: in std_logic_vector(15 downto 0);
      miim_wren: in std_logic;
      miim_rden: in std_logic;
      miim_rddata: out std_logic_vector(15 downto 0);
      miim_rddata_valid: out std_logic;
      miim_busy: out std_logic;
      mdc: out std_logic;
      mdio_in: in std_logic;
      mdio_out: out std_logic;
      mdio_oen: out std_logic
      );
  end component;

  component miim_controller
    generic (
      phyad: std_logic_vector(4 downto 0) := "00001");

    port (
      rstn: in std_logic;
      clk: in std_logic;
      miim_rddata_valid: in std_logic;
      miim_rddata: in std_logic_vector(15 downto 0);
      miim_busy: in std_logic;

      miim_phyad: out std_logic_vector(4 downto 0);
      miim_regad: out std_logic_vector(4 downto 0);
      miim_wrdata: out std_logic_vector(15 downto 0);
      miim_wren: out std_logic;
      miim_rden: out std_logic;
      link_up: out std_logic;
      negotiated: out std_logic);
  end component;

  component uart_app
	port (
      rstn: in std_logic;
      clk: in std_logic;
      uart_serial_out: out std_logic;
      uart_serial_in: in std_logic);
  end component;

  component udp_app
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
      mac_tx_data: out std_logic_vector(7 downto 0);
      mac_tx_last: out std_logic;
      mac_tx_ready: in std_logic;
      mac_tx_error: out std_logic;
      mac_tx_valid: out std_logic;

      -- UDP related
      udp_mac_rx_ready: out std_logic;

      link_up: in std_logic;
      negotiation_complete: in std_logic);
  end component;

  constant miim_phyad: std_logic_vector(4 downto 0) := "00001";

  signal rstn: std_logic;
  signal clk_125M: std_logic; -- to Triple Speed Ethernet Mac
  signal clk_25M: std_logic; -- to phy clk
  signal pll_reset: std_logic;
  signal pll_lock: std_logic;

  signal mac_rx_clk: std_logic;
  signal mac_rx_valid: std_logic;
  signal mac_rx_data: std_logic_vector(7 downto 0);
  signal mac_rx_last: std_logic;
  signal mac_rx_error: std_logic;
  signal mac_rx_statis_valid: std_logic;
  signal mac_rx_statis_vector: std_logic_vector(26 downto 0);
  signal mac_tx_clk: std_logic;
  signal mac_tx_valid: std_logic;
  signal mac_tx_data: std_logic_vector(7 downto 0);
  signal mac_tx_last: std_logic;
  signal mac_tx_error: std_logic;
  signal mac_tx_ready: std_logic;

  signal mac_tx_statis_valid: std_logic;
  signal mac_tx_statis_vector: std_logic_vector(28 downto 0);

  signal mac_miim_phyad: std_logic_vector(4 downto 0);
  signal mac_miim_regad: std_logic_vector(4 downto 0);
  signal mac_miim_wrdata: std_logic_vector(15 downto 0);
  signal mac_miim_wren: std_logic;
  signal mac_miim_rden: std_logic;
  signal mac_miim_rddata_valid: std_logic;
  signal mac_miim_rddata: std_logic_vector(15 downto 0);
  signal mac_miim_busy: std_logic;

  signal miim_clk: std_logic;
  signal miim_resetn: std_logic;
  signal miim_resetn_reg: std_logic;

  signal mdio_in: std_logic;
  signal mdio_out: std_logic;
  signal mdio_oen: std_logic;

  signal link_up: std_logic;
  signal negotiation_complete: std_logic;

  signal udp_mac_tx_valid: std_logic;
  signal udp_mac_tx_first: std_logic;
  signal udp_mac_tx_last: std_logic;
  signal mac_tx_tfirst: std_logic;
  signal udp_mac_rx_ready: std_logic;
  signal mac_tx_done: std_logic;
  
  signal our_ip_address: std_logic_vector(31 downto 0);
  signal our_mac_address: std_logic_vector(47 downto 0);

begin

  phy_rstn <= rstn;
  phy_clk <= clk_25M;
  rstn <= key0_n;
  pll_reset <= not rstn;
  miim_clk <= sys_clk;

  our_ip_address <= x"c0a80309";	-- 192.168.3.9
  our_mac_address <= x"002320212223";

  udp_app1: udp_app
    port map (
      rstn => rstn,
      sys_clk => sys_clk,
      mac_rx_clk => mac_rx_clk,
      mac_rx_data => mac_rx_data,
      mac_rx_last => mac_rx_last,
      mac_rx_error => mac_rx_error,
      mac_rx_statis_vector => mac_rx_statis_vector,
      mac_rx_statis_valid => mac_rx_statis_valid,
      mac_rx_valid => mac_rx_valid,
      udp_mac_rx_ready => udp_mac_rx_ready,

      mac_tx_clk => mac_tx_clk,
      mac_tx_valid => mac_tx_valid,
      mac_tx_last => udp_mac_tx_last,
      mac_tx_data => mac_tx_data,
      mac_tx_error => mac_tx_error,
      mac_tx_ready => mac_tx_ready,

      link_up => link_up,
      negotiation_complete => negotiation_complete);

  pll1: Gowin_PLL
    port map (
      clkin => sys_clk,
      init_clk => sys_clk,
      clkout0 => clk_125M,
      clkout1 => clk_25M,
      lock => pll_lock,
      reset => pll_reset
      );

  temac1: Triple_Speed_Ethernet_MAC_Top
	port map (
		rgmii_rxc => rgmii_rxc,
		rgmii_rx_ctl => rgmii_rx_ctl,
		rgmii_rxd => rgmii_rxd,
		gtx_clk => clk_125M,
		rgmii_txc => rgmii_txc,
		rgmii_tx_ctl => rgmii_tx_ctl,
		rgmii_txd => rgmii_txd,
		speedis1000 => '1',
		speedis10 => '0',
		duplex_status => '1',
		rstn => rstn,
		rx_mac_clk => mac_rx_clk,
		rx_mac_valid => mac_rx_valid,
		rx_mac_data => mac_rx_data,
		rx_mac_last => mac_rx_last,
		rx_mac_error => mac_rx_error,
		rx_statistics_valid => mac_rx_statis_valid,
		rx_statistics_vector => mac_rx_statis_vector,
		tx_mac_clk => mac_tx_clk,
		tx_mac_valid => mac_tx_valid,
		tx_mac_data => mac_tx_data,
		tx_mac_last => udp_mac_tx_last,
		tx_mac_error => mac_tx_error,
		tx_mac_ready => mac_tx_ready, -- mac_tx_ready,
		tx_statistics_valid => mac_tx_statis_valid,
		tx_statistics_vector => mac_tx_statis_vector,
        -- tx_collision => tx_collision,
        -- tx_retransmit => tx_retransmit,
		rx_fcs_fwd_ena => '0',
		rx_jumbo_ena => '0',
		-- rx_pause_req => rx_pause_req,
		-- rx_pause_val => rx_pause_val,
		tx_fcs_fwd_ena => '0',
		tx_ifg_delay_ena => '0',
		tx_ifg_delay => std_logic_vector(to_unsigned(0, 8)),
		tx_pause_req => '0',
		tx_pause_val => std_logic_vector(to_unsigned(0, 16)),
		tx_pause_source_addr => std_logic_vector(to_unsigned(0, 48)),
		clk => miim_clk,
		miim_phyad => mac_miim_phyad,
		miim_regad => mac_miim_regad,
		miim_wrdata => mac_miim_wrdata,
		miim_wren => mac_miim_wren,
		miim_rden => mac_miim_rden,
		miim_rddata => mac_miim_rddata,
		miim_rddata_valid => mac_miim_rddata_valid,
		miim_busy => mac_miim_busy,
		mdc => mdc,
		mdio_in => mdio_in,
		mdio_out => mdio_out,
		mdio_oen => mdio_oen
	);

  mdio_in <= mdio when mdio_oen = '1' else 'Z';
  mdio <= mdio_out when mdio_oen = '0' else 'Z';

  miim_reset_proc: process(miim_clk)
  begin
    if rising_edge(miim_clk) then
      miim_resetn_reg <= rstn;
      miim_resetn <= miim_resetn_reg;
    end if;
  end process;

  miim_ctrl1: miim_controller
    generic map (
      phyad => miim_phyad)
    port map (
      rstn => miim_resetn,
      clk => miim_clk,
      miim_rddata_valid => mac_miim_rddata_valid,
      miim_rddata => mac_miim_rddata,
      miim_busy => mac_miim_busy,
      miim_phyad => mac_miim_phyad,
      miim_regad => mac_miim_regad,
      miim_wrdata => mac_miim_wrdata,
      miim_wren => mac_miim_wren,
      miim_rden => mac_miim_rden,
      link_up => link_up,
      negotiated => negotiation_complete);

  uart_app1: uart_app
    port map (
      rstn => rstn,
      clk => sys_clk,
      uart_serial_in => rx,
      uart_serial_out => tx);

end architecture behaviour;
