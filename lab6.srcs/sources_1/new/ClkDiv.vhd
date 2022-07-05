library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity ClkDiv is
port ( 
        clk: in std_logic;
        clock_out: out std_logic);
        
end ClkDiv;
  
architecture behavioral of ClkDiv is
  
signal count: integer:=0;
signal tmp : std_logic := '0';
  
begin
  
process(clk)
begin

    if( rising_edge(clk) ) then
    
        count <=count+1;
    
            if (count = 1) then
            tmp <= NOT tmp;
            count <= 0;
            end if;
    
    end if;
    
    clock_out <= tmp;
    
end process;
  
end behavioral;