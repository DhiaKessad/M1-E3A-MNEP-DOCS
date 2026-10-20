library ieee;
use ieee.std_logic_1164.all;

entity chenillard is
  generic (
    N : integer := 12500000              
  );
  port (
    clk, rst_n   : in  std_logic;              
    dir   : in  std_logic;                -- SW0: 1 = up, 0 = down direction setting
    ledr  : out std_logic_vector(9 downto 0)
  );
end entity chenillard;

architecture rtl of chenillard is

  type lut_t is array (0 to 9) of std_logic_vector(9 downto 0);
  constant LUT : lut_t := (
    0 => "0000000001",
    1 => "0000000010",
    2 => "0000000100",
    3 => "0000001000",
    4 => "0000010000",
    5 => "0000100000",
    6 => "0001000000",
    7 => "0010000000",
    8 => "0100000000",
    9 => "1000000000"
  );

  signal cnt   : integer range 0 to N-1 := 0;  --conter
  signal tick  : std_logic;                     
  signal idx   : integer range 0 to 9 := 0;     
  signal dir_r : std_logic := '0';             

begin

  -- ex2 algo
  process(clk)
  begin
    if rising_edge(clk) then
      if rst_n = '0' then
        cnt <= 0;
      elsif cnt = N-1 then
        cnt <= 0;
      else
        cnt <= cnt + 1;
      end if;
    end if;
  end process;

  tick <= '1' when cnt = N-1 else '0';

  -- state machine: index into the LUT
  process(clk)
  begin
    if rising_edge(clk) then
      dir_r <= dir;                              -- synchronization flip-flop

      if rst_n = '0' then
        idx <= 0;
      elsif tick = '1' then
        if dir_r = '1' then
          if idx = 9 then idx <= 0; else idx <= idx + 1; end if;
        else
          if idx = 0 then idx <= 9; else idx <= idx - 1; end if;
        end if;
      end if;
    end if;
  end process;

  -- output
  ledr <= LUT(idx);

end architecture rtl;