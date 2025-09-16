library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package miim_pkg is
  constant bmcr_reg_addr: std_logic_vector(4 downto 0) := 5X"00";
  constant bmsr_reg_addr: std_logic_vector(4 downto 0) := 5X"01";
  constant phyid1_reg_addr: std_logic_vector(4 downto 0) := 5X"02";
  constant phyid2_reg_addr: std_logic_vector(4 downto 0) := 5X"03";
  constant anar_reg_addr: std_logic_vector(4 downto 0) := 5X"04";
  constant gbcr_reg_addr: std_logic_vector(4 downto 0) := 5X"09";
  constant gbsr_reg_addr: std_logic_vector(4 downto 0) := 5X"0A";

  constant rtl8211f_default_page: std_logic_vector(11 downto 0) := 12X"000";
  
  constant rtl8211f_pagsr_reg_page: std_logic_vector(11 downto 0) := 12X"a43";
  constant rtl8211f_pagsr_reg_addr: std_logic_vector(4 downto 0) := 5X"1F";

  constant rtl8211f_physr_reg_page: std_logic_vector(11 downto 0) := 12X"a43";
  constant rtl8211f_physr_reg_addr: std_logic_vector(4 downto 0) := 5X"1A";

    type bmsr_t is record
    o100base_t4: std_logic; -- 1.15
    o100base_tx_full: std_logic; -- 1.14
    o100base_tx_half: std_logic; -- 1.13
    o10base_t_full: std_logic; -- 1.12
    o10base_t_half: std_logic; -- 1.11
    o10base_t2_full: std_logic; -- 1.10
    o10base_t2_half: std_logic; -- 1.9
    o1000base_t_ex_st: std_logic; -- 1.8
    uni_directional_ability: std_logic; -- 1.7
    preamble_suppression: std_logic; -- 1.6
    auto_negotiation_complete: std_logic; -- 1.5
    remote_fault: std_logic; -- 1.4
    auto_negotiation_ability: std_logic; -- 1.3
    link_status: std_logic; -- 1.2
    jabber_detect: std_logic; -- 1.1
    extended_capability: std_logic; -- 1.0
  end record;

  type bmcr_t is record
    reset: std_logic; -- 0.15
    loopback: std_logic; -- 0.14
    speed: std_logic_vector(1 downto 0); -- 0.13, 0.6
    auto_negotiation_enable: std_logic; -- 0.12
    power_down: std_logic; -- 0.11
    isolate: std_logic; -- 0.10
    restart_auto_negotiation: std_logic; -- 0.09
    duplex: std_logic; -- 0.08
    collision_test: std_logic; -- 0.07
    uni_directional: std_logic; --0.05
  end record;

  type anar_t is record
    next_page: std_logic; -- 4.15
    remote_fault: std_logic; -- 4.13
    asymmetric_pause: std_logic; -- 4.11
    o100base_t4: std_logic; -- 4.9
    o100base_tx_full: std_logic; -- 4.8
    o100base_tx_half: std_logic; -- 4.7
    o10base_tx_full: std_logic; -- 4.6
    o10base_tx_half: std_logic; -- 4.5
  end record;

  type gbcr_t is record
    test_mode: std_logic_vector(2 downto 0); -- 9.15:13
    master_slave_manual_config_enable: std_logic; -- 9.12
    master_slave_value: std_logic; -- 9.11
    port_type: std_logic; -- 9.10
    o1000base_t_full_duplex: std_logic; -- 9.9
  end record;

  type gbsr_t is record
    master_slave_config_fault: std_logic; -- 10.15
    master_slave_config_resolution: std_logic; -- 10.14
    local_receiver_status: std_logic; -- 10.13
    remote_receiver_status: std_logic; -- 10.12
    link_partner_1000base_t_full_duplex_cap: std_logic; -- 10.11
    link_partner_1000base_t_half_duplex_cap: std_logic; -- 10.10
    idle_error_count: unsigned(7 downto 0); -- 10.7:0
  end record;

  type physr_t is record
    aldps_state: std_logic; -- 26.14
    mdi_plug: std_logic; -- 26.13
    nway_enable: std_logic; -- 26.12
    master_mode: std_logic; -- 26.11
    eee_cap: std_logic; -- 26.8
    rx_flow_enable: std_logic; -- 26.7
    tx_flow_enable: std_logic; -- 26.6
    speed: std_logic_vector(1 downto 0); -- 26.5:4
    duplex: std_logic; -- 26.3
    link: std_logic; -- 26.2
    mdi_crossover_status: std_logic; -- 26.1
    jabber: std_logic; -- 26.0
  end record;

  function read_bmsr(rddata: std_logic_vector(15 downto 0))
    return bmsr_t;
  function read_bmcr(rddata: std_logic_vector(15 downto 0))
    return bmcr_t;
  function read_gbsr(rddata: std_logic_vector(15 downto 0))
    return gbsr_t;
  function read_gbcr(rddata: std_logic_vector(15 downto 0))
    return gbcr_t;
  function read_physr(rddata: std_logic_vector(15 downto 0))
    return physr_t;
end package miim_pkg;

package body miim_pkg is
  function read_bmsr(rddata: std_logic_vector(15 downto 0))
    return bmsr_t is
    variable result: bmsr_t;
  begin
    result.o100base_t4 := rddata(15);
    result.o100base_tx_full := rddata(14);
    result.o100base_tx_half := rddata(13);
    result.o10base_t_full := rddata(12);
    result.o10base_t_half := rddata(11);
    result.o10base_t2_full := rddata(10);
    result.o10base_t2_half := rddata(9);
    result.o1000base_t_ex_st := rddata(8);
    result.uni_directional_ability := rddata(7);
    result.preamble_suppression := rddata(6);
    result.auto_negotiation_complete := rddata(5);
    result.remote_fault := rddata(4);
    result.auto_negotiation_ability := rddata(3);
    result.link_status := rddata(2);
    result.jabber_detect := rddata(1);
    result.extended_capability := rddata(0);
    return result;
  end function read_bmsr;

  function read_bmcr(rddata: std_logic_vector(15 downto 0))
    return bmcr_t is
    variable result: bmcr_t;
  begin
    result.reset := rddata(15);
    result.loopback := rddata(14);
    result.speed(0) := rddata(13);
    result.speed(1) := rddata(6);
    result.auto_negotiation_enable := rddata(12);
    result.power_down := rddata(11);
    result.isolate := rddata(10);
    result.restart_auto_negotiation := rddata(9);
    result.duplex := rddata(8);
    result.collision_test := rddata(7);
    result.uni_directional := rddata(5);
    return result;
  end function read_bmcr;

  function read_gbsr(rddata: std_logic_vector(15 downto 0))
    return gbsr_t is
    variable result: gbsr_t;
  begin
    result.master_slave_config_fault := rddata(15);
    result.master_slave_config_resolution := rddata(14);
    result.local_receiver_status := rddata(13);
    result.remote_receiver_status := rddata(12);
    result.link_partner_1000base_t_full_duplex_cap := rddata(11);
    result.link_partner_1000base_t_half_duplex_cap := rddata(10);
    result.idle_error_count := unsigned(rddata(7 downto 0));
    return result;
  end function read_gbsr;

  function read_gbcr(rddata: std_logic_vector(15 downto 0))
    return gbcr_t is
    variable result: gbcr_t;
  begin
    result.test_mode := rddata(15 downto 13);
    result.master_slave_manual_config_enable := rddata(12);
    result.master_slave_value := rddata(11);
    result.port_type := rddata(10);
    result.o1000base_t_full_duplex := rddata(9);
    return result;
  end function read_gbcr;

  function read_physr(rddata: std_logic_vector(15 downto 0))
    return physr_t is
    variable result: physr_t;
  begin
    result.aldps_state := rddata(14);
    result.mdi_plug := rddata(13);
    result.nway_enable := rddata(12);
    result.master_mode := rddata(11);
    result.eee_cap := rddata(8);
    result.rx_flow_enable := rddata(7);
    result.tx_flow_enable := rddata(6);
    result.speed := rddata(5 downto 4);
    result.duplex := rddata(3);
    result.link := rddata(2);
    result.mdi_crossover_status := rddata(1);
    result.jabber := rddata(0);
    return result;
  end function read_physr;
  
end package body miim_pkg;

