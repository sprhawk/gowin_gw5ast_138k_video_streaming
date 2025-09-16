--Copyright (C)2014-2025 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--Tool Version: V1.9.11.02
--Part Number: GW5AST-LV138PG484AC1/I0
--Device: GW5AST-138
--Device Version: B
--Created Time: Tue Sep  9 09:59:15 2025

--Change the instance name and port connections to the signal names
----------Copy here to design--------

component fifo_32bit
	port (
		Data: in std_logic_vector(31 downto 0);
		Reset: in std_logic;
		WrClk: in std_logic;
		RdClk: in std_logic;
		WrEn: in std_logic;
		RdEn: in std_logic;
		Q: out std_logic_vector(31 downto 0);
		Empty: out std_logic;
		Full: out std_logic
	);
end component;

your_instance_name: fifo_32bit
	port map (
		Data => Data,
		Reset => Reset,
		WrClk => WrClk,
		RdClk => RdClk,
		WrEn => WrEn,
		RdEn => RdEn,
		Q => Q,
		Empty => Empty,
		Full => Full
	);

----------Copy end-------------------
