library ieee;
use ieee.std_logic_1164.all;

entity tb_chenillard is
end entity;

architecture sim of tb_chenillard is
  signal clk   : std_logic := '0';
  signal rst_n : std_logic := '0';
  signal dir   : std_logic := '1';
  signal ledr  : std_logic_vector(9 downto 0);
begin
  clk <= not clk after 10 ns;

  uut : entity work.chenillard
    generic map (N => 5)
    port map (clk => clk, rst_n => rst_n, dir => dir, ledr => ledr);

  process
  begin
    rst_n <= '0'; dir <= '1'; wait for 45 ns;
    rst_n <= '1'; wait for 1300 ns;        -- up
    dir <= '0';   wait for 1300 ns;        -- down
    wait;
  end process;
end architecture;