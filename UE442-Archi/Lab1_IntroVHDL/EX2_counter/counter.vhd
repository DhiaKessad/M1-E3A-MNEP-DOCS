library ieee;
use ieee.std_logic_1164.all;

entity counter is
  generic (
    N : integer := 12500000          
  );
  port (
    clk   : in  std_logic;           -- colock signal
    rst : in  std_logic;           -- reset
    tick  : out std_logic            -- 1 clock cycle pulse every N cycles
  );
end entity counter;

architecture rtl of counter is
  signal cnt : integer range 0 to N-1 := 0;
begin

  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        cnt <= 0;
      elsif cnt = N-1 then
        cnt <= 0;                    -- fin, go back to 0
      else
        cnt <= cnt + 1;
      end if;
    end if;
  end process;

  tick <= '1' when cnt = N-1 else '0';

end architecture rtl;