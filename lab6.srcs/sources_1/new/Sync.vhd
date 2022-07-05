

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Sync is
 Port ( CLK: in STD_LOGIC;
 HoriSYNC, VertiSYNC: out STD_LOGIC ;
 R,G,B: out STD_LOGIC_VECTOR(3 downto 0));
end Sync;

architecture Behavioral of Sync is
Signal horiPos : integer range 0 to 800 := 0 ;
Signal verPos: integer range 0 to 525 := 0;
Signal dummyVer: integer range 0 to 525 := 220;

type dummy_bm is array (0 to 21) of STD_Logic_vector(0 to 39);

constant dummy: dummy_bm := (
"0000000000000000000000000000000000000000",
"0000000000000000000000000000000000000000",
"0000000000000111110000011111000000000000",
"0000000000011111111001111111100000000000",
"0000000000001111111110111111110000000000",
"0000000000101111111111111111111000000000",
"0000000000111111111111111111111000000000",
"0000000000011111111111111111111000000000",
"0000000001111111111111111111111000000000",
"0000000001111111111111111111111000000000",
"0000000000111111111111111111111000000000",
"0000000000111111111111111111110000000000",
"0000000000011111111111111111110000000000",
"0000000000001111111111111111100000000000",
"0000000000001111111111111111000000000000",
"0000000000000011111111111110000000000000",
"0000000000000001111111111100000000000000",
"0000000000000000111111110000000000000000",
"0000000000000000001111100000000000000000",
"0000000000000000000110000000000000000000",
"0000000000000000000000000000000000000000",
"0000000000000000000000000000000000000000"

);
begin

process (CLK) --with each clk sycle, increase horipos by 1. once it hits the line, increase veripos by one.
begin
if rising_edge(CLK) then
        
if (horiPos = 800) then 
horiPos <= 0;
    if verPos < 525 then 
    verPos <= verPos + 1 ;
    else verPos <= 0; 
    end if;
else 
horiPos <=horiPos + 1;
end if;

if (horiPos > 16 and horiPos < 113) then
    HoriSYNC <= '0';
else 
    HoriSYNC <= '1';
end if; 

if (verPos > 10 and verPos < 13) then
    VertiSYNC <= '1';
else 
    VertiSYNC <= '0';
end if;
 
  if (HoriPos >= 480 and horiPos < 520 and verPos < 21+dummyVer and verPos >= dummyVer  ) then
         if(dummy(VerPos - (dummyVer))(HoriPos-480)='1') then
         R <= (others => '1');
         G <= (others => '0');
         B <= (others => '0');
         else 
         R <= (others => '0');
         G <= (others => '0');
         B <= (others => '0');
         end if;
          else 
         R <= (others => '0');
         G <= (others => '0');
         B <= (others => '0');
         end if;
        
     
end if;

end process;


end Behavioral;