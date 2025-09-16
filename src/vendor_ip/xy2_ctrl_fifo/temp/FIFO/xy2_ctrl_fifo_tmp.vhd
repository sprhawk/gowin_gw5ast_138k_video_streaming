--Copyright (C)2014-2025 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--Tool Version: V1.9.11.02
--Part Number: GW5AST-LV138PG484AC1/I0
--Device: GW5AST-138
--Device Version: B
--Created Time: Thu Sep 11 18:40:18 2025

--Change the instance name and port connections to the signal names
----------Copy here to design--------

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

your_instance_name: xy2_ctrl_fifo
	port map (
		Data => Data,
		Reset => Reset,
		WrClk => WrClk,
		RdClk => RdClk,
		WrEn => WrEn,
		RdEn => RdEn,
		AlmostEmptySetTh => AlmostEmptySetTh,
		AlmostEmptyClrTh => AlmostEmptyClrTh,
		AlmostFullSetTh => AlmostFullSetTh,
		AlmostFullClrTh => AlmostFullClrTh,
		Wnum => Wnum,
		Rnum => Rnum,
		Almost_Empty => Almost_Empty,
		Almost_Full => Almost_Full,
		Q => Q,
		Empty => Empty,
		Full => Full
	);

----------Copy end-------------------
