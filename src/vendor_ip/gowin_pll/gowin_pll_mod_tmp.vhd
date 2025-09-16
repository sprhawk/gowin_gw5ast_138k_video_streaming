--Copyright (C)2014-2025 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--Tool Version: V1.9.11.02
--Part Number: GW5AST-LV138FPG676AC1/I0
--Device: GW5AST-138
--Device Version: B
--Created Time: Tue Aug 12 12:11:58 2025

--Change the instance name and port connections to the signal names
----------Copy here to design--------

component Gowin_PLL_MOD
    port (
        lock: out std_logic;
        clkout0: out std_logic;
        clkout1: out std_logic;
        clkin: in std_logic;
        reset: in std_logic;
        icpsel: in std_logic_vector(5 downto 0);
        lpfres: in std_logic_vector(2 downto 0);
        lpfcap: in std_logic_vector(1 downto 0)
    );
end component;

your_instance_name: Gowin_PLL_MOD
    port map (
        lock => lock,
        clkout0 => clkout0,
        clkout1 => clkout1,
        clkin => clkin,
        reset => reset,
        icpsel => icpsel,
        lpfres => lpfres,
        lpfcap => lpfcap
    );

----------Copy end-------------------
