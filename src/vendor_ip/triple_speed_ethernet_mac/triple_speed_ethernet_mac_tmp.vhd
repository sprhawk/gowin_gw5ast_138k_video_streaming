--Copyright (C)2014-2025 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--Tool Version: V1.9.11.02
--Part Number: GW5AST-LV138FPG676AC1/I0
--Device: GW5AST-138
--Device Version: B
--Created Time: Sun Sep 14 11:26:49 2025

--Change the instance name and port connections to the signal names
----------Copy here to design--------

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

your_instance_name: Triple_Speed_Ethernet_MAC_Top
	port map (
		rgmii_rxc => rgmii_rxc,
		rgmii_rx_ctl => rgmii_rx_ctl,
		rgmii_rxd => rgmii_rxd,
		gtx_clk => gtx_clk,
		rgmii_txc => rgmii_txc,
		rgmii_tx_ctl => rgmii_tx_ctl,
		rgmii_txd => rgmii_txd,
		speedis1000 => speedis1000,
		speedis10 => speedis10,
		duplex_status => duplex_status,
		rstn => rstn,
		rx_mac_clk => rx_mac_clk,
		rx_mac_valid => rx_mac_valid,
		rx_mac_data => rx_mac_data,
		rx_mac_last => rx_mac_last,
		rx_mac_error => rx_mac_error,
		rx_statistics_valid => rx_statistics_valid,
		rx_statistics_vector => rx_statistics_vector,
		tx_mac_clk => tx_mac_clk,
		tx_mac_valid => tx_mac_valid,
		tx_mac_data => tx_mac_data,
		tx_mac_last => tx_mac_last,
		tx_mac_error => tx_mac_error,
		tx_mac_ready => tx_mac_ready,
		tx_collision => tx_collision,
		tx_retransmit => tx_retransmit,
		tx_statistics_valid => tx_statistics_valid,
		tx_statistics_vector => tx_statistics_vector,
		rx_fcs_fwd_ena => rx_fcs_fwd_ena,
		rx_jumbo_ena => rx_jumbo_ena,
		rx_pause_req => rx_pause_req,
		rx_pause_val => rx_pause_val,
		tx_fcs_fwd_ena => tx_fcs_fwd_ena,
		tx_ifg_delay_ena => tx_ifg_delay_ena,
		tx_ifg_delay => tx_ifg_delay,
		tx_pause_req => tx_pause_req,
		tx_pause_val => tx_pause_val,
		tx_pause_source_addr => tx_pause_source_addr,
		clk => clk,
		miim_phyad => miim_phyad,
		miim_regad => miim_regad,
		miim_wrdata => miim_wrdata,
		miim_wren => miim_wren,
		miim_rden => miim_rden,
		miim_rddata => miim_rddata,
		miim_rddata_valid => miim_rddata_valid,
		miim_busy => miim_busy,
		mdc => mdc,
		mdio_in => mdio_in,
		mdio_out => mdio_out,
		mdio_oen => mdio_oen
	);

----------Copy end-------------------
