//Copyright (C)2014-2025 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//Tool Version: V1.9.11.02 
//Created Time: 2025-09-16 12:26:10
create_clock -name tck -period 50 -waveform {0 25} [get_ports {tck_pad_i}]
create_clock -name uart_rx_clk -period 1000 -waveform {0 500} [get_nets {uart_app1/uart_master_top1/i4/rxclk_Z}]
create_clock -name clk_50M -period 20 -waveform {0 10} [get_ports {sys_clk}] -add
create_clock -name rgmii_rxc -period 8 -waveform {0 4} [get_ports {rgmii_rxc}] -add
create_generated_clock -name xy2_pll_clk_8M -source [get_ports {sys_clk}] -master_clock clk_50M -divide_by 25 -multiply_by 4 -duty_cycle 5 [get_pins {udp_app1/xy2_pll1/u_pll/PLL_inst/CLKOUT0}]
create_generated_clock -name xy2_pll_clk_100M -source [get_ports {sys_clk}] -master_clock clk_50M -divide_by 1 -multiply_by 2 [get_pins {udp_app1/xy2_pll1/u_pll/PLL_inst/CLKOUT1}]
create_generated_clock -name clk_125M -source [get_ports {sys_clk}] -master_clock clk_50M -divide_by 2 -multiply_by 5 -duty_cycle 50 -add [get_pins {pll1/u_pll/PLL_inst/CLKOUT0}]
set_clock_groups -asynchronous -group [get_clocks {rgmii_rxc}] -group [get_clocks {clk_50M}] -group [get_clocks {tck}] -group [get_clocks {clk_125M}] -group [get_clocks {xy2_pll_clk_8M}] -group [get_clocks {xy2_pll_clk_100M}] -group [get_clocks {uart_rx_clk}]
set_input_delay -clock rgmii_rxc 2.8 -max -rise [get_ports {rgmii_rx_ctl rgmii_rxd[3] rgmii_rxd[2] rgmii_rxd[1] rgmii_rxd[0]}]
set_input_delay -clock rgmii_rxc 1.2 -min -rise -add_delay [get_ports {rgmii_rx_ctl rgmii_rxd[3] rgmii_rxd[2] rgmii_rxd[1] rgmii_rxd[0]}]
set_input_delay -clock rgmii_rxc 2.8 -clock_fall -max -fall -add_delay [get_ports {rgmii_rx_ctl rgmii_rxd[3] rgmii_rxd[2] rgmii_rxd[1] rgmii_rxd[0]}]
set_input_delay -clock rgmii_rxc 1.2 -clock_fall -min -fall -add_delay [get_ports {rgmii_rx_ctl rgmii_rxd[3] rgmii_rxd[2] rgmii_rxd[1] rgmii_rxd[0]}]
