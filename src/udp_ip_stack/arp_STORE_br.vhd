----------------------------------------------------------------------------------
-- Company: 
-- Engineer:            Peter Fall
-- 
-- Create Date:    12:00:04 05/31/2011 
-- Design Name: 
-- Module Name:    arp_STORE_br - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:
--              ARP storage table using block ram with lookup based on IP address
--              implements upto 255 entries with sequential search
--              uses round robin overwrite when full (LRU would be better, but ...)
--
--              store may take a number of cycles and the request is latched
--              lookup may take a number of cycles. Assumes that request signals remain valid during lookup
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use ieee.std_logic_unsigned.all;
use work.arp_types.all;

entity arp_STORE_br is
  generic (
    MAX_ARP_ENTRIES : integer := 255          -- max entries in the store
    );
  port (
    -- read signals
    read_req    : in  arp_store_rdrequest_t;  -- requesting a lookup or store
    read_result : out arp_store_result_t;     -- the result
    -- write signals
    write_req   : in  arp_store_wrrequest_t;  -- requesting a lookup or store
    -- control and status signals
    clear_store : in  std_logic;              -- erase all entries
    entry_count : out unsigned(7 downto 0);   -- how many entries currently in store
    -- system signals
    clk         : in  std_logic;
    reset       : in  std_logic
    );
end arp_STORE_br;

architecture Behavioral of arp_STORE_br is

  type st_state_t is (IDLE, PAUSE, SEARCH, FOUND, NOT_FOUND);

  type ip_ram_t is array (0 to MAX_ARP_ENTRIES-1) of std_logic_vector(31 downto 0);
  type mac_ram_t is array (0 to MAX_ARP_ENTRIES-1) of std_logic_vector(47 downto 0);
  subtype addr_t is integer range 0 to MAX_ARP_ENTRIES;

  type count_mode_t is (RST, INCR, HOLD);

  type mode_t is (MREAD, MWRITE);

  -- state variables
  signal ip_ram          : ip_ram_t;     -- will be implemented as block ram
  signal mac_ram         : mac_ram_t;    -- will be implemented as block ram     
  signal st_state        : st_state_t;
  signal next_write_addr : addr_t;       -- where to make the next write
  signal num_entries     : addr_t;       -- number of entries in the store
  signal next_read_addr  : addr_t;       -- next addr to read from
  signal entry_found     : arp_entry_t;  -- entry found in search
  signal mode            : mode_t;       -- are we writing or reading?
  signal req_entry       : arp_entry_t;  -- entry latched from req

  -- busses
  -- signal next_st_state 		: st_state_t;
  signal arp_entry_val 		: arp_entry_t;
  signal found_arp_entry	: arp_entry_t;
  signal mode_val      		: mode_t;
  signal write_addr    		: addr_t;        -- actual write address to use
  signal read_result_int 	: arp_store_result_t;

  -- control signals
  -- signal set_st_state        : std_logic;
  signal set_next_write_addr : count_mode_t;
  signal set_num_entries     : count_mode_t;
  signal set_next_read_addr  : count_mode_t;
  signal write_ram           : std_logic;
  signal set_entry_found     : std_logic;
  signal set_mode            : std_logic;

  -- in ARP_RX, write_req is latched in only one clock,
  -- so I keep the entry when received request
  signal req_entry_reg       : arp_entry_t;  -- entry latched from req

  function read_status(status : arp_store_rslt_t; signal mode : mode_t) return arp_store_rslt_t is
    variable ret : arp_store_rslt_t;
  begin
    case status is
      when IDLE =>
        ret := status;
      when others =>
        if mode = MWRITE then
          ret := BUSY;
        else
          ret := status;
        end if;
    end case;
    return ret;
  end read_status;

begin

  read_result.status <= read_result_int.status;
  read_result.entry <= entry_found;

  store_sequential: process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        set_next_read_addr <= RST;    -- start lookup from beginning
        mode_val           <= MREAD;
        set_mode           <= '0';
        st_state           <= IDLE;
        set_next_read_addr <= RST;
        read_result_int.status <= IDLE;
        read_result_int.entry.ip <= (others => '0');
        read_result_int.entry.mac <= (others => '0');
        entry_count        <= to_unsigned(num_entries, 8);
        req_entry_reg.ip <= (others => '0');
        req_entry_reg.mac <= (others => '0');
        set_entry_found <= '0';
        found_arp_entry.ip <= (others => '0');
        found_arp_entry.mac <= (others => '0');
      else
        set_entry_found <= '0';
        found_arp_entry.ip <= (others => '0');
        found_arp_entry.mac <= (others => '0');

        case st_state is
          when IDLE =>
            mode_val           <= MREAD;
            set_mode           <= '0';
            st_state           <= IDLE;

            read_result_int.status <= IDLE;
            entry_count        <= to_unsigned(num_entries, 8);
            write_ram          <= '0';
            set_next_write_addr <= HOLD;
            set_next_read_addr  <= HOLD;
            set_num_entries     <= HOLD;
            if write_req.req = '1' then
              -- need to search to see if this IP already there
              set_next_read_addr <= RST;    -- start lookup from beginning
              mode_val           <= MWRITE;
              set_mode           <= '1';
              st_state      <= PAUSE;
              req_entry_reg <= write_req.entry;
            elsif read_req.req = '1' then
              set_next_read_addr <= RST;    -- start lookup from beginning
              mode_val           <= MREAD;
              set_mode           <= '1';
              st_state      <= PAUSE;
            end if;
          when PAUSE =>
            -- wait until read addr is latched and we get first data out of the ram
            read_result_int.status <= read_status(BUSY, mode);
            -- set_next_read_addr <= INCR;
            st_state      <= SEARCH;
          when SEARCH =>
            read_result_int.status <= read_status(SEARCHING, mode);
            -- check if have a match at this entry
            if req_entry.ip = arp_entry_val.ip and next_read_addr < num_entries then
                                        -- found it
              set_entry_found <= '1';
              found_arp_entry <= arp_entry_val;
              st_state   <= FOUND;
              set_next_read_addr <= HOLD;
            elsif next_read_addr >= num_entries or next_read_addr >= MAX_ARP_ENTRIES then
                                        -- reached end of entry table
              read_result_int.status <= read_status(NOT_FOUND, mode);
              st_state      <= NOT_FOUND;
              set_next_read_addr <= HOLD;
            else
              -- no match at this entry , go to next
              set_next_read_addr <= INCR;
            end if;
          when FOUND =>
            read_result_int.status <= read_status(FOUND, mode);
            if mode = MWRITE then
              write_addr    <= next_read_addr - 1;
              write_ram     <= '1';
              st_state <= IDLE;
            elsif read_req.req = '0' then   -- wait in this state until request de-asserted
              st_state <= IDLE;
            end if;
          when NOT_FOUND =>
            read_result_int.status <= read_status(NOT_FOUND, mode);
            if mode = MWRITE then
              -- need to write into the next free slot
              write_addr          <= next_write_addr;
              write_ram           <= '1';
              set_next_write_addr <= INCR;
              if num_entries < MAX_ARP_ENTRIES then
                -- if not full, count another entry (if full, it just wraps)
                set_num_entries <= INCR;
              end if;
              st_state <= IDLE;
            elsif read_req.req = '0' then   -- wait in this state until request de-asserted
              st_state <= IDLE;
            end if;
        end case;
      end if; -- reset = '1'
    end if; -- rising_edge(clk)
  end process;

  write_addr_seq_proc: process(clk)
  begin
    if rising_edge(clk) then
      -- next_write_addr counts and wraps
      if (reset = '1') or (clear_store = '1') then
        next_write_addr <= 0;
      else
        case set_next_write_addr is
          when HOLD => next_write_addr                                             <= next_write_addr;
          when RST  => next_write_addr                                             <= 0;
          when INCR => if next_write_addr < MAX_ARP_ENTRIES-1 then next_write_addr <= next_write_addr + 1; else next_write_addr <= 0; end if;
        end case;
      end if;
    end if;
  end process write_addr_seq_proc;

  read_addr_seq_proc: process(clk)
  begin
    if rising_edge(clk) then
      -- next_write_addr counts and wraps
      if (reset = '1') or (clear_store = '1') then
        next_read_addr  <= 0;
      else
        -- next_read_addr counts and wraps
        case set_next_read_addr is
          when HOLD => next_read_addr                                          <= next_read_addr;
          when RST  => next_read_addr                                          <= 0;
          when INCR => if next_read_addr < MAX_ARP_ENTRIES then next_read_addr <= next_read_addr + 1; else next_read_addr <= 0; end if;
        end case;
      end if;
    end if;
  end process read_addr_seq_proc;

  set_num_entries_proc: process(clk)
  begin
    if rising_edge(clk) then
      if (reset = '1') or (clear_store = '1') then
        num_entries     <= 0;
      else
        -- num_entries counts and holds at max
        case set_num_entries is
          when HOLD => num_entries                                           <= num_entries;
          when RST  => num_entries                                           <= 0;
          when INCR => if next_write_addr < MAX_ARP_ENTRIES then num_entries <= num_entries + 1; else num_entries <= num_entries; end if;
        end case;
      end if;
    end if;
  end process;

  set_entry_found_proc: process(clk)
  begin
    if rising_edge(clk) then
      if (reset = '1') or (clear_store = '1') then
        entry_found.ip  <= (others => '0');
        entry_found.mac <= (others => '0');
      else
        -- latch entry found
        if set_entry_found = '1' then
          entry_found <= found_arp_entry;
        else
          entry_found <= entry_found;
        end if;
      end if;
    end if;
  end process;

  set_mode_proc: process(clk)
  begin
    if rising_edge(clk) then
      if (reset = '1') or (clear_store = '1') then
        req_entry.ip    <= (others => '0');
        req_entry.mac   <= (others => '0');
        mode            <= MREAD;
      else
        -- mode setting and write request latching
        if set_mode = '1' then
          mode <= mode_val;
          if mode_val = MWRITE then
            req_entry <= req_entry_reg;
          else
            req_entry.ip  <= read_req.ip;
            req_entry.mac <= (others => '0');
          end if;
        else
          mode      <= mode;
          req_entry <= req_entry;
        end if;
      end if;
    end if;
  end process;

  next_read_addr_proc: process(clk)
  begin
    if rising_edge(clk) then
      if next_read_addr < MAX_ARP_ENTRIES then
        arp_entry_val.ip  <= ip_ram(next_read_addr);
        arp_entry_val.mac <= mac_ram(next_read_addr);
      else
        arp_entry_val.ip  <= (others => '0');
        arp_entry_val.mac <= (others => '0');
      end if;
    end if;
  end process;

  write_mem_proc: process(clk)
  begin
    if rising_edge(clk) then
      -- ram processing
      if write_ram = '1' then
        ip_ram(write_addr)  <= req_entry.ip;
        mac_ram(write_addr) <= req_entry.mac;
      end if;
    end if;
  end process;

end Behavioral;
