library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.miim_pkg.all;

entity miim_controller is
  generic (
    phyad: std_logic_vector(4 downto 0) := "00001");
    
  port (
    rstn: in std_logic;
    clk: in std_logic;
    miim_rddata_valid: in std_logic;
    miim_rddata: in std_logic_vector(15 downto 0);
    miim_busy: in std_logic;
    
    miim_phyad: out std_logic_vector(4 downto 0);
    miim_regad: out std_logic_vector(4 downto 0);
    miim_wrdata: out std_logic_vector(15 downto 0);
    miim_wren: out std_logic;
    miim_rden: out std_logic;
    link_up: out std_logic;
    negotiated: out std_logic);
end miim_controller;

architecture behaviour of miim_controller is

  type op_state_t is (IDLE,
                   READ_BMSR, READ_BMCR,
                   READ_PHYID1, READ_PHYID2,
                   READ_GBCR, READ_GBSR,
                   READ_PHY_STATUS, CHECK_STATUS);

  type seq_state_t is (IDLE, READING, WRITING,
                        WAIT_VALID,
                        READING_PAGE, WRITING_PAGE,
                        WAIT_BUSY, RESET_PAGE);

  type seq_op_t is (IDLE, RD, WR,
                     RD_PG, WR_PG); -- read or write with page

  attribute syn_encoding : string;
  attribute syn_encoding of op_state_t : type is "gray";
  -- attribute syn_encoding of miim_state_t : type is "gray";
  -- attribute syn_encoding of miim_op_t : type is "gray";

  -- according to datasheet of RTL8211F, the OUI has 25 bits (0:24)
  signal oui: std_logic_vector(0 to 23);
  signal model_number: std_logic_vector(5 downto 0);
  signal revision: std_logic_vector(3 downto 0);

  signal bmsr: bmsr_t;
  signal bmcr: bmcr_t;
  signal gbcr: gbcr_t;
  signal gbsr: gbsr_t;
  signal physr: physr_t;
  
  signal op_state: op_state_t;

  signal regad: std_logic_vector(4 downto 0);
  signal reg_page: std_logic_vector(11 downto 0);
  signal rddata: std_logic_vector(15 downto 0);
  signal wrdata: std_logic_vector(15 downto 0);

  signal seq_state: seq_state_t;
  signal seq_op: seq_op_t;

  -- rd/wr_done: notify miim_op_comp_proc completion of miim_op_seq_proc
  signal rd_done: std_logic;
  signal wr_done: std_logic;

  -- used as op internal counter to track stages
  -- such as, write page address, then read reg 
  signal seq_op_count: unsigned(3 downto 0);
  signal seq_op_paging: std_logic;
begin

  miim_proc: process(clk)
    variable link: std_logic := '0';
    variable nego: std_logic := '0';
  begin
    if rising_edge(clk) then
      if not rstn then
        seq_op <= IDLE;
        bmcr <= (speed => "00", others => '0');
        bmsr <= (others => '0');
        gbcr <= (test_mode => "000", others => '0');
        gbsr <= (idle_error_count => (others => '0'), others => '0');
        physr <= (speed => "00", others => '0');
        oui <= (others => '0');
        model_number <= (others => '0');
        revision <= (others => '0');
        regad <= (others => '0');
        wrdata <= (others => '0');
        reg_page <= (others => '0');
        op_state <= IDLE;
        link_up <= '0';
        negotiated <= '0';
        link := '0';
        nego := '0';
      else
        case op_state is
          when IDLE =>
            op_state <= READ_PHYID1;
          when READ_PHYID1 =>
            regad <= phyid1_reg_addr;
            seq_op <= RD;
            if rd_done then
              seq_op <= IDLE;
              oui <= (2 to 17 => rddata, others => '0');
              op_state <= READ_PHYID2;
            end if;
          when READ_PHYID2 =>
            regad <= phyid2_reg_addr;
            seq_op <= RD;
            if rd_done then
              seq_op <= IDLE;
              -- 19:24 => 15:10
              oui(18 to 23) <= rddata(15 downto 10);
              model_number <= rddata(9 downto 4);
              revision <= rddata(3 downto 0);
              op_state <= READ_BMCR;
            end if;
          when READ_BMCR =>
            regad <= bmcr_reg_addr;
            seq_op <= RD;
            if rd_done then
              seq_op <= IDLE;
              bmcr <= read_bmcr(rddata);
              op_state <= READ_GBSR;
            end if;
          when READ_GBSR =>
            regad <= gbsr_reg_addr;
            seq_op <= RD;
            if rd_done then
              seq_op <= IDLE;
              gbsr <= read_gbsr(rddata);
              op_state <= READ_GBCR;
            end if;
          when READ_GBCR =>
            regad <= gbcr_reg_addr;
            seq_op <= RD;
            if rd_done then
              seq_op <= IDLE;
              gbcr <= read_gbcr(rddata);
              op_state <= READ_BMSR;
            end if;
          when READ_BMSR =>
            regad <= bmsr_reg_addr;
            seq_op <= RD;
            if rd_done then
              seq_op <= IDLE;
              bmsr <= read_bmsr(rddata);
              op_state <= READ_PHY_STATUS;
            end if;
          when READ_PHY_STATUS =>
            reg_page <= rtl8211f_physr_reg_page;
            regad <= rtl8211f_physr_reg_addr;
            seq_op <= RD_PG;
            if rd_done then
              seq_op <= IDLE;
              physr <= read_physr(rddata);
              op_state <= CHECK_STATUS;
            end if;
          when CHECK_STATUS =>
            negotiated <= bmsr.auto_negotiation_complete;
            link_up <= physr.link;
            op_state <= READ_BMSR;
        end case;
      end if;
    end if;
  end process miim_proc;

  miim_phyad <= phyad;

  miim_op_seq_proc: process(clk)
  begin
    if rising_edge(clk) then
      if (not rstn) then
        seq_state <= IDLE;
        miim_wren <= '0';
        miim_rden <= '0';
        miim_wrdata <= (others => '0');

        rd_done <= '0';
        wr_done <= '0';
        rddata <= (others => '0');
        seq_op_paging <= '0';
      else
        miim_wren <= '0';
        miim_rden <= '0';
        rd_done <= '0';
        wr_done <= '0';

        case seq_state is
          when IDLE =>
            seq_op_count <= X"0";
            seq_op_paging <= '0';
            case seq_op is
              when IDLE =>
              when RD =>
                seq_state <= READING;
              when WR =>
                seq_state <= WRITING;
              when RD_PG =>
                seq_state <= READING_PAGE;
                seq_op_paging <= '1';
              when WR_PG =>
                seq_state <= WRITING_PAGE;
                seq_op_paging <= '1';
            end case;
          when READING =>
            if not miim_busy then
              miim_rden <= '1';
              miim_regad <= regad;
              seq_state <= WAIT_VALID;
            end if;
          when WRITING =>
          when READING_PAGE =>
            case seq_op_count is
              when X"0" =>
                if not miim_busy then
                  miim_wren <= '1';
                  miim_regad <= rtl8211f_pagsr_reg_addr;
                  miim_wrdata <= (11 downto 0 => reg_page, others => '0');
                  seq_op_count <= seq_op_count + 1;
                end if;
              when X"1" =>
                  seq_op_count <= seq_op_count + 1;
              when X"2" =>
                  seq_op_count <= seq_op_count + 1;
              when X"3" =>
                if not miim_busy then
                  miim_rden <= '1';
                  miim_regad <= regad;
                  seq_state <= WAIT_VALID;
                  seq_op_count <= seq_op_count + 1;
                end if;
              when others =>
                seq_state <= IDLE;
            end case;
          when WRITING_PAGE =>
          when RESET_PAGE =>
            if not miim_busy then
              miim_wren <= '1';
              miim_regad <= rtl8211f_pagsr_reg_addr;
              miim_wrdata <= (others => '0');
              seq_op_count <= seq_op_count + 1;
              seq_state <= WAIT_BUSY;
              seq_op_paging <= '0';
            end if;
          when WAIT_VALID =>
            if miim_rddata_valid then
              rddata <= miim_rddata;
              seq_state <= WAIT_BUSY;
              rd_done <= '1';
            end if;
          when WAIT_BUSY =>
            if not miim_busy then
              if seq_op_paging = '1' then
                seq_state <= RESET_PAGE;
              else
                seq_state <= IDLE;
              end if;
            end if;
        end case;
      end if; -- not rstn
    end if; -- rising_edge(clk)
  end process miim_op_seq_proc;
end;
