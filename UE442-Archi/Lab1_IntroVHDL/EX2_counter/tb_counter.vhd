library ieee;
use ieee.std_logic_1164.all;

entity tb_counter is
end entity;

architecture sim of tb_counter is
  signal clk   : std_logic := '0';
  signal rst : std_logic := '0';
  signal tick  : std_logic;
begin

  clk <= not clk after 10 ns;        -- 20 ns period generation clk

  uut : entity work.counter
    generic map (N => 10)
    port map (clk => clk, rst => rst, tick => tick);

  process
  begin
    rst <= '1'; wait for 45 ns;    -- reset active
    rst <= '0'; wait for 600 ns;   -- normal operation
    wait;
  end process;

end architecture;