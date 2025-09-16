--
--Written by GowinSynthesis
--Tool Version "V1.9.11.02"
--Tue Sep  9 10:12:58 2025

--Source file index table:
--file0 "\/home/hongbo/Developer/FPGA/Gowin/prjs/ETH/src/macaddr_fifo/temp/FIFO/fifo_define.v"
--file1 "\/home/hongbo/Developer/FPGA/Gowin/prjs/ETH/src/macaddr_fifo/temp/FIFO/fifo_parameter.v"
--file2 "\/home/hongbo/.local/Gowin_V1.9.11.02_SP1_linux/IDE/ipcore/FIFO/data/edc.v"
--file3 "\/home/hongbo/.local/Gowin_V1.9.11.02_SP1_linux/IDE/ipcore/FIFO/data/fifo.v"
--file4 "\/home/hongbo/.local/Gowin_V1.9.11.02_SP1_linux/IDE/ipcore/FIFO/data/fifo_top.v"
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library gw5a;
use gw5a.components.all;

entity macaddr_fifo is
port(
  Data :  in std_logic_vector(47 downto 0);
  Reset :  in std_logic;
  WrClk :  in std_logic;
  RdClk :  in std_logic;
  WrEn :  in std_logic;
  RdEn :  in std_logic;
  Q :  out std_logic_vector(47 downto 0);
  Empty :  out std_logic;
  Full :  out std_logic);
end macaddr_fifo;
architecture beh of macaddr_fifo is
  signal \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO31\ : std_logic ;
  signal \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO30\ : std_logic ;
  signal \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO29\ : std_logic ;
  signal \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO28\ : std_logic ;
  signal \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO27\ : std_logic ;
  signal \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO26\ : std_logic ;
  signal \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO25\ : std_logic ;
  signal \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO24\ : std_logic ;
  signal \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO23\ : std_logic ;
  signal \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO22\ : std_logic ;
  signal \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO21\ : std_logic ;
  signal \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO20\ : std_logic ;
  signal \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO19\ : std_logic ;
  signal \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO18\ : std_logic ;
  signal \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO17\ : std_logic ;
  signal \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO16\ : std_logic ;
  signal fifo_inst_n20 : std_logic ;
  signal fifo_inst_n24 : std_logic ;
  signal fifo_inst_rempty_val : std_logic ;
  signal fifo_inst_wfull_val : std_logic ;
  signal fifo_inst_rempty_val_7 : std_logic ;
  signal fifo_inst_rempty_val_8 : std_logic ;
  signal fifo_inst_wfull_val_7 : std_logic ;
  signal fifo_inst_wfull_val_8 : std_logic ;
  signal \fifo_inst_Equal.wbinnext_0\ : std_logic ;
  signal fifo_inst_rbin_num_next_0 : std_logic ;
  signal fifo_inst_n4 : std_logic ;
  signal fifo_inst_n9 : std_logic ;
  signal GND_0 : std_logic ;
  signal VCC_0 : std_logic ;
  signal \fifo_inst/reset_r\ : std_logic_vector(1 downto 0);
  signal \fifo_inst/reset_w\ : std_logic_vector(1 downto 0);
  signal \fifo_inst/rbin_num\ : std_logic_vector(1 downto 0);
  signal \fifo_inst/Equal.wq1_rptr\ : std_logic_vector(1 downto 0);
  signal \fifo_inst/Equal.wq2_rptr\ : std_logic_vector(1 downto 0);
  signal \fifo_inst/Equal.rq1_wptr\ : std_logic_vector(1 downto 0);
  signal \fifo_inst/Equal.rq2_wptr\ : std_logic_vector(1 downto 0);
  signal \fifo_inst/Equal.rptr\ : std_logic_vector(0 downto 0);
  signal \fifo_inst/Equal.wptr\ : std_logic_vector(1 downto 0);
  signal \fifo_inst/Equal.wbin\ : std_logic_vector(0 downto 0);
  signal \fifo_inst/Equal.wbinnext\ : std_logic_vector(1 downto 1);
  signal \fifo_inst/Equal.wgraynext\ : std_logic_vector(0 downto 0);
  signal \fifo_inst/rbin_num_next\ : std_logic_vector(1 downto 1);
  signal \fifo_inst/Equal.rgraynext\ : std_logic_vector(0 downto 0);
  signal NN : std_logic;
  signal NN_0 : std_logic;
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
\fifo_inst/Equal.wq1_rptr_1_s0\: DFFCE
port map (
  Q => \fifo_inst/Equal.wq1_rptr\(1),
  D => \fifo_inst/rbin_num\(1),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Equal.wq1_rptr_0_s0\: DFFCE
port map (
  Q => \fifo_inst/Equal.wq1_rptr\(0),
  D => \fifo_inst/Equal.rptr\(0),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Equal.wq2_rptr_1_s0\: DFFCE
port map (
  Q => \fifo_inst/Equal.wq2_rptr\(1),
  D => \fifo_inst/Equal.wq1_rptr\(1),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Equal.wq2_rptr_0_s0\: DFFCE
port map (
  Q => \fifo_inst/Equal.wq2_rptr\(0),
  D => \fifo_inst/Equal.wq1_rptr\(0),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Equal.rq1_wptr_1_s0\: DFFCE
port map (
  Q => \fifo_inst/Equal.rq1_wptr\(1),
  D => \fifo_inst/Equal.wptr\(1),
  CLK => RdClk,
  CLEAR => \fifo_inst/reset_r\(1),
  CE => VCC_0);
\fifo_inst/Equal.rq1_wptr_0_s0\: DFFCE
port map (
  Q => \fifo_inst/Equal.rq1_wptr\(0),
  D => \fifo_inst/Equal.wptr\(0),
  CLK => RdClk,
  CLEAR => \fifo_inst/reset_r\(1),
  CE => VCC_0);
\fifo_inst/Equal.rq2_wptr_1_s0\: DFFCE
port map (
  Q => \fifo_inst/Equal.rq2_wptr\(1),
  D => \fifo_inst/Equal.rq1_wptr\(1),
  CLK => RdClk,
  CLEAR => \fifo_inst/reset_r\(1),
  CE => VCC_0);
\fifo_inst/Equal.rq2_wptr_0_s0\: DFFCE
port map (
  Q => \fifo_inst/Equal.rq2_wptr\(0),
  D => \fifo_inst/Equal.rq1_wptr\(0),
  CLK => RdClk,
  CLEAR => \fifo_inst/reset_r\(1),
  CE => VCC_0);
\fifo_inst/Equal.rptr_0_s0\: DFFCE
port map (
  Q => \fifo_inst/Equal.rptr\(0),
  D => \fifo_inst/Equal.rgraynext\(0),
  CLK => RdClk,
  CLEAR => \fifo_inst/reset_r\(1),
  CE => VCC_0);
\fifo_inst/Equal.wptr_1_s0\: DFFCE
port map (
  Q => \fifo_inst/Equal.wptr\(1),
  D => \fifo_inst/Equal.wbinnext\(1),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Equal.wptr_0_s0\: DFFCE
port map (
  Q => \fifo_inst/Equal.wptr\(0),
  D => \fifo_inst/Equal.wgraynext\(0),
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Equal.wbin_0_s0\: DFFCE
port map (
  Q => \fifo_inst/Equal.wbin\(0),
  D => \fifo_inst_Equal.wbinnext_0\,
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/Empty_s0\: DFFPE
port map (
  Q => NN,
  D => fifo_inst_rempty_val,
  CLK => RdClk,
  PRESET => \fifo_inst/reset_r\(1),
  CE => VCC_0);
\fifo_inst/Full_s0\: DFFCE
port map (
  Q => NN_0,
  D => fifo_inst_wfull_val,
  CLK => WrClk,
  CLEAR => \fifo_inst/reset_w\(1),
  CE => VCC_0);
\fifo_inst/reset_r_1_s0\: DFFPE
port map (
  Q => \fifo_inst/reset_r\(1),
  D => \fifo_inst/reset_r\(0),
  CLK => fifo_inst_n4,
  PRESET => Reset,
  CE => VCC_0);
\fifo_inst/Equal.mem_Equal.mem_0_0_s\: SDPB
generic map (
  BIT_WIDTH_0 => 32,
  BIT_WIDTH_1 => 32,
  READ_MODE => '1',
  RESET_MODE => "ASYNC",
  BLK_SEL_0 => "000",
  BLK_SEL_1 => "000"
)
port map (
  DO(31 downto 0) => Q(31 downto 0),
  CLKA => WrClk,
  CEA => fifo_inst_n20,
  CLKB => RdClk,
  CEB => fifo_inst_n24,
  OCE => VCC_0,
  RESET => \fifo_inst/reset_r\(1),
  ADA(13) => GND_0,
  ADA(12) => GND_0,
  ADA(11) => GND_0,
  ADA(10) => GND_0,
  ADA(9) => GND_0,
  ADA(8) => GND_0,
  ADA(7) => GND_0,
  ADA(6) => GND_0,
  ADA(5) => \fifo_inst/Equal.wbin\(0),
  ADA(4) => GND_0,
  ADA(3) => VCC_0,
  ADA(2) => VCC_0,
  ADA(1) => VCC_0,
  ADA(0) => VCC_0,
  ADB(13) => GND_0,
  ADB(12) => GND_0,
  ADB(11) => GND_0,
  ADB(10) => GND_0,
  ADB(9) => GND_0,
  ADB(8) => GND_0,
  ADB(7) => GND_0,
  ADB(6) => GND_0,
  ADB(5) => \fifo_inst/rbin_num\(0),
  ADB(4) => GND_0,
  ADB(3) => GND_0,
  ADB(2) => GND_0,
  ADB(1) => GND_0,
  ADB(0) => GND_0,
  DI(31 downto 0) => Data(31 downto 0),
  BLKSELA(2) => GND_0,
  BLKSELA(1) => GND_0,
  BLKSELA(0) => GND_0,
  BLKSELB(2) => GND_0,
  BLKSELB(1) => GND_0,
  BLKSELB(0) => GND_0);
\fifo_inst/Equal.mem_Equal.mem_0_1_s\: SDPB
generic map (
  BIT_WIDTH_0 => 32,
  BIT_WIDTH_1 => 32,
  READ_MODE => '1',
  RESET_MODE => "ASYNC",
  BLK_SEL_0 => "000",
  BLK_SEL_1 => "000"
)
port map (
  DO(31) => \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO31\,
  DO(30) => \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO30\,
  DO(29) => \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO29\,
  DO(28) => \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO28\,
  DO(27) => \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO27\,
  DO(26) => \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO26\,
  DO(25) => \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO25\,
  DO(24) => \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO24\,
  DO(23) => \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO23\,
  DO(22) => \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO22\,
  DO(21) => \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO21\,
  DO(20) => \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO20\,
  DO(19) => \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO19\,
  DO(18) => \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO18\,
  DO(17) => \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO17\,
  DO(16) => \fifo_inst_Equal.mem_Equal.mem_0_1_0_DO16\,
  DO(15 downto 0) => Q(47 downto 32),
  CLKA => WrClk,
  CEA => fifo_inst_n20,
  CLKB => RdClk,
  CEB => fifo_inst_n24,
  OCE => VCC_0,
  RESET => \fifo_inst/reset_r\(1),
  ADA(13) => GND_0,
  ADA(12) => GND_0,
  ADA(11) => GND_0,
  ADA(10) => GND_0,
  ADA(9) => GND_0,
  ADA(8) => GND_0,
  ADA(7) => GND_0,
  ADA(6) => GND_0,
  ADA(5) => \fifo_inst/Equal.wbin\(0),
  ADA(4) => GND_0,
  ADA(3) => VCC_0,
  ADA(2) => VCC_0,
  ADA(1) => VCC_0,
  ADA(0) => VCC_0,
  ADB(13) => GND_0,
  ADB(12) => GND_0,
  ADB(11) => GND_0,
  ADB(10) => GND_0,
  ADB(9) => GND_0,
  ADB(8) => GND_0,
  ADB(7) => GND_0,
  ADB(6) => GND_0,
  ADB(5) => \fifo_inst/rbin_num\(0),
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
  DI(15 downto 0) => Data(47 downto 32),
  BLKSELA(2) => GND_0,
  BLKSELA(1) => GND_0,
  BLKSELA(0) => GND_0,
  BLKSELB(2) => GND_0,
  BLKSELB(1) => GND_0,
  BLKSELB(0) => GND_0);
\fifo_inst/n20_s1\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => fifo_inst_n20,
  I0 => NN_0,
  I1 => WrEn);
\fifo_inst/n24_s0\: LUT2
generic map (
  INIT => X"4"
)
port map (
  F => fifo_inst_n24,
  I0 => NN,
  I1 => RdEn);
\fifo_inst/rempty_val_s2\: LUT4
generic map (
  INIT => X"0816"
)
port map (
  F => fifo_inst_rempty_val,
  I0 => fifo_inst_n24,
  I1 => \fifo_inst/rbin_num\(0),
  I2 => fifo_inst_rempty_val_7,
  I3 => fifo_inst_rempty_val_8);
\fifo_inst/wfull_val_s2\: LUT4
generic map (
  INIT => X"8049"
)
port map (
  F => fifo_inst_wfull_val,
  I0 => fifo_inst_n20,
  I1 => fifo_inst_wfull_val_7,
  I2 => \fifo_inst/Equal.wbin\(0),
  I3 => fifo_inst_wfull_val_8);
\fifo_inst/rempty_val_s3\: LUT2
generic map (
  INIT => X"9"
)
port map (
  F => fifo_inst_rempty_val_7,
  I0 => \fifo_inst/Equal.rq2_wptr\(0),
  I1 => \fifo_inst/rbin_num\(1));
\fifo_inst/rempty_val_s4\: LUT2
generic map (
  INIT => X"6"
)
port map (
  F => fifo_inst_rempty_val_8,
  I0 => \fifo_inst/Equal.rq2_wptr\(1),
  I1 => \fifo_inst/rbin_num\(1));
\fifo_inst/wfull_val_s3\: LUT2
generic map (
  INIT => X"9"
)
port map (
  F => fifo_inst_wfull_val_7,
  I0 => \fifo_inst/Equal.wq2_rptr\(0),
  I1 => \fifo_inst/Equal.wptr\(1));
\fifo_inst/wfull_val_s4\: LUT2
generic map (
  INIT => X"9"
)
port map (
  F => fifo_inst_wfull_val_8,
  I0 => \fifo_inst/Equal.wq2_rptr\(1),
  I1 => \fifo_inst/Equal.wptr\(1));
\fifo_inst/Equal.wbinnext_1_s3\: LUT4
generic map (
  INIT => X"BF40"
)
port map (
  F => \fifo_inst/Equal.wbinnext\(1),
  I0 => NN_0,
  I1 => WrEn,
  I2 => \fifo_inst/Equal.wbin\(0),
  I3 => \fifo_inst/Equal.wptr\(1));
\fifo_inst/Equal.wbinnext_0_s4\: LUT3
generic map (
  INIT => X"B4"
)
port map (
  F => \fifo_inst_Equal.wbinnext_0\,
  I0 => NN_0,
  I1 => WrEn,
  I2 => \fifo_inst/Equal.wbin\(0));
\fifo_inst/Equal.wgraynext_0_s1\: LUT4
generic map (
  INIT => X"0BF4"
)
port map (
  F => \fifo_inst/Equal.wgraynext\(0),
  I0 => NN_0,
  I1 => WrEn,
  I2 => \fifo_inst/Equal.wbin\(0),
  I3 => \fifo_inst/Equal.wptr\(1));
\fifo_inst/rbin_num_next_1_s3\: LUT4
generic map (
  INIT => X"BF40"
)
port map (
  F => \fifo_inst/rbin_num_next\(1),
  I0 => NN,
  I1 => RdEn,
  I2 => \fifo_inst/rbin_num\(0),
  I3 => \fifo_inst/rbin_num\(1));
\fifo_inst/rbin_num_next_0_s4\: LUT3
generic map (
  INIT => X"B4"
)
port map (
  F => fifo_inst_rbin_num_next_0,
  I0 => NN,
  I1 => RdEn,
  I2 => \fifo_inst/rbin_num\(0));
\fifo_inst/Equal.rgraynext_0_s1\: LUT4
generic map (
  INIT => X"0BF4"
)
port map (
  F => \fifo_inst/Equal.rgraynext\(0),
  I0 => NN,
  I1 => RdEn,
  I2 => \fifo_inst/rbin_num\(0),
  I3 => \fifo_inst/rbin_num\(1));
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
  Empty <= NN;
  Full <= NN_0;
end beh;
