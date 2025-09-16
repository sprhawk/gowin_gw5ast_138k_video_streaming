library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity udp_app_store is
  generic(
    MAX_DATA_ENTRIES: integer := 10240);
  port (
    reset: in std_logic;

    -- MAC related
    clk: in std_logic;
    data_in_valid: in std_logic;
    data_in: in std_logic_vector(7 downto 0);

    data_out_ready: in std_logic;
    data_out: out std_logic_vector(7 downto 0);
    data_out_valid: out std_logic;

    write_overflow: out std_logic;
    read_available: out std_logic);
end udp_app_store;

architecture Behavioral of udp_app_store is
  type data_ram_t is array (0 to MAX_DATA_ENTRIES - 1) of std_logic_vector(7 downto 0);
 -- when equal to MAX_DATA_ENTRIES, means overflow
  subtype data_addr_t is integer range 0 to MAX_DATA_ENTRIES;

  signal mem: data_ram_t;
  signal read_addr: data_addr_t;
  signal write_addr: data_addr_t;

begin
  store_proc: process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        read_addr <= 0;
        write_addr <= 0;
        write_overflow <= '0';
        read_available <= '0';
        data_out <= (others => '0');
        data_out_valid <= '0';
      else
        write_overflow <= '0';
        read_available <= '0';
        data_out <= (others => '0');

        write_overflow <= '1';
        if write_addr < MAX_DATA_ENTRIES then
          write_overflow <= '0';
          if data_in_valid then
            mem(write_addr) <= data_in;
            write_addr <= write_addr + 1;
          end if;
        end if; -- write_addr < MAX_DATA_ENTRIES

        data_out_valid <= '0';
        if read_addr < write_addr then
          read_available <= '1';
          if data_out_ready then
            data_out <= mem(read_addr);
            data_out_valid <= '1';
            read_addr <= read_addr + 1;
          end if;
        end if; -- data_out_ready

      end if; -- reset = '1'
    end if; -- rising_edge
  end process;
end;
