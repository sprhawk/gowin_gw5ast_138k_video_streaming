--
--Written by GowinSynthesis
--Tool Version "V1.9.11.02"
--Thu Sep 11 18:40:18 2025

--Source file index table:
--file0 "\/home/hongbo/Developer/FPGA/Gowin/prjs/ETH/src/xy2_ctrl_fifo/temp/FIFO/fifo_define.v"
--file1 "\/home/hongbo/Developer/FPGA/Gowin/prjs/ETH/src/xy2_ctrl_fifo/temp/FIFO/fifo_parameter.v"
--file2 "\/home/hongbo/.local/Gowin_V1.9.11.02_SP1_linux/IDE/ipcore/FIFO/data/edc.v"
--file3 "\/home/hongbo/.local/Gowin_V1.9.11.02_SP1_linux/IDE/ipcore/FIFO/data/fifo.v"
--file4 "\/home/hongbo/.local/Gowin_V1.9.11.02_SP1_linux/IDE/ipcore/FIFO/data/fifo_top.v"
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library gw5a;
use gw5a.components.all;

entity xy2_ctrl_fifo is
port(
  Data :  in std_logic_vector(7 downto 0);
  Reset :  in std_logic;
  WrClk :  in std_logic;
  RdClk :  in std_logic;
  WrEn :  in std_logic;
  RdEn :  in std_logic;
  AlmostEmptySetTh :  in std_logic_vector(1 downto 0);
  AlmostEmptyClrTh :  in std_logic_vector(1 downto 0);
  AlmostFullSetTh :  in std_logic_vector(3 downto 0);
  AlmostFullClrTh :  in std_logic_vector(3 downto 0);
  Wnum :  out std_logic_vector(4 downto 0);
  Rnum :  out std_logic_vector(2 downto 0);
  Almost_Empty :  out std_logic;
  Almost_Full :  out std_logic;
  Q :  out std_logic_vector(31 downto 0);
  Empty :  out std_logic;
  Full :  out std_logic);
end xy2_ctrl_fifo;
architecture beh of xy2_ctrl_fifo is
  signal fifo_inst_rcnt_sub_0 : std_logic ;
  signal fifo_inst_rcnt_sub_1 : std_logic ;
  signal fifo_inst_rcnt_sub_2 : std_logic ;
  signal fifo_inst_wcnt_sub_2 : std_logic ;
  signal fifo_inst_wcnt_sub_3 : std_logic ;
  signal fifo_inst_wcnt_sub_4 : std_logic ;
  signal fifo_inst_n395 : std_logic ;
  signal fifo_inst_n395_19 : std_logic ;
  signal fifo_inst_n395_20 : std_logic ;
  signal fifo_inst_n395_21 : std_logic ;
  signal fifo_inst_n395_22 : std_logic ;
  signal fifo_inst_n395_23 : std_logic ;
  signal fifo_inst_n429 : std_logic ;
  signal fifo_inst_n429_19 : std_logic ;
  signal fifo_inst_n429_20 : std_logic ;
  signal fifo_inst_n429_21 : std_logic ;
  signal fifo_inst_n429_22 : std_logic ;
  signal fifo_inst_n429_23 : std_logic ;
  signal fifo_inst_n294 : std_logic ;
  signal fifo_inst_n294_3 : std_logic ;
  signal fifo_inst_n295 : std_logic ;
  signal fifo_inst_n295_3 : std_logic ;
  signal fifo_inst_n21 : std_logic ;
  signal fifo_inst_n25 : std_logic ;
  signal fifo_inst_n301 : std_logic ;
  signal fifo_inst_wfull_val : std_logic ;
  signal fifo_inst_n343 : std_logic ;
  signal fifo_inst_n429_25 : std_logic ;
  signal fifo_inst_n395_25 : std_logic ;
  signal \fifo_inst_Big.wgraynext_0\ : std_logic ;
  signal fifo_inst_wfull_val_4 : std_logic ;
  signal fifo_inst_n422 : std_logic ;
  signal fifo_inst_n444 : std_logic ;
  signal fifo_inst_n444_5 : std_logic ;
  signal \fifo_inst_Big.wbin_num_next_4\ : std_logic ;
  signal fifo_inst_n422_6 : std_logic ;
  signal fifo_inst_n422_7 : std_logic ;
  signal fifo_inst_n422_8 : std_logic ;
  signal fifo_inst_n422_9 : std_logic ;
  signal fifo_inst_n422_10 : std_logic ;
  signal fifo_inst_n444_6 : std_logic ;
  signal fifo_inst_n444_7 : std_logic ;
  signal fifo_inst_n444_8 : std_logic ;
  signal fifo_inst_n444_9 : std_logic ;
  signal fifo_inst_n422_11 : std_logic ;
  signal fifo_inst_n444_10 : std_logic ;
  signal fifo_inst_n444_11 : std_logic ;
  signal fifo_inst_n444_12 : std_logic ;
  signal fifo_inst_n444_13 : std_logic ;
  signal fifo_inst_n444_14 : std_logic ;
  signal fifo_inst_n444_15 : std_logic ;
  signal fifo_inst_Almost_Empty : std_logic ;
  signal fifo_inst_n422_13 : std_logic ;
  signal \fifo_inst_Big.wbin_num_next_0\ : std_logic ;
  signal fifo_inst_rbin_num_next_0 : std_logic ;
  signal fifo_inst_n444_21 : std_logic ;
  signal fifo_inst_rempty_val : std_logic ;
  signal fifo_inst_n4 : std_logic ;
  signal fifo_inst_n9 : std_logic ;
  signal GND_0 : std_logic ;
  signal VCC_0 : std_logic ;
  signal \fifo_inst/reset_r\ : std_logic_vector(1 downto 0);
  signal \fifo_inst/reset_w\ : std_logic_vector(1 downto 0);
  signal \fifo_inst/rbin_num\ : std_logic_vector(2 downto 0);
  signal \fifo_inst/Big.wq1_rptr\ : std_logic_vector(2 downto 0);
  signal \fifo_inst/Big.wq2_rptr\ : std_logic_vector(2 downto 0);
  signal \fifo_inst/Big.rq1_wptr\ : std_logic_vector(2 downto 0);
  signal \fifo_inst/Big.rq2_wptr\ : std_logic_vector(2 downto 0);
  signal \fifo_inst/Big.rptr\ : std_logic_vector(1 downto 0);
  signal \fifo_inst/Big.wptr\ : std_logic_vector(2 downto 0);
  signal \fifo_inst/Big.wbin\ : std_logic_vector(3 downto 0);
  signal \fifo_inst/rcnt_sub\ : std_logic_vector(2 downto 0);
  signal \fifo_inst/wcnt_sub\ : std_logic_vector(4 downto 2);
  signal \fifo_inst/Big.rgraynext\ : std_logic_vector(1 downto 0);
  signal \fifo_inst/Big.wcount_r\ : std_logic_vector(1 downto 0);
  signal \fifo_inst/Big.wgraynext\ : std_logic_vector(1 downto 0);
  signal \fifo_inst/Big.rcount_w_1\ : std_logic_vector(3 downto 2);
  signal \fifo_inst/rbin_num_next\ : std_logic_vector(2 downto 1);
  signal \fifo_inst/Big.wbin_num_next\ : std_logic_vector(4 downto 1);
  signal NN : std_logic;
  signal NN_0 : std_logic;
  signal NN_1 : std_logic;
begin
\fifo_inst/reset_r_0_s0\: DFFPE
port map (
  Q => \fifo_inst/reset_r\(0),
  D => GND_0,
  CLK => fifo_inst_n4,
  PRESET => Reset,
  CE => VCC_0);
\fifo_inst/reset_w_1_s0\: DFFPE
port map (
  Q => \fifo_inst/reset_w\(1),
  D => \fifo_inst/reset_w\(0),
  CLK => fifo_inst_n9,
  PRESET => Reset,
  CE => VCC_0);
\fifo_inst/reset_w_0_s0\: DFFPE
port map (
  Q => \fifo_inst/reset_w\(0),
  D => GND_0,
  CLK => fifo_inst_n9,
  PRESET => Reset,
  CE => VCC_0);
\fifo_inst/rbin_num_2_s0\: DFFCE
port map (
  Q => \fifo_inst/rbin_num\(2),
  D => \fifo_inst/rbin_num_next\(2),
  CLK => RdClk,
  CLEAR => \fifo_inst/reset_r\(1),
  CE => VCC_0);
\fifo_inst/rbin_num_1_s0\: DFFCE
port map (
  Q => \fifo_inst/rbin_num\(1),
  D => \fifo_inst/rbin_num_next\(1),
  CLK => RdClk,
  CLEAR => \fifo_inst/reset_r\(1),
  CE => VCC_0);
\fifo_inst/rbin_num_0_s0\: DFFCE
port map (
  Q => \fifo_inst/rbin_num\(0),
  D => fifo_inst_rbin_num_next_0,
  CLK => RdClk,
  CLEAR => \fifo_inst/reset_r\(1),
  CE => VCC_0);
\fifo_inst/Big.wq1_rptr_2_s0\: DFFCE
port map (
  Q => \fifo_inst/Big.wq1_rptr\(2),
  D => \fifo_inst/rbin_num\(2),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Big.wq1_rptr_1_s0\: DFFCE
port map (
  Q => \fifo_inst/Big.wq1_rptr\(1),
  D => \fifo_inst/Big.rptr\(1),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Big.wq1_rptr_0_s0\: DFFCE
port map (
  Q => \fifo_inst/Big.wq1_rptr\(0),
  D => \fifo_inst/Big.rptr\(0),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Big.wq2_rptr_2_s0\: DFFCE
port map (
  Q => \fifo_inst/Big.wq2_rptr\(2),
  D => \fifo_inst/Big.wq1_rptr\(2),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Big.wq2_rptr_1_s0\: DFFCE
port map (
  Q => \fifo_inst/Big.wq2_rptr\(1),
  D => \fifo_inst/Big.wq1_rptr\(1),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Big.wq2_rptr_0_s0\: DFFCE
port map (
  Q => \fifo_inst/Big.wq2_rptr\(0),
  D => \fifo_inst/Big.wq1_rptr\(0),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Big.rq1_wptr_2_s0\: DFFCE
port map (
  Q => \fifo_inst/Big.rq1_wptr\(2),
  D => \fifo_inst/Big.wptr\(2),
  CLK => RdClk,
  CLEAR => \fifo_inst/reset_r\(1),
  CE => VCC_0);
\fifo_inst/Big.rq1_wptr_1_s0\: DFFCE
port map (
  Q => \fifo_inst/Big.rq1_wptr\(1),
  D => \fifo_inst/Big.wptr\(1),
  CLK => RdClk,
  CLEAR => \fifo_inst/reset_r\(1),
  CE => VCC_0);
\fifo_inst/Big.rq1_wptr_0_s0\: DFFCE
port map (
  Q => \fifo_inst/Big.rq1_wptr\(0),
  D => \fifo_inst/Big.wptr\(0),
  CLK => RdClk,
  CLEAR => \fifo_inst/reset_r\(1),
  CE => VCC_0);
\fifo_inst/Big.rq2_wptr_2_s0\: DFFCE
port map (
  Q => \fifo_inst/Big.rq2_wptr\(2),
  D => \fifo_inst/Big.rq1_wptr\(2),
  CLK => RdClk,
  CLEAR => \fifo_inst/reset_r\(1),
  CE => VCC_0);
\fifo_inst/Big.rq2_wptr_1_s0\: DFFCE
port map (
  Q => \fifo_inst/Big.rq2_wptr\(1),
  D => \fifo_inst/Big.rq1_wptr\(1),
  CLK => RdClk,
  CLEAR => \fifo_inst/reset_r\(1),
  CE => VCC_0);
\fifo_inst/Big.rq2_wptr_0_s0\: DFFCE
port map (
  Q => \fifo_inst/Big.rq2_wptr\(0),
  D => \fifo_inst/Big.rq1_wptr\(0),
  CLK => RdClk,
  CLEAR => \fifo_inst/reset_r\(1),
  CE => VCC_0);
\fifo_inst/Big.rptr_1_s0\: DFFCE
port map (
  Q => \fifo_inst/Big.rptr\(1),
  D => \fifo_inst/Big.rgraynext\(1),
  CLK => RdClk,
  CLEAR => \fifo_inst/reset_r\(1),
  CE => VCC_0);
\fifo_inst/Big.rptr_0_s0\: DFFCE
port map (
  Q => \fifo_inst/Big.rptr\(0),
  D => \fifo_inst/Big.rgraynext\(0),
  CLK => RdClk,
  CLEAR => \fifo_inst/reset_r\(1),
  CE => VCC_0);
\fifo_inst/Big.wptr_2_s0\: DFFCE
port map (
  Q => \fifo_inst/Big.wptr\(2),
  D => \fifo_inst/Big.wbin_num_next\(4),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Big.wptr_1_s0\: DFFCE
port map (
  Q => \fifo_inst/Big.wptr\(1),
  D => \fifo_inst/Big.wgraynext\(1),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Big.wptr_0_s0\: DFFCE
port map (
  Q => \fifo_inst/Big.wptr\(0),
  D => \fifo_inst/Big.wgraynext\(0),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Big.wbin_3_s0\: DFFCE
port map (
  Q => \fifo_inst/Big.wbin\(3),
  D => \fifo_inst/Big.wbin_num_next\(3),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Big.wbin_2_s0\: DFFCE
port map (
  Q => \fifo_inst/Big.wbin\(2),
  D => \fifo_inst/Big.wbin_num_next\(2),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Big.wbin_1_s0\: DFFCE
port map (
  Q => \fifo_inst/Big.wbin\(1),
  D => \fifo_inst/Big.wbin_num_next\(1),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Big.wbin_0_s0\: DFFCE
port map (
  Q => \fifo_inst/Big.wbin\(0),
  D => \fifo_inst_Big.wbin_num_next_0\,
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Empty_s0\: DFFPE
port map (
  Q => NN_0,
  D => fifo_inst_rempty_val,
  CLK => RdClk,
  PRESET => \fifo_inst/reset_r\(1),
  CE => VCC_0);
\fifo_inst/Full_s0\: DFFCE
port map (
  Q => NN_1,
  D => fifo_inst_wfull_val,
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Wnum_4_s0\: DFFCE
port map (
  Q => Wnum(4),
  D => \fifo_inst/wcnt_sub\(4),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Wnum_3_s0\: DFFCE
port map (
  Q => Wnum(3),
  D => \fifo_inst/wcnt_sub\(3),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Wnum_2_s0\: DFFCE
port map (
  Q => Wnum(2),
  D => \fifo_inst/wcnt_sub\(2),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Wnum_1_s0\: DFFCE
port map (
  Q => Wnum(1),
  D => \fifo_inst/Big.wbin\(1),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Wnum_0_s0\: DFFCE
port map (
  Q => Wnum(0),
  D => \fifo_inst/Big.wbin\(0),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Rnum_2_s0\: DFFCE
port map (
  Q => Rnum(2),
  D => \fifo_inst/rcnt_sub\(2),
  CLK => RdClk,
  CLEAR => \fifo_inst/reset_r\(1),
  CE => VCC_0);
\fifo_inst/Rnum_1_s0\: DFFCE
port map (
  Q => Rnum(1),
  D => \fifo_inst/rcnt_sub\(1),
  CLK => RdClk,
  CLEAR => \fifo_inst/reset_r\(1),
  CE => VCC_0);
\fifo_inst/Rnum_0_s0\: DFFCE
port map (
  Q => Rnum(0),
  D => \fifo_inst/rcnt_sub\(0),
  CLK => RdClk,
  CLEAR => \fifo_inst/reset_r\(1),
  CE => VCC_0);
\fifo_inst/reset_r_1_s0\: DFFPE
port map (
  Q => \fifo_inst/reset_r\(1),
  D => \fifo_inst/reset_r\(0),
  CLK => fifo_inst_n4,
  PRESET => Reset,
  CE => VCC_0);
\fifo_inst/Almost_Empty_s1\: DFFPE
generic map (
  INIT => '1'
)
port map (
  Q => Almost_Empty,
  D => fifo_inst_n422_13,
  CLK => RdClk,
  PRESET => \fifo_inst/reset_r\(1),
  CE => fifo_inst_Almost_Empty);
\fifo_inst/Big.mem_Big.mem_0_0_s\: SDPB
generic map (
  BIT_WIDTH_0 => 8,
  BIT_WIDTH_1 => 32,
  READ_MODE => '1',
  RESET_MODE => "ASYNC",
  BLK_SEL_0 => "000",
  BLK_SEL_1 => "000"
)
port map (
  DO(31 downto 0) => Q(31 downto 0),
  CLKA => WrClk,
  CEA => fifo_inst_n21,
  CLKB => RdClk,
  CEB => fifo_inst_n25,
  OCE => VCC_0,
  RESET => \fifo_inst/reset_r\(1),
  ADA(13) => GND_0,
  ADA(12) => GND_0,
  ADA(11) => GND_0,
  ADA(10) => GND_0,
  ADA(9) => GND_0,
  ADA(8) => GND_0,
  ADA(7) => GND_0,
  ADA(6 downto 3) => \fifo_inst/Big.wbin\(3 downto 0),
  ADA(2) => GND_0,
  ADA(1) => GND_0,
  ADA(0) => GND_0,
  ADB(13) => GND_0,
  ADB(12) => GND_0,
  ADB(11) => GND_0,
  ADB(10) => GND_0,
  ADB(9) => GND_0,
  ADB(8) => GND_0,
  ADB(7) => GND_0,
  ADB(6 downto 5) => \fifo_inst/rbin_num\(1 downto 0),
  ADB(4) => GND_0,
  ADB(3) => GND_0,
  ADB(2) => GND_0,
  ADB(1) => GND_0,
  ADB(0) => GND_0,
  DI(31) => GND_0,
  DI(30) => GND_0,
  DI(29) => GND_0,
  DI(28) => GND_0,
  DI(27) => GND_0,
  DI(26) => GND_0,
  DI(25) => GND_0,
  DI(24) => GND_0,
  DI(23) => GND_0,
  DI(22) => GND_0,
  DI(21) => GND_0,
  DI(20) => GND_0,
  DI(19) => GND_0,
  DI(18) => GND_0,
  DI(17) => GND_0,
  DI(16) => GND_0,
  DI(15) => GND_0,
  DI(14) => GND_0,
  DI(13) => GND_0,
  DI(12) => GND_0,
  DI(11) => GND_0,
  DI(10) => GND_0,
  DI(9) => GND_0,
  DI(8) => GND_0,
  DI(7 downto 0) => Data(7 downto 0),
  BLKSELA(2) => GND_0,
  BLKSELA(1) => GND_0,
  BLKSELA(0) => GND_0,
  BLKSELB(2) => GND_0,
  BLKSELB(1) => GND_0,
  BLKSELB(0) => GND_0);
\fifo_inst/rcnt_sub_0_s\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => \fifo_inst/rcnt_sub\(0),
  COUT => fifo_inst_rcnt_sub_0,
  I0 => \fifo_inst/Big.wcount_r\(0),
  I1 => \fifo_inst/rbin_num\(0),
  I3 => GND_0,
  CIN => VCC_0);
\fifo_inst/rcnt_sub_1_s\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => \fifo_inst/rcnt_sub\(1),
  COUT => fifo_inst_rcnt_sub_1,
  I0 => \fifo_inst/Big.wcount_r\(1),
  I1 => \fifo_inst/rbin_num\(1),
  I3 => GND_0,
  CIN => fifo_inst_rcnt_sub_0);
\fifo_inst/rcnt_sub_2_s\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => \fifo_inst/rcnt_sub\(2),
  COUT => fifo_inst_rcnt_sub_2,
  I0 => fifo_inst_n301,
  I1 => GND_0,
  I3 => GND_0,
  CIN => fifo_inst_rcnt_sub_1);
\fifo_inst/wcnt_sub_2_s\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => \fifo_inst/wcnt_sub\(2),
  COUT => fifo_inst_wcnt_sub_2,
  I0 => \fifo_inst/Big.wbin\(2),
  I1 => \fifo_inst/Big.rcount_w_1\(2),
  I3 => GND_0,
  CIN => VCC_0);
\fifo_inst/wcnt_sub_3_s\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => \fifo_inst/wcnt_sub\(3),
  COUT => fifo_inst_wcnt_sub_3,
  I0 => \fifo_inst/Big.wbin\(3),
  I1 => \fifo_inst/Big.rcount_w_1\(3),
  I3 => GND_0,
  CIN => fifo_inst_wcnt_sub_2);
\fifo_inst/wcnt_sub_4_s\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => \fifo_inst/wcnt_sub\(4),
  COUT => fifo_inst_wcnt_sub_4,
  I0 => fifo_inst_n343,
  I1 => GND_0,
  I3 => GND_0,
  CIN => fifo_inst_wcnt_sub_3);
\fifo_inst/n395_s12\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => fifo_inst_n395,
  COUT => fifo_inst_n395_19,
  I0 => fifo_inst_n395_25,
  I1 => AlmostFullClrTh(1),
  I3 => GND_0,
  CIN => \fifo_inst/Big.wbin\(1));
\fifo_inst/n395_s13\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => fifo_inst_n395_20,
  COUT => fifo_inst_n395_21,
  I0 => \fifo_inst/wcnt_sub\(2),
  I1 => AlmostFullClrTh(2),
  I3 => GND_0,
  CIN => fifo_inst_n395_19);
\fifo_inst/n395_s14\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => fifo_inst_n395_22,
  COUT => fifo_inst_n395_23,
  I0 => \fifo_inst/wcnt_sub\(3),
  I1 => AlmostFullClrTh(3),
  I3 => GND_0,
  CIN => fifo_inst_n395_21);
\fifo_inst/n429_s12\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => fifo_inst_n429,
  COUT => fifo_inst_n429_19,
  I0 => fifo_inst_n429_25,
  I1 => AlmostFullSetTh(1),
  I3 => GND_0,
  CIN => \fifo_inst/Big.wbin\(1));
\fifo_inst/n429_s13\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => fifo_inst_n429_20,
  COUT => fifo_inst_n429_21,
  I0 => \fifo_inst/wcnt_sub\(2),
  I1 => AlmostFullSetTh(2),
  I3 => GND_0,
  CIN => fifo_inst_n429_19);
\fifo_inst/n429_s14\: ALU
generic map (
  ALU_MODE => 1
)
port map (
  SUM => fifo_inst_n429_22,
  COUT => fifo_inst_n429_23,
  I0 => \fifo_inst/wcnt_sub\(3),
  I1 => AlmostFullSetTh(3),
  I3 => GND_0,
  CIN => fifo_inst_n429_21);
\fifo_inst/n294_s0\: ALU
generic map (
  ALU_MODE => 3
)
port map (
  SUM => fifo_inst_n294,
  COUT => fifo_inst_n294_3,
  I0 => \fifo_inst/Big.rgraynext\(0),
  I1 => \fifo_inst/Big.rq2_wptr\(0),
  I3 => GND_0,
  CIN => GND_0);
\fifo_inst/n295_s0\: ALU
generic map (
  ALU_MODE => 3
)
port map (
  SUM => fifo_inst_n295,
  COUT => fifo_inst_n295_3,
  I0 => \fifo_inst/Big.rgraynext\(1),
  I1 => \fifo_inst/Big.rq2_wptr\(1),
  I3 => GND_0,
  CIN => fifo_inst_n294_3);
\fifo_inst/n21_s1\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => fifo_inst_n21,
  I0 => NN_1,
  I1 => WrEn);
\fifo_inst/n25_s0\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => fifo_inst_n25,
  I0 => NN_0,
  I1 => RdEn);
\fifo_inst/Big.rgraynext_1_s0\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => \fifo_inst/Big.rgraynext\(1),
  I0 => \fifo_inst/rbin_num_next\(1),
  I1 => \fifo_inst/rbin_num_next\(2));
\fifo_inst/Big.wcount_r_1_s0\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => \fifo_inst/Big.wcount_r\(1),
  I0 => \fifo_inst/Big.rq2_wptr\(2),
  I1 => \fifo_inst/Big.rq2_wptr\(1));
\fifo_inst/n301_s0\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => fifo_inst_n301,
  I0 => \fifo_inst/Big.rq2_wptr\(2),
  I1 => \fifo_inst/rbin_num\(2));
\fifo_inst/Big.wgraynext_0_s0\: LUT3
generic map (
  INIT => X"1E"
)
port map (
  F => \fifo_inst/Big.wgraynext\(0),
  I0 => \fifo_inst/Big.wbin\(2),
  I1 => \fifo_inst_Big.wgraynext_0\,
  I2 => \fifo_inst/Big.wbin\(3));
\fifo_inst/Big.wgraynext_1_s0\: LUT4
generic map (
  INIT => X"07F8"
)
port map (
  F => \fifo_inst/Big.wgraynext\(1),
  I0 => \fifo_inst/Big.wbin\(2),
  I1 => \fifo_inst_Big.wgraynext_0\,
  I2 => \fifo_inst/Big.wbin\(3),
  I3 => \fifo_inst/Big.wptr\(2));
\fifo_inst/wfull_val_s0\: LUT3
generic map (
  INIT => X"90"
)
port map (
  F => fifo_inst_wfull_val,
  I0 => \fifo_inst/Big.wq2_rptr\(0),
  I1 => \fifo_inst/Big.wgraynext\(0),
  I2 => fifo_inst_wfull_val_4);
\fifo_inst/Big.rcount_w_1_3_s0\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => \fifo_inst/Big.rcount_w_1\(3),
  I0 => \fifo_inst/Big.wq2_rptr\(2),
  I1 => \fifo_inst/Big.wq2_rptr\(1));
\fifo_inst/n343_s0\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => fifo_inst_n343,
  I0 => \fifo_inst/Big.wq2_rptr\(2),
  I1 => \fifo_inst/Big.wptr\(2));
\fifo_inst/rbin_num_next_2_s2\: LUT4
generic map (
  INIT => X"7F80"
)
port map (
  F => \fifo_inst/rbin_num_next\(2),
  I0 => \fifo_inst/rbin_num\(0),
  I1 => \fifo_inst/rbin_num\(1),
  I2 => fifo_inst_n25,
  I3 => \fifo_inst/rbin_num\(2));
\fifo_inst/Big.wbin_num_next_2_s3\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => \fifo_inst/Big.wbin_num_next\(2),
  I0 => \fifo_inst/Big.wbin\(2),
  I1 => \fifo_inst_Big.wgraynext_0\);
\fifo_inst/Big.wbin_num_next_3_s3\: LUT3
generic map (
  INIT => X"78"
)
port map (
  F => \fifo_inst/Big.wbin_num_next\(3),
  I0 => \fifo_inst/Big.wbin\(2),
  I1 => \fifo_inst_Big.wgraynext_0\,
  I2 => \fifo_inst/Big.wbin\(3));
\fifo_inst/n429_s15\: LUT2
generic map (
  INIT => X"B"
)
port map (
  F => fifo_inst_n429_25,
  I0 => \fifo_inst/Big.wbin\(0),
  I1 => AlmostFullSetTh(0));
\fifo_inst/n395_s15\: LUT2
generic map (
  INIT => X"B"
)
port map (
  F => fifo_inst_n395_25,
  I0 => \fifo_inst/Big.wbin\(0),
  I1 => AlmostFullClrTh(0));
\fifo_inst/Big.wgraynext_0_s1\: LUT4
generic map (
  INIT => X"4000"
)
port map (
  F => \fifo_inst_Big.wgraynext_0\,
  I0 => NN_1,
  I1 => WrEn,
  I2 => \fifo_inst/Big.wbin\(1),
  I3 => \fifo_inst/Big.wbin\(0));
\fifo_inst/wfull_val_s1\: LUT4
generic map (
  INIT => X"1428"
)
port map (
  F => fifo_inst_wfull_val_4,
  I0 => \fifo_inst/Big.wq2_rptr\(1),
  I1 => \fifo_inst_Big.wbin_num_next_4\,
  I2 => fifo_inst_n343,
  I3 => \fifo_inst/Big.wgraynext\(1));
\fifo_inst/n422_s1\: LUT4
generic map (
  INIT => X"CDD0"
)
port map (
  F => fifo_inst_n422,
  I0 => fifo_inst_n422_6,
  I1 => \fifo_inst/rcnt_sub\(2),
  I2 => fifo_inst_n422_7,
  I3 => fifo_inst_n422_8);
\fifo_inst/n444_s1\: LUT4
generic map (
  INIT => X"000B"
)
port map (
  F => fifo_inst_n444,
  I0 => fifo_inst_n444_6,
  I1 => fifo_inst_n444_7,
  I2 => fifo_inst_n395_23,
  I3 => \fifo_inst/wcnt_sub\(4));
\fifo_inst/n444_s2\: LUT4
generic map (
  INIT => X"000D"
)
port map (
  F => fifo_inst_n444_5,
  I0 => fifo_inst_n444_8,
  I1 => fifo_inst_n444_9,
  I2 => \fifo_inst/wcnt_sub\(4),
  I3 => fifo_inst_n429_23);
\fifo_inst/Big.wbin_num_next_4_s3\: LUT3
generic map (
  INIT => X"80"
)
port map (
  F => \fifo_inst_Big.wbin_num_next_4\,
  I0 => \fifo_inst/Big.wbin\(2),
  I1 => \fifo_inst/Big.wbin\(3),
  I2 => \fifo_inst_Big.wgraynext_0\);
\fifo_inst/n422_s3\: LUT4
generic map (
  INIT => X"EF08"
)
port map (
  F => fifo_inst_n422_6,
  I0 => RdEn,
  I1 => AlmostEmptySetTh(0),
  I2 => \fifo_inst/rcnt_sub\(0),
  I3 => AlmostEmptySetTh(1));
\fifo_inst/n422_s4\: LUT3
generic map (
  INIT => X"E7"
)
port map (
  F => fifo_inst_n422_7,
  I0 => RdEn,
  I1 => AlmostEmptySetTh(0),
  I2 => \fifo_inst/rcnt_sub\(0));
\fifo_inst/n422_s5\: LUT3
generic map (
  INIT => X"3D"
)
port map (
  F => fifo_inst_n422_8,
  I0 => AlmostEmptySetTh(1),
  I1 => \fifo_inst/rcnt_sub\(1),
  I2 => fifo_inst_n422_7);
\fifo_inst/n422_s6\: LUT3
generic map (
  INIT => X"2B"
)
port map (
  F => fifo_inst_n422_9,
  I0 => \fifo_inst/rcnt_sub\(1),
  I1 => AlmostEmptyClrTh(1),
  I2 => fifo_inst_n422_11);
\fifo_inst/n422_s7\: LUT3
generic map (
  INIT => X"40"
)
port map (
  F => fifo_inst_n422_10,
  I0 => \fifo_inst/rcnt_sub\(0),
  I1 => RdEn,
  I2 => AlmostEmptyClrTh(0));
\fifo_inst/n444_s3\: LUT4
generic map (
  INIT => X"BDCF"
)
port map (
  F => fifo_inst_n444_6,
  I0 => \fifo_inst/Big.wbin\(0),
  I1 => fifo_inst_n444_10,
  I2 => fifo_inst_n444_11,
  I3 => \fifo_inst/Big.wbin\(1));
\fifo_inst/n444_s4\: LUT4
generic map (
  INIT => X"6100"
)
port map (
  F => fifo_inst_n444_7,
  I0 => fifo_inst_n444_12,
  I1 => \fifo_inst/wcnt_sub\(3),
  I2 => AlmostFullClrTh(3),
  I3 => WrEn);
\fifo_inst/n444_s5\: LUT4
generic map (
  INIT => X"6100"
)
port map (
  F => fifo_inst_n444_8,
  I0 => fifo_inst_n444_13,
  I1 => \fifo_inst/wcnt_sub\(3),
  I2 => AlmostFullSetTh(3),
  I3 => WrEn);
\fifo_inst/n444_s6\: LUT4
generic map (
  INIT => X"E3FD"
)
port map (
  F => fifo_inst_n444_9,
  I0 => \fifo_inst/Big.wbin\(1),
  I1 => AlmostFullSetTh(0),
  I2 => fifo_inst_n444_14,
  I3 => fifo_inst_n444_15);
\fifo_inst/n422_s8\: LUT3
generic map (
  INIT => X"E7"
)
port map (
  F => fifo_inst_n422_11,
  I0 => RdEn,
  I1 => AlmostEmptyClrTh(0),
  I2 => \fifo_inst/rcnt_sub\(0));
\fifo_inst/n444_s7\: LUT4
generic map (
  INIT => X"FC95"
)
port map (
  F => fifo_inst_n444_10,
  I0 => \fifo_inst/Big.wbin\(1),
  I1 => \fifo_inst/Big.wbin\(0),
  I2 => AlmostFullClrTh(1),
  I3 => AlmostFullClrTh(0));
\fifo_inst/n444_s8\: LUT2
generic map (
  INIT => X"9"
)
port map (
  F => fifo_inst_n444_11,
  I0 => \fifo_inst/wcnt_sub\(2),
  I1 => AlmostFullClrTh(2));
\fifo_inst/n444_s9\: LUT3
generic map (
  INIT => X"01"
)
port map (
  F => fifo_inst_n444_12,
  I0 => AlmostFullClrTh(0),
  I1 => AlmostFullClrTh(1),
  I2 => AlmostFullClrTh(2));
\fifo_inst/n444_s10\: LUT3
generic map (
  INIT => X"01"
)
port map (
  F => fifo_inst_n444_13,
  I0 => AlmostFullSetTh(0),
  I1 => AlmostFullSetTh(1),
  I2 => AlmostFullSetTh(2));
\fifo_inst/n444_s11\: LUT4
generic map (
  INIT => X"FC6A"
)
port map (
  F => fifo_inst_n444_14,
  I0 => \fifo_inst/Big.wbin\(1),
  I1 => AlmostFullSetTh(0),
  I2 => AlmostFullSetTh(1),
  I3 => \fifo_inst/Big.wbin\(0));
\fifo_inst/n444_s12\: LUT2
generic map (
  INIT => X"9"
)
port map (
  F => fifo_inst_n444_15,
  I0 => \fifo_inst/wcnt_sub\(2),
  I1 => AlmostFullSetTh(2));
\fifo_inst/Big.rcount_w_1_2_s1\: LUT3
generic map (
  INIT => X"96"
)
port map (
  F => \fifo_inst/Big.rcount_w_1\(2),
  I0 => \fifo_inst/Big.wq2_rptr\(0),
  I1 => \fifo_inst/Big.wq2_rptr\(2),
  I2 => \fifo_inst/Big.wq2_rptr\(1));
\fifo_inst/Big.wbin_num_next_4_s4\: LUT4
generic map (
  INIT => X"6AAA"
)
port map (
  F => \fifo_inst/Big.wbin_num_next\(4),
  I0 => \fifo_inst/Big.wptr\(2),
  I1 => \fifo_inst/Big.wbin\(2),
  I2 => \fifo_inst/Big.wbin\(3),
  I3 => \fifo_inst_Big.wgraynext_0\);
\fifo_inst/Big.wcount_r_0_s1\: LUT3
generic map (
  INIT => X"96"
)
port map (
  F => \fifo_inst/Big.wcount_r\(0),
  I0 => \fifo_inst/Big.rq2_wptr\(0),
  I1 => \fifo_inst/Big.rq2_wptr\(2),
  I2 => \fifo_inst/Big.rq2_wptr\(1));
\fifo_inst/Almost_Empty_s4\: LUT4
generic map (
  INIT => X"D5FD"
)
port map (
  F => fifo_inst_Almost_Empty,
  I0 => fifo_inst_n422,
  I1 => fifo_inst_n422_9,
  I2 => \fifo_inst/rcnt_sub\(2),
  I3 => fifo_inst_n422_10);
\fifo_inst/n422_s9\: LUT4
generic map (
  INIT => X"1501"
)
port map (
  F => fifo_inst_n422_13,
  I0 => fifo_inst_n422,
  I1 => fifo_inst_n422_9,
  I2 => \fifo_inst/rcnt_sub\(2),
  I3 => fifo_inst_n422_10);
\fifo_inst/Big.wbin_num_next_1_s4\: LUT4
generic map (
  INIT => X"DF20"
)
port map (
  F => \fifo_inst/Big.wbin_num_next\(1),
  I0 => \fifo_inst/Big.wbin\(0),
  I1 => NN_1,
  I2 => WrEn,
  I3 => \fifo_inst/Big.wbin\(1));
\fifo_inst/Big.wbin_num_next_0_s4\: LUT3
generic map (
  INIT => X"9A"
)
port map (
  F => \fifo_inst_Big.wbin_num_next_0\,
  I0 => \fifo_inst/Big.wbin\(0),
  I1 => NN_1,
  I2 => WrEn);
\fifo_inst/rbin_num_next_1_s4\: LUT4
generic map (
  INIT => X"DF20"
)
port map (
  F => \fifo_inst/rbin_num_next\(1),
  I0 => \fifo_inst/rbin_num\(0),
  I1 => NN_0,
  I2 => RdEn,
  I3 => \fifo_inst/rbin_num\(1));
\fifo_inst/rbin_num_next_0_s4\: LUT3
generic map (
  INIT => X"9A"
)
port map (
  F => fifo_inst_rbin_num_next_0,
  I0 => \fifo_inst/rbin_num\(0),
  I1 => NN_0,
  I2 => RdEn);
\fifo_inst/Almost_Full_s4\: DFFCE
generic map (
  INIT => '0'
)
port map (
  Q => NN,
  D => fifo_inst_n444_21,
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/n444_s14\: LUT3
generic map (
  INIT => X"0D"
)
port map (
  F => fifo_inst_n444_21,
  I0 => fifo_inst_n444_5,
  I1 => NN,
  I2 => fifo_inst_n444);
\fifo_inst/rempty_val_s1\: LUT3
generic map (
  INIT => X"41"
)
port map (
  F => fifo_inst_rempty_val,
  I0 => fifo_inst_n295_3,
  I1 => \fifo_inst/Big.rq2_wptr\(2),
  I2 => \fifo_inst/rbin_num_next\(2));
\fifo_inst/Big.rgraynext_0_s1\: LUT4
generic map (
  INIT => X"6966"
)
port map (
  F => \fifo_inst/Big.rgraynext\(0),
  I0 => \fifo_inst/rbin_num_next\(1),
  I1 => \fifo_inst/rbin_num\(0),
  I2 => NN_0,
  I3 => RdEn);
\fifo_inst/n4_s2\: INV
port map (
  O => fifo_inst_n4,
  I => RdClk);
\fifo_inst/n9_s2\: INV
port map (
  O => fifo_inst_n9,
  I => WrClk);
GND_s0: GND
port map (
  G => GND_0);
VCC_s0: VCC
port map (
  V => VCC_0);
GSR_0: GSR
port map (
  GSRI => VCC_0);
  Almost_Full <= NN;
  Empty <= NN_0;
  Full <= NN_1;
end beh;
