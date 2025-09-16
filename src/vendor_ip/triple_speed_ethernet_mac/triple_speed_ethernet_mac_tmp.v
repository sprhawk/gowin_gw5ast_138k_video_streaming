//Copyright (C)2014-2025 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//Tool Version: V1.9.11.02
//Part Number: GW5AST-LV138FPG676AC1/I0
//Device: GW5AST-138
//Device Version: B
//Created Time: Sun Sep 14 11:26:16 2025

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

	Triple_Speed_Ethernet_MAC_Top your_instance_name(
		.rgmii_rxc(rgmii_rxc), //input rgmii_rxc
		.rgmii_rx_ctl(rgmii_rx_ctl), //input rgmii_rx_ctl
		.rgmii_rxd(rgmii_rxd), //input [3:0] rgmii_rxd
		.gtx_clk(gtx_clk), //input gtx_clk
		.rgmii_txc(rgmii_txc), //output rgmii_txc
		.rgmii_tx_ctl(rgmii_tx_ctl), //output rgmii_tx_ctl
		.rgmii_txd(rgmii_txd), //output [3:0] rgmii_txd
		.speedis1000(speedis1000), //input speedis1000
		.speedis10(speedis10), //input speedis10
		.duplex_status(duplex_status), //input duplex_status
		.rstn(rstn), //input rstn
		.rx_mac_clk(rx_mac_clk), //output rx_mac_clk
		.rx_mac_valid(rx_mac_valid), //output rx_mac_valid
		.rx_mac_data(rx_mac_data), //output [7:0] rx_mac_data
		.rx_mac_last(rx_mac_last), //output rx_mac_last
		.rx_mac_error(rx_mac_error), //output rx_mac_error
		.rx_statistics_valid(rx_statistics_valid), //output rx_statistics_valid
		.rx_statistics_vector(rx_statistics_vector), //output [26:0] rx_statistics_vector
		.tx_mac_clk(tx_mac_clk), //output tx_mac_clk
		.tx_mac_valid(tx_mac_valid), //input tx_mac_valid
		.tx_mac_data(tx_mac_data), //input [7:0] tx_mac_data
		.tx_mac_last(tx_mac_last), //input tx_mac_last
		.tx_mac_error(tx_mac_error), //input tx_mac_error
		.tx_mac_ready(tx_mac_ready), //output tx_mac_ready
		.tx_collision(tx_collision), //output tx_collision
		.tx_retransmit(tx_retransmit), //output tx_retransmit
		.tx_statistics_valid(tx_statistics_valid), //output tx_statistics_valid
		.tx_statistics_vector(tx_statistics_vector), //output [28:0] tx_statistics_vector
		.rx_fcs_fwd_ena(rx_fcs_fwd_ena), //input rx_fcs_fwd_ena
		.rx_jumbo_ena(rx_jumbo_ena), //input rx_jumbo_ena
		.rx_pause_req(rx_pause_req), //output rx_pause_req
		.rx_pause_val(rx_pause_val), //output [15:0] rx_pause_val
		.tx_fcs_fwd_ena(tx_fcs_fwd_ena), //input tx_fcs_fwd_ena
		.tx_ifg_delay_ena(tx_ifg_delay_ena), //input tx_ifg_delay_ena
		.tx_ifg_delay(tx_ifg_delay), //input [7:0] tx_ifg_delay
		.tx_pause_req(tx_pause_req), //input tx_pause_req
		.tx_pause_val(tx_pause_val), //input [15:0] tx_pause_val
		.tx_pause_source_addr(tx_pause_source_addr), //input [47:0] tx_pause_source_addr
		.clk(clk), //input clk
		.miim_phyad(miim_phyad), //input [4:0] miim_phyad
		.miim_regad(miim_regad), //input [4:0] miim_regad
		.miim_wrdata(miim_wrdata), //input [15:0] miim_wrdata
		.miim_wren(miim_wren), //input miim_wren
		.miim_rden(miim_rden), //input miim_rden
		.miim_rddata(miim_rddata), //output [15:0] miim_rddata
		.miim_rddata_valid(miim_rddata_valid), //output miim_rddata_valid
		.miim_busy(miim_busy), //output miim_busy
		.mdc(mdc), //output mdc
		.mdio_in(mdio_in), //input mdio_in
		.mdio_out(mdio_out), //output mdio_out
		.mdio_oen(mdio_oen) //output mdio_oen
	);

//--------Copy end-------------------
