library ieee;
use ieee.std_logic_1164.all;

entity  PISO is
generic(m:integer := 8);
port( SP,CLK,CLR : in std_logic;
          PI : in std_logic_vector(m-1 downto 0);
				  SO : out std_logic
);
end PISO;

architecture behavioral of PISO is
signal temp: std_logic_vector(m-1 downto 0);
begin
process(CLK,CLR)
begin
if(CLR='0') then 
temp<=(others =>'0');
elsif(CLK'event and CLK='0') then 
if(SP='0') then
temp(m-2 downto 0)<=temp(m-1 downto 1);
temp(m-1)<='0';

else 
temp<=PI;
end if;
end if;
SO<=temp(0);
end process;
end behavioral;
