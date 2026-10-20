library ieee;
use ieee.std_logic_1164.all;

entity compa_4 is
  port (
    a, b : in  std_logic_vector(3 downto 0);  -- input vectors
    c, clk    : in  std_logic;                     -- validation                     
    s    : out std_logic                      -- output signal
  );
end entity compa_4;

architecture rtl of compa_4 is
  signal a_r, b_r : std_logic_vector(3 downto 0) := (others => '0');  -- synchronized a, b
  signal c_r      : std_logic := '0';                                  -- synchronized c
  signal e        : std_logic_vector(4 downto 0);                      -- equality chain
begin
  -- synchronization 
  process(clk)
  begin
    if rising_edge(clk) then
      a_r <= a;
      b_r <= b;
      c_r <= c;
    end if;
  end process;

  
  e(0) <= '1';
  comp : for i in 0 to 3 generate
    e(i+1) <= e(i) and (a_r(i) xnor b_r(i));
  end generate comp;

  s <= e(4) and c_r;
end architecture rtl;