library ieee;
use IEEE.std_logic_1164.all;

entity micro is 
port( A15, wr, rd, PSEN : in std_logic;
      S : out std_logic_vector(7 downto 0)); -- OE CE of U1, CE OE WE of U3, CE OE WE of U2

end entity

architecture rtl of micro is
    begin
        if A15 then S[5] <='0';
        else S[2] <= '0'; 
        S[7] <= '0';
        end if;
        if PSEN then 
        if rd then S[4] <= '0';
        S[1] <= '0';
        end if;
        else S[6] <= '0';
        end if;
        if wr ='0' then S[0] <= '0';
        S[3] <= '0';
        end if;
        end architecture;
