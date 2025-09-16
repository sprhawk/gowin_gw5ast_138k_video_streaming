--
--Written by GowinSynthesis
--Tool Version "V1.9.11.02"
--Sun Sep 14 11:26:49 2025

--Source file index table:
--file0 "\/home/hongbo/.local/Gowin_V1.9.11.02_SP1_linux/IDE/ipcore/TSE_MAC/data/eth_mac_top.v"
--file1 "\/home/hongbo/.local/Gowin_V1.9.11.02_SP1_linux/IDE/ipcore/TSE_MAC/data/eth_mac.v"
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library gw5a;
use gw5a.components.all;

entity Triple_Speed_Ethernet_MAC_Top is
port(
  rgmii_rxc :  in std_logic;
  rgmii_rx_ctl :  in std_logic;
  rgmii_rxd :  in std_logic_vector(3 downto 0);
  gtx_clk :  in std_logic;
  rgmii_txc :  out std_logic;
  rgmii_tx_ctl :  out std_logic;
  rgmii_txd :  out std_logic_vector(3 downto 0);
  speedis1000 :  in std_logic;
  speedis10 :  in std_logic;
  duplex_status :  in std_logic;
  rstn :  in std_logic;
  rx_mac_clk :  out std_logic;
  rx_mac_valid :  out std_logic;
  rx_mac_data :  out std_logic_vector(7 downto 0);
  rx_mac_last :  out std_logic;
  rx_mac_error :  out std_logic;
  rx_statistics_valid :  out std_logic;
  rx_statistics_vector :  out std_logic_vector(26 downto 0);
  tx_mac_clk :  out std_logic;
  tx_mac_valid :  in std_logic;
  tx_mac_data :  in std_logic_vector(7 downto 0);
  tx_mac_last :  in std_logic;
  tx_mac_error :  in std_logic;
  tx_mac_ready :  out std_logic;
  tx_collision :  out std_logic;
  tx_retransmit :  out std_logic;
  tx_statistics_valid :  out std_logic;
  tx_statistics_vector :  out std_logic_vector(28 downto 0);
  rx_fcs_fwd_ena :  in std_logic;
  rx_jumbo_ena :  in std_logic;
  rx_pause_req :  out std_logic;
  rx_pause_val :  out std_logic_vector(15 downto 0);
  tx_fcs_fwd_ena :  in std_logic;
  tx_ifg_delay_ena :  in std_logic;
  tx_ifg_delay :  in std_logic_vector(7 downto 0);
  tx_pause_req :  in std_logic;
  tx_pause_val :  in std_logic_vector(15 downto 0);
  tx_pause_source_addr :  in std_logic_vector(47 downto 0);
  clk :  in std_logic;
  miim_phyad :  in std_logic_vector(4 downto 0);
  miim_regad :  in std_logic_vector(4 downto 0);
  miim_wrdata :  in std_logic_vector(15 downto 0);
  miim_wren :  in std_logic;
  miim_rden :  in std_logic;
  miim_rddata :  out std_logic_vector(15 downto 0);
  miim_rddata_valid :  out std_logic;
  miim_busy :  out std_logic;
  mdc :  out std_logic;
  mdio_in :  in std_logic;
  mdio_out :  out std_logic;
  mdio_oen :  out std_logic);
end Triple_Speed_Ethernet_MAC_Top;
architecture beh of Triple_Speed_Ethernet_MAC_Top is
  signal \u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_[0].IODELAY_inst_rxd\ : std_logic ;
  signal \u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_[1].IODELAY_inst_rxd\ : std_logic ;
  signal \u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_[2].IODELAY_inst_rxd\ : std_logic ;
  signal \u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_[3].IODELAY_inst_rxd\ : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_IODELAY_inst_ctl : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_rgmii_rx_ctl_delay : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_dv_int_iddr : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_er_int_iddr : std_logic ;
  signal \u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_[0].U_ODDR_txd\ : std_logic ;
  signal \u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_[1].U_ODDR_txd\ : std_logic ;
  signal \u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_[2].U_ODDR_txd\ : std_logic ;
  signal \u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_[3].U_ODDR_txd\ : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_U_ODDR_ctl : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_U_ODDR_clk : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_er_int : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg1 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_dv_reg : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_er_reg : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_clk_ena_reg : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_er_reg_tmp : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_align_reg : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_rgmii_rx_dv_o : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_rgmii_rx_er_o : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_rgmii_clk_ena_o : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_align_o_tmp : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_rgmii_align_o : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_dv_int : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_mac_rx_if_mux_gmii_rx_er_int_Z : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_mac_rx_if_mux_clk_rx_ena_int : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_mac_rx_if_mux_gmii_rx_align_int : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_mac_rx_if_mux_gmii_rx_dv_int_Z : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis1000_reg2 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis10_reg1 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis10_reg2 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_gmii_tx_en_int : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_gmii_tx_er_int : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_clk_ena_int : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_clk_d0 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_clk_d1 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis1000_reg1 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_fwd_ena_reg2 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_hd_ena_reg1 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_hd_ena_reg2 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_jumbo_ena_reg1 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_jumbo_ena_reg2 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_ena_reg1 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_ena_reg2 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_ena_reg3 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_fwd_ena_reg3 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_hd_ena_reg3 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_jumbo_ena_reg3 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_gmii_rx_dv_int : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_gmii_rx_er_int : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_clk_ena_int : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_gmii_rx_align_int : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_valid_int : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_valid : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_error : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_crc_result_valid : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_lgt_err : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_err : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_er_err : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_align_err : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_col_err : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_multicast_frm : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_broadcast_frm : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_unicast_frm : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_vlan_frm : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_ctrl_frm : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_flow_ctrl_frm_reg : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_statistics_valid : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_statistics_valid_o_tmp : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_align_err_o_tmp : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_lgt_err_o_tmp : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_err_o_tmp : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_er_err_o_tmp : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_col_o_tmp : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_flow_ctrl_frm_o_tmp : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_ctrl_frm_o_tmp : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_vlan_frm_o_tmp : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_multicast_frm_o_tmp : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_broadcast_frm_o_tmp : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_unicast_frm_o_tmp : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_fwd_ena_reg1 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_clk_ena_reg : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_duplex_status_reg1 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_ena_reg1 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg1 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_ifg_delay_ena_reg1 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_fcs_fwd_ena_reg1 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_duplex_status_reg2 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_ena_reg2 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_ifg_delay_ena_reg2 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_fcs_fwd_ena_reg2 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_reg1 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_reg2 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_gmii_crs_reg1 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_gmii_crs_reg2 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_ena_reg3 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_ifg_delay_ena_reg3 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_fcs_fwd_ena_reg3 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_int : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_gmii_crs_int : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_ifg_end_flag : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_crc_init : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_int_reg : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_clr_retrans_cnt : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_retrans_flag_reg : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_start_reg1 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_late_col_reg : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_EndBusy : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlData_q1 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlData_q2 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlData_q3 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_RStat_q1 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_RStat_q2 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_RStat_q3 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart_q : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart_q1 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart_q2 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_RStatStart_q1 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_RStatStart_q2 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress_q1 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress_q2 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress_q3 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte0_d : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_WriteOp : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_EndBusy_d : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_ShiftedBit : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_MdoEn_d : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_mdio_oe : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_Mdo_2d : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_Mdo_d : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_MdoEn_2d : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d1 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_gmii_col_int : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_er_err_reg : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_ready_mask : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_latch : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_late_col : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_too_many_retransmit : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_retrans_flag : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_active_retrans : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_start_reg : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_error_reg : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_en_from_mac : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_frm_latch : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_occur_col_latch : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_excessive_col_latch : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_late_col_latch : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_vlan_frame_latch : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_ctrl_frm_latch : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_unicast_frm_latch : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_broadcast_frm_latch : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_multicast_frm_latch : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1335 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1335_36 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1335_37 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1335_38 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1335_39 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1335_40 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1446 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1446_36 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1446_37 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1446_38 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1446_39 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1446_40 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n50 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n51 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n52 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n53 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n55 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n127 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n128 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n129 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n130 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n131 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n132 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n133 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n134 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n136 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n176 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n177 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_crs_int : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_col_int : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_rgmii_tx_ctl_err : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n28 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n146 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n147 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n148 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n149 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n150 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n151 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n152 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n153 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n158 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n163 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n168 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n173 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n178 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n359 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n360 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n464 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n495 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n562 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1590 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_flow_ctrl_frm : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1634 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n247 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n249 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n828 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n769 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1116 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1117 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1118 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1119 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1120 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1121 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1122 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1123 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1124 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1125 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1260 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1307 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1330 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1552 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1672 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1691 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1906 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1938 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_n8 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_n18 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_n108 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d2 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte0_d2 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_CountEq0 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_n_Z : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n55 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n56 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n57 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n58 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n59 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n60 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n61 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n206 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_n25 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_n37 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_n38 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_fwd_ena_reg3_6 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_n27 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_gmii_col_int_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_er_err_reg_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_type_reg_15 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_op_reg_15 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_pause_val_reg_15 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_ready_mask_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_late_col_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_too_many_retransmit_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_retrans_flag_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_active_retrans_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_gmii_tx_en : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress_6 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_WriteOp_6 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d1_8 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n35 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n34 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n36 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n38 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n531 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n530 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n529 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n528 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n527 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n526 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n525 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n524 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1554 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1509 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1508 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1507 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1506 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1505 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1504 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1503 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1502 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1455 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1454 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1453 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1452 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1451 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1450 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1449 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1448 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1344 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1343 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1342 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1341 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1340 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1339 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1338 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1337 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n881 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n880 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n879 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n878 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n877 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n876 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n875 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n874 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n873 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n872 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n871 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n870 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n869 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n868 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n867 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n866 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n865 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n864 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n863 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n862 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n861 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n860 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n859 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n858 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n857 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n856 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n855 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n854 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n853 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n852 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n851 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n850 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n849 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n848 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n847 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n846 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n845 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n844 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n843 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n842 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n616 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n613 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n612 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n611 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n609 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n608 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n607 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n605 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n604 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n186 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n377 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2123 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2119 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2121 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1911 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1819 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1814 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1638 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1637 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1636 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1635 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1517 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1518 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1286 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1284 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n978 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n977 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n976 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n958 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n957 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n913 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n911 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n910 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n908 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n906 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n905 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n903 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n305 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n304 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n303 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n302 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n301 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n300 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n299 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n62 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_n118 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1130 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1128 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1127 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1126 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_n149 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_n148 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_n147 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_n146 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_n144 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n68 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n66 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n65 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n64 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n140 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n139 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n138 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n137 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n136 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n135 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n134 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n133 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_n145 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1526 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1525 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1524 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1523 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1522 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1521 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1520 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1519 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1347 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1346 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1345 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n810 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n626 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n625 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n624 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n623 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n622 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n621 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n620 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n619 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n618 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n559 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n558 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n528 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n527 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n707 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n358 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n357 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n356 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n355 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n354 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n353 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n352 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n351 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n177 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n176 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n175 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n172 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n171 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n170 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n167 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n166 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n165 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n162 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n161 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n160 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n157 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n156 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n155 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n145 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n144 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n143 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n142 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n141 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n140 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n139 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n138 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n137 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n136 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n135 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n134 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n133 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n132 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n131 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n130 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n129 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n128 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n127 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n126 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n125 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n124 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n123 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n122 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n43 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n42 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n41 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n40 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n39 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n38 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n37 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n46 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n47 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n48 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n49 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n171 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n189 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n37 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n40 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n259 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n286 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n282 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n281 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n280 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n279 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n278 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n276 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n275 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n274 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n273 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n272 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n271 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n270 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n269 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n268 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n267 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n266 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n265 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n264 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n263 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n262 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n261 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n260 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n306 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n227 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n258 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n257 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n256 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n255 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n254 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n253 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n252 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n251 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n250 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n249 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n248 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n247 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n246 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n245 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n244 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n243 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n242 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n241 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n240 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n239 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n238 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n237 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n235 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n234 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n233 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n232 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n231 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n230 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n229 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n228 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n70 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n556 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n91 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n135 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54_4 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n146_4 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n469 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n495_4 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n495_5 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n495_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n562_6 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_3 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_4 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n769_4 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n775 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n780 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1026 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1116_4 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1116_5 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1117_4 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1117_5 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1118_4 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1118_5 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1119_4 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1119_5 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1120_5 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1122_5 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1123_4 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1123_5 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1124_5 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1307_5 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1672_4 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1956 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1906_4 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1906_5 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1906_6 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1938_4 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1938_5 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_0 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_1 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_2 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_3 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_4 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_5 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_6 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_6_5 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_8_5 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_10_5 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_14 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_15 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_n108_4 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_n108_5 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_n108_6 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d2_4 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d2_5 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte0_d2_4 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_CountEq0_4 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_4 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_5 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n55_4 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n56_4 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n57_4 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n58_4 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n58_5 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n59_4 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n59_5 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n60_4 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n61_4 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_3 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_3_45 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_2 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_2_45 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_1 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_data_int_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_cnt_crc_1 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_type_ptr_4 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_pause_val_reg_15_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_pause_frm_reg_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_ready_mask_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_late_col_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_late_col_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_retrans_cnt_4 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_unicast_frm_latch_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0_11 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n38_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n617 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n614 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n612_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n608_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n604_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n186_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2119_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2119_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2119_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1820 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1818 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1816 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1813 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1518_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1508 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n305_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n305_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n304_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n303_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n302_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n301_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n300_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n299_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n62_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1129 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1127_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n69 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n67 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n63 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n140_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n136_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1526_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1526_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1525_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1525_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1524_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1523_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1523_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1522_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1522_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1521_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1521_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1520_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1519_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1519_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n810_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n626_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n626_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n625_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n622_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n619_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n555 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1395 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1271 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1174 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n707_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n40_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n259_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n289 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n286_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n285 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n282_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n281_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n280_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n278_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n276_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n275_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n274_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n273_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n271_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n268_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n267_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n264_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n263_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n262_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n261_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n260_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n306_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n258_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n257_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n256_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n255_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n254_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n253_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n253_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n252_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n251_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n251_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n250_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n248_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n246_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n245_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n244_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n243_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n243_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n243_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n242_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n242_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n241_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n241_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n241_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n240_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n239_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n236 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n235_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n232_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n232_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n231_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n230_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n229_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n228_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n70_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n91_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n_state_0 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_0 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_42 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54_5 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54_6 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n495_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_5 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_6 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1026_6 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1026_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1116_6 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1118_6 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1118_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1123_6 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1906_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1906_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1906_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1906_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1906_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1938_6 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1938_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1938_8 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d2_7 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_6 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_7 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n55_5 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n56_5 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n57_5 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n57_6 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n60_5 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n61_5 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_3_46 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_3_47 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_2_46 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_2_48 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_2_49 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_43 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_44 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_45 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_type_ptr_4_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_type_ptr_4_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_type_ptr_4_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_type_ptr_4_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_late_col_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_late_col_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_late_col_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_late_col_14 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_retrans_cnt_4_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_unicast_frm_latch_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0_14 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0_15 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n186_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_14 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_16 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_17 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_18 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2119_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2119_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2119_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2119_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2119_14 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2119_15 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2119_16 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2119_17 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2119_18 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2119_19 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2119_20 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2119_21 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1813_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1812 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1810 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1809 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1807 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1518_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1518_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n305_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n305_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n304_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n303_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n303_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n302_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n301_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n300_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n300_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n299_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n62_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n62_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n69_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n69_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n140_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1526_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1526_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1525_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1524_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1524_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1522_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1522_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1521_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1520_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1519_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1519_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1519_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n810_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n626_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n626_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n626_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n626_14 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n626_16 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n625_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_14 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_15 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_16 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_17 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1395_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1395_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1395_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1395_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1271_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1271_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1271_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1271_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1174_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1174_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1174_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n707_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n259_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n289_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n288 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n286_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n282_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n282_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n281_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n278_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n275_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n275_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n273_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n272_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n272_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n263_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n306_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n306_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n256_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n246_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n70_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n70_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n70_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n557 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_43 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_44 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_45 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_46 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1026_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1906_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1906_14 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n57_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_3_48 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_2_50 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_47 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_48 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_49 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_14 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_late_col_15 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_19 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_20 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n305_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n305_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n305_14 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n304_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n304_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n303_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n303_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n303_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n303_14 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n303_15 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n302_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n302_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n301_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n301_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n300_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n300_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n300_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n299_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n299_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n299_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n69_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n69_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1520_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n626_18 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n626_19 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n626_20 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n626_21 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_18 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_19 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_20 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_21 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_22 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_23 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_24 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_25 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_26 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_27 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1581_28 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1174_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1174_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1174_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1174_14 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1174_15 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1174_16 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1174_17 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1174_18 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1174_19 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1174_20 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1174_21 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1174_22 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n707_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n289_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n289_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n288_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n282_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n275_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n306_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n306_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n306_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_47 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_48 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_late_col_16 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_21 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n304_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n304_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n302_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n302_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n301_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n301_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n299_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n626_22 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n626_23 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n626_24 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n626_25 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_49 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n626_26 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n626_28 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1174_24 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n469_6 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n252_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n138 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1122_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1129_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n899 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1807_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n900 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1808 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n901 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n902 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n909 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1817 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1906_16 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_ctrl_frm_latch_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n557_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n618_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n621_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n272_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n278_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n287 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n38_10 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d2_9 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_StartOp : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n606 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n607_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n610 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n611_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n249_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n248_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n231_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n249_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n253_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n707_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_16 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1124_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1120_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1125_6 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_51 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_2_52 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1811 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1812_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1814_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n_state_3_50 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n775_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_cnt_1 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1026_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n780_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2123_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_broadcast_frm_latch_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n288_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n562_8 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n495_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_cnt_crc_1_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n615 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n617_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n236_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1121_7 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1956_6 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n626_30 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n65_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n67_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_preamble_cnt_2 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1269 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_25 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92_15 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n39 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_data_int_7_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n453 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n454 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1121_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n606_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n610_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n614_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n912 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1820_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n559_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n552 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n553 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n554 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n555_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n285_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n63_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n69_14 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283_15 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_15 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n285_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n287_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n288_14 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n289_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_pause_frm_reg_7_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1523_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n114 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n115 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n116 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n117 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n118 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n119 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n120 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n121 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n154 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n159 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n164 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n169 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n174 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n214 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1810_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1809_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1811_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1812_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1813_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1816_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1818_9 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1821 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1822 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1169 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1508_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_latch_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n862 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_frm_lgt_latch_15 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_late_col_latch_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1609 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1624 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1651 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1652 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1653 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1654 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1681 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1700 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1765 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1859 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1860 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1861 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1862 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1863 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1864 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1865 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1866 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1867 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1868 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1869 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1870 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1871 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1872 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1873 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1874 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1948 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2132 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2133 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n2134 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_vlan_frame_latch_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_excessive_col_latch_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_attempts_latch_3 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_occur_col_latch_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_frm_latch_10 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n638 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n639 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n640 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n641 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n642 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n643 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n644 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n645 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n646 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n647 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n648 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n649 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n650 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n651 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n652 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n653 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n723 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n739 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n754 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1173 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1175 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1271_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1395_13 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1591 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1592 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1593 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1594 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1595 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1596 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1597 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1598 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1599 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1600 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1601 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1602 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1603 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1604 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1605 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1606 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_align_err_reg : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_col_err_reg : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_latch : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_tx_er_from_mac : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_RStatStart : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_n150 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_Z : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n606_15 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_frm_lgt_reg_15 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n610_15 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n615_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n618 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n619 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n2333 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n2335 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n882 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n882_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n883 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n883_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n884 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n884_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n885 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n885_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n886 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n886_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n887 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n887_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n888 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n888_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n889 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n889_11 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1317 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_type_ptr_4_15 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n329 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n330 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n331 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n332 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n333 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n334 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n335 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n336 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n337 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n338 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n339 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n340 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n341 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n342 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n343 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n344 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n345 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n346 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n347 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n348 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n349 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n350 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n351 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n352 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n353 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n354 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n355 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n356 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n357 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n358 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n359 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n360 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n361 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n362 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n363 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n364 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n365 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n366 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n367 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n368 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n369 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n370 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n371 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n372 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n373 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n374 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n375 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n376 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n377 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n378 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n379 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n380 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n381 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n382 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n383 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n384 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n385 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n386 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n387 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n388 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n389 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n390 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n391 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n392 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n393 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n914 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_14 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1131 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1026_12 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1285 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_retrans_cnt_4_14 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1287 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1288 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1560 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1561 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1562 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1563 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1564 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1565 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1566 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1567 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1587 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1912 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_type_ptr_4 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1913 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n378 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_cnt_1_13 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart_q_10 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart_q_14 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n_state_0_24 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n904 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n1815 : std_logic ;
  signal u_triple_speed_mac_u_mac_tx_ctrl_n907 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_rx_ena_reg3_7 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n54 : std_logic ;
  signal u_triple_speed_mac_u_mac_rx_ctrl_n1335_91 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n41 : std_logic ;
  signal u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart_q_16 : std_logic ;
  signal VCC_0 : std_logic ;
  signal GND_0 : std_logic ;
  signal \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_delay\ : std_logic_vector(3 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_iddr\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\ : std_logic_vector(15 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_dv_10100m_reg\ : std_logic_vector(3 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_er_10100m_reg\ : std_logic_vector(3 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_o\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_en_from_mac_delay\ : std_logic_vector(3 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_er_from_mac_delay\ : std_logic_vector(3 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\ : std_logic_vector(6 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d0\ : std_logic_vector(3 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d1\ : std_logic_vector(3 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/c_state\ : std_logic_vector(1 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\ : std_logic_vector(63 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\ : std_logic_vector(15 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\ : std_logic_vector(15 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\ : std_logic_vector(15 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\ : std_logic_vector(15 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\ : std_logic_vector(15 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\ : std_logic_vector(6 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\ : std_logic_vector(47 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\ : std_logic_vector(15 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\ : std_logic_vector(47 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\ : std_logic_vector(15 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/c_state\ : std_logic_vector(3 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt\ : std_logic_vector(1 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\ : std_logic_vector(4 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/retrans_timeout_cnt\ : std_logic_vector(2 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\ : std_logic_vector(15 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\ : std_logic_vector(47 downto 16);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\ : std_logic_vector(15 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\ : std_logic_vector(15 downto 10);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\ : std_logic_vector(9 downto 0);
  signal \u_triple_speed_mac/u_miim_block/u_eth_miim/LatchByte\ : std_logic_vector(1 downto 0);
  signal \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\ : std_logic_vector(6 downto 0);
  signal \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\ : std_logic_vector(6 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/cnt_crc\ : std_logic_vector(1 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\ : std_logic_vector(15 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\ : std_logic_vector(47 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\ : std_logic_vector(15 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/type_ptr\ : std_logic_vector(4 downto 2);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\ : std_logic_vector(15 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\ : std_logic_vector(15 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\ : std_logic_vector(15 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\ : std_logic_vector(31 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\ : std_logic_vector(15 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/preamble_cnt\ : std_logic_vector(2 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\ : std_logic_vector(15 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\ : std_logic_vector(4 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/tx_attempts_latch\ : std_logic_vector(3 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\ : std_logic_vector(15 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/type_ptr\ : std_logic_vector(4 downto 2);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\ : std_logic_vector(31 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/cnt\ : std_logic_vector(1 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\ : std_logic_vector(15 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/n_state\ : std_logic_vector(3 downto 0);
  signal \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\ : std_logic_vector(7 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\ : std_logic_vector(15 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\ : std_logic_vector(47 downto 0);
  signal \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\ : std_logic_vector(7 downto 0);
  signal NN : std_logic;
  signal NN_0 : std_logic;
  signal NN_1 : std_logic;
  signal NN_2 : std_logic;
  signal NN_3 : std_logic;
begin
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/[0].IODELAY_inst_rxd\: IODELAY
generic map (
  C_STATIC_DLY => 240
)
port map (
  DF => \u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_[0].IODELAY_inst_rxd\,
  DO => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_delay\(0),
  DI => rgmii_rxd(0),
  SDTAP => GND_0,
  VALUE => GND_0,
  DLYSTEP(7) => GND_0,
  DLYSTEP(6) => GND_0,
  DLYSTEP(5) => GND_0,
  DLYSTEP(4) => GND_0,
  DLYSTEP(3) => GND_0,
  DLYSTEP(2) => GND_0,
  DLYSTEP(1) => GND_0,
  DLYSTEP(0) => GND_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/[1].IODELAY_inst_rxd\: IODELAY
generic map (
  C_STATIC_DLY => 240
)
port map (
  DF => \u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_[1].IODELAY_inst_rxd\,
  DO => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_delay\(1),
  DI => rgmii_rxd(1),
  SDTAP => GND_0,
  VALUE => GND_0,
  DLYSTEP(7) => GND_0,
  DLYSTEP(6) => GND_0,
  DLYSTEP(5) => GND_0,
  DLYSTEP(4) => GND_0,
  DLYSTEP(3) => GND_0,
  DLYSTEP(2) => GND_0,
  DLYSTEP(1) => GND_0,
  DLYSTEP(0) => GND_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/[2].IODELAY_inst_rxd\: IODELAY
generic map (
  C_STATIC_DLY => 240
)
port map (
  DF => \u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_[2].IODELAY_inst_rxd\,
  DO => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_delay\(2),
  DI => rgmii_rxd(2),
  SDTAP => GND_0,
  VALUE => GND_0,
  DLYSTEP(7) => GND_0,
  DLYSTEP(6) => GND_0,
  DLYSTEP(5) => GND_0,
  DLYSTEP(4) => GND_0,
  DLYSTEP(3) => GND_0,
  DLYSTEP(2) => GND_0,
  DLYSTEP(1) => GND_0,
  DLYSTEP(0) => GND_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/[3].IODELAY_inst_rxd\: IODELAY
generic map (
  C_STATIC_DLY => 240
)
port map (
  DF => \u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_[3].IODELAY_inst_rxd\,
  DO => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_delay\(3),
  DI => rgmii_rxd(3),
  SDTAP => GND_0,
  VALUE => GND_0,
  DLYSTEP(7) => GND_0,
  DLYSTEP(6) => GND_0,
  DLYSTEP(5) => GND_0,
  DLYSTEP(4) => GND_0,
  DLYSTEP(3) => GND_0,
  DLYSTEP(2) => GND_0,
  DLYSTEP(1) => GND_0,
  DLYSTEP(0) => GND_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/IODELAY_inst_ctl\: IODELAY
generic map (
  C_STATIC_DLY => 240
)
port map (
  DF => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_IODELAY_inst_ctl,
  DO => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_rgmii_rx_ctl_delay,
  DI => rgmii_rx_ctl,
  SDTAP => GND_0,
  VALUE => GND_0,
  DLYSTEP(7) => GND_0,
  DLYSTEP(6) => GND_0,
  DLYSTEP(5) => GND_0,
  DLYSTEP(4) => GND_0,
  DLYSTEP(3) => GND_0,
  DLYSTEP(2) => GND_0,
  DLYSTEP(1) => GND_0,
  DLYSTEP(0) => GND_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/[0].U_IDDR_rxd\: IDDR
port map (
  Q0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_iddr\(0),
  Q1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_iddr\(4),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_delay\(0),
  CLK => rgmii_rxc);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/[1].U_IDDR_rxd\: IDDR
port map (
  Q0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_iddr\(1),
  Q1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_iddr\(5),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_delay\(1),
  CLK => rgmii_rxc);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/[2].U_IDDR_rxd\: IDDR
port map (
  Q0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_iddr\(2),
  Q1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_iddr\(6),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_delay\(2),
  CLK => rgmii_rxc);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/[3].U_IDDR_rxd\: IDDR
port map (
  Q0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_iddr\(3),
  Q1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_iddr\(7),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_delay\(3),
  CLK => rgmii_rxc);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/U_IDDR_ctl_err\: IDDR
port map (
  Q0 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_dv_int_iddr,
  Q1 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_er_int_iddr,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_rgmii_rx_ctl_delay,
  CLK => rgmii_rxc);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/[0].U_ODDR_txd\: ODDR
port map (
  Q0 => rgmii_txd(0),
  Q1 => \u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_[0].U_ODDR_txd\,
  D0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d0\(0),
  D1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d1\(0),
  TX => VCC_0,
  CLK => gtx_clk);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/[1].U_ODDR_txd\: ODDR
port map (
  Q0 => rgmii_txd(1),
  Q1 => \u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_[1].U_ODDR_txd\,
  D0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d0\(1),
  D1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d1\(1),
  TX => VCC_0,
  CLK => gtx_clk);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/[2].U_ODDR_txd\: ODDR
port map (
  Q0 => rgmii_txd(2),
  Q1 => \u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_[2].U_ODDR_txd\,
  D0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d0\(2),
  D1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d1\(2),
  TX => VCC_0,
  CLK => gtx_clk);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/[3].U_ODDR_txd\: ODDR
port map (
  Q0 => rgmii_txd(3),
  Q1 => \u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_[3].U_ODDR_txd\,
  D0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d0\(3),
  D1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d1\(3),
  TX => VCC_0,
  CLK => gtx_clk);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/U_ODDR_ctl\: ODDR
port map (
  Q0 => rgmii_tx_ctl,
  Q1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_U_ODDR_ctl,
  D0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0,
  D1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d1,
  TX => VCC_0,
  CLK => gtx_clk);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/U_ODDR_clk\: ODDR
port map (
  Q0 => rgmii_txc,
  Q1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_U_ODDR_clk,
  D0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_clk_d0,
  D1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_clk_d1,
  TX => VCC_0,
  CLK => gtx_clk);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_er_int_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_er_int,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n55,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int\(7),
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n46,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int\(6),
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n47,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int\(5),
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n48,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int\(4),
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n49,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int\(3),
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n50,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int\(2),
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n51,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int\(1),
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n52,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int\(0),
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n53,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg_15_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(15),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(11),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg_14_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(14),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(10),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg_13_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(13),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(9),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg_12_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(12),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(8),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg_11_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(11),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(7),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg_10_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(10),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(6),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg_9_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(9),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(5),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg_8_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(8),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(4),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(7),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(3),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(6),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(2),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(5),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(1),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(4),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(0),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(3),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_iddr\(3),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(2),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_iddr\(2),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(1),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_iddr\(1),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(0),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_iddr\(0),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_dv_10100m_reg_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_dv_10100m_reg\(3),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_dv_10100m_reg\(2),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_dv_10100m_reg_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_dv_10100m_reg\(2),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_dv_10100m_reg\(1),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_dv_10100m_reg_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_dv_10100m_reg\(1),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_dv_10100m_reg\(0),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_dv_10100m_reg_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_dv_10100m_reg\(0),
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_dv_int_iddr,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_er_10100m_reg_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_er_10100m_reg\(3),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_er_10100m_reg\(2),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_er_10100m_reg_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_er_10100m_reg\(2),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_er_10100m_reg\(1),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_er_10100m_reg_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_er_10100m_reg\(1),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_er_10100m_reg\(0),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_er_10100m_reg_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_er_10100m_reg\(0),
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_er_int_iddr,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/speedis1000_reg1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg1,
  D => speedis1000,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/speedis1000_reg2_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg1,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg\(7),
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n127,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg\(6),
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n128,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg\(5),
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n129,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg\(4),
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n130,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg\(3),
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n131,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg\(2),
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n132,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg\(1),
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n133,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg\(0),
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n134,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_dv_reg_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_dv_reg,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_dv_int,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_er_reg_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_er_reg,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n138,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/clk_ena_reg_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_clk_ena_reg,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n135,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_er_reg_tmp_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_er_reg_tmp,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n136,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_align_reg_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_align_reg,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n171,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_dv_o_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_rgmii_rx_dv_o,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n176,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_o_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_o\(7),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg\(7),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n177);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_o_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_o\(6),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg\(6),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n177);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_o_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_o\(5),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg\(5),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n177);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_o_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_o\(4),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg\(4),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n177);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_o_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_o\(3),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg\(3),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n177);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_o_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_o\(2),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg\(2),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n177);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_o_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_o\(1),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg\(1),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n177);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_o_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_o\(0),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg\(0),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n177);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_er_o_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_rgmii_rx_er_o,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_er_reg,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/clk_ena_o_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_rgmii_clk_ena_o,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n177,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_align_o_tmp_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_align_o_tmp,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n189,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_align_o_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_rgmii_align_o,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_align_o_tmp,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_en_from_mac_delay_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_en_from_mac_delay\(3),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_en_from_mac_delay\(2),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_en_from_mac_delay_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_en_from_mac_delay\(2),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_en_from_mac_delay\(1),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_en_from_mac_delay_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_en_from_mac_delay\(1),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_en_from_mac_delay\(0),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_en_from_mac_delay_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_en_from_mac_delay\(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_tx_en_from_mac,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_er_from_mac_delay_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_er_from_mac_delay\(3),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_er_from_mac_delay\(2),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_er_from_mac_delay_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_er_from_mac_delay\(2),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_er_from_mac_delay\(1),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_er_from_mac_delay_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_er_from_mac_delay\(1),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_er_from_mac_delay\(0),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_er_from_mac_delay_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_er_from_mac_delay\(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_tx_er_from_mac,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_dv_int_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_dv_int,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(7),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_o\(7),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(6),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_o\(6),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(5),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_o\(5),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(4),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_o\(4),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(3),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_o\(3),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(2),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_o\(2),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(1),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_o\(1),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(0),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/rgmii_rxd_o\(0),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rx_er_int_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_if_block_u_mac_rx_if_mux_gmii_rx_er_int_Z,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_rgmii_rx_er_o,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/clk_ena_int_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_if_block_u_mac_rx_if_mux_clk_rx_ena_int,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_rgmii_clk_ena_o,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_align_int_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_if_block_u_mac_rx_if_mux_gmii_rx_align_int,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_rgmii_align_o,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rx_dv_int_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_if_block_u_mac_rx_if_mux_gmii_rx_dv_int_Z,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_rgmii_rx_dv_o,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/speedis1000_reg2_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis1000_reg2,
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis1000_reg1,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/speedis10_reg1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis10_reg1,
  D => speedis10,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/speedis10_reg2_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis10_reg2,
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis10_reg1,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_tx_en_int_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_gmii_tx_en_int,
  D => u_triple_speed_mac_u_mac_tx_ctrl_tx_en_from_mac,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(7),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(7),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(6),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(6),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(5),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(5),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(4),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(4),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(3),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(3),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(2),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(2),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(1),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(1),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(0),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(0),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_tx_er_int_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_gmii_tx_er_int,
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_rgmii_tx_ctl_err,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_ena_int_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_clk_ena_int,
  D => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(6),
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n37,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(5),
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n38,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(4),
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n39,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(3),
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n40,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(2),
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n41,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(1),
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n42,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(0),
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n43,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_d0_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_clk_d0,
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n91,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_d1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_clk_d1,
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d0_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d0\(3),
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n133,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d0_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d0\(2),
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n134,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d0_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d0\(1),
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n135,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d0_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d0\(0),
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n136,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d1_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d1\(3),
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n137,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d1_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d1\(2),
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n138,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d1_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d1\(1),
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n139,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d1_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/data_d1\(0),
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n140,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/speedis1000_reg1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis1000_reg1,
  D => speedis1000,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_fcs_fwd_ena_reg2_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_fwd_ena_reg2,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_fwd_ena_reg1,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/hd_ena_reg1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_hd_ena_reg1,
  D => duplex_status,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/hd_ena_reg2_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_hd_ena_reg2,
  D => u_triple_speed_mac_u_mac_rx_ctrl_hd_ena_reg1,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_jumbo_ena_reg1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_jumbo_ena_reg1,
  D => rx_jumbo_ena,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_jumbo_ena_reg2_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_jumbo_ena_reg2,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_jumbo_ena_reg1,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_ena_reg1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_ena_reg1,
  D => VCC_0,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_ena_reg2_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_ena_reg2,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_ena_reg1,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_ena_reg3_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_ena_reg3,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_ena_reg2,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_ena_reg3_7);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_fcs_fwd_ena_reg3_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_fwd_ena_reg3,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_fwd_ena_reg2,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_fwd_ena_reg3_6);
\u_triple_speed_mac/u_mac_rx_ctrl/speedis1000_reg3_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_fwd_ena_reg3_6);
\u_triple_speed_mac/u_mac_rx_ctrl/hd_ena_reg3_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_hd_ena_reg3,
  D => u_triple_speed_mac_u_mac_rx_ctrl_n28,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_fwd_ena_reg3_6);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_jumbo_ena_reg3_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_jumbo_ena_reg3,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_jumbo_ena_reg2,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_fwd_ena_reg3_6);
\u_triple_speed_mac/u_mac_rx_ctrl/gmii_rx_dv_int_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_gmii_rx_dv_int,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_mac_rx_if_mux_gmii_rx_dv_int_Z,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(7),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(7),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(6),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(6),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(5),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(5),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(4),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(4),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(3),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(3),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(2),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(2),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(1),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(1),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(0),
  D => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(0),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/gmii_rx_er_int_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_gmii_rx_er_int,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_mac_rx_if_mux_gmii_rx_er_int_Z,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_int_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_clk_ena_int,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_mac_rx_if_mux_clk_rx_ena_int,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/gmii_rx_align_int_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_gmii_rx_align_int,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_mac_rx_if_mux_gmii_rx_align_int,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/c_state_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/c_state\(1),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n62,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_63_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(63),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n114,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_62_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(62),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n115,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_61_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(61),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n116,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_60_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(60),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n117,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_59_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(59),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n118,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_58_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(58),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n119,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_57_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(57),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n120,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_56_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(56),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n121,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_55_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(55),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n122,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_54_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(54),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n123,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_53_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(53),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n124,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_52_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(52),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n125,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_51_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(51),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n126,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_50_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(50),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n127,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_49_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(49),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n128,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_48_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(48),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n129,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_47_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(47),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n130,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_46_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(46),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n131,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_45_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(45),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n132,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_44_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(44),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n133,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_43_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(43),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n134,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_42_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(42),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n135,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_41_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(41),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n136,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_40_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(40),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n137,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_39_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(39),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n138,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_38_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(38),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n139,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_37_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(37),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n140,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_36_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(36),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n141,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_35_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(35),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n142,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_34_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(34),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n143,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_33_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(33),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n144,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_32_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(32),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n145,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_31_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(31),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n146,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_30_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(30),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n147,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_29_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(29),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n148,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_28_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(28),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n149,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_27_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(27),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n150,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_26_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(26),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n151,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_25_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(25),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n152,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_24_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(24),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n153,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_23_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(23),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(31),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_22_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(22),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(30),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_21_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(21),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(29),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_20_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(20),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(28),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_19_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(19),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(27),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_18_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(18),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(26),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_17_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(17),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(25),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_16_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(16),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(24),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_15_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(15),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(23),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_14_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(14),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(22),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_13_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(13),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(21),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_12_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(12),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(20),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_11_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(11),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(19),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_10_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(10),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(18),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_9_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(9),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(17),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_8_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(8),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(16),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(7),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(15),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(6),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(14),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(5),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(13),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(4),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(12),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(3),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(11),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(2),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(10),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(1),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(9),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(0),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(8),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(7),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n154,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(6),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n155,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(5),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n156,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(4),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n157,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(3),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n158,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(2),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(3),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(1),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(2),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(1),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(7),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n159,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(6),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n160,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(5),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n161,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(4),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n162,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(3),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n163,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(2),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(3),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(1),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(2),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(1),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg\(7),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n164,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg\(6),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n165,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg\(5),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n166,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg\(4),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n167,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg\(3),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n168,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg\(2),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg\(3),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg\(1),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg\(2),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg\(0),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg\(1),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg\(7),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n169,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg\(6),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n170,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg\(5),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n171,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg\(4),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n172,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg\(3),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n173,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg\(2),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg\(3),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg\(1),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg\(2),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg\(0),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg\(1),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg\(7),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n174,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg\(6),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n175,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg\(5),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n176,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg\(4),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n177,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg\(3),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n178,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg\(2),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg\(3),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg\(1),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg\(2),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg\(0),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg\(1),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg_15_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(15),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n351,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg_14_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(14),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n352,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg_13_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(13),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n353,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg_12_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(12),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n354,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg_11_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(11),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n355,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg_10_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(10),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n356,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg_9_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(9),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n357,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg_8_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(8),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n358,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(7),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n359,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(6),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n360,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(5),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(7),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(4),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(6),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(3),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(5),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(2),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(4),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(1),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(3),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(0),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(2),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_valid_int_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_valid_int,
  D => u_triple_speed_mac_u_mac_rx_ctrl_n495,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_valid_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_valid,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_valid_int,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data\(7),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int\(7),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data\(6),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int\(6),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data\(5),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int\(5),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data\(4),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int\(4),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data\(3),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int\(3),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data\(2),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int\(2),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data\(1),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int\(1),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data\(0),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int\(0),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_last_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  D => u_triple_speed_mac_u_mac_rx_ctrl_n464,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_error_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_error,
  D => u_triple_speed_mac_u_mac_rx_ctrl_n469_6,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/crc_result_valid_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_crc_result_valid,
  D => u_triple_speed_mac_u_mac_rx_ctrl_n562,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_statistics_reg_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg,
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_15_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(15),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n638,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_14_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(14),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n639,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_13_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(13),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n640,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_12_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(12),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n641,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_11_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(11),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n642,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_10_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(10),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n643,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_9_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(9),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n644,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_8_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(8),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n645,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(7),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n646,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(6),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n647,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(5),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n648,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(4),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n649,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(3),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n650,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(2),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n651,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(1),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n652,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(0),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n653,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_lgt_err_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_lgt_err,
  D => u_triple_speed_mac_u_mac_rx_ctrl_n707,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_fcs_err_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_err,
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_er_err_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_er_err,
  D => u_triple_speed_mac_u_mac_rx_ctrl_n723,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_align_err_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_align_err,
  D => u_triple_speed_mac_u_mac_rx_ctrl_n739,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_col_err_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_col_err,
  D => u_triple_speed_mac_u_mac_rx_ctrl_n754,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_multicast_frm_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_multicast_frm,
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1175,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_broadcast_frm_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_broadcast_frm,
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1174_24,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_unicast_frm_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_unicast_frm,
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1173,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_vlan_frm_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_vlan_frm,
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1271_13,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_ctrl_frm_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_ctrl_frm,
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1395_13,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_flow_ctrl_frm_reg_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_flow_ctrl_frm_reg,
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1581,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_15_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(15),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1591,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_14_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(14),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1592,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_13_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(13),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1593,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_12_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(12),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1594,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_11_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(11),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1595,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_10_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(10),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1596,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_9_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(9),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1597,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_8_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(8),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1598,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(7),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1599,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(6),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1600,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(5),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1601,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(4),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1602,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(3),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1603,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(2),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1604,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(1),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1605,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(0),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1606,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_statistics_valid_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_statistics_valid,
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1590,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_valid_o_s0\: DFFCE
port map (
  Q => rx_mac_valid,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_valid,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_o_7_s0\: DFFCE
port map (
  Q => rx_mac_data(7),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data\(7),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_o_6_s0\: DFFCE
port map (
  Q => rx_mac_data(6),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data\(6),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_o_5_s0\: DFFCE
port map (
  Q => rx_mac_data(5),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data\(5),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_o_4_s0\: DFFCE
port map (
  Q => rx_mac_data(4),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data\(4),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_o_3_s0\: DFFCE
port map (
  Q => rx_mac_data(3),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data\(3),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_o_2_s0\: DFFCE
port map (
  Q => rx_mac_data(2),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data\(2),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_o_1_s0\: DFFCE
port map (
  Q => rx_mac_data(1),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data\(1),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_o_0_s0\: DFFCE
port map (
  Q => rx_mac_data(0),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data\(0),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_last_o_s0\: DFFCE
port map (
  Q => rx_mac_last,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_error_o_s0\: DFFCE
port map (
  Q => rx_mac_error,
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1634,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_statistics_valid_o_s0\: DFFCE
port map (
  Q => rx_statistics_valid,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_statistics_valid_o_tmp,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_align_err_o_s0\: DFFCE
port map (
  Q => rx_statistics_vector(26),
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_align_err_o_tmp,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_lgt_err_o_s0\: DFFCE
port map (
  Q => rx_statistics_vector(25),
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_lgt_err_o_tmp,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_fcs_err_o_s0\: DFFCE
port map (
  Q => rx_statistics_vector(24),
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_err_o_tmp,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_er_err_o_s0\: DFFCE
port map (
  Q => rx_statistics_vector(23),
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_er_err_o_tmp,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_col_o_s0\: DFFCE
port map (
  Q => rx_statistics_vector(22),
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_col_o_tmp,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_flow_ctrl_frm_o_s0\: DFFCE
port map (
  Q => NN_0,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_flow_ctrl_frm_o_tmp,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_ctrl_frm_o_s0\: DFFCE
port map (
  Q => rx_statistics_vector(4),
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_ctrl_frm_o_tmp,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_vlan_frm_o_s0\: DFFCE
port map (
  Q => rx_statistics_vector(3),
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_vlan_frm_o_tmp,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_15_s0\: DFFCE
port map (
  Q => rx_statistics_vector(21),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(15),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_14_s0\: DFFCE
port map (
  Q => rx_statistics_vector(20),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(14),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_13_s0\: DFFCE
port map (
  Q => rx_statistics_vector(19),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(13),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_12_s0\: DFFCE
port map (
  Q => rx_statistics_vector(18),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(12),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_11_s0\: DFFCE
port map (
  Q => rx_statistics_vector(17),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(11),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_10_s0\: DFFCE
port map (
  Q => rx_statistics_vector(16),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(10),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_9_s0\: DFFCE
port map (
  Q => rx_statistics_vector(15),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(9),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_8_s0\: DFFCE
port map (
  Q => rx_statistics_vector(14),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(8),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_7_s0\: DFFCE
port map (
  Q => rx_statistics_vector(13),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(7),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_6_s0\: DFFCE
port map (
  Q => rx_statistics_vector(12),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(6),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_5_s0\: DFFCE
port map (
  Q => rx_statistics_vector(11),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(5),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_4_s0\: DFFCE
port map (
  Q => rx_statistics_vector(10),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(4),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_3_s0\: DFFCE
port map (
  Q => rx_statistics_vector(9),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(3),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_2_s0\: DFFCE
port map (
  Q => rx_statistics_vector(8),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(2),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_1_s0\: DFFCE
port map (
  Q => rx_statistics_vector(7),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(1),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_0_s0\: DFFCE
port map (
  Q => rx_statistics_vector(6),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(0),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_multicast_frm_o_s0\: DFFCE
port map (
  Q => rx_statistics_vector(2),
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_multicast_frm_o_tmp,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_broadcast_frm_o_s0\: DFFCE
port map (
  Q => rx_statistics_vector(1),
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_broadcast_frm_o_tmp,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_unicast_frm_o_s0\: DFFCE
port map (
  Q => rx_statistics_vector(0),
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_unicast_frm_o_tmp,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_15_s0\: DFFCE
port map (
  Q => rx_pause_val(15),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(15),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_14_s0\: DFFCE
port map (
  Q => rx_pause_val(14),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(14),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_13_s0\: DFFCE
port map (
  Q => rx_pause_val(13),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(13),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_12_s0\: DFFCE
port map (
  Q => rx_pause_val(12),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(12),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_11_s0\: DFFCE
port map (
  Q => rx_pause_val(11),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(11),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_10_s0\: DFFCE
port map (
  Q => rx_pause_val(10),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(10),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_9_s0\: DFFCE
port map (
  Q => rx_pause_val(9),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(9),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_8_s0\: DFFCE
port map (
  Q => rx_pause_val(8),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(8),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_7_s0\: DFFCE
port map (
  Q => rx_pause_val(7),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(7),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_6_s0\: DFFCE
port map (
  Q => rx_pause_val(6),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(6),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_5_s0\: DFFCE
port map (
  Q => rx_pause_val(5),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(5),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_4_s0\: DFFCE
port map (
  Q => rx_pause_val(4),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(4),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_3_s0\: DFFCE
port map (
  Q => rx_pause_val(3),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(3),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_2_s0\: DFFCE
port map (
  Q => rx_pause_val(2),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(2),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_1_s0\: DFFCE
port map (
  Q => rx_pause_val(1),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(1),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_0_s0\: DFFCE
port map (
  Q => rx_pause_val(0),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(0),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_statistics_valid_o_tmp_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_statistics_valid_o_tmp,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_statistics_valid,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_align_err_o_tmp_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_align_err_o_tmp,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_align_err,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_lgt_err_o_tmp_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_lgt_err_o_tmp,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_lgt_err,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_fcs_err_o_tmp_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_err_o_tmp,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_err,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_er_err_o_tmp_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_er_err_o_tmp,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_er_err,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_col_o_tmp_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_col_o_tmp,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_col_err,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_flow_ctrl_frm_o_tmp_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_flow_ctrl_frm_o_tmp,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_flow_ctrl_frm,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_ctrl_frm_o_tmp_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_ctrl_frm_o_tmp,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_ctrl_frm,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_vlan_frm_o_tmp_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_vlan_frm_o_tmp,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_vlan_frm,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp_15_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(15),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(15),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp_14_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(14),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(14),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp_13_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(13),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(13),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp_12_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(12),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(12),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp_11_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(11),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(11),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp_10_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(10),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(10),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp_9_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(9),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(9),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp_8_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(8),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(8),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(7),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(7),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(6),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(6),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(5),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(5),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(4),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(4),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(3),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(3),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(2),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(2),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(1),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(1),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_o_tmp\(0),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt\(0),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_multicast_frm_o_tmp_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_multicast_frm_o_tmp,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_multicast_frm,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_broadcast_frm_o_tmp_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_broadcast_frm_o_tmp,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_broadcast_frm,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_unicast_frm_o_tmp_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_unicast_frm_o_tmp,
  D => u_triple_speed_mac_u_mac_rx_ctrl_rx_unicast_frm,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp_15_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(15),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(15),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp_14_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(14),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(14),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp_13_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(13),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(13),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp_12_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(12),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(12),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp_11_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(11),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(11),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp_10_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(10),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(10),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp_9_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(9),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(9),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp_8_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(8),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(8),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(7),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(7),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(6),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(6),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(5),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(5),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(4),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(4),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(3),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(3),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(2),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(2),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(1),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(1),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_o_tmp\(0),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val\(0),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_fcs_fwd_ena_reg1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_fwd_ena_reg1,
  D => rx_fcs_fwd_ena,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(6),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n63_10,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(5),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n64,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(4),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n65,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(3),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n66,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(2),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n67_10,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(1),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n68,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n69_14,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_reg_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_clk_ena_reg,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n70,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/duplex_status_reg1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_duplex_status_reg1,
  D => duplex_status,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ena_reg1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_ena_reg1,
  D => VCC_0,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_47_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(47),
  D => tx_pause_source_addr(47),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_46_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(46),
  D => tx_pause_source_addr(46),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_45_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(45),
  D => tx_pause_source_addr(45),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_44_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(44),
  D => tx_pause_source_addr(44),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_43_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(43),
  D => tx_pause_source_addr(43),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_42_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(42),
  D => tx_pause_source_addr(42),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_41_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(41),
  D => tx_pause_source_addr(41),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_40_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(40),
  D => tx_pause_source_addr(40),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_39_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(39),
  D => tx_pause_source_addr(39),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_38_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(38),
  D => tx_pause_source_addr(38),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_37_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(37),
  D => tx_pause_source_addr(37),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_36_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(36),
  D => tx_pause_source_addr(36),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_35_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(35),
  D => tx_pause_source_addr(35),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_34_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(34),
  D => tx_pause_source_addr(34),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_33_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(33),
  D => tx_pause_source_addr(33),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_32_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(32),
  D => tx_pause_source_addr(32),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_31_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(31),
  D => tx_pause_source_addr(31),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_30_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(30),
  D => tx_pause_source_addr(30),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_29_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(29),
  D => tx_pause_source_addr(29),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_28_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(28),
  D => tx_pause_source_addr(28),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_27_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(27),
  D => tx_pause_source_addr(27),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_26_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(26),
  D => tx_pause_source_addr(26),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_25_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(25),
  D => tx_pause_source_addr(25),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_24_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(24),
  D => tx_pause_source_addr(24),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_23_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(23),
  D => tx_pause_source_addr(23),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_22_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(22),
  D => tx_pause_source_addr(22),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_21_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(21),
  D => tx_pause_source_addr(21),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_20_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(20),
  D => tx_pause_source_addr(20),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_19_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(19),
  D => tx_pause_source_addr(19),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_18_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(18),
  D => tx_pause_source_addr(18),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_17_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(17),
  D => tx_pause_source_addr(17),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_16_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(16),
  D => tx_pause_source_addr(16),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_15_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(15),
  D => tx_pause_source_addr(15),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_14_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(14),
  D => tx_pause_source_addr(14),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_13_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(13),
  D => tx_pause_source_addr(13),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_12_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(12),
  D => tx_pause_source_addr(12),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_11_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(11),
  D => tx_pause_source_addr(11),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_10_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(10),
  D => tx_pause_source_addr(10),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_9_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(9),
  D => tx_pause_source_addr(9),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_8_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(8),
  D => tx_pause_source_addr(8),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(7),
  D => tx_pause_source_addr(7),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(6),
  D => tx_pause_source_addr(6),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(5),
  D => tx_pause_source_addr(5),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(4),
  D => tx_pause_source_addr(4),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(3),
  D => tx_pause_source_addr(3),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(2),
  D => tx_pause_source_addr(2),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(1),
  D => tx_pause_source_addr(1),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(0),
  D => tx_pause_source_addr(0),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_req_reg1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg1,
  D => tx_pause_req,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1_15_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(15),
  D => tx_pause_val(15),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1_14_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(14),
  D => tx_pause_val(14),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1_13_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(13),
  D => tx_pause_val(13),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1_12_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(12),
  D => tx_pause_val(12),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1_11_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(11),
  D => tx_pause_val(11),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1_10_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(10),
  D => tx_pause_val(10),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1_9_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(9),
  D => tx_pause_val(9),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1_8_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(8),
  D => tx_pause_val(8),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(7),
  D => tx_pause_val(7),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(6),
  D => tx_pause_val(6),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(5),
  D => tx_pause_val(5),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(4),
  D => tx_pause_val(4),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(3),
  D => tx_pause_val(3),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(2),
  D => tx_pause_val(2),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(1),
  D => tx_pause_val(1),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(0),
  D => tx_pause_val(0),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_ena_reg1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_ifg_delay_ena_reg1,
  D => tx_ifg_delay_ena,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1\(7),
  D => tx_ifg_delay(7),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1\(6),
  D => tx_ifg_delay(6),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1\(5),
  D => tx_ifg_delay(5),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1\(4),
  D => tx_ifg_delay(4),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1\(3),
  D => tx_ifg_delay(3),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1\(2),
  D => tx_ifg_delay(2),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1\(1),
  D => tx_ifg_delay(1),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1\(0),
  D => tx_ifg_delay(0),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_fcs_fwd_ena_reg1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_fcs_fwd_ena_reg1,
  D => tx_fcs_fwd_ena,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/duplex_status_reg2_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_duplex_status_reg2,
  D => u_triple_speed_mac_u_mac_tx_ctrl_duplex_status_reg1,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ena_reg2_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_ena_reg2,
  D => u_triple_speed_mac_u_mac_tx_ctrl_tx_ena_reg1,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_47_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(47),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(47),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_46_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(46),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(46),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_45_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(45),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(45),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_44_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(44),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(44),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_43_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(43),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(43),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_42_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(42),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(42),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_41_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(41),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(41),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_40_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(40),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(40),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_39_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(39),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(39),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_38_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(38),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(38),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_37_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(37),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(37),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_36_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(36),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(36),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_35_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(35),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(35),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_34_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(34),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(34),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_33_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(33),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(33),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_32_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(32),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(32),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_31_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(31),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(31),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_30_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(30),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(30),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_29_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(29),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(29),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_28_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(28),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(28),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_27_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(27),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(27),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_26_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(26),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(26),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_25_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(25),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(25),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_24_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(24),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(24),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_23_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(23),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(23),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_22_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(22),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(22),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_21_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(21),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(21),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_20_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(20),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(20),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_19_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(19),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(19),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_18_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(18),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(18),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_17_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(17),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(17),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_16_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(16),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(16),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_15_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(15),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(15),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_14_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(14),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(14),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_13_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(13),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(13),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_12_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(12),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(12),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_11_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(11),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(11),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_10_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(10),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(10),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_9_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(9),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(9),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_8_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(8),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(8),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(7),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(7),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(6),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(6),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(5),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(5),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(4),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(4),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(3),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(3),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(2),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(2),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(1),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(1),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(0),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg1\(0),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_req_reg2_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2,
  D => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg1,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2_15_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(15),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(15),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2_14_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(14),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(14),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2_13_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(13),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(13),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2_12_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(12),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(12),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2_11_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(11),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(11),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2_10_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(10),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(10),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2_9_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(9),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(9),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2_8_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(8),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(8),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(7),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(7),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(6),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(6),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(5),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(5),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(4),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(4),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(3),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(3),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(2),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(2),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(1),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(1),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(0),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg1\(0),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_ena_reg2_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_ifg_delay_ena_reg2,
  D => u_triple_speed_mac_u_mac_tx_ctrl_tx_ifg_delay_ena_reg1,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2\(7),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1\(7),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2\(6),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1\(6),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2\(5),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1\(5),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2\(4),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1\(4),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2\(3),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1\(3),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2\(2),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1\(2),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2\(1),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1\(1),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2\(0),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg1\(0),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_fcs_fwd_ena_reg2_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_fcs_fwd_ena_reg2,
  D => u_triple_speed_mac_u_mac_tx_ctrl_tx_fcs_fwd_ena_reg1,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/gmii_col_reg1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_reg1,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_col_int,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/gmii_col_reg2_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_reg2,
  D => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_reg1,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/gmii_crs_reg1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_gmii_crs_reg1,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_crs_int,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/gmii_crs_reg2_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_gmii_crs_reg2,
  D => u_triple_speed_mac_u_mac_tx_ctrl_gmii_crs_reg1,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ena_reg3_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_ena_reg3,
  D => u_triple_speed_mac_u_mac_tx_ctrl_tx_ena_reg2,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n247);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_ena_reg3_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_ifg_delay_ena_reg3,
  D => u_triple_speed_mac_u_mac_tx_ctrl_tx_ifg_delay_ena_reg2,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n247);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(7),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2\(7),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n247);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(6),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2\(6),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n247);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(5),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2\(5),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n247);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(4),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2\(4),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n247);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(3),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2\(3),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n247);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(2),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2\(2),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n247);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(1),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2\(1),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n247);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(0),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg2\(0),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n247);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_fcs_fwd_ena_reg3_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_fcs_fwd_ena_reg3,
  D => u_triple_speed_mac_u_mac_tx_ctrl_tx_fcs_fwd_ena_reg2,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n247);
\u_triple_speed_mac/u_mac_tx_ctrl/hd_state_enable_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n249,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n247);
\u_triple_speed_mac/u_mac_tx_ctrl/gmii_col_int_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_int,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n527,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/gmii_crs_int_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_gmii_crs_int,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n528,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(7),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n552,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(6),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n553,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(5),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n554,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(4),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n555_10,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int_2_s0\: DFFPE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(2),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n557_10,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(1),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n558,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n559,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(7),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n618,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(6),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n619,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(5),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n620,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(4),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n621,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(3),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n622,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(2),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n623,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(1),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n624,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n625,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/ifg_end_flag_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_ifg_end_flag,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n626,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  D => u_triple_speed_mac_u_mac_tx_ctrl_clk_ena_reg,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/c_state_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(3),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/n_state\(3),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/c_state_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/n_state\(2),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/c_state_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/n_state\(1),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/c_state_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/n_state\(0),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_ready_o_s0\: DFFCE
port map (
  Q => NN_2,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n810,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/crc_init_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt\(1),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n957,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt\(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n958,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/gmii_col_int_reg_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_int_reg,
  D => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_int,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_collision_o_s0\: DFFCE
port map (
  Q => NN_1,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n780_7,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_retransmit_o_s0\: DFFCE
port map (
  Q => NN_3,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1260,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/clr_retrans_cnt_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_clr_retrans_cnt,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1307,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(4),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(4),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1269);
\u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(3),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(3),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1269);
\u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(2),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(2),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1269);
\u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(1),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(1),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1269);
\u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(0),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(0),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1269);
\u_triple_speed_mac/u_mac_tx_ctrl/retrans_flag_reg_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_retrans_flag_reg,
  D => u_triple_speed_mac_u_mac_tx_ctrl_retrans_flag,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/retrans_timeout_cnt_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_timeout_cnt\(2),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1345,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/retrans_timeout_cnt_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_timeout_cnt\(1),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1346,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/retrans_timeout_cnt_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_timeout_cnt\(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1347,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(7),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1519,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(6),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1520,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(5),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1521,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(4),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1522,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(3),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1523,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(2),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1524,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(1),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1525,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1526,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_start_reg1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_start_reg1,
  D => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_start_reg,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_last_reg1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1,
  D => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_statistics_valid_o_s0\: DFFCE
port map (
  Q => tx_statistics_valid,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1552,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_frm_o_s0\: DFFCE
port map (
  Q => tx_statistics_vector(5),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1609,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_occur_col_o_s0\: DFFCE
port map (
  Q => tx_statistics_vector(28),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1624,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_attempts_o_3_s0\: DFFCE
port map (
  Q => tx_statistics_vector(27),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1651,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_attempts_o_2_s0\: DFFCE
port map (
  Q => tx_statistics_vector(26),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1652,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_attempts_o_1_s0\: DFFCE
port map (
  Q => tx_statistics_vector(25),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1653,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_attempts_o_0_s0\: DFFCE
port map (
  Q => tx_statistics_vector(24),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1654,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_excessive_col_o_s0\: DFFCE
port map (
  Q => tx_statistics_vector(23),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1681,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/late_col_reg_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_late_col_reg,
  D => u_triple_speed_mac_u_mac_tx_ctrl_late_col,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_late_col_o_s0\: DFFCE
port map (
  Q => tx_statistics_vector(22),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1700,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg_15_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(15),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(7),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg_14_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(14),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(6),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg_13_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(13),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(5),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg_12_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(12),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(4),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg_11_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(11),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(3),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg_10_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(10),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(2),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg_9_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(9),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(1),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg_8_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(8),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(0),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(7),
  D => tx_mac_data(7),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(6),
  D => tx_mac_data(6),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(5),
  D => tx_mac_data(5),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(4),
  D => tx_mac_data(4),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(3),
  D => tx_mac_data(3),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(2),
  D => tx_mac_data(2),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(1),
  D => tx_mac_data(1),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(0),
  D => tx_mac_data(0),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_vlan_frame_o_s0\: DFFCE
port map (
  Q => tx_statistics_vector(3),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1765,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_o_15_s0\: DFFCE
port map (
  Q => tx_statistics_vector(21),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1859,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_o_14_s0\: DFFCE
port map (
  Q => tx_statistics_vector(20),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1860,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_o_13_s0\: DFFCE
port map (
  Q => tx_statistics_vector(19),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1861,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_o_12_s0\: DFFCE
port map (
  Q => tx_statistics_vector(18),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1862,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_o_11_s0\: DFFCE
port map (
  Q => tx_statistics_vector(17),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1863,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_o_10_s0\: DFFCE
port map (
  Q => tx_statistics_vector(16),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1864,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_o_9_s0\: DFFCE
port map (
  Q => tx_statistics_vector(15),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1865,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_o_8_s0\: DFFCE
port map (
  Q => tx_statistics_vector(14),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1866,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_o_7_s0\: DFFCE
port map (
  Q => tx_statistics_vector(13),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1867,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_o_6_s0\: DFFCE
port map (
  Q => tx_statistics_vector(12),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1868,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_o_5_s0\: DFFCE
port map (
  Q => tx_statistics_vector(11),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1869,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_o_4_s0\: DFFCE
port map (
  Q => tx_statistics_vector(10),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1870,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_o_3_s0\: DFFCE
port map (
  Q => tx_statistics_vector(9),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1871,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_o_2_s0\: DFFCE
port map (
  Q => tx_statistics_vector(8),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1872,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_o_1_s0\: DFFCE
port map (
  Q => tx_statistics_vector(7),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1873,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_o_0_s0\: DFFCE
port map (
  Q => tx_statistics_vector(6),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1874,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_ctrl_frm_o_s0\: DFFCE
port map (
  Q => tx_statistics_vector(4),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1948,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_47_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(47),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(39),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_46_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(46),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(38),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_45_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(45),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(37),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_44_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(44),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(36),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_43_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(43),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(35),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_42_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(42),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(34),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_41_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(41),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(33),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_40_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(40),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(32),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_39_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(39),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(31),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_38_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(38),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(30),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_37_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(37),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(29),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_36_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(36),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(28),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_35_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(35),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(27),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_34_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(34),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(26),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_33_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(33),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(25),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_32_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(32),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(24),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_31_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(31),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(23),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_30_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(30),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(22),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_29_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(29),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(21),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_28_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(28),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(20),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_27_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(27),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(19),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_26_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(26),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(18),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_25_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(25),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(17),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_24_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(24),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(16),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_23_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(23),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(15),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_22_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(22),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(14),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_21_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(21),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(13),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_20_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(20),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(12),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_19_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(19),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(11),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_18_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(18),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(10),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_17_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(17),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(9),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg_16_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(16),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(8),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_unicast_frm_o_s0\: DFFCE
port map (
  Q => tx_statistics_vector(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n2132,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_broadcast_frm_o_s0\: DFFCE
port map (
  Q => tx_statistics_vector(1),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n2133,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_multicast_frm_o_s0\: DFFCE
port map (
  Q => tx_statistics_vector(2),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n2134,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int_3_s0\: DFFPE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(3),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n556,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o_13_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(13),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(12),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o_12_s0\: DFFPE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(12),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(11),
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o_11_s0\: DFFPE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(11),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(10),
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o_10_s0\: DFFPE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(10),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(9),
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o_9_s0\: DFFPE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(9),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(8),
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o_8_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(8),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(7),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(7),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(6),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(6),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(5),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o_5_s0\: DFFPE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(5),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(4),
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o_4_s0\: DFFPE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(4),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(3),
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(3),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(2),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(2),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(1),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o_1_s0\: DFFPE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(1),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(0),
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_n27,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg_15_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(15),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(15),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg_14_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(14),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(14),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg_13_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(13),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(13),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg_12_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(12),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(12),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg_11_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(11),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(11),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg_10_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(10),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(10),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg_9_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(9),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(9),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg_8_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(8),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(8),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(7),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(7),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(6),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(6),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(5),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(5),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(4),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(4),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(3),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(3),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(2),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(2),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(1),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(1),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(0),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(0),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o_15_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(15),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(14),
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o_14_s0\: DFFPE
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(14),
  D => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(13),
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena);
\u_triple_speed_mac/u_miim_block/u_eth_miim/EndBusy_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_EndBusy,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_EndBusy_d,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/UpdateMIIRX_DATAReg_s0\: DFFCE
port map (
  Q => miim_rddata_valid,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_n18,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/WCtrlData_q1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlData_q1,
  D => miim_wren,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/WCtrlData_q2_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlData_q2,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlData_q1,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/WCtrlData_q3_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlData_q3,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlData_q2,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/RStat_q1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_RStat_q1,
  D => miim_rden,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/RStat_q2_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_RStat_q2,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_RStat_q1,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/RStat_q3_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_RStat_q3,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_RStat_q2,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/WCtrlDataStart_q_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart_q,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart_q_16);
\u_triple_speed_mac/u_miim_block/u_eth_miim/WCtrlDataStart_q1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart_q1,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/WCtrlDataStart_q2_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart_q2,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart_q1,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/RStatStart_q1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_RStatStart_q1,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_RStatStart,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/RStatStart_q2_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_RStatStart_q2,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_RStatStart_q1,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/InProgress_q1_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress_q1,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/InProgress_q2_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress_q2,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress_q1,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/InProgress_q3_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress_q3,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress_q2,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/LatchByte0_d_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte0_d,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte0_d2,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/LatchByte1_d_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d2,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/LatchByte_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/LatchByte\(1),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/LatchByte_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/LatchByte\(0),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte0_d,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/InProgress_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_StartOp,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress_6);
\u_triple_speed_mac/u_miim_block/u_eth_miim/WriteOp_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_WriteOp,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_n118,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_WriteOp_6);
\u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(6),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_n144,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(5),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_n145,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(4),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_n146,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(3),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_n147,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(2),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_n148,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(1),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_n149,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/EndBusy_d_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_EndBusy_d,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_n8,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/Busy_s0\: DFFPE
port map (
  Q => miim_busy,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_n108,
  CLK => clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(6),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n35,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(5),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n36,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(4),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n37,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(3),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n38,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(2),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n39,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(1),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n40,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter_7_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(7),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n34,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter_0_s0\: DFFPE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(0),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n41,
  CLK => clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg_6_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(6),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n55,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_n_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg_5_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(5),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n56,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_n_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg_4_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(4),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n57,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_n_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg_3_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(3),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n58,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_n_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg_2_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(2),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n59,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_n_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg_1_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(1),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n60,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_n_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg_0_s0\: DFFCE
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(0),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n61,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_n_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/Prsd_15_s0\: DFFCE
port map (
  Q => miim_rddata(15),
  D => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(6),
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n206);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/Prsd_14_s0\: DFFCE
port map (
  Q => miim_rddata(14),
  D => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(5),
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n206);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/Prsd_13_s0\: DFFCE
port map (
  Q => miim_rddata(13),
  D => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(4),
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n206);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/Prsd_12_s0\: DFFCE
port map (
  Q => miim_rddata(12),
  D => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(3),
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n206);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/Prsd_11_s0\: DFFCE
port map (
  Q => miim_rddata(11),
  D => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(2),
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n206);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/Prsd_10_s0\: DFFCE
port map (
  Q => miim_rddata(10),
  D => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(1),
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n206);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/Prsd_9_s0\: DFFCE
port map (
  Q => miim_rddata(9),
  D => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(0),
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n206);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/Prsd_8_s0\: DFFCE
port map (
  Q => miim_rddata(8),
  D => mdio_in,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n206);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/Prsd_7_s0\: DFFCE
port map (
  Q => miim_rddata(7),
  D => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(6),
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n214);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/Prsd_6_s0\: DFFCE
port map (
  Q => miim_rddata(6),
  D => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(5),
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n214);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/Prsd_5_s0\: DFFCE
port map (
  Q => miim_rddata(5),
  D => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(4),
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n214);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/Prsd_4_s0\: DFFCE
port map (
  Q => miim_rddata(4),
  D => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(3),
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n214);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/Prsd_3_s0\: DFFCE
port map (
  Q => miim_rddata(3),
  D => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(2),
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n214);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/Prsd_2_s0\: DFFCE
port map (
  Q => miim_rddata(2),
  D => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(1),
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n214);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/Prsd_1_s0\: DFFCE
port map (
  Q => miim_rddata(1),
  D => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(0),
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n214);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/Prsd_0_s0\: DFFCE
port map (
  Q => miim_rddata(0),
  D => mdio_in,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n214);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg_7_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_ShiftedBit,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_n_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/outctrl/MdoEn_d_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_MdoEn_d,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_MdoEn_2d,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_n_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/outctrl/MdoEn_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_mdio_oe,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_MdoEn_d,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_n_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/outctrl/Mdo_2d_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_Mdo_2d,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_n37,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_n_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/outctrl/Mdo_d_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_Mdo_d,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_n38,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_n_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/outctrl/Mdo_s0\: DFFCE
port map (
  Q => mdio_out,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_Mdo_d,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_n_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/outctrl/MdoEn_2d_s0\: DFFCE
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_MdoEn_2d,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_n25,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_n_Z);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/ctl_d0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0,
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d1_8);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/ctl_d1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d1,
  D => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n186,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d1_8);
\u_triple_speed_mac/u_mac_rx_ctrl/gmii_col_int_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_gmii_col_int,
  D => u_triple_speed_mac_u_mac_rx_if_block_u_mac_rx_if_mux_gmii_rx_dv_int_Z,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_gmii_col_int_8);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int_7_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int\(7),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n524,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_data_int_7_11);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int_6_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int\(6),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n525,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_data_int_7_11);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int_5_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int\(5),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n526,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_data_int_7_11);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int\(4),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n527,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_data_int_7_11);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int\(3),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n528,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_data_int_7_11);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int\(2),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n529,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_data_int_7_11);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int\(1),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n530,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_data_int_7_11);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int\(0),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n531,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_data_int_7_11);
\u_triple_speed_mac/u_mac_rx_ctrl/cnt_crc_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/cnt_crc\(1),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n453,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_cnt_crc_1_11);
\u_triple_speed_mac/u_mac_rx_ctrl/cnt_crc_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/cnt_crc\(0),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n454,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_cnt_crc_1_11);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg_15_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(15),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n604,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_frm_lgt_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg_14_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(14),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n605,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_frm_lgt_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg_12_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(12),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n607,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_frm_lgt_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg_11_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(11),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n608,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_frm_lgt_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg_10_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(10),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n609,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_frm_lgt_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg_8_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(8),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n611,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_frm_lgt_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg_7_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(7),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n612,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_frm_lgt_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg_6_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(6),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n613,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_frm_lgt_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg_5_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(5),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n614_9,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_frm_lgt_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(3),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n616,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_frm_lgt_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(2),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n617_9,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_frm_lgt_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_er_err_reg_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_er_err_reg,
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_er_err_reg_8);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_47_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(47),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n842,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_46_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(46),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n843,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_45_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(45),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n844,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_44_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(44),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n845,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_43_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(43),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n846,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_42_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(42),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n847,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_41_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(41),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n848,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_40_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(40),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n849,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_39_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(39),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n850,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_38_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(38),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n851,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_37_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(37),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n852,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_36_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(36),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n853,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_35_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(35),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n854,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_34_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(34),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n855,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_33_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(33),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n856,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_32_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(32),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n857,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_31_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(31),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n858,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_30_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(30),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n859,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_29_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(29),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n860,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_28_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(28),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n861,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_27_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(27),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n862,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_26_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(26),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n863,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_25_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(25),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n864,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_24_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(24),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n865,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_23_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(23),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n866,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_22_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(22),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n867,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_21_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(21),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n868,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_20_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(20),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n869,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_19_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(19),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n870,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_18_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(18),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n871,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_17_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(17),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n872,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_16_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(16),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n873,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_15_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(15),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n874,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_14_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(14),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n875,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_13_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(13),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n876,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_12_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(12),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n877,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_11_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(11),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n878,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_10_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(10),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n879,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_9_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(9),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n880,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_8_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(8),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n881,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_7_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(7),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n882_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_6_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(6),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n883_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_5_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(5),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n884_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(4),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n885_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(3),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n886_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(2),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n887_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(1),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n888_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(0),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n889_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47);
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_15_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(15),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n882_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_14_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(14),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n883_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_13_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(13),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n884_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_12_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(12),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n885_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_11_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(11),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n886_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_10_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(10),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n887_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_9_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(9),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n888_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_8_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(8),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n889_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_7_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(7),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n882_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_7);
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_6_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(6),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n883_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_7);
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_5_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(5),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n884_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_7);
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(4),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n885_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_7);
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(3),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n886_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_7);
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(2),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n887_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_7);
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(1),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n888_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_7);
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(0),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n889_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_7);
\u_triple_speed_mac/u_mac_rx_ctrl/type_ptr_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/type_ptr\(4),
  D => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_type_ptr_4_15);
\u_triple_speed_mac/u_mac_rx_ctrl/type_reg_15_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(15),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1337,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_type_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/type_reg_14_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(14),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1338,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_type_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/type_reg_13_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(13),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1339,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_type_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/type_reg_12_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(12),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1340,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_type_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/type_reg_11_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(11),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1341,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_type_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/type_reg_10_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(10),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1342,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_type_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/type_reg_9_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(9),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1343,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_type_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/type_reg_8_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(8),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1344,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_type_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/type_reg_7_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(7),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n882_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_type_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/type_reg_6_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(6),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n883_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_type_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/type_reg_5_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(5),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n884_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_type_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/type_reg_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(4),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n885_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_type_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/type_reg_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(3),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n886_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_type_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/type_reg_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(2),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n887_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_type_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/type_reg_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(1),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n888_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_type_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/type_reg_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(0),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n889_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_type_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/op_reg_15_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(15),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1448,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_op_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/op_reg_14_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(14),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1449,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_op_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/op_reg_13_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(13),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1450,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_op_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/op_reg_12_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(12),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1451,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_op_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/op_reg_11_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(11),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1452,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_op_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/op_reg_10_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(10),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1453,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_op_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/op_reg_9_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(9),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1454,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_op_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/op_reg_8_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(8),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1455,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_op_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/op_reg_7_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(7),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n882_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_op_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/op_reg_6_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(6),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n883_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_op_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/op_reg_5_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(5),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n884_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_op_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/op_reg_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(4),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n885_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_op_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/op_reg_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(3),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n886_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_op_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/op_reg_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(2),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n887_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_op_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/op_reg_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(1),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n888_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_op_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/op_reg_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(0),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n889_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_op_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg_15_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(15),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1502,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_pause_val_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg_14_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(14),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1503,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_pause_val_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg_13_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(13),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1504,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_pause_val_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg_12_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(12),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1505,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_pause_val_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg_11_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(11),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1506,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_pause_val_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg_10_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(10),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1507,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_pause_val_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg_9_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(9),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1508,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_pause_val_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg_8_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(8),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1509,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_pause_val_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg_7_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(7),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n882_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_pause_val_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg_6_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(6),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n883_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_pause_val_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg_5_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(5),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n884_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_pause_val_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(4),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n885_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_pause_val_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(3),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n886_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_pause_val_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(2),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n887_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_pause_val_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(1),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n888_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_pause_val_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(0),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n889_11,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_rx_pause_val_reg_15);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_30_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(30),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n228,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_29_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(29),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n229,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_28_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(28),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n230,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_27_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(27),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n231,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_26_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(26),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n232,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_25_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(25),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n233,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_24_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(24),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n234,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_23_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(23),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n235,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_22_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(22),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n236_9,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_21_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(21),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n237,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_20_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(20),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n238,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_19_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(19),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n239,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_18_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(18),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n240,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_17_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(17),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n241,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_16_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(16),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n242,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_15_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(15),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n243,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_14_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(14),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n244,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_13_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(13),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n245,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_12_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(12),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n246,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_11_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(11),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n247,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_10_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(10),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n248,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_9_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(9),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n249,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_8_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(8),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n250,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_7_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(7),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n251,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_6_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(6),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n252,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_5_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(5),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n253,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_4_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(4),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n254,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_3_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(3),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n255,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_2_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(2),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n256,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_1_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(1),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n257,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_0_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(0),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n258,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_31_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(31),
  D => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n227,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30);
\u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg_7_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(7),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n299,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_pause_frm_reg_7_11);
\u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg_6_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(6),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n300,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_pause_frm_reg_7_11);
\u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg_5_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(5),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n301,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_pause_frm_reg_7_11);
\u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(4),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n302,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_pause_frm_reg_7_11);
\u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(3),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n303,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_pause_frm_reg_7_11);
\u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(2),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n304,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_pause_frm_reg_7_11);
\u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(1),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n305,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_pause_frm_reg_7_11);
\u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n306,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_pause_frm_reg_7_11);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_ready_mask_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_ready_mask,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n769,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_ready_mask_8);
\u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt_15_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(15),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n899,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_14);
\u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt_14_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(14),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n900,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_14);
\u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt_13_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(13),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n901,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_14);
\u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt_12_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(12),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n902,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_14);
\u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt_11_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(11),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n903,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_14);
\u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt_10_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(10),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n904,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_14);
\u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt_9_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(9),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n905,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_14);
\u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt_8_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(8),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n906,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_14);
\u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt_7_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(7),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n907,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_14);
\u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt_6_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(6),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n908,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_14);
\u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt_5_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(5),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n909,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_14);
\u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(4),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n910,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_14);
\u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(3),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n911,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_14);
\u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n912,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_14);
\u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n913,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_14);
\u_triple_speed_mac/u_mac_tx_ctrl/preamble_cnt_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/preamble_cnt\(2),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n976,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_preamble_cnt_2);
\u_triple_speed_mac/u_mac_tx_ctrl/preamble_cnt_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/preamble_cnt\(1),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n977,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_preamble_cnt_2);
\u_triple_speed_mac/u_mac_tx_ctrl/preamble_cnt_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/preamble_cnt\(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n978,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_preamble_cnt_2);
\u_triple_speed_mac/u_mac_tx_ctrl/back_cnt_15_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(15),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1116,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1026_12);
\u_triple_speed_mac/u_mac_tx_ctrl/back_cnt_14_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(14),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1117,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1026_12);
\u_triple_speed_mac/u_mac_tx_ctrl/back_cnt_13_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(13),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1118,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1026_12);
\u_triple_speed_mac/u_mac_tx_ctrl/back_cnt_12_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(12),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1119,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1026_12);
\u_triple_speed_mac/u_mac_tx_ctrl/back_cnt_11_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(11),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1120,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1026_12);
\u_triple_speed_mac/u_mac_tx_ctrl/back_cnt_10_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(10),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1121,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1026_12);
\u_triple_speed_mac/u_mac_tx_ctrl/back_cnt_9_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(9),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1122,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1026_12);
\u_triple_speed_mac/u_mac_tx_ctrl/back_cnt_8_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(8),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1123,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1026_12);
\u_triple_speed_mac/u_mac_tx_ctrl/back_cnt_7_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(7),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1124,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1026_12);
\u_triple_speed_mac/u_mac_tx_ctrl/back_cnt_6_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(6),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1125,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1026_12);
\u_triple_speed_mac/u_mac_tx_ctrl/back_cnt_5_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(5),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1126,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1026_12);
\u_triple_speed_mac/u_mac_tx_ctrl/back_cnt_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(4),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1127,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1026_12);
\u_triple_speed_mac/u_mac_tx_ctrl/back_cnt_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(3),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1128,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1026_12);
\u_triple_speed_mac/u_mac_tx_ctrl/back_cnt_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(2),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1129_9,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1026_12);
\u_triple_speed_mac/u_mac_tx_ctrl/back_cnt_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(1),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1130,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_n1026_12);
\u_triple_speed_mac/u_mac_tx_ctrl/gmii_col_latch_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_latch,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1169,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_latch_10);
\u_triple_speed_mac/u_mac_tx_ctrl/late_col_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_late_col,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1169,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_late_col_8);
\u_triple_speed_mac/u_mac_tx_ctrl/too_many_retransmit_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_too_many_retransmit,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1169,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_too_many_retransmit_8);
\u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(4),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1284,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_retrans_cnt_4_14);
\u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(2),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1286,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_retrans_cnt_4_14);
\u_triple_speed_mac/u_mac_tx_ctrl/retrans_flag_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_retrans_flag,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1330,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_retrans_flag_8);
\u_triple_speed_mac/u_mac_tx_ctrl/active_retrans_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_active_retrans,
  D => u_triple_speed_mac_u_mac_tx_ctrl_retrans_flag,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_active_retrans_8);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_start_reg_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_start_reg,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1508_10,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_last_reg_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1518,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_error_reg_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_error_reg,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1517,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/gmii_tx_en_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_en_from_mac,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1554,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_gmii_tx_en);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_frm_latch_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_frm_latch,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_frm_latch_10);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_occur_col_latch_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_occur_col_latch,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n775_10,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_occur_col_latch_10);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_attempts_latch_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_attempts_latch\(3),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1635,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_attempts_latch_3);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_attempts_latch_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_attempts_latch\(2),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1636,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_attempts_latch_3);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_attempts_latch_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_attempts_latch\(1),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1637,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_attempts_latch_3);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_attempts_latch_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_attempts_latch\(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1638,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_attempts_latch_3);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_excessive_col_latch_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_excessive_col_latch,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1672,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_excessive_col_latch_10);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_late_col_latch_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_late_col_latch,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1691,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_late_col_latch_12);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_vlan_frame_latch_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_vlan_frame_latch,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1906,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_vlan_frame_latch_10);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch_15_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(15),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1807_10,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_frm_lgt_latch_15);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch_14_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(14),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1808,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_frm_lgt_latch_15);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch_13_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(13),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1809_12,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_frm_lgt_latch_15);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch_12_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(12),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1810_12,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_frm_lgt_latch_15);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch_11_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(11),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1811_11,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_frm_lgt_latch_15);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch_10_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(10),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1812_12,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_frm_lgt_latch_15);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch_9_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(9),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1813_10,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_frm_lgt_latch_15);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch_8_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(8),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1814,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_frm_lgt_latch_15);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch_7_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(7),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1815,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_frm_lgt_latch_15);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch_6_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(6),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1816_9,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_frm_lgt_latch_15);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch_5_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(5),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1817,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_frm_lgt_latch_15);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(4),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1818_9,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_frm_lgt_latch_15);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch_3_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(3),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1819,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_frm_lgt_latch_15);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch_2_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(2),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1820_9,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_frm_lgt_latch_15);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(1),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1821,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_frm_lgt_latch_15);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1822,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_frm_lgt_latch_15);
\u_triple_speed_mac/u_mac_tx_ctrl/type_ptr_4_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/type_ptr\(4),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1911,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_type_ptr_4);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_ctrl_frm_latch_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_ctrl_frm_latch,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1938,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_ctrl_frm_latch_10);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_unicast_frm_latch_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_unicast_frm_latch,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n2121,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_broadcast_frm_latch_9);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_broadcast_frm_latch_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_broadcast_frm_latch,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n2119,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_broadcast_frm_latch_9);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_multicast_frm_latch_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_multicast_frm_latch,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n2123,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_tx_broadcast_frm_latch_9);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_30_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(30),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n260,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_29_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(29),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n261,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_28_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(28),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n262,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_27_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(27),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n263,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_26_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(26),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n264,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_25_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(25),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n265,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_24_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(24),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n266,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_23_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(23),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n267,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_22_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(22),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n268,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_21_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(21),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n269,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_20_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(20),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n270,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_19_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(19),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n271,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_18_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(18),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n272,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_17_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(17),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n273,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_16_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(16),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n274,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_15_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(15),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n275,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_14_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(14),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n276,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_13_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(13),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_12_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(12),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n278,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_11_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(11),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n279,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_10_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(10),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n280,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_9_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(9),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n281,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_8_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(8),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n282,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_7_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(7),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283_15,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_6_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(6),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_15,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_5_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(5),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n285_13,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_4_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(4),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n286,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_3_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(3),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n287_13,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_2_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(2),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n288_14,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_1_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(1),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n289_13,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_0_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290_13,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/cnt_1_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/cnt\(1),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n377,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_cnt_1_13);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_31_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(31),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n259,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11);
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Mdc_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => NN,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n54,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_CountEq0);
\u_triple_speed_mac/u_mac_rx_ctrl/n1335_s32\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => u_triple_speed_mac_u_mac_rx_ctrl_n1335,
  COUT => u_triple_speed_mac_u_mac_rx_ctrl_n1335_36,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n1335_91,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(2),
  I3 => GND_0,
  CIN => \u_triple_speed_mac/u_mac_rx_ctrl/type_ptr\(2));
\u_triple_speed_mac/u_mac_rx_ctrl/n1335_s33\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => u_triple_speed_mac_u_mac_rx_ctrl_n1335_37,
  COUT => u_triple_speed_mac_u_mac_rx_ctrl_n1335_38,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/type_ptr\(2),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(3),
  I3 => GND_0,
  CIN => u_triple_speed_mac_u_mac_rx_ctrl_n1335_36);
\u_triple_speed_mac/u_mac_rx_ctrl/n1335_s34\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => u_triple_speed_mac_u_mac_rx_ctrl_n1335_39,
  COUT => u_triple_speed_mac_u_mac_rx_ctrl_n1335_40,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/type_ptr\(4),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(4),
  I3 => GND_0,
  CIN => u_triple_speed_mac_u_mac_rx_ctrl_n1335_38);
\u_triple_speed_mac/u_mac_rx_ctrl/n1446_s32\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => u_triple_speed_mac_u_mac_rx_ctrl_n1446,
  COUT => u_triple_speed_mac_u_mac_rx_ctrl_n1446_36,
  I0 => VCC_0,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(2),
  I3 => GND_0,
  CIN => \u_triple_speed_mac/u_mac_rx_ctrl/type_ptr\(2));
\u_triple_speed_mac/u_mac_rx_ctrl/n1446_s33\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => u_triple_speed_mac_u_mac_rx_ctrl_n1446_37,
  COUT => u_triple_speed_mac_u_mac_rx_ctrl_n1446_38,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/type_ptr\(2),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(3),
  I3 => GND_0,
  CIN => u_triple_speed_mac_u_mac_rx_ctrl_n1446_36);
\u_triple_speed_mac/u_mac_rx_ctrl/n1446_s34\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => u_triple_speed_mac_u_mac_rx_ctrl_n1446_39,
  COUT => u_triple_speed_mac_u_mac_rx_ctrl_n1446_40,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/type_ptr\(4),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(4),
  I3 => GND_0,
  CIN => u_triple_speed_mac_u_mac_rx_ctrl_n1446_38);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n50_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n50,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_iddr\(3),
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(15),
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n51_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n51,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_iddr\(2),
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(14),
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n52_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n52,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_iddr\(1),
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(13),
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n53_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n53,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_iddr\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(12),
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n54_s0\: LUT4
generic map (
  INIT => X"F044"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54,
  I0 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54_4,
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_dv_10100m_reg\(3),
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_dv_int_iddr,
  I3 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n55_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n55,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_er_10100m_reg\(3),
  I1 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_er_int_iddr,
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n127_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n127,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int\(3),
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int\(7),
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n128_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n128,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int\(2),
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int\(6),
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n129_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n129,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int\(1),
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int\(5),
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n130_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n130,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int\(4),
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n131_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n131,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg\(7),
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int\(3),
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n132_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n132,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg\(6),
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int\(2),
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n133_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n133,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg\(5),
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int\(1),
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n134_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n134,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_reg\(4),
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int\(0),
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n136_s0\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n136,
  I0 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_dv_int,
  I1 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_er_int);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n176_s0\: LUT2
generic map (
  INIT => X"E"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n176,
  I0 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_dv_reg,
  I1 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_align_o_tmp);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n177_s0\: LUT2
generic map (
  INIT => X"E"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n177,
  I0 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_align_o_tmp,
  I1 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_clk_ena_reg);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_crs_int_s\: LUT4
generic map (
  INIT => X"FFFE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_crs_int,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_en_from_mac_delay\(3),
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_er_from_mac_delay\(3),
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_rgmii_rx_dv_o,
  I3 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_rgmii_rx_er_o);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_col_int_s\: LUT4
generic map (
  INIT => X"EEE0"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_col_int,
  I0 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_rgmii_rx_dv_o,
  I1 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_rgmii_rx_er_o,
  I2 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_en_from_mac_delay\(3),
  I3 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/tx_er_from_mac_delay\(3));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/rgmii_tx_ctl_err_s0\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_rgmii_tx_ctl_err,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_tx_en_from_mac,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_tx_er_from_mac);
\u_triple_speed_mac/u_mac_rx_ctrl/n28_s1\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n28,
  I0 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_hd_ena_reg2);
\u_triple_speed_mac/u_mac_rx_ctrl/n146_s0\: LUT4
generic map (
  INIT => X"88F0"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n146,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(7),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n146_4,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(39),
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3);
\u_triple_speed_mac/u_mac_rx_ctrl/n147_s0\: LUT4
generic map (
  INIT => X"88F0"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n147,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(6),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n146_4,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(38),
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3);
\u_triple_speed_mac/u_mac_rx_ctrl/n148_s0\: LUT4
generic map (
  INIT => X"88F0"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n148,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(5),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n146_4,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(37),
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3);
\u_triple_speed_mac/u_mac_rx_ctrl/n149_s0\: LUT4
generic map (
  INIT => X"88F0"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n149,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(4),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n146_4,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(36),
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3);
\u_triple_speed_mac/u_mac_rx_ctrl/n150_s0\: LUT4
generic map (
  INIT => X"88F0"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n150,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(3),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n146_4,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(35),
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3);
\u_triple_speed_mac/u_mac_rx_ctrl/n151_s0\: LUT4
generic map (
  INIT => X"88F0"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n151,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(2),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n146_4,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(34),
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3);
\u_triple_speed_mac/u_mac_rx_ctrl/n152_s0\: LUT4
generic map (
  INIT => X"88F0"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n152,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(1),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n146_4,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(33),
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3);
\u_triple_speed_mac/u_mac_rx_ctrl/n153_s0\: LUT4
generic map (
  INIT => X"88F0"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n153,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(0),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n146_4,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(32),
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3);
\u_triple_speed_mac/u_mac_rx_ctrl/n158_s0\: LUT4
generic map (
  INIT => X"88F0"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n158,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_clk_ena_int,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n146_4,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(4),
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3);
\u_triple_speed_mac/u_mac_rx_ctrl/n163_s0\: LUT4
generic map (
  INIT => X"88F0"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n163,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_gmii_rx_dv_int,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n146_4,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(4),
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3);
\u_triple_speed_mac/u_mac_rx_ctrl/n168_s0\: LUT4
generic map (
  INIT => X"88F0"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n168,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_gmii_rx_er_int,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n146_4,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg\(4),
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3);
\u_triple_speed_mac/u_mac_rx_ctrl/n173_s0\: LUT4
generic map (
  INIT => X"88F0"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n173,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_gmii_col_int,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n146_4,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg\(4),
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3);
\u_triple_speed_mac/u_mac_rx_ctrl/n178_s0\: LUT4
generic map (
  INIT => X"88F0"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n178,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_gmii_rx_align_int,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n146_4,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg\(4),
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3);
\u_triple_speed_mac/u_mac_rx_ctrl/n359_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n359,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(9),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state\(1),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3);
\u_triple_speed_mac/u_mac_rx_ctrl/n360_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n360,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(8),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3);
\u_triple_speed_mac/u_mac_rx_ctrl/n464_s0\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n464,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_crc_result_valid,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_valid_int);
\u_triple_speed_mac/u_mac_rx_ctrl/n495_s0\: LUT4
generic map (
  INIT => X"C0CD"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n495,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n495_4,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n495_5,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n495_10,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_n495_7);
\u_triple_speed_mac/u_mac_rx_ctrl/n562_s1\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n562,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(4),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n562_8,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_n562_6);
\u_triple_speed_mac/u_mac_rx_ctrl/n1590_s1\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1590,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_flow_ctrl_frm_s0\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_rx_flow_ctrl_frm,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_lgt_err,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_rx_flow_ctrl_frm_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n1634_s0\: LUT2
generic map (
  INIT => X"E"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1634,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_lgt_err,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_error);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_err_Z_s\: LUT3
generic map (
  INIT => X"70"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_3,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_4,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_crc_result_valid);
\u_triple_speed_mac/u_mac_tx_ctrl/n247_s0\: LUT3
generic map (
  INIT => X"01"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n247,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n249_s1\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n249,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis1000_reg2,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_duplex_status_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n828_s1\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n769_s0\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n769,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n769_4);
\u_triple_speed_mac/u_mac_tx_ctrl/n1116_s0\: LUT4
generic map (
  INIT => X"F044"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1116,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1116_4,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(9),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1116_5,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1117_s0\: LUT4
generic map (
  INIT => X"F044"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1117,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1117_4,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(8),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1117_5,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1118_s0\: LUT4
generic map (
  INIT => X"3CAA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1118,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1118_4,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(13),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1118_5,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1119_s0\: LUT4
generic map (
  INIT => X"3CAA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1119,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1119_4,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(12),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1119_5,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1120_s0\: LUT4
generic map (
  INIT => X"F044"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1120,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1120_7,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(5),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1120_5,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1121_s0\: LUT4
generic map (
  INIT => X"F044"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1121,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1121_9,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(4),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1121_7,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1122_s0\: LUT4
generic map (
  INIT => X"3CAA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1122,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1122_7,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(9),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1122_5,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1123_s0\: LUT4
generic map (
  INIT => X"3CAA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1123,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1123_4,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(8),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1123_5,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1124_s0\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1124,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1124_7,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1124_5,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1125_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1125,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1125_6,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(0),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_10);
\u_triple_speed_mac/u_mac_tx_ctrl/lfsr_ena_s0\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_lfsr_ena,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable);
\u_triple_speed_mac/u_mac_tx_ctrl/n1260_s1\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1260,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_late_col,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_too_many_retransmit,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n780_7);
\u_triple_speed_mac/u_mac_tx_ctrl/n1307_s1\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1307,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/n_state\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/n_state\(0),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/n_state\(2),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1307_5);
\u_triple_speed_mac/u_mac_tx_ctrl/n1330_s0\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1330,
  I0 => NN_1,
  I1 => NN_3);
\u_triple_speed_mac/u_mac_tx_ctrl/n1552_s0\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1552,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1672_s0\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1672,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(4),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(3),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1269,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1672_4);
\u_triple_speed_mac/u_mac_tx_ctrl/n1691_s0\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1691,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_late_col_reg,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_late_col);
\u_triple_speed_mac/u_mac_tx_ctrl/n1906_s0\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1906,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1906_4,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1906_5,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1906_6);
\u_triple_speed_mac/u_mac_tx_ctrl/n1938_s0\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1938,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1906_5,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1938_4,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1938_5);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_0_s0\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(0),
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(4),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(5),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(8),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_0);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_1_s0\: LUT3
generic map (
  INIT => X"96"
)
port map (
  F => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(1),
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(13),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(1),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_1);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_2_s0\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(2),
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(6),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_2);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_3_s0\: LUT3
generic map (
  INIT => X"96"
)
port map (
  F => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(3),
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(3),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_3);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_4_s0\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(4),
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(5),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(9),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(4),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_4);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_5_s0\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(5),
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(6),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(10),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(5),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_5);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_6_s0\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(6),
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(6),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_6,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_6_5);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_7_s0\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(7),
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(4),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(8),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_6,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_7);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_8_s0\: LUT3
generic map (
  INIT => X"69"
)
port map (
  F => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(8),
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(0),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_8,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_8_5);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_9_s0\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(9),
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(10),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(14),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_1,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_9);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_10_s0\: LUT3
generic map (
  INIT => X"96"
)
port map (
  F => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(10),
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(4),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_10,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_10_5);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_11_s0\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(11),
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(11),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(3),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(11),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_6);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_12_s0\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(12),
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(12),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(8),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(12),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_4);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_13_s0\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(13),
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(9),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(13),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(13),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_5);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_14_s0\: LUT3
generic map (
  INIT => X"96"
)
port map (
  F => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(14),
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(14),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(6),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_14);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_15_s0\: LUT3
generic map (
  INIT => X"96"
)
port map (
  F => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z\(15),
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(15),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(4),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_15);
\u_triple_speed_mac/u_miim_block/u_eth_miim/n8_s0\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_n8,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress_q2,
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress_q3);
\u_triple_speed_mac/u_miim_block/u_eth_miim/n18_s0\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_n18,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress_q3,
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart_q,
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_EndBusy_d);
\u_triple_speed_mac/u_miim_block/u_eth_miim/n108_s0\: LUT3
generic map (
  INIT => X"7F"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_n108,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_n108_4,
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_n108_5,
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_n108_6);
\u_triple_speed_mac/u_miim_block/u_eth_miim/LatchByte1_d2_s0\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d2,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(3),
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d2_4,
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d2_5,
  I3 => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d2_9);
\u_triple_speed_mac/u_miim_block/u_eth_miim/LatchByte0_d2_s0\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte0_d2,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_WriteOp,
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d2_9,
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte0_d2_4);
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/CountEq0_s0\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_CountEq0,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(5),
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(6),
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(7),
  I3 => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_CountEq0_4);
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/MdcEn_n_Z_s\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_n_Z,
  I0 => NN,
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_CountEq0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n54_s0\: LUT3
generic map (
  INIT => X"5C"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_4,
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(6),
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_5);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n55_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n55,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n55_4,
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(5),
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_5);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n56_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n56,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n56_4,
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(4),
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_5);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n57_s0\: LUT4
generic map (
  INIT => X"40FF"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n57,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_WriteOp,
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(3),
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(4),
  I3 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n57_4);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n58_s0\: LUT4
generic map (
  INIT => X"EEF0"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n58,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n58_4,
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n58_5,
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(2),
  I3 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_5);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n59_s0\: LUT4
generic map (
  INIT => X"EEF0"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n59,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n59_4,
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n59_5,
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(1),
  I3 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_5);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n60_s0\: LUT3
generic map (
  INIT => X"AC"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n60,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n60_4,
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(0),
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_5);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n61_s0\: LUT3
generic map (
  INIT => X"5C"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n61,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n61_4,
  I1 => mdio_in,
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_5);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n206_s0\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n206,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/LatchByte\(0),
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_5,
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_n_Z,
  I3 => \u_triple_speed_mac/u_miim_block/u_eth_miim/LatchByte\(1));
\u_triple_speed_mac/u_miim_block/u_eth_miim/outctrl/n25_s0\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_n25,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d2_4,
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress);
\u_triple_speed_mac/u_miim_block/u_eth_miim/outctrl/n37_s0\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_n37,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(5),
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(6));
\u_triple_speed_mac/u_miim_block/u_eth_miim/outctrl/n38_s0\: LUT2
generic map (
  INIT => X"E"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_n38,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_ShiftedBit,
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_Mdo_2d);
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_3_s26\: LUT4
generic map (
  INIT => X"FF70"
)
port map (
  F => \u_triple_speed_mac/u_mac_tx_ctrl/n_state\(3),
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_3,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_3_50,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_3_45);
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_2_s27\: LUT4
generic map (
  INIT => X"B0BB"
)
port map (
  F => \u_triple_speed_mac/u_mac_tx_ctrl/n_state\(2),
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1026,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_2,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_2_45,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_1_s25\: LUT3
generic map (
  INIT => X"C5"
)
port map (
  F => \u_triple_speed_mac/u_mac_tx_ctrl/n_state\(1),
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_1,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_2_45,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(3));
\u_triple_speed_mac/u_mac_rx_ctrl/rx_fcs_fwd_ena_reg3_s2\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_fwd_ena_reg3_6,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/n27_s1\: LUT4
generic map (
  INIT => X"9669"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_n27,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(15),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(14),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(12),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(3));
\u_triple_speed_mac/u_mac_rx_ctrl/gmii_col_int_s3\: LUT2
generic map (
  INIT => X"B"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_gmii_col_int_8,
  I0 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_col_int,
  I1 => u_triple_speed_mac_u_mac_rx_if_block_u_mac_rx_if_mux_gmii_rx_dv_int_Z);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_er_err_reg_s3\: LUT3
generic map (
  INIT => X"4F"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_rx_er_err_reg_8,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_er_err_reg,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg\(0),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_47_s3\: LUT3
generic map (
  INIT => X"8F"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47_9,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47_10,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_15_s3\: LUT4
generic map (
  INIT => X"40FF"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_16,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_7_s3\: LUT4
generic map (
  INIT => X"80FF"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_16,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/type_reg_15_s3\: LUT3
generic map (
  INIT => X"8F"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_type_reg_15,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n1335_40,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47_9,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/op_reg_15_s3\: LUT3
generic map (
  INIT => X"8F"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_op_reg_15,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n1446_40,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47_9,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg_15_s3\: LUT4
generic map (
  INIT => X"B0FF"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_rx_pause_val_reg_15,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_pause_val_reg_15_9,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(4),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47_9,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg_30_s3\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_reg_30,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_ready_mask_s3\: LUT4
generic map (
  INIT => X"FFFE"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_ready_mask_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n769,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n780_7,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_ready_mask_9);
\u_triple_speed_mac/u_mac_tx_ctrl/late_col_s3\: LUT4
generic map (
  INIT => X"FF40"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_late_col_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_late_col_9,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_late_col_10,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n247);
\u_triple_speed_mac/u_mac_tx_ctrl/too_many_retransmit_s3\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_too_many_retransmit_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(4),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n775_10,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n247);
\u_triple_speed_mac/u_mac_tx_ctrl/retrans_flag_s3\: LUT4
generic map (
  INIT => X"FF40"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_retrans_flag_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_timeout_cnt\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_timeout_cnt\(2),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_timeout_cnt\(0),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1330);
\u_triple_speed_mac/u_mac_tx_ctrl/active_retrans_s3\: LUT2
generic map (
  INIT => X"B"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_active_retrans_8,
  I0 => tx_mac_valid,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_retrans_flag);
\u_triple_speed_mac/u_mac_tx_ctrl/gmii_tx_en_s3\: LUT4
generic map (
  INIT => X"E0FF"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_gmii_tx_en,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_start_reg1,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_ena_reg3);
\u_triple_speed_mac/u_miim_block/u_eth_miim/InProgress_s2\: LUT4
generic map (
  INIT => X"F800"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress_6,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress_7,
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte0_d2_4,
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_StartOp,
  I3 => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/WriteOp_s2\: LUT3
generic map (
  INIT => X"70"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_WriteOp_6,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_StartOp,
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress,
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress_6);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/ctl_d0_s4\: LUT4
generic map (
  INIT => X"FEFF"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d1_8,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis1000_reg2,
  I1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0_10,
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0_11,
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_gmii_tx_en_int);
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/n35_s2\: LUT4
generic map (
  INIT => X"CF20"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n35,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(7),
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(5),
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_CountEq0_4,
  I3 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(6));
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/n34_s2\: LUT4
generic map (
  INIT => X"EF00"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n34,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(6),
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(5),
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_CountEq0_4,
  I3 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(7));
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/n36_s2\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n36,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_CountEq0,
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(5),
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_CountEq0_4);
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/n38_s2\: LUT4
generic map (
  INIT => X"0B04"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n38,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(2),
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n38_8,
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_CountEq0,
  I3 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(3));
\u_triple_speed_mac/u_mac_rx_ctrl/n531_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n531,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n495_10,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n530_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n530,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n495_10,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(1));
\u_triple_speed_mac/u_mac_rx_ctrl/n529_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n529,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n495_10,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(2));
\u_triple_speed_mac/u_mac_rx_ctrl/n528_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n528,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n495_10,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(3));
\u_triple_speed_mac/u_mac_rx_ctrl/n527_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n527,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n495_10,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(4));
\u_triple_speed_mac/u_mac_rx_ctrl/n526_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n526,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n495_10,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(5));
\u_triple_speed_mac/u_mac_rx_ctrl/n525_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n525,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n495_10,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(6));
\u_triple_speed_mac/u_mac_rx_ctrl/n524_s3\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n524,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n495_10,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(7));
\u_triple_speed_mac/u_mac_tx_ctrl/n1554_s3\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1554,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_start_reg1,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_ena_reg3);
\u_triple_speed_mac/u_mac_rx_ctrl/n1509_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1509,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n1508_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1508,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(1));
\u_triple_speed_mac/u_mac_rx_ctrl/n1507_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1507,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(2));
\u_triple_speed_mac/u_mac_rx_ctrl/n1506_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1506,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(3));
\u_triple_speed_mac/u_mac_rx_ctrl/n1505_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1505,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(4));
\u_triple_speed_mac/u_mac_rx_ctrl/n1504_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1504,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(5));
\u_triple_speed_mac/u_mac_rx_ctrl/n1503_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1503,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(6));
\u_triple_speed_mac/u_mac_rx_ctrl/n1502_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1502,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(7));
\u_triple_speed_mac/u_mac_rx_ctrl/n1455_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1455,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n1454_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1454,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(1));
\u_triple_speed_mac/u_mac_rx_ctrl/n1453_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1453,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(2));
\u_triple_speed_mac/u_mac_rx_ctrl/n1452_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1452,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(3));
\u_triple_speed_mac/u_mac_rx_ctrl/n1451_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1451,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(4));
\u_triple_speed_mac/u_mac_rx_ctrl/n1450_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1450,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(5));
\u_triple_speed_mac/u_mac_rx_ctrl/n1449_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1449,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(6));
\u_triple_speed_mac/u_mac_rx_ctrl/n1448_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1448,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(7));
\u_triple_speed_mac/u_mac_rx_ctrl/n1344_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1344,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n1343_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1343,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(1));
\u_triple_speed_mac/u_mac_rx_ctrl/n1342_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1342,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(2));
\u_triple_speed_mac/u_mac_rx_ctrl/n1341_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1341,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(3));
\u_triple_speed_mac/u_mac_rx_ctrl/n1340_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1340,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(4));
\u_triple_speed_mac/u_mac_rx_ctrl/n1339_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1339,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(5));
\u_triple_speed_mac/u_mac_rx_ctrl/n1338_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1338,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(6));
\u_triple_speed_mac/u_mac_rx_ctrl/n1337_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1337,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(7));
\u_triple_speed_mac/u_mac_rx_ctrl/n881_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n881,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n880_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n880,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(1));
\u_triple_speed_mac/u_mac_rx_ctrl/n879_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n879,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(2));
\u_triple_speed_mac/u_mac_rx_ctrl/n878_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n878,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(3));
\u_triple_speed_mac/u_mac_rx_ctrl/n877_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n877,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(4));
\u_triple_speed_mac/u_mac_rx_ctrl/n876_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n876,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(5));
\u_triple_speed_mac/u_mac_rx_ctrl/n875_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n875,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(6));
\u_triple_speed_mac/u_mac_rx_ctrl/n874_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n874,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(7));
\u_triple_speed_mac/u_mac_rx_ctrl/n873_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n873,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(8));
\u_triple_speed_mac/u_mac_rx_ctrl/n872_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n872,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(9));
\u_triple_speed_mac/u_mac_rx_ctrl/n871_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n871,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(10));
\u_triple_speed_mac/u_mac_rx_ctrl/n870_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n870,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(11));
\u_triple_speed_mac/u_mac_rx_ctrl/n869_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n869,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(12));
\u_triple_speed_mac/u_mac_rx_ctrl/n868_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n868,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(13));
\u_triple_speed_mac/u_mac_rx_ctrl/n867_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n867,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(14));
\u_triple_speed_mac/u_mac_rx_ctrl/n866_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n866,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(15));
\u_triple_speed_mac/u_mac_rx_ctrl/n865_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n865,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(16));
\u_triple_speed_mac/u_mac_rx_ctrl/n864_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n864,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(17));
\u_triple_speed_mac/u_mac_rx_ctrl/n863_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n863,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(18));
\u_triple_speed_mac/u_mac_rx_ctrl/n862_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n862,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(19));
\u_triple_speed_mac/u_mac_rx_ctrl/n861_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n861,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(20));
\u_triple_speed_mac/u_mac_rx_ctrl/n860_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n860,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(21));
\u_triple_speed_mac/u_mac_rx_ctrl/n859_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n859,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(22));
\u_triple_speed_mac/u_mac_rx_ctrl/n858_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n858,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(23));
\u_triple_speed_mac/u_mac_rx_ctrl/n857_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n857,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(24));
\u_triple_speed_mac/u_mac_rx_ctrl/n856_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n856,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(25));
\u_triple_speed_mac/u_mac_rx_ctrl/n855_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n855,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(26));
\u_triple_speed_mac/u_mac_rx_ctrl/n854_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n854,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(27));
\u_triple_speed_mac/u_mac_rx_ctrl/n853_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n853,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(28));
\u_triple_speed_mac/u_mac_rx_ctrl/n852_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n852,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(29));
\u_triple_speed_mac/u_mac_rx_ctrl/n851_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n851,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(30));
\u_triple_speed_mac/u_mac_rx_ctrl/n850_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n850,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(31));
\u_triple_speed_mac/u_mac_rx_ctrl/n849_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n849,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(32));
\u_triple_speed_mac/u_mac_rx_ctrl/n848_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n848,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(33));
\u_triple_speed_mac/u_mac_rx_ctrl/n847_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n847,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(34));
\u_triple_speed_mac/u_mac_rx_ctrl/n846_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n846,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(35));
\u_triple_speed_mac/u_mac_rx_ctrl/n845_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n845,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(36));
\u_triple_speed_mac/u_mac_rx_ctrl/n844_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n844,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(37));
\u_triple_speed_mac/u_mac_rx_ctrl/n843_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n843,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(38));
\u_triple_speed_mac/u_mac_rx_ctrl/n842_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n842,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(39));
\u_triple_speed_mac/u_mac_rx_ctrl/n616_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n616,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(2),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n617,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(3),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n613_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n613,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(5),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n614,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(6),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n612_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n612,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n614,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n612_7,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(7),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n611_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n611,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n614,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n611_9,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(8),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n609_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n609,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(9),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n610_12,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(10),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n608_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n608,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n610_12,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n608_7,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(11),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n607_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n607,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n610_12,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n607_9,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(12),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n605_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n605,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(13),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n606_12,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(14),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n604_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n604,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n606_12,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n604_7,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(15),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n186_s5\: LUT4
generic map (
  INIT => X"F100"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n186,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis1000_reg2,
  I1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n186_11,
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_gmii_tx_er_int,
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_gmii_tx_en_int);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n185_s5\: LUT4
generic map (
  INIT => X"BF00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_11,
  I1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_12,
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_13,
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_gmii_tx_en_int);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n377_s1\: LUT4
generic map (
  INIT => X"6000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n377,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/cnt\(1),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_cnt_1);
\u_triple_speed_mac/u_mac_tx_ctrl/n2123_s2\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2123,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n2119,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n2123_10,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(40));
\u_triple_speed_mac/u_mac_tx_ctrl/n2119_s1\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2119,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_tx_unicast_frm_latch_9,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n2119_7,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n2119_8,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n2119_9);
\u_triple_speed_mac/u_mac_tx_ctrl/n2121_s3\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2121,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(40),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n2123_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1911_s2\: LUT4
generic map (
  INIT => X"0708"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1911,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/type_ptr\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/type_ptr\(3),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/type_ptr\(4));
\u_triple_speed_mac/u_mac_tx_ctrl/n1819_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1819,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1820,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(3),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15);
\u_triple_speed_mac/u_mac_tx_ctrl/n1814_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1814,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(7),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1814_9,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(8),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15);
\u_triple_speed_mac/u_mac_tx_ctrl/n1638_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1638,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(0),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1269);
\u_triple_speed_mac/u_mac_tx_ctrl/n1637_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1637,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(1),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1269);
\u_triple_speed_mac/u_mac_tx_ctrl/n1636_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1636,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(2),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1269);
\u_triple_speed_mac/u_mac_tx_ctrl/n1635_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1635,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(3),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1269);
\u_triple_speed_mac/u_mac_tx_ctrl/n1517_s2\: LUT4
generic map (
  INIT => X"B000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1517,
  I0 => tx_mac_error,
  I1 => tx_mac_valid,
  I2 => NN_2,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n769_4);
\u_triple_speed_mac/u_mac_tx_ctrl/n1518_s2\: LUT3
generic map (
  INIT => X"F1"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1518,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_latch,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1518_8,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n780);
\u_triple_speed_mac/u_mac_tx_ctrl/n1286_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1286,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(2),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1269);
\u_triple_speed_mac/u_mac_tx_ctrl/n1284_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1284,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(3),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1672_4,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(4),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1269);
\u_triple_speed_mac/u_mac_tx_ctrl/n978_s3\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n978,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/preamble_cnt\(0),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n862);
\u_triple_speed_mac/u_mac_tx_ctrl/n977_s2\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n977,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/preamble_cnt\(0),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/preamble_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n976_s2\: LUT4
generic map (
  INIT => X"0708"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n976,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/preamble_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/preamble_cnt\(1),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/preamble_cnt\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/n958_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n958,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt\(0),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n775_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n957_s1\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n957,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt\(1),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n775_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n913_s2\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n913,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n911_s2\: LUT4
generic map (
  INIT => X"0708"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n911,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1820,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n910_s2\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n910,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(4),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1818);
\u_triple_speed_mac/u_mac_tx_ctrl/n908_s2\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n908,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(6),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1816);
\u_triple_speed_mac/u_mac_tx_ctrl/n906_s2\: LUT4
generic map (
  INIT => X"0708"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n906,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(7),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1814_9,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(8));
\u_triple_speed_mac/u_mac_tx_ctrl/n905_s2\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n905,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(9),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1813);
\u_triple_speed_mac/u_mac_tx_ctrl/n903_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n903,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1811);
\u_triple_speed_mac/u_mac_tx_ctrl/n305_s2\: LUT4
generic map (
  INIT => X"00F8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n305,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n305_8,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(1),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n305_9,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_pause_frm_reg_7);
\u_triple_speed_mac/u_mac_tx_ctrl/n304_s2\: LUT4
generic map (
  INIT => X"00F8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n304,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n305_8,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(2),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n304_8,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_pause_frm_reg_7);
\u_triple_speed_mac/u_mac_tx_ctrl/n303_s2\: LUT4
generic map (
  INIT => X"00F8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n303,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n305_8,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(3),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n303_8,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_pause_frm_reg_7);
\u_triple_speed_mac/u_mac_tx_ctrl/n302_s2\: LUT4
generic map (
  INIT => X"00F8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n302,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n305_8,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(4),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n302_8,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_pause_frm_reg_7);
\u_triple_speed_mac/u_mac_tx_ctrl/n301_s2\: LUT4
generic map (
  INIT => X"00F8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n301,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n305_8,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(5),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n301_8,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_pause_frm_reg_7);
\u_triple_speed_mac/u_mac_tx_ctrl/n300_s2\: LUT4
generic map (
  INIT => X"00F8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n300,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n305_8,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(6),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n300_8,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_pause_frm_reg_7);
\u_triple_speed_mac/u_mac_tx_ctrl/n299_s2\: LUT4
generic map (
  INIT => X"00F8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n299,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n305_8,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(7),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n299_8,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_pause_frm_reg_7);
\u_triple_speed_mac/u_mac_rx_ctrl/n62_s1\: LUT4
generic map (
  INIT => X"2C00"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n62,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n62_7,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state\(1),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state\(0),
  I3 => u_triple_speed_mac_u_mac_rx_if_block_u_mac_rx_if_mux_gmii_rx_dv_int_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/n118_s1\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_n118,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart_q2,
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart_q1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1130_s1\: LUT3
generic map (
  INIT => X"90"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1130,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(1),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1128_s1\: LUT4
generic map (
  INIT => X"B400"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1128,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(2),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1129,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(3),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1127_s1\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1127,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(4),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1127_7,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1126_s1\: LUT4
generic map (
  INIT => X"B400"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1126,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(4),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1127_7,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(5),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_10);
\u_triple_speed_mac/u_miim_block/u_eth_miim/n149_s1\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_n149,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(0),
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(1),
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress);
\u_triple_speed_mac/u_miim_block/u_eth_miim/n148_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_n148,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(0),
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(1),
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(2),
  I3 => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress);
\u_triple_speed_mac/u_miim_block/u_eth_miim/n147_s1\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_n147,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(3),
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d2_5,
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress);
\u_triple_speed_mac/u_miim_block/u_eth_miim/n146_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_n146,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(3),
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d2_5,
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(4),
  I3 => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress);
\u_triple_speed_mac/u_miim_block/u_eth_miim/n144_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_n144,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(5),
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte0_d2_4,
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(6),
  I3 => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress);
\u_triple_speed_mac/u_mac_tx_ctrl/n68_s2\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n68,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(1),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n69);
\u_triple_speed_mac/u_mac_tx_ctrl/n66_s2\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n66,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(2),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n67,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(3),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n69);
\u_triple_speed_mac/u_mac_tx_ctrl/n65_s2\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n65,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(4),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n65_10,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n69);
\u_triple_speed_mac/u_mac_tx_ctrl/n64_s2\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n64,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(4),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n65_10,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(5),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n69);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n140_s1\: LUT4
generic map (
  INIT => X"AC00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n140,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(4),
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n140_7,
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_gmii_tx_en_int);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n139_s1\: LUT4
generic map (
  INIT => X"AC00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n139,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(5),
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n140_7,
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_gmii_tx_en_int);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n138_s1\: LUT4
generic map (
  INIT => X"AC00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n138,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(6),
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n140_7,
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_gmii_tx_en_int);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n137_s1\: LUT4
generic map (
  INIT => X"AC00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n137,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(7),
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n140_7,
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_gmii_tx_en_int);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n136_s1\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n136,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(4),
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n136_7,
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_gmii_tx_en_int);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n135_s1\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n135,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(5),
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n136_7,
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_gmii_tx_en_int);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n134_s1\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n134,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(6),
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n136_7,
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_gmii_tx_en_int);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n133_s1\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n133,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/gmii_txd_int\(7),
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n136_7,
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_gmii_tx_en_int);
\u_triple_speed_mac/u_miim_block/u_eth_miim/n145_s1\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_n145,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(5),
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte0_d2_4,
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress);
\u_triple_speed_mac/u_mac_tx_ctrl/n1526_s2\: LUT4
generic map (
  INIT => X"4F44"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1526,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1526_8,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(0),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1526_9,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/n1525_s2\: LUT4
generic map (
  INIT => X"77F0"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1525,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1525_8,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1525_9,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(1),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/n1524_s2\: LUT4
generic map (
  INIT => X"4F44"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1524,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1526_8,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(2),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1524_8,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/n1523_s2\: LUT4
generic map (
  INIT => X"BF30"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1523,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1523_12,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1523_9,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1523_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1522_s2\: LUT4
generic map (
  INIT => X"77F0"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1522,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1522_8,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1522_9,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(4),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/n1521_s2\: LUT4
generic map (
  INIT => X"77F0"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1521,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1521_8,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1521_9,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(5),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/n1520_s2\: LUT3
generic map (
  INIT => X"F4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1520,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1526_8,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(6),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1520_8);
\u_triple_speed_mac/u_mac_tx_ctrl/n1519_s2\: LUT4
generic map (
  INIT => X"BBF0"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1519,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1519_8,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1519_9,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(7),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/n1347_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1347,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_timeout_cnt\(0),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_retrans_flag);
\u_triple_speed_mac/u_mac_tx_ctrl/n1346_s1\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1346,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_timeout_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_timeout_cnt\(1),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_retrans_flag);
\u_triple_speed_mac/u_mac_tx_ctrl/n1345_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1345,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_timeout_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_timeout_cnt\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_timeout_cnt\(2),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_retrans_flag);
\u_triple_speed_mac/u_mac_tx_ctrl/n810_s1\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n810,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_ready_mask_9,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n810_7,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_ena_reg,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_ready_mask);
\u_triple_speed_mac/u_mac_tx_ctrl/n626_s2\: LUT4
generic map (
  INIT => X"F400"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n626,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n626_8,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n626_28,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n626_10,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n862);
\u_triple_speed_mac/u_mac_tx_ctrl/n625_s1\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n625,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(0),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n625_7);
\u_triple_speed_mac/u_mac_tx_ctrl/n624_s1\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n624,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(0),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n625_7);
\u_triple_speed_mac/u_mac_tx_ctrl/n623_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n623,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(0),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(2),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n625_7);
\u_triple_speed_mac/u_mac_tx_ctrl/n622_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n622,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(0),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n622_7,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(3),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n862);
\u_triple_speed_mac/u_mac_tx_ctrl/n621_s1\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n621,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(4),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n621_9,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n862);
\u_triple_speed_mac/u_mac_tx_ctrl/n620_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n620,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(4),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n621_9,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(5),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n862);
\u_triple_speed_mac/u_mac_tx_ctrl/n619_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n619,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n621_9,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n619_7,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(6),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n862);
\u_triple_speed_mac/u_mac_tx_ctrl/n618_s1\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n618,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n621_9,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n618_9,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(7),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n862);
\u_triple_speed_mac/u_mac_tx_ctrl/n559_s2\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n559,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(0),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n559_12);
\u_triple_speed_mac/u_mac_tx_ctrl/n558_s2\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n558,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(1),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n559_12);
\u_triple_speed_mac/u_mac_tx_ctrl/n528_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n528,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_gmii_crs_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n527_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n527,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_reg2);
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s1\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n469,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_7,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_8,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_9);
\u_triple_speed_mac/u_mac_rx_ctrl/n707_s1\: LUT4
generic map (
  INIT => X"F100"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n707,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_jumbo_ena_reg3,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n707_7,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n707_12,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_n1590);
\u_triple_speed_mac/u_mac_rx_ctrl/n358_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n358,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(10));
\u_triple_speed_mac/u_mac_rx_ctrl/n357_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n357,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(11));
\u_triple_speed_mac/u_mac_rx_ctrl/n356_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n356,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(12));
\u_triple_speed_mac/u_mac_rx_ctrl/n355_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n355,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(13));
\u_triple_speed_mac/u_mac_rx_ctrl/n354_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n354,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(14));
\u_triple_speed_mac/u_mac_rx_ctrl/n353_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n353,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(15));
\u_triple_speed_mac/u_mac_rx_ctrl/n352_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n352,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n351_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n351,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state\(1));
\u_triple_speed_mac/u_mac_rx_ctrl/n177_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n177,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg\(5));
\u_triple_speed_mac/u_mac_rx_ctrl/n176_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n176,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg\(6));
\u_triple_speed_mac/u_mac_rx_ctrl/n175_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n175,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg\(7));
\u_triple_speed_mac/u_mac_rx_ctrl/n172_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n172,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg\(5));
\u_triple_speed_mac/u_mac_rx_ctrl/n171_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n171,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg\(6));
\u_triple_speed_mac/u_mac_rx_ctrl/n170_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n170,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg\(7));
\u_triple_speed_mac/u_mac_rx_ctrl/n167_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n167,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg\(5));
\u_triple_speed_mac/u_mac_rx_ctrl/n166_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n166,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg\(6));
\u_triple_speed_mac/u_mac_rx_ctrl/n165_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n165,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_er_reg\(7));
\u_triple_speed_mac/u_mac_rx_ctrl/n162_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n162,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(5));
\u_triple_speed_mac/u_mac_rx_ctrl/n161_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n161,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(6));
\u_triple_speed_mac/u_mac_rx_ctrl/n160_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n160,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(7));
\u_triple_speed_mac/u_mac_rx_ctrl/n157_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n157,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(5));
\u_triple_speed_mac/u_mac_rx_ctrl/n156_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n156,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(6));
\u_triple_speed_mac/u_mac_rx_ctrl/n155_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n155,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(7));
\u_triple_speed_mac/u_mac_rx_ctrl/n145_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n145,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(40));
\u_triple_speed_mac/u_mac_rx_ctrl/n144_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n144,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(41));
\u_triple_speed_mac/u_mac_rx_ctrl/n143_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n143,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(42));
\u_triple_speed_mac/u_mac_rx_ctrl/n142_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n142,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(43));
\u_triple_speed_mac/u_mac_rx_ctrl/n141_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n141,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(44));
\u_triple_speed_mac/u_mac_rx_ctrl/n140_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n140,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(45));
\u_triple_speed_mac/u_mac_rx_ctrl/n139_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n139,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(46));
\u_triple_speed_mac/u_mac_rx_ctrl/n138_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n138,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(47));
\u_triple_speed_mac/u_mac_rx_ctrl/n137_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n137,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(48));
\u_triple_speed_mac/u_mac_rx_ctrl/n136_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n136,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(49));
\u_triple_speed_mac/u_mac_rx_ctrl/n135_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n135,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(50));
\u_triple_speed_mac/u_mac_rx_ctrl/n134_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n134,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(51));
\u_triple_speed_mac/u_mac_rx_ctrl/n133_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n133,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(52));
\u_triple_speed_mac/u_mac_rx_ctrl/n132_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n132,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(53));
\u_triple_speed_mac/u_mac_rx_ctrl/n131_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n131,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(54));
\u_triple_speed_mac/u_mac_rx_ctrl/n130_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n130,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(55));
\u_triple_speed_mac/u_mac_rx_ctrl/n129_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n129,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(56));
\u_triple_speed_mac/u_mac_rx_ctrl/n128_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n128,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(57));
\u_triple_speed_mac/u_mac_rx_ctrl/n127_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n127,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(58));
\u_triple_speed_mac/u_mac_rx_ctrl/n126_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n126,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(59));
\u_triple_speed_mac/u_mac_rx_ctrl/n125_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n125,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(60));
\u_triple_speed_mac/u_mac_rx_ctrl/n124_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n124,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(61));
\u_triple_speed_mac/u_mac_rx_ctrl/n123_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n123,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(62));
\u_triple_speed_mac/u_mac_rx_ctrl/n122_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n122,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(63));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n92_s2\: LUT4
generic map (
  INIT => X"00F4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92_8,
  I1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92_15,
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92_10,
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis1000_reg2);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n43_s3\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n43,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(0),
  I1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_clk_ena_int);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n42_s2\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n42,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_clk_ena_int,
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(0),
  I2 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(1));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n41_s2\: LUT4
generic map (
  INIT => X"0708"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n41,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(1),
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_clk_ena_int,
  I3 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(2));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n40_s2\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n40,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_clk_ena_int,
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(3),
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n40_8);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n39_s2\: LUT4
generic map (
  INIT => X"0708"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n39,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(3),
  I1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n40_8,
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_clk_ena_int,
  I3 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(4));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n38_s2\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n38,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_clk_ena_int,
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(5),
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n38_10);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n37_s2\: LUT4
generic map (
  INIT => X"0708"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n37,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(5),
  I1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n38_10,
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_clk_ena_int,
  I3 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(6));
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n46_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n46,
  I0 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2,
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_iddr\(7));
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n47_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n47,
  I0 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2,
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_iddr\(6));
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n48_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n48,
  I0 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2,
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_iddr\(5));
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n49_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n49,
  I0 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2,
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_int_iddr\(4));
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n171_s1\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n171,
  I0 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2,
  I1 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_align_reg,
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_dv_int);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n189_s1\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n189,
  I0 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_dv_int,
  I1 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_dv_reg,
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_align_reg);
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/n37_s1\: LUT4
generic map (
  INIT => X"EF10"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n37,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(2),
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(3),
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n38_8,
  I3 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(4));
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/n40_s1\: LUT2
generic map (
  INIT => X"9"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n40,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(0),
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n259_s2\: LUT3
generic map (
  INIT => X"BE"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n259,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(23),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n259_8);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n286_s2\: LUT4
generic map (
  INIT => X"96FF"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n286,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n287,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n286_8,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290_9);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n282_s2\: LUT3
generic map (
  INIT => X"BE"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n282,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(0),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n282_8);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n281_s2\: LUT4
generic map (
  INIT => X"FBF4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n281,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n281_8,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n280_s2\: LUT3
generic map (
  INIT => X"BE"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n280,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(2),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n280_8);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n279_s2\: LUT3
generic map (
  INIT => X"BE"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n279,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(3),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n282_8);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n278_s2\: LUT3
generic map (
  INIT => X"BE"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n278,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(4),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n278_8);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n277_s2\: LUT4
generic map (
  INIT => X"FBF4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277_8,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(5));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n276_s2\: LUT2
generic map (
  INIT => X"B"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n276,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n276_8);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n275_s2\: LUT3
generic map (
  INIT => X"BE"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n275,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(7),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n275_8);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n274_s2\: LUT3
generic map (
  INIT => X"BE"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n274,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(8),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n274_8);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n273_s2\: LUT2
generic map (
  INIT => X"B"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n273,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n273_8);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n272_s2\: LUT4
generic map (
  INIT => X"FBF4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n272,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n272_12,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(10));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n271_s2\: LUT4
generic map (
  INIT => X"FBF4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n271,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n271_8,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(11));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n270_s2\: LUT4
generic map (
  INIT => X"FEF1"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n270,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n286_8,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(12));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n269_s2\: LUT3
generic map (
  INIT => X"BE"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n269,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(13),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n259_8);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n268_s2\: LUT4
generic map (
  INIT => X"FEF1"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n268,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n268_8,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(14));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n267_s2\: LUT2
generic map (
  INIT => X"B"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n267,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n267_8);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n266_s2\: LUT4
generic map (
  INIT => X"FBF4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n266,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n288_12,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(16));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n265_s2\: LUT4
generic map (
  INIT => X"FBF4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n265,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n287,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(17));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n264_s2\: LUT2
generic map (
  INIT => X"B"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n264,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n264_8);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n263_s2\: LUT3
generic map (
  INIT => X"BE"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n263,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(19),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n263_8);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n262_s2\: LUT2
generic map (
  INIT => X"B"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n262,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n262_8);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n261_s2\: LUT4
generic map (
  INIT => X"FBF4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n261,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n261_8,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(21));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n260_s4\: LUT4
generic map (
  INIT => X"FBF4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n260,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n260_10,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(22));
\u_triple_speed_mac/u_mac_tx_ctrl/n306_s1\: LUT4
generic map (
  INIT => X"FFF8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n306,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n305_8,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(0),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_pause_frm_reg_7,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n306_7);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n227_s1\: LUT4
generic map (
  INIT => X"EBBE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n227,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(2),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(29),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(23));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n258_s1\: LUT2
generic map (
  INIT => X"E"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n258,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n258_7);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n257_s1\: LUT3
generic map (
  INIT => X"BE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n257,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n258_7,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n257_7);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n256_s1\: LUT3
generic map (
  INIT => X"BE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n256,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n258_7,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n256_7);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n255_s1\: LUT3
generic map (
  INIT => X"EB"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n255,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n257_7,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n255_7);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n254_s1\: LUT3
generic map (
  INIT => X"EB"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n254,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n258_7,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n254_7);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n253_s1\: LUT4
generic map (
  INIT => X"BEEB"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n253,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n253_11,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n253_8,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n253_9);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n252_s1\: LUT3
generic map (
  INIT => X"BE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n252,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n252_10,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n252_8);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n251_s1\: LUT3
generic map (
  INIT => X"EB"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n251,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n251_7,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n251_8);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n250_s1\: LUT4
generic map (
  INIT => X"BEEB"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n250,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(28),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(0),
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n250_7);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n249_s1\: LUT4
generic map (
  INIT => X"EBBE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n249,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(5),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n249_12,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n249_10);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n248_s1\: LUT4
generic map (
  INIT => X"EBBE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n248,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(2),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n248_10,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n248_8);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n247_s1\: LUT4
generic map (
  INIT => X"BEEB"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n247,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(28),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(3),
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n250_7);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n246_s1\: LUT4
generic map (
  INIT => X"BEEB"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n246,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(1),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(29),
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n246_7);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n245_s1\: LUT4
generic map (
  INIT => X"EBBE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n245,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(4),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n252_10,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n245_7);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n244_s1\: LUT4
generic map (
  INIT => X"BEEB"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n244,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(6),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n254_7,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n244_7);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n243_s1\: LUT4
generic map (
  INIT => X"BEEB"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n243,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n243_7,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n243_8,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n243_9);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n242_s1\: LUT4
generic map (
  INIT => X"EBBE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n242,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(7),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n242_7,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n242_8);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n241_s1\: LUT4
generic map (
  INIT => X"BEEB"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n241,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n241_7,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n241_8,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n241_9);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n240_s1\: LUT4
generic map (
  INIT => X"EBBE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n240,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(10),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n240_7,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n244_7);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n239_s1\: LUT3
generic map (
  INIT => X"BE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n239,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n239_7);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n238_s1\: LUT4
generic map (
  INIT => X"EBBE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n238,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(3),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(28),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(12));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n237_s1\: LUT4
generic map (
  INIT => X"EBBE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n237,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(2),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(29),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(13));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n235_s1\: LUT4
generic map (
  INIT => X"EBBE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n235,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(15),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n258_7,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n235_7);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n234_s1\: LUT4
generic map (
  INIT => X"EBBE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n234,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(16),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n257_7,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n240_7);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n233_s1\: LUT3
generic map (
  INIT => X"EB"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n233,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(17),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n255_7);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n232_s1\: LUT4
generic map (
  INIT => X"EBBE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n232,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(1),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n232_7,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n232_8);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n231_s1\: LUT4
generic map (
  INIT => X"EBBE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n231,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(19),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n231_7,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n231_10);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n230_s1\: LUT4
generic map (
  INIT => X"EBBE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n230,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(5),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n241_7,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n230_7);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n229_s1\: LUT4
generic map (
  INIT => X"EBBE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n229,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(21),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n229_7,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n244_7);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n228_s1\: LUT3
generic map (
  INIT => X"BE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n228,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n228_7);
\u_triple_speed_mac/u_mac_tx_ctrl/n70_s1\: LUT2
generic map (
  INIT => X"E"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n70,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis1000_reg2,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n70_7);
\u_triple_speed_mac/u_mac_tx_ctrl/n556_s1\: LUT2
generic map (
  INIT => X"B"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n556,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(3),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n559_12);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n91_s1\: LUT4
generic map (
  INIT => X"FFF4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n91,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n91_7,
  I1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92_15,
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92_10,
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis1000_reg2);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n135_s1\: LUT4
generic map (
  INIT => X"FF40"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n135,
  I0 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_clk_ena_reg,
  I1 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_dv_reg,
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_dv_int,
  I3 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_0_s24\: LUT4
generic map (
  INIT => X"050C"
)
port map (
  F => \u_triple_speed_mac/u_mac_tx_ctrl/n_state\(0),
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_0,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(3),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_42);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n54_s1\: LUT4
generic map (
  INIT => X"007F"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54_4,
  I0 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54_5,
  I1 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54_6,
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54_7,
  I3 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_dv_int);
\u_triple_speed_mac/u_mac_rx_ctrl/n146_s1\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n146_4,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(6),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(7));
\u_triple_speed_mac/u_mac_rx_ctrl/n469_s1\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n469,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_align_err_reg,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_rx_er_err_reg,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_col_err_reg,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z);
\u_triple_speed_mac/u_mac_rx_ctrl/n495_s1\: LUT4
generic map (
  INIT => X"007F"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n495_4,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_fwd_ena_reg3,
  I3 => u_triple_speed_mac_u_mac_rx_if_block_u_mac_rx_if_mux_gmii_rx_dv_int_Z);
\u_triple_speed_mac/u_mac_rx_ctrl/n495_s2\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n495_5,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_fwd_ena_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n495_8,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_cnt_crc_1);
\u_triple_speed_mac/u_mac_rx_ctrl/n495_s4\: LUT3
generic map (
  INIT => X"70"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n495_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_mac_rx_if_mux_gmii_rx_dv_int_Z);
\u_triple_speed_mac/u_mac_rx_ctrl/n562_s3\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n562_6,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(3),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(5),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(6),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(7));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_err_Z_s0\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_3,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_5,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_6,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_7,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_8);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_err_Z_s1\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_4,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_9,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_10,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_11,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_12);
\u_triple_speed_mac/u_mac_tx_ctrl/n769_s1\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n769_4,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(3),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n775_s2\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n775,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n780_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n780,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt\(1),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n775_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1026_s2\: LUT3
generic map (
  INIT => X"70"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1026,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_6,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1118_5,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_7);
\u_triple_speed_mac/u_mac_tx_ctrl/n1116_s1\: LUT4
generic map (
  INIT => X"004F"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1116_4,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(2),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1116_6,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(3),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(4));
\u_triple_speed_mac/u_mac_tx_ctrl/n1116_s2\: LUT4
generic map (
  INIT => X"EF10"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1116_5,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(13),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(14),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1118_5,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(15));
\u_triple_speed_mac/u_mac_tx_ctrl/n1117_s1\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1117_4,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(4));
\u_triple_speed_mac/u_mac_tx_ctrl/n1117_s2\: LUT3
generic map (
  INIT => X"B4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1117_5,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(13),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1118_5,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(14));
\u_triple_speed_mac/u_mac_tx_ctrl/n1118_s1\: LUT4
generic map (
  INIT => X"8F00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1118_4,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(2),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1118_6,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1117_4,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(7));
\u_triple_speed_mac/u_mac_tx_ctrl/n1118_s2\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1118_5,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(8),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1123_5,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1118_7);
\u_triple_speed_mac/u_mac_tx_ctrl/n1119_s1\: LUT4
generic map (
  INIT => X"8F00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1119_4,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(1),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1117_4,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(6));
\u_triple_speed_mac/u_mac_tx_ctrl/n1119_s2\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1119_5,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(9),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(10),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(11),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1122_5);
\u_triple_speed_mac/u_mac_tx_ctrl/n1120_s2\: LUT4
generic map (
  INIT => X"EF10"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1120_5,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(9),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(10),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1122_5,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(11));
\u_triple_speed_mac/u_mac_tx_ctrl/n1122_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1122_5,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(8),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1123_5);
\u_triple_speed_mac/u_mac_tx_ctrl/n1123_s1\: LUT3
generic map (
  INIT => X"D0"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1123_4,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1121_9,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/n1123_s2\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1123_5,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(6),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(7),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1127_7,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1123_6);
\u_triple_speed_mac/u_mac_tx_ctrl/n1124_s2\: LUT4
generic map (
  INIT => X"BF40"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1124_5,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(6),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1127_7,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1123_6,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(7));
\u_triple_speed_mac/u_mac_tx_ctrl/n1307_s2\: LUT3
generic map (
  INIT => X"01"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1307_5,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_latch,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/n_state\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n1672_s1\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1672_4,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/n1956_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1956,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/n1906_s1\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1906_4,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1906_7,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1906_8);
\u_triple_speed_mac/u_mac_tx_ctrl/n1906_s2\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1906_5,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(5),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(6),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1906_9,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1906_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1906_s3\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1906_6,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(3),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1906_16,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1906_12);
\u_triple_speed_mac/u_mac_tx_ctrl/n1938_s1\: LUT4
generic map (
  INIT => X"9000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1938_4,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/type_ptr\(2),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1906_4,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1938_6);
\u_triple_speed_mac/u_mac_tx_ctrl/n1938_s2\: LUT4
generic map (
  INIT => X"9000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1938_5,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(4),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/type_ptr\(4),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1938_7,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1938_8);
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_0_s1\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_0,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(12),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_1_s1\: LUT3
generic map (
  INIT => X"96"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_1,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(5),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(6),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(9));
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_2_s1\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_2,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(7),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(10),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(14),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_3_s1\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_3,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(8),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(7),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(11),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(15));
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_4_s1\: LUT3
generic map (
  INIT => X"96"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_4,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(4),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_5_s1\: LUT3
generic map (
  INIT => X"96"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_5,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(5),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_6_s1\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_6,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(7));
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_6_s2\: LUT3
generic map (
  INIT => X"96"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_6_5,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(6),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(11),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_7_s1\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_7,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(12),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(3),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(7));
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_8_s1\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(8),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(9),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(1),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_8_s2\: LUT4
generic map (
  INIT => X"9669"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_8_5,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(4),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(5),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(13),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(8));
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_9_s1\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(2),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(3),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(9));
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_10_s1\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(6),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(7),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(2),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_10_s2\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_10_5,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(10),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(11),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(15),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_o\(10));
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_14_s1\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_14,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(10),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(14),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(2),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_15_s1\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_lfsr_z_15,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(7),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(11),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/z_reg\(15),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(3));
\u_triple_speed_mac/u_miim_block/u_eth_miim/n108_s1\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_n108_4,
  I0 => miim_wren,
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_RStatStart,
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_EndBusy,
  I3 => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress);
\u_triple_speed_mac/u_miim_block/u_eth_miim/n108_s2\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_n108_5,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlData_q1,
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart,
  I2 => miim_rden,
  I3 => u_triple_speed_mac_u_miim_block_u_eth_miim_RStat_q1);
\u_triple_speed_mac/u_miim_block/u_eth_miim/n108_s3\: LUT3
generic map (
  INIT => X"01"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_n108_6,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress_q3,
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlData_q2,
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_RStat_q2);
\u_triple_speed_mac/u_miim_block/u_eth_miim/LatchByte1_d2_s1\: LUT4
generic map (
  INIT => X"00F4"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d2_4,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d2_7,
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(5),
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(6),
  I3 => u_triple_speed_mac_u_miim_block_u_eth_miim_WriteOp);
\u_triple_speed_mac/u_miim_block/u_eth_miim/LatchByte1_d2_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d2_5,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(0),
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(1),
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(2));
\u_triple_speed_mac/u_miim_block/u_eth_miim/LatchByte0_d2_s1\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte0_d2_4,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(3),
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(4),
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d2_5);
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/CountEq0_s1\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_CountEq0_4,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(2),
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(3),
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(4),
  I3 => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n38_8);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n54_s1\: LUT4
generic map (
  INIT => X"0F77"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_4,
  I0 => miim_phyad(0),
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(3),
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_6,
  I3 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(4));
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n54_s2\: LUT3
generic map (
  INIT => X"B0"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_5,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_WriteOp,
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(4),
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_7);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n55_s1\: LUT4
generic map (
  INIT => X"F0BB"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n55_4,
  I0 => miim_regad(4),
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(3),
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n55_5,
  I3 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(4));
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n56_s1\: LUT4
generic map (
  INIT => X"0FEE"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n56_4,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(4),
  I1 => miim_regad(3),
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_WriteOp,
  I3 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n56_5);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n57_s1\: LUT4
generic map (
  INIT => X"0503"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n57_4,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n57_5,
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/ShiftReg\(3),
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n57_6,
  I3 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_7);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n58_s1\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n58_4,
  I0 => miim_wrdata(11),
  I1 => miim_wrdata(3),
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(3),
  I3 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(4));
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n58_s2\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n58_5,
  I0 => miim_phyad(4),
  I1 => miim_regad(1),
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(4),
  I3 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(3));
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n59_s1\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n59_4,
  I0 => miim_wrdata(10),
  I1 => miim_wrdata(2),
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(3),
  I3 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(4));
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n59_s2\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n59_5,
  I0 => miim_phyad(3),
  I1 => miim_regad(0),
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(4),
  I3 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(3));
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n60_s1\: LUT4
generic map (
  INIT => X"0FEE"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n60_4,
  I0 => miim_phyad(2),
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(3),
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n60_5,
  I3 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(4));
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n61_s1\: LUT3
generic map (
  INIT => X"D3"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n61_4,
  I0 => miim_phyad(1),
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(4),
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n61_5);
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_3_s27\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_3,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(4));
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_3_s29\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_3_45,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_latch,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_latch,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_3_47);
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_2_s28\: LUT4
generic map (
  INIT => X"0EEE"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_2,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_2_46,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_2_52,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_2_48,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_2_49);
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_2_s29\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_2_45,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n775,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_3,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_3_50);
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_1_s26\: LUT4
generic map (
  INIT => X"3730"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_1,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_43,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_44,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_45);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int_7_s4\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_data_int_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state\(1));
\u_triple_speed_mac/u_mac_rx_ctrl/cnt_crc_1_s4\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_cnt_crc_1,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(1));
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_47_s4\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47_9,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(5),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n707_12);
\u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg_47_s5\: LUT4
generic map (
  INIT => X"0007"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_dest_addr_reg_47_10,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(2),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(1),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(3),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(4));
\u_triple_speed_mac/u_mac_rx_ctrl/type_ptr_4_s4\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_type_ptr_4,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_type_ptr_4_10,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_type_ptr_4_11,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_type_ptr_4_12,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_type_ptr_4_13);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg_15_s4\: LUT4
generic map (
  INIT => X"0071"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_rx_pause_val_reg_15_9,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(1),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(2),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/type_ptr\(4),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg_7_s4\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_pause_frm_reg_7,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_latch,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_ready_mask_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_ready_mask_9,
  I0 => tx_mac_last,
  I1 => NN_2);
\u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt_15_s4\: LUT2
generic map (
  INIT => X"2"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_10);
\u_triple_speed_mac/u_mac_tx_ctrl/late_col_s4\: LUT4
generic map (
  INIT => X"4F00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_late_col_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_late_col_11,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_late_col_12,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_late_col_13);
\u_triple_speed_mac/u_mac_tx_ctrl/late_col_s5\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_late_col_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(3),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_int_reg,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_late_col_14,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_int);
\u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_4_s4\: LUT4
generic map (
  INIT => X"000B"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_retrans_cnt_4,
  I0 => NN_3,
  I1 => NN_1,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clr_retrans_cnt,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_retrans_cnt_4_10);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_unicast_frm_latch_s4\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_tx_unicast_frm_latch_9,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_3_50,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_unicast_frm_latch_10);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_30_s4\: LUT4
generic map (
  INIT => X"00EF"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_2_46,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => NN_2);
\u_triple_speed_mac/u_miim_block/u_eth_miim/InProgress_s3\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress_7,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(6),
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(5));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/ctl_d0_s5\: LUT4
generic map (
  INIT => X"0B00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0_10,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0_12,
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(3),
  I2 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(4),
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0_13);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/ctl_d0_s6\: LUT4
generic map (
  INIT => X"4F00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0_11,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(2),
  I1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0_14,
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0_15,
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis10_reg2);
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/n38_s3\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n38_8,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(0),
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(1));
\u_triple_speed_mac/u_mac_rx_ctrl/n617_s2\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n617,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(1));
\u_triple_speed_mac/u_mac_rx_ctrl/n614_s2\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n614,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(4),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n615);
\u_triple_speed_mac/u_mac_rx_ctrl/n612_s2\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n612_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(5),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(6));
\u_triple_speed_mac/u_mac_rx_ctrl/n608_s2\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n608_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(9),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(10));
\u_triple_speed_mac/u_mac_rx_ctrl/n604_s2\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n604_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(13),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(14));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n186_s6\: LUT4
generic map (
  INIT => X"F400"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n186_11,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis10_reg2,
  I1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n40_8,
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_12,
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n186_12);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n185_s6\: LUT4
generic map (
  INIT => X"D000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_11,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_14,
  I1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0_12,
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0_13,
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis10_reg2);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n185_s7\: LUT4
generic map (
  INIT => X"0F77"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_12,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_25,
  I1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_16,
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_17,
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis10_reg2);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n185_s8\: LUT4
generic map (
  INIT => X"0007"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_13,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_18,
  I1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_25,
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis1000_reg2,
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_gmii_tx_er_int);
\u_triple_speed_mac/u_mac_tx_ctrl/n2119_s2\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2119_7,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n2119_10,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n2119_11,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n2119_12,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n2119_13);
\u_triple_speed_mac/u_mac_tx_ctrl/n2119_s3\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2119_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n2119_14,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n2119_15,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n2119_16,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n2119_17);
\u_triple_speed_mac/u_mac_tx_ctrl/n2119_s4\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2119_9,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n2119_18,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n2119_19,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n2119_20,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n2119_21);
\u_triple_speed_mac/u_mac_tx_ctrl/n1820_s2\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1820,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n1818_s2\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1818,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n1816_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1816,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(4),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(5),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1818);
\u_triple_speed_mac/u_mac_tx_ctrl/n1813_s2\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1813,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(8),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1813_8,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1818,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_late_col_12);
\u_triple_speed_mac/u_mac_tx_ctrl/n1518_s3\: LUT4
generic map (
  INIT => X"0777"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1518_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_cnt_1,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1518_9,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1518_10,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1523_12);
\u_triple_speed_mac/u_mac_tx_ctrl/n1508_s3\: LUT4
generic map (
  INIT => X"0E00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1508,
  I0 => tx_mac_valid,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_latch,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_gmii_crs_int,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n305_s3\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n305_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(3),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(4),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_late_col_11);
\u_triple_speed_mac/u_mac_tx_ctrl/n305_s4\: LUT4
generic map (
  INIT => X"0305"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n305_9,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n305_10,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n305_11,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(4),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n304_s3\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n304_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(10),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1818,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n304_9,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(4));
\u_triple_speed_mac/u_mac_tx_ctrl/n303_s3\: LUT4
generic map (
  INIT => X"004F"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n303_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n303_9,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(3),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n303_10,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(4));
\u_triple_speed_mac/u_mac_tx_ctrl/n302_s3\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n302_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(12),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1818,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n302_9,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(4));
\u_triple_speed_mac/u_mac_tx_ctrl/n301_s3\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n301_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(13),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1818,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n301_9,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(4));
\u_triple_speed_mac/u_mac_tx_ctrl/n300_s3\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n300_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n300_9,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n300_10,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(4),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n299_s3\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n299_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(15),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1818,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n299_9,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(4));
\u_triple_speed_mac/u_mac_rx_ctrl/n62_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n62_7,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(0),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n62_8,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n62_9);
\u_triple_speed_mac/u_mac_tx_ctrl/n1129_s2\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1129,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n1127_s2\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1127_7,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(2),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n69_s3\: LUT3
generic map (
  INIT => X"E0"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n69,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n69_9,
  I1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis10_reg2,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n69_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n67_s3\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n67,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n63_s3\: LUT4
generic map (
  INIT => X"007F"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n63,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(5),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(4),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n65_10,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(6));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n140_s2\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n140_7,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis1000_reg2,
  I1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n140_8);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n136_s2\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n136_7,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis1000_reg2,
  I1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n140_8);
\u_triple_speed_mac/u_mac_tx_ctrl/n1526_s3\: LUT3
generic map (
  INIT => X"D0"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1526_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n769_4,
  I1 => NN_2,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/n1526_s4\: LUT4
generic map (
  INIT => X"0700"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1526_9,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n958,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt\(1),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1526_10,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1526_11);
\u_triple_speed_mac/u_mac_tx_ctrl/n1525_s3\: LUT4
generic map (
  INIT => X"F077"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1525_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(1),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(30),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_cnt_1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1525_s4\: LUT4
generic map (
  INIT => X"7077"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1525_9,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1525_10,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1523_12,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt\(1),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n775_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1524_s3\: LUT4
generic map (
  INIT => X"0700"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1524_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(2),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1524_9,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1524_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1523_s4\: LUT4
generic map (
  INIT => X"7077"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1523_9,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(3),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(28),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_cnt_1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1523_s5\: LUT4
generic map (
  INIT => X"ACCC"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1523_10,
  I0 => tx_mac_data(3),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(3),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => NN_2);
\u_triple_speed_mac/u_mac_tx_ctrl/n1522_s3\: LUT4
generic map (
  INIT => X"0BBB"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1522_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1522_10,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n769_4,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(4),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n828);
\u_triple_speed_mac/u_mac_tx_ctrl/n1522_s4\: LUT4
generic map (
  INIT => X"7077"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1522_9,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n775_10,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1522_11,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(27),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_cnt_1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1521_s3\: LUT4
generic map (
  INIT => X"F077"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1521_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(5),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(26),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_cnt_1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1521_s4\: LUT4
generic map (
  INIT => X"004F"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1521_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt\(1),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n775_10,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1521_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1520_s3\: LUT4
generic map (
  INIT => X"4F00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1520_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(25),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_cnt_1,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1520_9,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/n1519_s3\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1519_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1519_10,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1519_11,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n769_4);
\u_triple_speed_mac/u_mac_tx_ctrl/n1519_s4\: LUT4
generic map (
  INIT => X"000D"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1519_9,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_cnt_1,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(24),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n958,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1519_12);
\u_triple_speed_mac/u_mac_tx_ctrl/n810_s2\: LUT4
generic map (
  INIT => X"0007"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n810_7,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n810_8,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n769,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1523_12,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n775_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n626_s3\: LUT4
generic map (
  INIT => X"00D4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n626_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(5),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n626_11,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n626_12,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n626_13);
\u_triple_speed_mac/u_mac_tx_ctrl/n626_s5\: LUT3
generic map (
  INIT => X"90"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n626_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(7),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n626_16,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(7));
\u_triple_speed_mac/u_mac_tx_ctrl/n625_s2\: LUT4
generic map (
  INIT => X"BF00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n625_7,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(3),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_gmii_crs_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n625_8,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n862);
\u_triple_speed_mac/u_mac_tx_ctrl/n622_s2\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n622_7,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/n619_s2\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n619_7,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(4),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(5));
\u_triple_speed_mac/u_mac_tx_ctrl/n555_s3\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n555,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_tx_ifg_delay_ena_reg3);
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s2\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_7,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_10,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_11,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_12,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_13);
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s3\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_8,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(39),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(40),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n1590,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_14);
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s4\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_9,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n1395,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_15,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_16,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_17);
\u_triple_speed_mac/u_mac_rx_ctrl/n1395_s2\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1395,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n1395_8,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n1395_9,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n1395_10,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_n1395_11);
\u_triple_speed_mac/u_mac_rx_ctrl/n1271_s2\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1271,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n1271_8,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n1271_9,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n1271_10,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_n1271_11);
\u_triple_speed_mac/u_mac_rx_ctrl/n1174_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1174,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n1174_8,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n1174_9,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n1174_10);
\u_triple_speed_mac/u_mac_rx_ctrl/n707_s2\: LUT4
generic map (
  INIT => X"1F00"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n707_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(9),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n707_9,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(10),
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_10);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n92_s3\: LUT4
generic map (
  INIT => X"FE45"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92_8,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(2),
  I2 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(0),
  I3 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(3));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n92_s5\: LUT4
generic map (
  INIT => X"0D00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92_10,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92_11,
  I1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n38_10,
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92_12,
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis10_reg2);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n40_s3\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n40_8,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n259_s3\: LUT3
generic map (
  INIT => X"41"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n259_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(29),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n259_9);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n290_s3\: LUT3
generic map (
  INIT => X"69"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(24),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(30),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290_10);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n290_s4\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290_9,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n289_s3\: LUT3
generic map (
  INIT => X"69"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n289,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(25),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(31),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n289_9);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n286_s3\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n286_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(28),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n286_9);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n285_s3\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n285,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(27),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n289,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n285_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n284_s3\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(30),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_9,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_10,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n283_s4\: LUT4
generic map (
  INIT => X"9669"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(31),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(26),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283_10,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n282_s3\: LUT4
generic map (
  INIT => X"4114"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n282_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n268_8,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n282_9,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n282_10);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n281_s3\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n281_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(26),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_10,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n282_10,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n281_9);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n280_s3\: LUT4
generic map (
  INIT => X"1441"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n280_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(26),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283_11,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283_13);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n278_s3\: LUT4
generic map (
  INIT => X"4114"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n278_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(26),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n278_12,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n278_10);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n277_s3\: LUT4
generic map (
  INIT => X"9669"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n288_12,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277_9,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277_10,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n276_s3\: LUT4
generic map (
  INIT => X"14EB"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n276_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n282_9,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n272_12,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(6));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n275_s3\: LUT4
generic map (
  INIT => X"1441"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n275_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283_10,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n275_9,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n275_10);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n274_s3\: LUT4
generic map (
  INIT => X"4114"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n274_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_9,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_10,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n268_8);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n273_s3\: LUT4
generic map (
  INIT => X"41BE"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n273_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n282_10,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n273_9,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(9));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n271_s3\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n271_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(31),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(27),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277_9,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283_10);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n268_s3\: LUT4
generic map (
  INIT => X"AC53"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n268_8,
  I0 => tx_mac_data(7),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1519_12,
  I2 => NN_2,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(24));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n267_s3\: LUT4
generic map (
  INIT => X"14EB"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n267_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290_10,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n278_10,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(15));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n264_s3\: LUT4
generic map (
  INIT => X"41BE"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n264_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n282_9,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(18));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n263_s3\: LUT4
generic map (
  INIT => X"1441"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n263_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n289_9,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_9,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n263_9);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n262_s3\: LUT4
generic map (
  INIT => X"41BE"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n262_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n288,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n273_9,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(20));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n261_s3\: LUT4
generic map (
  INIT => X"9669"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n261_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(27),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277_9,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n272_9,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n272_10);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n260_s5\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n260_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(31),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(28),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n286_9,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n306_s2\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n306_7,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n306_8,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n306_9,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(4),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(3));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n258_s2\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n258_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(1),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(7),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(24),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(30));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n257_s2\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n257_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(6),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(25),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(31));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n256_s2\: LUT3
generic map (
  INIT => X"96"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n256_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(5),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(25),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n256_8);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n255_s2\: LUT4
generic map (
  INIT => X"9669"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n255_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(4),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(5),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(26),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(27));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n254_s2\: LUT3
generic map (
  INIT => X"96"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n254_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(3),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(28),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n255_7);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n253_s3\: LUT4
generic map (
  INIT => X"9669"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n253_8,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(6),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(27),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(28),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(29));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n253_s4\: LUT3
generic map (
  INIT => X"96"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n253_9,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(25),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(31),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n258_7);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n252_s3\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n252_8,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(3),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(30),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(28),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(29));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n251_s2\: LUT4
generic map (
  INIT => X"9669"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n251_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(31),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(26),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n243_7,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n236);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n251_s3\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n251_8,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(4),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(5),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(27),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(29));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n250_s2\: LUT4
generic map (
  INIT => X"9669"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n250_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(3),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n236,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n229_7,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n235_7);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n248_s3\: LUT4
generic map (
  INIT => X"9669"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n248_8,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(4),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(24),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(29),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(2));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n246_s2\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n246_7,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n236,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n249_12,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n241_8,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n246_8);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n245_s2\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n245_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(30),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(27),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(29),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(5));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n244_s2\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n244_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(1),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(30),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(31));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n243_s2\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n243_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(2));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n243_s3\: LUT4
generic map (
  INIT => X"9669"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n243_8,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(3),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(4),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(29),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(7));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n243_s4\: LUT3
generic map (
  INIT => X"96"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n243_9,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(31),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(27),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(28));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n242_s2\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n242_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(2),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(3));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n242_s3\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n242_8,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(24),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(28),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(29),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(8));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n241_s2\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n241_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(1),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(2));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n241_s3\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n241_8,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(30),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(25));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n241_s4\: LUT3
generic map (
  INIT => X"69"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n241_9,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(6),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(29),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(9));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n240_s2\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n240_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(5),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(26));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n239_s2\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n239_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(4),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(31),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(27),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(11));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n236_s2\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n236,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(7),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(24));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n235_s2\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n235_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(6),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(25));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n232_s2\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n232_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(7),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(30),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(28),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(18));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n232_s3\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n232_8,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(3),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(4),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(24),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(27));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n231_s2\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n231_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(25),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(31),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(28),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(29));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n230_s2\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n230_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(30),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(26),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(29),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(20));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n229_s2\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n229_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(4),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(27));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n228_s2\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n228_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(3),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(31),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(28),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(22));
\u_triple_speed_mac/u_mac_tx_ctrl/n70_s2\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n70_7,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n70_8,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n70_9,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(6),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n70_10);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n91_s2\: LUT4
generic map (
  INIT => X"FE4F"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n91_7,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(2),
  I2 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(1),
  I3 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(3));
\u_triple_speed_mac/u_mac_rx_ctrl/n_state_0_s10\: LUT4
generic map (
  INIT => X"305F"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n_state_0,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_ena_reg3,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n62_7,
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_mac_rx_if_mux_gmii_rx_dv_int_Z,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_0_s25\: LUT3
generic map (
  INIT => X"0E"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_0,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_43,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_44,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_45);
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_0_s26\: LUT4
generic map (
  INIT => X"008F"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_42,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1118_5,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_46,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_43,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_44);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n54_s2\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54_5,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(13),
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(12),
  I2 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(14),
  I3 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54_8);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n54_s3\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54_6,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(9),
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(11),
  I2 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(10),
  I3 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(8));
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n54_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54_7,
  I0 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54_9,
  I1 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54_10);
\u_triple_speed_mac/u_mac_rx_ctrl/n495_s5\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n495_8,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/cnt_crc\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/cnt_crc\(1));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_err_Z_s2\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_5,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(9),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(8),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(10),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(11));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_err_Z_s3\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_6,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(16),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(17),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(19),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(18));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_err_Z_s4\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_7,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(20),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(21),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(22),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(23));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_err_Z_s5\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_8,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(13),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(12),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(14),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(15));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_err_Z_s6\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_9,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(2),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(1),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(0),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(3));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_err_Z_s7\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_10,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(29),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(25),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(31),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(30));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_err_Z_s8\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_11,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(27),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(28),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(24),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(26));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_err_Z_s9\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_crc_err_Z_12,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(7),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(5),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(6),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(4));
\u_triple_speed_mac/u_mac_tx_ctrl/n1026_s3\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1026_6,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(13),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(14),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(15),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1956);
\u_triple_speed_mac/u_mac_tx_ctrl/n1026_s4\: LUT4
generic map (
  INIT => X"0700"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1026_7,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_8,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_too_many_retransmit,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/n1116_s3\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1116_6,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n1118_s3\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1118_6,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n1118_s4\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1118_7,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(9),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(10),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(11),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(12));
\u_triple_speed_mac/u_mac_tx_ctrl/n1123_s3\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1123_6,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(4),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(5));
\u_triple_speed_mac/u_mac_tx_ctrl/n1906_s4\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1906_7,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(8),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(9),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(10),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(11));
\u_triple_speed_mac/u_mac_tx_ctrl/n1906_s5\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1906_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(12),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(13),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(14),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(15));
\u_triple_speed_mac/u_mac_tx_ctrl/n1906_s6\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1906_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(7),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(0),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(1),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/n1906_s7\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1906_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(4),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(5),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(6),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(7));
\u_triple_speed_mac/u_mac_tx_ctrl/n1906_s9\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1906_12,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_tx_unicast_frm_latch_10,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1906_14);
\u_triple_speed_mac/u_mac_tx_ctrl/n1938_s3\: LUT4
generic map (
  INIT => X"0B00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1938_6,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/type_ptr\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(3),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n1938_s4\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1938_7,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(8),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(3),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(11));
\u_triple_speed_mac/u_mac_tx_ctrl/n1938_s5\: LUT4
generic map (
  INIT => X"D000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1938_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/type_ptr\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(3),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1906_13,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1906_14);
\u_triple_speed_mac/u_miim_block/u_eth_miim/LatchByte1_d2_s4\: LUT4
generic map (
  INIT => X"007F"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d2_7,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(2),
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(3),
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(1),
  I3 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(4));
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n54_s3\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_6,
  I0 => miim_wrdata(15),
  I1 => miim_wrdata(7),
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(3));
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n54_s4\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_7,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(0),
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(1),
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(2),
  I3 => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d2_9);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n55_s2\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n55_5,
  I0 => miim_wrdata(14),
  I1 => miim_wrdata(6),
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(3));
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n56_s2\: LUT4
generic map (
  INIT => X"305F"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n56_5,
  I0 => miim_wrdata(13),
  I1 => miim_wrdata(5),
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(4),
  I3 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(3));
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n57_s2\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n57_5,
  I0 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(4),
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(3),
  I2 => miim_regad(2));
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n57_s3\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n57_6,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n57_7,
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_7,
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_WriteOp);
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n60_s2\: LUT3
generic map (
  INIT => X"35"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n60_5,
  I0 => miim_wrdata(9),
  I1 => miim_wrdata(1),
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(3));
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n61_s2\: LUT4
generic map (
  INIT => X"305F"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n61_5,
  I0 => miim_wrdata(8),
  I1 => miim_wrdata(0),
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(4),
  I3 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_3_s30\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_3_46,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(5),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(6),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(7));
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_3_s31\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_3_47,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(3),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1519_10,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_3_48);
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_2_s30\: LUT3
generic map (
  INIT => X"E7"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_2_46,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_2_s32\: LUT4
generic map (
  INIT => X"EF00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_2_48,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1519_10,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_2_s33\: LUT4
generic map (
  INIT => X"0E00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_2_49,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_2_50,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_latch,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_1_s27\: LUT4
generic map (
  INIT => X"0B00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_43,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_51,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_3_48,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_8,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_1_s28\: LUT3
generic map (
  INIT => X"0B"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_44,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_47,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_2_48,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_1_s29\: LUT4
generic map (
  INIT => X"BF00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_45,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_48,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_49);
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_15_s5\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_10,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(11),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_13);
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_15_s6\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_11,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(7),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(8),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(9),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(10));
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_15_s7\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_12,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(1),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(2),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_14);
\u_triple_speed_mac/u_mac_rx_ctrl/type_ptr_4_s5\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_type_ptr_4_10,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(1),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(2),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(3));
\u_triple_speed_mac/u_mac_rx_ctrl/type_ptr_4_s6\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_type_ptr_4_11,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(3),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(5),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(6),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/type_ptr_4_s7\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_type_ptr_4_12,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(1),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(2),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(4),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(7));
\u_triple_speed_mac/u_mac_rx_ctrl/type_ptr_4_s8\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_type_ptr_4_13,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(4),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(5),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(6),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(7));
\u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt_15_s5\: LUT4
generic map (
  INIT => X"FE53"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/late_col_s6\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_late_col_11,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/late_col_s7\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_late_col_12,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(4),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(5));
\u_triple_speed_mac/u_mac_tx_ctrl/late_col_s8\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_late_col_13,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(6),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(7),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1906_7,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1906_8);
\u_triple_speed_mac/u_mac_tx_ctrl/late_col_s9\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_late_col_14,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(12),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_late_col_12,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_late_col_15,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1813_8);
\u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_4_s5\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_retrans_cnt_4_10,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_retrans_flag,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_active_retrans,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_retrans_flag_reg);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_unicast_frm_latch_s5\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_tx_unicast_frm_latch_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(4),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/ctl_d0_s7\: LUT3
generic map (
  INIT => X"01"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0_12,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(2));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/ctl_d0_s8\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0_13,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(5),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(6));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/ctl_d0_s9\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0_14,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(4));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/ctl_d0_s10\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0_15,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(5),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(6));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n186_s7\: LUT4
generic map (
  INIT => X"00EF"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n186_12,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(1),
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_25,
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_11);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n185_s9\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_14,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(4));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n185_s11\: LUT3
generic map (
  INIT => X"E0"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_16,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(0),
  I2 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(2));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n185_s12\: LUT3
generic map (
  INIT => X"0B"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_17,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_19,
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(6),
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_20);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n185_s13\: LUT3
generic map (
  INIT => X"07"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_18,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(0),
  I2 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/n2119_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2119_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(32),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(33),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(34),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(35));
\u_triple_speed_mac/u_mac_tx_ctrl/n2119_s6\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2119_11,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(40),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(41),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(42),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(43));
\u_triple_speed_mac/u_mac_tx_ctrl/n2119_s7\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2119_12,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(44),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(45),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(46),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(47));
\u_triple_speed_mac/u_mac_tx_ctrl/n2119_s8\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2119_13,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(36),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(37),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(38),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(39));
\u_triple_speed_mac/u_mac_tx_ctrl/n2119_s9\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2119_14,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(16),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(17),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(18),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(19));
\u_triple_speed_mac/u_mac_tx_ctrl/n2119_s10\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2119_15,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(24),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(25),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(26),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(27));
\u_triple_speed_mac/u_mac_tx_ctrl/n2119_s11\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2119_16,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(28),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(29),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(30),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(31));
\u_triple_speed_mac/u_mac_tx_ctrl/n2119_s12\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2119_17,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(20),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(21),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(22),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/dest_mac_addr_reg\(23));
\u_triple_speed_mac/u_mac_tx_ctrl/n2119_s13\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2119_18,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(2),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n2119_s14\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2119_19,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(8),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(9),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(10),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(11));
\u_triple_speed_mac/u_mac_tx_ctrl/n2119_s15\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2119_20,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(12),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(13),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(14),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(15));
\u_triple_speed_mac/u_mac_tx_ctrl/n2119_s16\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2119_21,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(4),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(5),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(6),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(7));
\u_triple_speed_mac/u_mac_tx_ctrl/n1813_s3\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1813_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(6),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(7));
\u_triple_speed_mac/u_mac_tx_ctrl/n1812_s3\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1812,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(9),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1813);
\u_triple_speed_mac/u_mac_tx_ctrl/n1810_s3\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1810,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(9),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(10),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(11),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1813);
\u_triple_speed_mac/u_mac_tx_ctrl/n1809_s3\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1809,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(10),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(11),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(12),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1812);
\u_triple_speed_mac/u_mac_tx_ctrl/n1807_s3\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1807,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(12),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(13),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(14));
\u_triple_speed_mac/u_mac_tx_ctrl/n1518_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1518_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n1518_s5\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1518_10,
  I0 => tx_mac_last,
  I1 => NN_2,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_fcs_fwd_ena_reg3);
\u_triple_speed_mac/u_mac_tx_ctrl/n305_s5\: LUT4
generic map (
  INIT => X"F43F"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n305_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n305_12);
\u_triple_speed_mac/u_mac_tx_ctrl/n305_s6\: LUT4
generic map (
  INIT => X"C3F5"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n305_11,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n305_13,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n305_14,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n304_s4\: LUT4
generic map (
  INIT => X"FACF"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n304_9,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n304_10,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n304_11,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n303_s4\: LUT4
generic map (
  INIT => X"3FFA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n303_9,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n303_11,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(11),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n303_s5\: LUT4
generic map (
  INIT => X"B0BB"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n303_10,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n303_12,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n303_13,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n303_14,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n303_15);
\u_triple_speed_mac/u_mac_tx_ctrl/n302_s4\: LUT4
generic map (
  INIT => X"FACF"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n302_9,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n302_10,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n302_11,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n301_s4\: LUT4
generic map (
  INIT => X"FACF"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n301_9,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n301_10,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n301_11,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n300_s4\: LUT4
generic map (
  INIT => X"00E3"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n300_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(6),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n300_11);
\u_triple_speed_mac/u_mac_tx_ctrl/n300_s5\: LUT3
generic map (
  INIT => X"3A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n300_10,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n300_12,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n300_13,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n299_s4\: LUT4
generic map (
  INIT => X"BBF0"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n299_9,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n299_10,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n299_11,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n299_12,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(3));
\u_triple_speed_mac/u_mac_rx_ctrl/n62_s3\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n62_8,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(5),
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(6),
  I2 => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(7),
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_clk_ena_int);
\u_triple_speed_mac/u_mac_rx_ctrl/n62_s4\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n62_9,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(1),
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(3),
  I2 => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(2),
  I3 => \u_triple_speed_mac/u_mac_rx_if_block/u_mac_rx_if_mux/gmii_rxd_int_Z\(4));
\u_triple_speed_mac/u_mac_tx_ctrl/n69_s4\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n69_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(4),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(5),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(6),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n69_11);
\u_triple_speed_mac/u_mac_tx_ctrl/n69_s5\: LUT4
generic map (
  INIT => X"00BF"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n69_10,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n69_12,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(6),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(5),
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis1000_reg2);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n140_s3\: LUT4
generic map (
  INIT => X"0FBB"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n140_8,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_16,
  I1 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_25,
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_20,
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis10_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n1526_s5\: LUT4
generic map (
  INIT => X"8F00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1526_10,
  I0 => NN_2,
  I1 => tx_mac_data(0),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n769_4);
\u_triple_speed_mac/u_mac_tx_ctrl/n1526_s6\: LUT4
generic map (
  INIT => X"F077"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1526_11,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(0),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(31),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_cnt_1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1525_s5\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1525_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(1),
  I1 => tx_mac_data(1),
  I2 => NN_2);
\u_triple_speed_mac/u_mac_tx_ctrl/n1524_s4\: LUT4
generic map (
  INIT => X"8F00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1524_9,
  I0 => NN_2,
  I1 => tx_mac_data(2),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n769_4);
\u_triple_speed_mac/u_mac_tx_ctrl/n1524_s5\: LUT4
generic map (
  INIT => X"B0BB"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1524_10,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1522_11,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n775_10,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(29),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_cnt_1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1522_s5\: LUT4
generic map (
  INIT => X"3500"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1522_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(4),
  I1 => tx_mac_data(4),
  I2 => NN_2,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n1522_s6\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1522_11,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n1521_s5\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1521_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(5),
  I1 => tx_mac_data(5),
  I2 => NN_2,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1523_12);
\u_triple_speed_mac/u_mac_tx_ctrl/n1520_s4\: LUT4
generic map (
  INIT => X"0007"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1520_9,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(6),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n780,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1520_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1519_s5\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1519_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/preamble_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/preamble_cnt\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/preamble_cnt\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/n1519_s6\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1519_11,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(7),
  I1 => tx_mac_data(7),
  I2 => NN_2);
\u_triple_speed_mac/u_mac_tx_ctrl/n1519_s7\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1519_12,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(7),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n828);
\u_triple_speed_mac/u_mac_tx_ctrl/n810_s3\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n810_8,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_latch,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_latch,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1519_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n626_s6\: LUT3
generic map (
  INIT => X"B4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n626_11,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(4),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n626_30,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(5));
\u_triple_speed_mac/u_mac_tx_ctrl/n626_s7\: LUT4
generic map (
  INIT => X"FD54"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n626_12,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(4),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n626_18,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n626_19,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n626_20);
\u_triple_speed_mac/u_mac_tx_ctrl/n626_s8\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n626_13,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n626_21,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(6));
\u_triple_speed_mac/u_mac_tx_ctrl/n626_s9\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n626_14,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(7),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(7),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n626_16);
\u_triple_speed_mac/u_mac_tx_ctrl/n626_s11\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n626_16,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(4),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(5),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(6),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n626_30);
\u_triple_speed_mac/u_mac_tx_ctrl/n625_s3\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n625_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(4),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(5),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(6),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(7));
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s5\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_10,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(3),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(4),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(5),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(6));
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s6\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_11,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(11),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(12),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(13),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(14));
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s7\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_12,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(15),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(16),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(17),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(18));
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s8\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_13,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(7),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(8),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(9),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(10));
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s9\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_14,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_hd_ena_reg3,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(1),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(2),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s10\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_15,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_18,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_19,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_20);
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s11\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_16,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_21,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_22,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_23,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_24);
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s12\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_17,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_25,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_26,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_27,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_n1581_28);
\u_triple_speed_mac/u_mac_rx_ctrl/n1395_s3\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1395_8,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(1),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(2),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(3));
\u_triple_speed_mac/u_mac_rx_ctrl/n1395_s4\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1395_9,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(8),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(9),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(10),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(11));
\u_triple_speed_mac/u_mac_rx_ctrl/n1395_s5\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1395_10,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(12),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(13),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(14),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(15));
\u_triple_speed_mac/u_mac_rx_ctrl/n1395_s6\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1395_11,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(4),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(5),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(6),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/type_reg\(7));
\u_triple_speed_mac/u_mac_rx_ctrl/n1271_s3\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1271_8,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(1),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(2),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(3));
\u_triple_speed_mac/u_mac_rx_ctrl/n1271_s4\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1271_9,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(9),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(10),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(11),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(8));
\u_triple_speed_mac/u_mac_rx_ctrl/n1271_s5\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1271_10,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(12),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(13),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(14),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(15));
\u_triple_speed_mac/u_mac_rx_ctrl/n1271_s6\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1271_11,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(4),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(5),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(6),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg\(7));
\u_triple_speed_mac/u_mac_rx_ctrl/n1174_s3\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1174_8,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n1174_11,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n1174_12,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n1174_13,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_n1174_14);
\u_triple_speed_mac/u_mac_rx_ctrl/n1174_s4\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1174_9,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n1174_15,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n1174_16,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n1174_17,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_n1174_18);
\u_triple_speed_mac/u_mac_rx_ctrl/n1174_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1174_10,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n1174_19,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n1174_20,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n1174_21,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_n1174_22);
\u_triple_speed_mac/u_mac_rx_ctrl/n707_s4\: LUT4
generic map (
  INIT => X"C500"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n707_9,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n1271,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(4),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n707_10,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_n610);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n92_s6\: LUT4
generic map (
  INIT => X"8F00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92_11,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(1),
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_ctl_d0_14,
  I3 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(5));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n92_s7\: LUT4
generic map (
  INIT => X"07F0"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92_12,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_16,
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(3),
  I2 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(6),
  I3 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92_13);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n259_s4\: LUT4
generic map (
  INIT => X"0F77"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n259_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(2),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I2 => tx_mac_data(2),
  I3 => NN_2);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n290_s5\: LUT4
generic map (
  INIT => X"3CAA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290_10,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290_11,
  I1 => tx_mac_data(7),
  I2 => tx_mac_data(1),
  I3 => NN_2);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n289_s4\: LUT4
generic map (
  INIT => X"0F77"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n289_9,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n289_10,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n289_11,
  I3 => NN_2);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n288_s4\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n288,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(26),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n288_10);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n286_s4\: LUT4
generic map (
  INIT => X"0F77"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n286_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(3),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I2 => tx_mac_data(3),
  I3 => NN_2);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n284_s4\: LUT4
generic map (
  INIT => X"0F77"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_9,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_12,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_13,
  I3 => NN_2);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n284_s5\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(28),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(29));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n284_s6\: LUT4
generic map (
  INIT => X"0F77"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_11,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(1),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I2 => tx_mac_data(1),
  I3 => NN_2);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n283_s5\: LUT4
generic map (
  INIT => X"0F77"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(0),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I2 => tx_mac_data(0),
  I3 => NN_2);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n283_s6\: LUT3
generic map (
  INIT => X"96"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283_11,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(27),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(29),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n259_9);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n282_s4\: LUT3
generic map (
  INIT => X"96"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n282_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(27),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(28),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n275_9);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n282_s5\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n282_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(25),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n282_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n281_s4\: LUT2
generic map (
  INIT => X"9"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n281_9,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n288_10,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_9);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n278_s5\: LUT4
generic map (
  INIT => X"9669"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n278_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(24),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(30),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(25),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n282_11);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n277_s4\: LUT4
generic map (
  INIT => X"0F77"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(4),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I2 => tx_mac_data(4),
  I3 => NN_2);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n277_s5\: LUT4
generic map (
  INIT => X"3CAA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277_10,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277_12,
  I1 => tx_mac_data(2),
  I2 => tx_mac_data(1),
  I3 => NN_2);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n277_s6\: LUT3
generic map (
  INIT => X"96"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277_11,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(30),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(27),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(29));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n275_s4\: LUT4
generic map (
  INIT => X"3CAA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n275_9,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n275_11,
  I1 => tx_mac_data(4),
  I2 => tx_mac_data(3),
  I3 => NN_2);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n275_s5\: LUT4
generic map (
  INIT => X"9669"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n275_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(31),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(27),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n259_9,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_10);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n273_s4\: LUT3
generic map (
  INIT => X"96"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n273_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(30),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(29),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277_10);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n272_s4\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n272_9,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_11,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283_10);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n272_s5\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n272_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(30),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(31));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n263_s4\: LUT4
generic map (
  INIT => X"9669"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n263_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(25),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(31),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(28),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(29));
\u_triple_speed_mac/u_mac_tx_ctrl/n306_s3\: LUT4
generic map (
  INIT => X"4F00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n306_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(8),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n306_10,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/n306_s4\: LUT4
generic map (
  INIT => X"880D"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n306_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n306_11,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n306_12,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n256_s3\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n256_8,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(6),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(31),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(26));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n246_s3\: LUT3
generic map (
  INIT => X"96"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n246_8,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(5),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(6),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(4));
\u_triple_speed_mac/u_mac_tx_ctrl/n70_s3\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n70_8,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis10_reg2,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(5),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n70_s4\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n70_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(1),
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis10_reg2,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(5));
\u_triple_speed_mac/u_mac_tx_ctrl/n70_s5\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n70_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(4),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n557_s3\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n557,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(6),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(5),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(4),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_0_s27\: LUT4
generic map (
  INIT => X"FC50"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_43,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_48,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_too_many_retransmit,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_0_s28\: LUT4
generic map (
  INIT => X"8F00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_44,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_47,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_late_col_13,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_0_s29\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_45,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_late_col_12,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_48,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_late_col_13);
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_0_s30\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_46,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_6);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n54_s5\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54_8,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(15),
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_dv_10100m_reg\(0),
  I2 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_dv_10100m_reg\(1),
  I3 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rx_dv_10100m_reg\(2));
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n54_s6\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54_9,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(5),
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(7),
  I2 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(6),
  I3 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(4));
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n54_s7\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n54_10,
  I0 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(1),
  I1 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(0),
  I2 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(2),
  I3 => \u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n1026_s5\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1026_8,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt\(0),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n1906_s10\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1906_13,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(9),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(10));
\u_triple_speed_mac/u_mac_tx_ctrl/n1906_s11\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1906_14,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(12),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(13),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(14),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(15));
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n57_s4\: LUT4
generic map (
  INIT => X"C0AF"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n57_7,
  I0 => miim_wrdata(12),
  I1 => miim_wrdata(4),
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(4),
  I3 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_3_s32\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_3_48,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_2_s34\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_2_50,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_tx_fcs_fwd_ena_reg3,
  I1 => tx_mac_last,
  I2 => NN_2,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_1_s31\: LUT4
generic map (
  INIT => X"000D"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_47,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_ifg_end_flag,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1508);
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_1_s32\: LUT4
generic map (
  INIT => X"0305"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_48,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_latch,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1518_10,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_latch,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_1_s33\: LUT4
generic map (
  INIT => X"EFF3"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_49,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_latch,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1));
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_15_s8\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_13,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(12),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(13),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(14),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(15));
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_15_s9\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_14,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(4),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(5),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(6),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/late_col_s10\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_late_col_15,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(8),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(9),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(10),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_late_col_16);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n185_s14\: LUT4
generic map (
  INIT => X"000B"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_19,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_18,
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(3),
  I2 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(5),
  I3 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(4));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n185_s15\: LUT4
generic map (
  INIT => X"00BF"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_20,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_21,
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(4),
  I2 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(5),
  I3 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(6));
\u_triple_speed_mac/u_mac_tx_ctrl/n305_s7\: LUT4
generic map (
  INIT => X"5F30"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n305_12,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(17),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(9),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n305_s8\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n305_13,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(25),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(33),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n305_s9\: LUT4
generic map (
  INIT => X"3F0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n305_14,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(41),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(9),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/n304_s5\: LUT4
generic map (
  INIT => X"BB0F"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n304_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(34),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n304_12,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n304_s6\: LUT4
generic map (
  INIT => X"0F77"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n304_11,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n304_13,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n303_s6\: LUT2
generic map (
  INIT => X"1"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n303_11,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(27));
\u_triple_speed_mac/u_mac_tx_ctrl/n303_s7\: LUT3
generic map (
  INIT => X"07"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n303_12,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(43),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n303_s8\: LUT4
generic map (
  INIT => X"0E00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n303_13,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(35),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n303_s9\: LUT4
generic map (
  INIT => X"305F"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n303_14,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(11),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(19),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n303_s10\: LUT4
generic map (
  INIT => X"0E00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n303_15,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(3),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/n302_s5\: LUT4
generic map (
  INIT => X"BB0F"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n302_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(36),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n302_12,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n302_s6\: LUT4
generic map (
  INIT => X"0F77"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n302_11,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(4),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n302_13,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n301_s5\: LUT4
generic map (
  INIT => X"BB0F"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n301_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(37),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n301_12,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n301_s6\: LUT4
generic map (
  INIT => X"0F77"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n301_11,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(5),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n301_13,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n300_s6\: LUT4
generic map (
  INIT => X"305F"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n300_11,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(14),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(22),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n300_s7\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n300_12,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(30),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(38),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n300_s8\: LUT4
generic map (
  INIT => X"3FF5"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n300_13,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(46),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(14),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/n299_s5\: LUT4
generic map (
  INIT => X"0305"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n299_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(31),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(47),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n299_s6\: LUT4
generic map (
  INIT => X"00EF"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n299_11,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(39),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/n299_s7\: LUT4
generic map (
  INIT => X"F34C"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n299_12,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(7),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n299_13,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n69_s6\: LUT4
generic map (
  INIT => X"FE00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n69_11,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(2),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(0),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n69_s7\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n69_12,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(3),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(4),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n67);
\u_triple_speed_mac/u_mac_tx_ctrl/n1520_s5\: LUT4
generic map (
  INIT => X"8F00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1520_10,
  I0 => NN_2,
  I1 => tx_mac_data(6),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n769_4);
\u_triple_speed_mac/u_mac_tx_ctrl/n626_s13\: LUT3
generic map (
  INIT => X"01"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n626_18,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n626_23,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n626_24,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n626_25);
\u_triple_speed_mac/u_mac_tx_ctrl/n626_s14\: LUT4
generic map (
  INIT => X"0E01"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n626_19,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(2),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n626_22,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(3),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n626_s15\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n626_20,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(4),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n626_30);
\u_triple_speed_mac/u_mac_tx_ctrl/n626_s16\: LUT4
generic map (
  INIT => X"10EF"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n626_21,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(4),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(5),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n626_30,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(6));
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s13\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_18,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(8),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(13),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(14),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(15));
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s14\: LUT3
generic map (
  INIT => X"01"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_19,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(5),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(6),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(7));
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s15\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_20,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(9),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(10),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(11),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(12));
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s16\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_21,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(35),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(36),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(37),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(38));
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s17\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_22,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(45),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(46),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(47),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s18\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_23,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(1),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(2),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(3),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/op_reg\(4));
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s19\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_24,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(41),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(42),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(43),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(44));
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s20\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_25,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(19),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(20),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(21),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(22));
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s21\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_26,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(27),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(28),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(29),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(30));
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s22\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_27,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(32),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(33),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(34),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(31));
\u_triple_speed_mac/u_mac_rx_ctrl/n1581_s23\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1581_28,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(23),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(24),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(26),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(25));
\u_triple_speed_mac/u_mac_rx_ctrl/n1174_s6\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1174_11,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(30),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(31),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(32),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(33));
\u_triple_speed_mac/u_mac_rx_ctrl/n1174_s7\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1174_12,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(38),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(41),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(42),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(43));
\u_triple_speed_mac/u_mac_rx_ctrl/n1174_s8\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1174_13,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(44),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(45),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(46),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(47));
\u_triple_speed_mac/u_mac_rx_ctrl/n1174_s9\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1174_14,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(34),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(35),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(36),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(37));
\u_triple_speed_mac/u_mac_rx_ctrl/n1174_s10\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1174_15,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(14),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(15),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(16),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(17));
\u_triple_speed_mac/u_mac_rx_ctrl/n1174_s11\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1174_16,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(22),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(23),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(24),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(25));
\u_triple_speed_mac/u_mac_rx_ctrl/n1174_s12\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1174_17,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(26),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(27),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(28),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(29));
\u_triple_speed_mac/u_mac_rx_ctrl/n1174_s13\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1174_18,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(18),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(19),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(20),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(21));
\u_triple_speed_mac/u_mac_rx_ctrl/n1174_s14\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1174_19,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(2),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(3),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(4),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(5));
\u_triple_speed_mac/u_mac_rx_ctrl/n1174_s15\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1174_20,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(6),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(7),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(8),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(9));
\u_triple_speed_mac/u_mac_rx_ctrl/n1174_s16\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1174_21,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(10),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(11),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(12),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(13));
\u_triple_speed_mac/u_mac_rx_ctrl/n1174_s17\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1174_22,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(1),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(39),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(40));
\u_triple_speed_mac/u_mac_rx_ctrl/n707_s5\: LUT4
generic map (
  INIT => X"FE7F"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n707_10,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(2),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(3),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n617,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(4));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n92_s8\: LUT4
generic map (
  INIT => X"004F"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92_13,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(6),
  I2 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(4),
  I3 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(5));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n290_s6\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290_11,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(7),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n828);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n289_s5\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n289_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(6));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n289_s6\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n289_11,
  I0 => tx_mac_data(6),
  I1 => tx_mac_data(0));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n288_s5\: LUT4
generic map (
  INIT => X"0F77"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n288_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(5),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I2 => tx_mac_data(5),
  I3 => NN_2);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n284_s7\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_12,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n284_s8\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_13,
  I0 => tx_mac_data(3),
  I1 => tx_mac_data(2));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n282_s6\: LUT4
generic map (
  INIT => X"0F77"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n282_11,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(6),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I2 => tx_mac_data(6),
  I3 => NN_2);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n277_s7\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277_12,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(2),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n828);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n275_s6\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n275_11,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg\(4),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n828);
\u_triple_speed_mac/u_mac_tx_ctrl/n306_s5\: LUT4
generic map (
  INIT => X"5F30"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n306_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(16),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(0),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n306_s6\: LUT4
generic map (
  INIT => X"BBF0"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n306_11,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(8),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(40),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/n306_s7\: LUT4
generic map (
  INIT => X"F503"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n306_12,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(32),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(24),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_0_s31\: LUT4
generic map (
  INIT => X"1F00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_47,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1820,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_late_col_12,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_ready_mask_9);
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_0_s32\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_48,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_latch,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1820,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_49);
\u_triple_speed_mac/u_mac_tx_ctrl/late_col_s11\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_late_col_16,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(11),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(13),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(14),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(15));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n185_s16\: LUT3
generic map (
  INIT => X"01"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_21,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(2),
  I2 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n304_s7\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n304_12,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(26),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(42),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n304_s8\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n304_13,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(10),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(18),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n302_s7\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n302_12,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(28),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(44),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n302_s8\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n302_13,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(12),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(20),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n301_s7\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n301_12,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(29),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(45),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n301_s8\: LUT3
generic map (
  INIT => X"CA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n301_13,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(13),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(21),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n299_s8\: LUT4
generic map (
  INIT => X"5F30"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n299_13,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(23),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(15),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n626_s17\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n626_22,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n626_s18\: LUT4
generic map (
  INIT => X"00F4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n626_23,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n626_22,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(2),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(2),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n626_26);
\u_triple_speed_mac/u_mac_tx_ctrl/n626_s19\: LUT4
generic map (
  INIT => X"00F8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n626_24,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(3),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n626_22,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/n626_s20\: LUT4
generic map (
  INIT => X"F400"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n626_25,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(3),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(2),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_0_s33\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_0_49,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/n626_s21\: LUT4
generic map (
  INIT => X"32F3"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n626_26,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(1),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n626_s22\: LUT3
generic map (
  INIT => X"54"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n626_28,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n626_14,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n626_21,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(6));
\u_triple_speed_mac/u_mac_rx_ctrl/n1174_s18\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1174_24,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n1590,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n1174_8,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n1174_9,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_n1174_10);
\u_triple_speed_mac/u_mac_rx_ctrl/n469_s2\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n469_6,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n469,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_crc_result_valid,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_valid_int);
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n252_s4\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n252_10,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(5),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(25),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n256_8,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n241_7);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n138_s1\: LUT3
generic map (
  INIT => X"BE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n138,
  I0 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_er_reg_tmp,
  I1 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_dv_int,
  I2 => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rx_er_int);
\u_triple_speed_mac/u_mac_tx_ctrl/n1122_s3\: LUT4
generic map (
  INIT => X"D500"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1122_7,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1121_9,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(0),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(1),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n1129_s3\: LUT4
generic map (
  INIT => X"A900"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1129_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(0),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(1),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n899_s3\: LUT4
generic map (
  INIT => X"1540"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n899,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1810,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1807,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(15));
\u_triple_speed_mac/u_mac_tx_ctrl/n1807_s4\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1807_10,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1810,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1807,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(15),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15);
\u_triple_speed_mac/u_mac_tx_ctrl/n900_s3\: LUT4
generic map (
  INIT => X"1540"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n900,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(13),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1809,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(14));
\u_triple_speed_mac/u_mac_tx_ctrl/n1808_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1808,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(13),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1809,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(14),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15);
\u_triple_speed_mac/u_mac_tx_ctrl/n901_s3\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n901,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(13),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1809);
\u_triple_speed_mac/u_mac_tx_ctrl/n902_s3\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n902,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(12),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1810);
\u_triple_speed_mac/u_mac_tx_ctrl/n909_s3\: LUT4
generic map (
  INIT => X"1540"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n909,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(4),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1818,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(5));
\u_triple_speed_mac/u_mac_tx_ctrl/n1817_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1817,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(4),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1818,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(5),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15);
\u_triple_speed_mac/u_mac_tx_ctrl/n1906_s12\: LUT4
generic map (
  INIT => X"0004"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1906_16,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(11),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(8),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(9),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/statistics_data_reg\(10));
\u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_ctrl_frm_latch_s4\: LUT4
generic map (
  INIT => X"EAAA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_ctrl_frm_latch_10,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1552,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1906_5,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1938_4,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1938_5);
\u_triple_speed_mac/u_mac_tx_ctrl/n557_s4\: LUT4
generic map (
  INIT => X"B0FF"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n557_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(7),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n557,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(2),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n555);
\u_triple_speed_mac/u_mac_tx_ctrl/n618_s3\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n618_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(6),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(4),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(5));
\u_triple_speed_mac/u_mac_tx_ctrl/n621_s3\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n621_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(0),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(1),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/ifg_cnt\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n272_s6\: LUT4
generic map (
  INIT => X"9669"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n272_12,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n288,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_11,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283_10,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n272_10);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n278_s6\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n278_12,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290_10,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_10,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n288_10,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_9);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n283_s7\: LUT3
generic map (
  INIT => X"69"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283_13,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n288_10,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277_9,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n268_8);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n287_s5\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n287,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(26),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(27),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n288_10,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277_9);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n38_s4\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n38_10,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n40_8,
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(3),
  I2 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(4));
\u_triple_speed_mac/u_miim_block/u_eth_miim/LatchByte1_d2_s5\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_LatchByte1_d2_9,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress,
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(6),
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(5));
\u_triple_speed_mac/u_miim_block/u_eth_miim/StartOp_s1\: LUT4
generic map (
  INIT => X"4F44"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_StartOp,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_RStatStart_q2,
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_RStatStart_q1,
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart_q2,
  I3 => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart_q1);
\u_triple_speed_mac/u_mac_rx_ctrl/n606_s4\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n606,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(11),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(12),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(9),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(10));
\u_triple_speed_mac/u_mac_rx_ctrl/n607_s3\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n607_9,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(11),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(9),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(10));
\u_triple_speed_mac/u_mac_rx_ctrl/n610_s4\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n610,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(7),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(8),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(5),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(6));
\u_triple_speed_mac/u_mac_rx_ctrl/n611_s3\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n611_9,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(7),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(5),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(6));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n249_s4\: LUT4
generic map (
  INIT => X"9669"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n249_10,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(29),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(1),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(6),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(25));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n248_s4\: LUT4
generic map (
  INIT => X"9669"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n248_10,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(7),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(27),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(5),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(26));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n231_s4\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n231_10,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(6),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(2),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(3));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n249_s5\: LUT4
generic map (
  INIT => X"9669"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n249_12,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(26),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(28),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(2),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(3));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n253_s5\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n253_11,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(3),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(4),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(0),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(2));
\u_triple_speed_mac/u_mac_rx_ctrl/n707_s6\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n707_12,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(6),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(11),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_13,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_11);
\u_triple_speed_mac/u_mac_rx_ctrl/vlan_reg_15_s10\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_16,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(11),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_13,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_11,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_15_12);
\u_triple_speed_mac/u_mac_tx_ctrl/n1124_s3\: LUT4
generic map (
  INIT => X"FD00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1124_7,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1121_9,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(0),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(1),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_lfsr/lfsr_out\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n1120_s3\: LUT4
generic map (
  INIT => X"1F00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1120_7,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(2),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1117_4);
\u_triple_speed_mac/u_mac_tx_ctrl/n1125_s2\: LUT4
generic map (
  INIT => X"FD02"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1125_6,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1127_7,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(4),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(5),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(6));
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_1_s34\: LUT4
generic map (
  INIT => X"1500"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_1_51,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_latch,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/cnt\(0),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/cnt\(1),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_2_s35\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_2_52,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_latch,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1956,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/cnt\(0),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n1811_s3\: LUT4
generic map (
  INIT => X"7F80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1811,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(10),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(9),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1813,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(11));
\u_triple_speed_mac/u_mac_tx_ctrl/n1812_s4\: LUT3
generic map (
  INIT => X"6A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1812_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(10),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(9),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1813);
\u_triple_speed_mac/u_mac_tx_ctrl/n1814_s3\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1814_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(6),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(4),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(5),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1818);
\u_triple_speed_mac/u_mac_tx_ctrl/n_state_3_s33\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n_state_3_50,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1906_7,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1906_8,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_3_46);
\u_triple_speed_mac/u_mac_tx_ctrl/n775_s5\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n775_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(3),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/cnt_1_s5\: LUT4
generic map (
  INIT => X"0800"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_cnt_1,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(3),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2));
\u_triple_speed_mac/u_mac_tx_ctrl/n1026_s6\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1026_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(3),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1956);
\u_triple_speed_mac/u_mac_tx_ctrl/n780_s3\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n780_7,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt\(0),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt\(1),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n775_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n2123_s4\: LUT4
generic map (
  INIT => X"BF00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2123_10,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_3_50,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_unicast_frm_latch_10,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1552);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_broadcast_frm_latch_s3\: LUT4
generic map (
  INIT => X"BAAA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_tx_broadcast_frm_latch_9,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1552,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n_state_3_50,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_unicast_frm_latch_10);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg_30_s5\: LUT4
generic map (
  INIT => X"F8FF"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30_11,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_cnt_1,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n288_s6\: LUT3
generic map (
  INIT => X"69"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n288_12,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n289,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(26),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n288_10);
\u_triple_speed_mac/u_mac_rx_ctrl/n562_s4\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n562_8,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(1),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(2),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(0),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(1));
\u_triple_speed_mac/u_mac_rx_ctrl/n495_s6\: LUT4
generic map (
  INIT => X"00BF"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n495_10,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(1),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_fwd_ena_reg3,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_data_int_7);
\u_triple_speed_mac/u_mac_rx_ctrl/cnt_crc_1_s5\: LUT4
generic map (
  INIT => X"FF40"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_cnt_crc_1_11,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(1),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_data_int_7);
\u_triple_speed_mac/u_mac_rx_ctrl/n615_s3\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n615,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(2),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(3),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(0),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(1));
\u_triple_speed_mac/u_mac_rx_ctrl/n617_s3\: LUT4
generic map (
  INIT => X"6A00"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n617_9,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(2),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(0),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(1),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/n236_s3\: LUT4
generic map (
  INIT => X"EBBE"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_u_crc_chk_n236_9,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_last,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(14),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(7),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/u_crc_chk/crc_reg\(24));
\u_triple_speed_mac/u_mac_tx_ctrl/n1121_s3\: LUT4
generic map (
  INIT => X"EF10"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1121_7,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(9),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(8),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1123_5,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(10));
\u_triple_speed_mac/u_mac_tx_ctrl/n1956_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1956_6,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n769_4,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int);
\u_triple_speed_mac/u_mac_tx_ctrl/n626_s23\: LUT4
generic map (
  INIT => X"0111"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n626_30,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(3),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(1),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_int\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n65_s4\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n65_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(3),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(0),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n67_s4\: LUT4
generic map (
  INIT => X"6A00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n67_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(0),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(1),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n69);
\u_triple_speed_mac/u_mac_tx_ctrl/preamble_cnt_2_s4\: LUT4
generic map (
  INIT => X"BAAA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_preamble_cnt_2,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n769_4);
\u_triple_speed_mac/u_mac_tx_ctrl/n1269_s1\: LUT4
generic map (
  INIT => X"0400"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1269,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt\(1),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/jam_cnt\(0),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n775_10);
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n185_s18\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n185_25,
  I0 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(4),
  I2 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(5),
  I3 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(6));
\u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/n92_s9\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_n92_15,
  I0 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis10_reg2,
  I1 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(4),
  I2 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(5),
  I3 => \u_triple_speed_mac/u_mac_tx_if_block/u_rgmii_tx_if/clk_cnt\(6));
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/n39_s3\: LUT4
generic map (
  INIT => X"4441"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n39,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_CountEq0,
  I1 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(2),
  I2 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(0),
  I3 => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(1));
\u_triple_speed_mac/u_mac_rx_ctrl/rx_mac_data_int_7_s5\: LUT4
generic map (
  INIT => X"EEEF"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_data_int_7_11,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_fcs_fwd_ena_reg3,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_rx_mac_data_int_7,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(0),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(1));
\u_triple_speed_mac/u_mac_rx_ctrl/n453_s2\: LUT4
generic map (
  INIT => X"0BB0"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n453,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state\(1),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/cnt_crc\(0),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/cnt_crc\(1));
\u_triple_speed_mac/u_mac_rx_ctrl/n454_s3\: LUT3
generic map (
  INIT => X"45"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n454,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/cnt_crc\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state\(0),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n1121_s4\: LUT3
generic map (
  INIT => X"01"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1121_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(3),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_random\(4));
\u_triple_speed_mac/u_mac_rx_ctrl/n606_s5\: LUT4
generic map (
  INIT => X"8000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n606_12,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(4),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n615,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n610,
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_n606);
\u_triple_speed_mac/u_mac_rx_ctrl/n610_s5\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n610_12,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(4),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n615,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n610);
\u_triple_speed_mac/u_mac_rx_ctrl/n614_s3\: LUT4
generic map (
  INIT => X"6A00"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n614_9,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(5),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(4),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n615,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n912_s3\: LUT4
generic map (
  INIT => X"1444"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n912,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n1820_s3\: LUT4
generic map (
  INIT => X"6A00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1820_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15);
\u_triple_speed_mac/u_mac_tx_ctrl/n559_s5\: LUT4
generic map (
  INIT => X"0B00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n559_12,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(7),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n557,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_ifg_delay_ena_reg3);
\u_triple_speed_mac/u_mac_tx_ctrl/n552_s3\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n552,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(7),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_ifg_delay_ena_reg3);
\u_triple_speed_mac/u_mac_tx_ctrl/n553_s3\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n553,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(6),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_ifg_delay_ena_reg3);
\u_triple_speed_mac/u_mac_tx_ctrl/n554_s3\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n554,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(5),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_ifg_delay_ena_reg3);
\u_triple_speed_mac/u_mac_tx_ctrl/n555_s4\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n555_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_ifg_delay_reg3\(4),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_ifg_delay_ena_reg3);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n285_s5\: LUT4
generic map (
  INIT => X"6996"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n285_11,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n277_9,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_9,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(28),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(29));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n290_s7\: LUT4
generic map (
  INIT => X"96FF"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290_13,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(24),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/crc_reg\(30),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290_10,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290_9);
\u_triple_speed_mac/u_mac_tx_ctrl/n63_s4\: LUT4
generic map (
  INIT => X"5400"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n63_10,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n63,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n69_9,
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis10_reg2,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n69_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n69_s8\: LUT4
generic map (
  INIT => X"5400"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n69_14,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/clk_ena_cnt\(0),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n69_9,
  I2 => u_triple_speed_mac_u_mac_tx_if_block_u_rgmii_tx_if_speedis10_reg2,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n69_10);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n283_s8\: LUT4
generic map (
  INIT => X"FFF9"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283_15,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283_13,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n283,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n284_s9\: LUT4
generic map (
  INIT => X"FFF6"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284_15,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n288_12,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n284,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n285_s6\: LUT3
generic map (
  INIT => X"FD"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n285_13,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n285,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n287_s6\: LUT4
generic map (
  INIT => X"FFF6"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n287_13,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n289,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n287,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n288_s7\: LUT4
generic map (
  INIT => X"FFF9"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n288_14,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n288_12,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n289_s7\: LUT4
generic map (
  INIT => X"FFF9"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n289_13,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n290,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n289,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_crc_reg_30);
\u_triple_speed_mac/u_mac_tx_ctrl/pause_frm_reg_7_s5\: LUT4
generic map (
  INIT => X"8F88"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_pause_frm_reg_7_11,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_latch,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n1523_s6\: LUT4
generic map (
  INIT => X"0200"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1523_12,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(3),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1));
\u_triple_speed_mac/u_mac_rx_ctrl/n114_s2\: LUT4
generic map (
  INIT => X"0400"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n114,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(14),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(7),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(15));
\u_triple_speed_mac/u_mac_rx_ctrl/n115_s2\: LUT4
generic map (
  INIT => X"0400"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n115,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(14),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(6),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(15));
\u_triple_speed_mac/u_mac_rx_ctrl/n116_s2\: LUT4
generic map (
  INIT => X"0400"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n116,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(14),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(5),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(15));
\u_triple_speed_mac/u_mac_rx_ctrl/n117_s2\: LUT4
generic map (
  INIT => X"0400"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n117,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(14),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(4),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(15));
\u_triple_speed_mac/u_mac_rx_ctrl/n118_s2\: LUT4
generic map (
  INIT => X"0400"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n118,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(14),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(3),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(15));
\u_triple_speed_mac/u_mac_rx_ctrl/n119_s2\: LUT4
generic map (
  INIT => X"0400"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n119,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(14),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(2),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(15));
\u_triple_speed_mac/u_mac_rx_ctrl/n120_s2\: LUT4
generic map (
  INIT => X"0400"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n120,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(14),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(1),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(15));
\u_triple_speed_mac/u_mac_rx_ctrl/n121_s2\: LUT4
generic map (
  INIT => X"0400"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n121,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(14),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/gmii_rxd_int\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(15));
\u_triple_speed_mac/u_mac_rx_ctrl/n154_s2\: LUT4
generic map (
  INIT => X"0400"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n154,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(14),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_clk_ena_int,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(15));
\u_triple_speed_mac/u_mac_rx_ctrl/n159_s2\: LUT4
generic map (
  INIT => X"0400"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n159,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(14),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_gmii_rx_dv_int,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(15));
\u_triple_speed_mac/u_mac_rx_ctrl/n164_s2\: LUT4
generic map (
  INIT => X"0400"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n164,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(14),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_gmii_rx_er_int,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(15));
\u_triple_speed_mac/u_mac_rx_ctrl/n169_s2\: LUT4
generic map (
  INIT => X"0400"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n169,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(14),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_gmii_col_int,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(15));
\u_triple_speed_mac/u_mac_rx_ctrl/n174_s2\: LUT4
generic map (
  INIT => X"0400"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n174,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(14),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_gmii_rx_align_int,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state_reg\(15));
\u_triple_speed_mac/u_miim_block/u_eth_miim/shftrg/n214_s1\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n214,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_shftrg_n54_5,
  I1 => NN,
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_CountEq0,
  I3 => \u_triple_speed_mac/u_miim_block/u_eth_miim/LatchByte\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n1810_s5\: LUT4
generic map (
  INIT => X"0060"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1810_12,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(12),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1810,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1809_s5\: LUT4
generic map (
  INIT => X"0060"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1809_12,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(13),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1809,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1811_s4\: LUT3
generic map (
  INIT => X"08"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1811_11,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1811,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1812_s5\: LUT3
generic map (
  INIT => X"08"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1812_12,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1812_10,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1813_s4\: LUT4
generic map (
  INIT => X"0060"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1813_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(9),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1813,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1816_s3\: LUT4
generic map (
  INIT => X"0060"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1816_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(6),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1816,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1818_s3\: LUT4
generic map (
  INIT => X"0060"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1818_9,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(4),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1818,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1821_s2\: LUT4
generic map (
  INIT => X"0060"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1821,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(1),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1822_s3\: LUT3
generic map (
  INIT => X"04"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1822,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n1169_s4\: LUT3
generic map (
  INIT => X"FE"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1169,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n1508_s4\: LUT4
generic map (
  INIT => X"0100"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1508_10,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(3),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1508);
\u_triple_speed_mac/u_mac_tx_ctrl/gmii_col_latch_s4\: LUT4
generic map (
  INIT => X"AAAB"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_latch_10,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_gmii_col_int,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/n862_s1\: LUT4
generic map (
  INIT => X"0001"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(1),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(2),
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/c_state\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch_15_s5\: LUT4
generic map (
  INIT => X"88F8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_tx_frm_lgt_latch_15,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_10);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_late_col_latch_s5\: LUT4
generic map (
  INIT => X"8F88"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_tx_late_col_latch_12,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_late_col_reg,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_late_col);
\u_triple_speed_mac/u_mac_tx_ctrl/n1609_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1609,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_frm_latch,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1624_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1624,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_tx_occur_col_latch,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1651_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1651,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_attempts_latch\(3),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1652_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1652,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_attempts_latch\(2),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1653_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1653,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_attempts_latch\(1),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1654_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1654,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_attempts_latch\(0),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1681_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1681,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_tx_excessive_col_latch,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1700_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1700,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_tx_late_col_latch,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1765_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1765,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_tx_vlan_frame_latch,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1859_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1859,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(15),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1860_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1860,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(14),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1861_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1861,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(13),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1862_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1862,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(12),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1863_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1863,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(11),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1864_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1864,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(10),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1865_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1865,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(9),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1866_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1866,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(8),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1867_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1867,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(7),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1868_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1868,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(6),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1869_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1869,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(5),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1870_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1870,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(4),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1871_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1871,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(3),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1872_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1872,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(2),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1873_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1873,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(1),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1874_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1874,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_frm_lgt_latch\(0),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n1948_s2\: LUT4
generic map (
  INIT => X"E000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1948,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_frm_latch,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_ctrl_frm_latch,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n2132_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2132,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_tx_unicast_frm_latch,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n2133_s2\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2133,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_tx_broadcast_frm_latch,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/n2134_s2\: LUT4
generic map (
  INIT => X"E000"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n2134,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_tx_multicast_frm_latch,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_frm_latch,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_vlan_frame_latch_s4\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_tx_vlan_frame_latch_10,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1906);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_excessive_col_latch_s4\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_tx_excessive_col_latch_10,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1672);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_attempts_latch_3_s4\: LUT3
generic map (
  INIT => X"EA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_tx_attempts_latch_3,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1269,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_occur_col_latch_s4\: LUT3
generic map (
  INIT => X"EA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_tx_occur_col_latch_10,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n775_10,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_frm_latch_s4\: LUT3
generic map (
  INIT => X"EA"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_frm_latch_10,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1);
\u_triple_speed_mac/u_mac_rx_ctrl/n638_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n638,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(15),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n639_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n639,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(14),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n640_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n640,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(13),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n641_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n641,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(12),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n642_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n642,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(11),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n643_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n643,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(10),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n644_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n644,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(9),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n645_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n645,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(8),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n646_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n646,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(7),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n647_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n647,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(6),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n648_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n648,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(5),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n649_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n649,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(4),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n650_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n650,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(3),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n651_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n651,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(2),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n652_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n652,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(1),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n653_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n653,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n723_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n723,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_er_err_reg,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n739_s2\: LUT4
generic map (
  INIT => X"0400"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n739,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_rx_align_err_reg,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n754_s2\: LUT4
generic map (
  INIT => X"0800"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n754,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_rx_col_err_reg,
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_hd_ena_reg3,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I3 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n1173_s4\: LUT3
generic map (
  INIT => X"10"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1173,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(40),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n1175_s3\: LUT4
generic map (
  INIT => X"1000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1175,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n1174,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/dest_addr_reg\(40));
\u_triple_speed_mac/u_mac_rx_ctrl/n1271_s7\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1271_13,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n1271);
\u_triple_speed_mac/u_mac_rx_ctrl/n1395_s7\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1395_13,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n1395);
\u_triple_speed_mac/u_mac_rx_ctrl/n1591_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1591,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(15),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n1592_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1592,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(14),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n1593_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1593,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(13),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n1594_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1594,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(12),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n1595_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1595,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(11),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n1596_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1596,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(10),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n1597_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1597,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(9),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n1598_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1598,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(8),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n1599_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1599,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(7),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n1600_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1600,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(6),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n1601_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1601,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(5),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n1602_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1602,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(4),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n1603_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1603,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(3),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n1604_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1604,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(2),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n1605_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1605,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(1),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_mac_rx_ctrl/n1606_s2\: LUT3
generic map (
  INIT => X"20"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1606,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_pause_val_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_rx_dv_statistics_reg);
\u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter_0_s1\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(0),
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_n150,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg_13_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(13),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n606_15,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg_9_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(9),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n610_15,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg_4_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(4),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n615_12,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg_1_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(1),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n618,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg_0_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(0),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n619,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_align_err_reg_s5\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_align_err_reg,
  D => u_triple_speed_mac_u_mac_rx_ctrl_n2333,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_col_err_reg_s5\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_rx_ctrl_rx_col_err_reg,
  D => u_triple_speed_mac_u_mac_rx_ctrl_n2335,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg_7_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(7),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n882,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg_6_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(6),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n883,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg_5_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(5),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n884,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg_4_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(4),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n885,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg_3_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(3),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n886,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg_2_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(2),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n887,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg_1_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(1),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n888,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg_0_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(0),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n889,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/type_ptr_2_s3\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/type_ptr\(2),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n1317,
  CLK => rgmii_rxc,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_req_latch_s5\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_latch,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n329,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch_15_s4\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(15),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n330,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch_14_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(14),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n331,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch_13_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(13),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n332,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch_12_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(12),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n333,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch_11_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(11),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n334,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch_10_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(10),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n335,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch_9_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(9),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n336,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch_8_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(8),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n337,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch_7_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(7),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n338,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch_6_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(6),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n339,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch_5_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(5),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n340,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch_4_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(4),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n341,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch_3_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(3),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n342,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch_2_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(2),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n343,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch_1_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(1),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n344,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch_0_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n345,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_47_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(47),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n346,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_46_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(46),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n347,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_45_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(45),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n348,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_44_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(44),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n349,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_43_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(43),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n350,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_42_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(42),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n351,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_41_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(41),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n352,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_40_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(40),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n353,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_39_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(39),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n354,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_38_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(38),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n355,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_37_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(37),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n356,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_36_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(36),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n357,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_35_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(35),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n358,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_34_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(34),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n359,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_33_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(33),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n360,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_32_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(32),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n361,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_31_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(31),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n362,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_30_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(30),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n363,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_29_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(29),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n364,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_28_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(28),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n365,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_27_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(27),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n366,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_26_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(26),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n367,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_25_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(25),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n368,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_24_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(24),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n369,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_23_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(23),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n370,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_22_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(22),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n371,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_21_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(21),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n372,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_20_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(20),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n373,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_19_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(19),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n374,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_18_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(18),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n375,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_17_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(17),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n376,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_16_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(16),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n377,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_15_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(15),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n378,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_14_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(14),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n379,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_13_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(13),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n380,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_12_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(12),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n381,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_11_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(11),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n382,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_10_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(10),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n383,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_9_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(9),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n384,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_8_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(8),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n385,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_7_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(7),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n386,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_6_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(6),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n387,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_5_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(5),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n388,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_4_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(4),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n389,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_3_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(3),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n390,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_2_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(2),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n391,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_1_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(1),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n392,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch_0_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n393,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt_0_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n914,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/back_cnt_0_s2\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1131,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_3_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(3),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1285,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_1_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(1),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1287,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_0_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1288,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_7_s4\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(7),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1560,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_6_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(6),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1561,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_5_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(5),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1562,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_4_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(4),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1563,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_3_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(3),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1564,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_2_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(2),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1565,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_1_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(1),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1566,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_0_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1567,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/gmii_tx_er_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_mac_tx_ctrl_tx_er_from_mac,
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1587,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/type_ptr_3_s3\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/type_ptr\(3),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1912,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/type_ptr_2_s3\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/type_ptr\(2),
  D => u_triple_speed_mac_u_mac_tx_ctrl_n1913,
  CLK => gtx_clk,
  PRESET => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/cnt_0_s3\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/cnt\(0),
  D => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n378,
  CLK => gtx_clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/WCtrlDataStart_s4\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart_q_10,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/RStatStart_s4\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => u_triple_speed_mac_u_miim_block_u_eth_miim_RStatStart,
  D => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart_q_14,
  CLK => clk,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_mac_rx_ctrl/c_state_0_s2\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => \u_triple_speed_mac/u_mac_rx_ctrl/c_state\(0),
  D => u_triple_speed_mac_u_mac_rx_ctrl_n_state_0_24,
  CLK => rgmii_rxc,
  CLEAR => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  CE => VCC_0);
\u_triple_speed_mac/u_miim_block/u_eth_miim/n150_s4\: LUT4
generic map (
  INIT => X"CF20"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_n150,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_InProgress,
  I1 => NN,
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_CountEq0,
  I3 => \u_triple_speed_mac/u_miim_block/u_eth_miim/BitCounter\(0));
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/MdcEn_Z_s0\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_MdcEn_Z,
  I0 => NN,
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_CountEq0);
\u_triple_speed_mac/u_mac_rx_ctrl/n606_s7\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n606_15,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_n606_12,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(13),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg_15_s4\: LUT2
generic map (
  INIT => X"B"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_rx_frm_lgt_reg_15,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n610_s7\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n610_15,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n610_12,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(9),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n615_s5\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n615_12,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_n615,
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(4),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n618_s3\: LUT4
generic map (
  INIT => X"7800"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n618,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(0),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(1),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n619_s4\: LUT3
generic map (
  INIT => X"60"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n619,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(0),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n2333_s3\: LUT4
generic map (
  INIT => X"0E00"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n2333,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_align_reg\(0),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_rx_align_err_reg,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_speedis1000_reg3,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n2335_s2\: LUT4
generic map (
  INIT => X"E000"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n2335,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_col_reg\(0),
  I1 => u_triple_speed_mac_u_mac_rx_ctrl_rx_col_err_reg,
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_hd_ena_reg3,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n882_s3\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n882,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(7),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(7),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n882_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n882_11,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(7));
\u_triple_speed_mac/u_mac_rx_ctrl/n883_s3\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n883,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(6),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(6),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n883_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n883_11,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(6));
\u_triple_speed_mac/u_mac_rx_ctrl/n884_s3\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n884,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(5),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(5),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n884_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n884_11,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(5));
\u_triple_speed_mac/u_mac_rx_ctrl/n885_s3\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n885,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(4),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(4),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n885_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n885_11,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(4));
\u_triple_speed_mac/u_mac_rx_ctrl/n886_s3\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n886,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(3),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(3),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n886_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n886_11,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(3));
\u_triple_speed_mac/u_mac_rx_ctrl/n887_s3\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n887,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(2),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(2),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n887_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n887_11,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(2));
\u_triple_speed_mac/u_mac_rx_ctrl/n888_s3\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n888,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(1),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(1),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n888_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n888_11,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(1));
\u_triple_speed_mac/u_mac_rx_ctrl/n889_s3\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n889,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_statistics_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(0),
  I2 => \u_triple_speed_mac/u_mac_rx_ctrl/clk_ena_reg\(0),
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n889_s4\: LUT2
generic map (
  INIT => X"8"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n889_11,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rxd_reg\(0));
\u_triple_speed_mac/u_mac_rx_ctrl/n1317_s4\: LUT4
generic map (
  INIT => X"7F30"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n1317,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_type_ptr_4,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_7,
  I3 => \u_triple_speed_mac/u_mac_rx_ctrl/type_ptr\(2));
\u_triple_speed_mac/u_mac_rx_ctrl/type_ptr_4_s9\: LUT3
generic map (
  INIT => X"B0"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_type_ptr_4_15,
  I0 => u_triple_speed_mac_u_mac_rx_ctrl_type_ptr_4,
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/rx_dv_reg\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_vlan_reg_7);
\u_triple_speed_mac/u_mac_tx_ctrl/n329_s7\: LUT4
generic map (
  INIT => X"00F4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n329,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n828,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_latch,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable);
\u_triple_speed_mac/u_mac_tx_ctrl/n330_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n330,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(15),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(15),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n331_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n331,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(14),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(14),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n332_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n332,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(13),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(13),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n333_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n333,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(12),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(12),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n334_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n334,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(11),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(11),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n335_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n335,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(10),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(10),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n336_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n336,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(9),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(9),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n337_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n337,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(8),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(8),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n338_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n338,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(7),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(7),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n339_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n339,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(6),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(6),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n340_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n340,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(5),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(5),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n341_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n341,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(4),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(4),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n342_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n342,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(3),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n343_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n343,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(2),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n344_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n344,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(1),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n345_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n345,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_latch\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_val_reg2\(0),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n346_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n346,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(47),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(47),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n347_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n347,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(46),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(46),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n348_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n348,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(45),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(45),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n349_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n349,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(44),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(44),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n350_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n350,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(43),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(43),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n351_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n351,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(42),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(42),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n352_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n352,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(41),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(41),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n353_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n353,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(40),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(40),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n354_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n354,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(39),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(39),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n355_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n355,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(38),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(38),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n356_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n356,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(37),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(37),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n357_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n357,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(36),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(36),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n358_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n358,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(35),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(35),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n359_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n359,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(34),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(34),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n360_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n360,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(33),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(33),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n361_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n361,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(32),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(32),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n362_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n362,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(31),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(31),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n363_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n363,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(30),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(30),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n364_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n364,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(29),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(29),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n365_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n365,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(28),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(28),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n366_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n366,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(27),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(27),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n367_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n367,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(26),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(26),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n368_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n368,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(25),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(25),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n369_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n369,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(24),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(24),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n370_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n370,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(23),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(23),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n371_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n371,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(22),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(22),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n372_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n372,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(21),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(21),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n373_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n373,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(20),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(20),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n374_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n374,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(19),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(19),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n375_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n375,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(18),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(18),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n376_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n376,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(17),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(17),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n377_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n377,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(16),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(16),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n378_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n378,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(15),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(15),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n379_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n379,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(14),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(14),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n380_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n380,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(13),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(13),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n381_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n381,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(12),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(12),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n382_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n382,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(11),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(11),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n383_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n383,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(10),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(10),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n384_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n384,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(9),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(9),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n385_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n385,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(8),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(8),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n386_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n386,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(7),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(7),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n387_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n387,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(6),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(6),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n388_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n388,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(5),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(5),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n389_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n389,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(4),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(4),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n390_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n390,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(3),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n391_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n391,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(2),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n392_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n392,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(1),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n393_s4\: LUT4
generic map (
  INIT => X"0C0A"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n393,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_latch\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_pause_source_addr_reg2\(0),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_hd_state_enable,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_pause_req_reg2);
\u_triple_speed_mac/u_mac_tx_ctrl/n914_s5\: LUT4
generic map (
  INIT => X"0B04"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n914,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_10,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt_15_s7\: LUT3
generic map (
  INIT => X"F4"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_14,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_10,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n862);
\u_triple_speed_mac/u_mac_tx_ctrl/n1131_s3\: LUT4
generic map (
  INIT => X"37C0"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1131,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n780_7,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1026,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_10,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/back_cnt\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n1026_s7\: LUT3
generic map (
  INIT => X"E0"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1026_12,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n780_7,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1026_10,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1026);
\u_triple_speed_mac/u_mac_tx_ctrl/n1285_s3\: LUT4
generic map (
  INIT => X"3CA0"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1285,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_retrans_cnt_4,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1672_4,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(3),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1269);
\u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt_4_s6\: LUT2
generic map (
  INIT => X"B"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_retrans_cnt_4_14,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n1269,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_retrans_cnt_4);
\u_triple_speed_mac/u_mac_tx_ctrl/n1287_s3\: LUT4
generic map (
  INIT => X"3AC0"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1287,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_retrans_cnt_4,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(0),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1269,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(1));
\u_triple_speed_mac/u_mac_tx_ctrl/n1288_s4\: LUT3
generic map (
  INIT => X"2C"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1288,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_retrans_cnt_4,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1269,
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/retrans_cnt\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/n1560_s3\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1560,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(7),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(7),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_ena_reg3);
\u_triple_speed_mac/u_mac_tx_ctrl/n1561_s3\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1561,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(6),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(6),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_ena_reg3);
\u_triple_speed_mac/u_mac_tx_ctrl/n1562_s3\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1562,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(5),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(5),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_ena_reg3);
\u_triple_speed_mac/u_mac_tx_ctrl/n1563_s3\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1563,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(4),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(4),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_ena_reg3);
\u_triple_speed_mac/u_mac_tx_ctrl/n1564_s3\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1564,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(3),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(3),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_ena_reg3);
\u_triple_speed_mac/u_mac_tx_ctrl/n1565_s3\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1565,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(2),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(2),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_ena_reg3);
\u_triple_speed_mac/u_mac_tx_ctrl/n1566_s3\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1566,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(1),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(1),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_ena_reg3);
\u_triple_speed_mac/u_mac_tx_ctrl/n1567_s3\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1567,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/gmii_txd_int\(0),
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/tx_mac_data_reg\(0),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_ena_reg3);
\u_triple_speed_mac/u_mac_tx_ctrl/n1587_s3\: LUT4
generic map (
  INIT => X"CA00"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1587,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_tx_er_from_mac,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_error_reg,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_tx_ena_reg3);
\u_triple_speed_mac/u_mac_tx_ctrl/n1912_s3\: LUT4
generic map (
  INIT => X"F7F8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1912,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/type_ptr\(2),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1906,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/type_ptr\(3));
\u_triple_speed_mac/u_mac_tx_ctrl/type_ptr_4_s4\: LUT2
generic map (
  INIT => X"E"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_type_ptr_4,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1906);
\u_triple_speed_mac/u_mac_tx_ctrl/n1913_s3\: LUT3
generic map (
  INIT => X"BE"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1913,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_tx_mac_last_reg1,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/type_ptr\(2),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1906);
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/n378_s4\: LUT4
generic map (
  INIT => X"0788"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_n378,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_cnt_1,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init,
  I3 => \u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/cnt\(0));
\u_triple_speed_mac/u_mac_tx_ctrl/u_crc_gen/cnt_1_s6\: LUT3
generic map (
  INIT => X"F8"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_cnt_1_13,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_u_crc_gen_cnt_1,
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_crc_init);
\u_triple_speed_mac/u_miim_block/u_eth_miim/WCtrlDataStart_q_s5\: LUT4
generic map (
  INIT => X"00F4"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart_q_10,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlData_q3,
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlData_q2,
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart,
  I3 => u_triple_speed_mac_u_miim_block_u_eth_miim_EndBusy);
\u_triple_speed_mac/u_miim_block/u_eth_miim/WCtrlDataStart_q_s7\: LUT4
generic map (
  INIT => X"00F4"
)
port map (
  F => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart_q_14,
  I0 => u_triple_speed_mac_u_miim_block_u_eth_miim_RStat_q3,
  I1 => u_triple_speed_mac_u_miim_block_u_eth_miim_RStat_q2,
  I2 => u_triple_speed_mac_u_miim_block_u_eth_miim_RStatStart,
  I3 => u_triple_speed_mac_u_miim_block_u_eth_miim_EndBusy);
\u_triple_speed_mac/u_mac_rx_ctrl/n_state_0_s12\: LUT3
generic map (
  INIT => X"41"
)
port map (
  F => u_triple_speed_mac_u_mac_rx_ctrl_n_state_0_24,
  I0 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state\(1),
  I1 => \u_triple_speed_mac/u_mac_rx_ctrl/c_state\(0),
  I2 => u_triple_speed_mac_u_mac_rx_ctrl_n_state_0);
\u_triple_speed_mac/u_mac_tx_ctrl/n904_s3\: LUT4
generic map (
  INIT => X"1444"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n904,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(10),
  I2 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(9),
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_n1813);
\u_triple_speed_mac/u_mac_tx_ctrl/n1815_s4\: LUT4
generic map (
  INIT => X"0060"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n1815,
  I0 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(7),
  I1 => u_triple_speed_mac_u_mac_tx_ctrl_n1814_9,
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_clk_tx_ena_int,
  I3 => u_triple_speed_mac_u_mac_tx_ctrl_frm_byte_cnt_15_10);
\u_triple_speed_mac/u_mac_tx_ctrl/n907_s3\: LUT3
generic map (
  INIT => X"14"
)
port map (
  F => u_triple_speed_mac_u_mac_tx_ctrl_n907,
  I0 => u_triple_speed_mac_u_mac_tx_ctrl_n862,
  I1 => \u_triple_speed_mac/u_mac_tx_ctrl/frm_byte_cnt\(7),
  I2 => u_triple_speed_mac_u_mac_tx_ctrl_n1814_9);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/n26_s2\: INV
port map (
  O => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_n26,
  I => rstn);
\u_triple_speed_mac/u_miim_block/mdio_oen_d_s0\: INV
port map (
  O => mdio_oen,
  I => u_triple_speed_mac_u_miim_block_u_eth_miim_outctrl_mdio_oe);
\u_triple_speed_mac/u_mac_rx_if_block/u_rgmii_rx_if/gmii_rxd_10100m_reg_15_s3\: INV
port map (
  O => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_gmii_rxd_10100m_reg_15,
  I => u_triple_speed_mac_u_mac_rx_if_block_u_rgmii_rx_if_speedis1000_reg2);
\u_triple_speed_mac/u_mac_rx_ctrl/rx_ena_reg3_s3\: INV
port map (
  O => u_triple_speed_mac_u_mac_rx_ctrl_rx_ena_reg3_7,
  I => u_triple_speed_mac_u_mac_rx_if_block_u_mac_rx_if_mux_gmii_rx_dv_int_Z);
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/n54_s2\: INV
port map (
  O => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n54,
  I => NN);
\u_triple_speed_mac/u_mac_rx_ctrl/n1335_s60\: INV
port map (
  O => u_triple_speed_mac_u_mac_rx_ctrl_n1335_91,
  I => \u_triple_speed_mac/u_mac_rx_ctrl/rx_frm_lgt_reg\(1));
\u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/n41_s2\: INV
port map (
  O => u_triple_speed_mac_u_miim_block_u_eth_miim_clkgen_n41,
  I => \u_triple_speed_mac/u_miim_block/u_eth_miim/clkgen/Counter\(0));
\u_triple_speed_mac/u_miim_block/u_eth_miim/WCtrlDataStart_q_s8\: INV
port map (
  O => u_triple_speed_mac_u_miim_block_u_eth_miim_WCtrlDataStart_q_16,
  I => u_triple_speed_mac_u_miim_block_u_eth_miim_EndBusy);
VCC_s11: VCC
port map (
  V => VCC_0);
GND_s12: GND
port map (
  G => GND_0);
GSR_0: GSR
port map (
  GSRI => VCC_0);
  rx_mac_clk <= rgmii_rxc;
  tx_mac_clk <= gtx_clk;
  mdc <= NN;
  rx_pause_req <= NN_0;
  rx_statistics_vector(5) <= NN_0;
  tx_collision <= NN_1;
  tx_mac_ready <= NN_2;
  tx_retransmit <= NN_3;
end beh;
