library ieee;
use ieee.std_logic_1164.all;

entity tb_compa_4 is
end entity;

architecture sim of tb_compa_4 is
  signal g, f : std_logic_vector(3 downto 0) := (others => '0');
  signal c, s : std_logic := '0';
begin
  uut : entity work.compa_4 port map (a => g, b => f, c => c, s => s);

  process
  begin
    c <= '1';
    g <= "1010"; f <= "1010"; wait for 10 ns; -- A & A

    g <= "1010"; f <= "1011"; wait for 10 ns; -- A & B

    c <= '0'; -- no starting condition
    g <= "0110"; f <= "0110"; wait for 10 ns;
    
    c <= '1';
    g <= "1010"; f <= "1010"; wait for 10 ns; -- A & A
    g <= "1010"; f <= "1000"; wait for 10 ns; 
    
    wait;
  end process;
end architecture;