Library IEEE;
use IEEE.std_logic_1164.all;

entity Compa_4 is 
    Port( a,b : in std_logic_vector(3 downto 0); -- input vectors
           c  : in std_logic;   -- starting condition
           s  : out std_logic  -- output signal
    );
END Compa_4;

architecture rtl of compa_4 is
         Signal e : std_logic_vector(4 downto 0); -- internal signal for validation

    begin
        e(0) <= '1';

        comp : for i in 0 to 3 generate 
            e(i+1) <= e(i) and (a(i) XNOR b(i));
        end generate comp;

        s <= e(4) AND c; -- condition is stable to use in this 

end architecture;