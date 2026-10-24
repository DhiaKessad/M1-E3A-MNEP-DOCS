library ieee;
use IEEE.std_logic_1164.all;

entity compa_4 is 
generic ( N : integer := 4);
port (a, b : in std_logic_vector(N-1 downto 0);
      e : out std_logic);
end entity compa_4;

architecture rtl of compa_4 is 

begin
process(a, b)
    variable s, v : std_logic;
begin
    s := '1';
    v := '1';

    for i in N-1 downto 0 loop
        if s = '1' and v = '1' then
            v := not(a(i)) or b(i);
            s := not(b(i)) or a(i);
        end if;
    end loop;

    e <= not(s) and not(v);
end process;
end architecture rtl;
