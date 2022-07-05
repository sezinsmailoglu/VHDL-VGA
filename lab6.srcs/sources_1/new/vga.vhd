

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga is
 Port ( CLK_100 : in STD_LOGIC;
       vga_hs, vga_vs : out STD_LOGIC; -- sync signals
        vga_r, vga_g, vga_b : out STD_LOGIC_VECTOR(3 downto 0) --color channels
         );
end vga;

architecture Behavioral of vga is

component sync is
 Port ( CLK: in STD_LOGIC;
 HoriSYNC, VertiSYNC: out STD_LOGIC ;
 R,G,B: out STD_LOGIC_VECTOR(3 downto 0));
end component;

component ClkDiv is 
port ( 
        clk: in std_logic;
        clock_out: out std_logic);
        
end component;

signal VGACLK: STD_LOGIC;
begin
c1 : sync port map (VGACLK, VGA_hs, VGA_vs, VGA_R, VGA_G, VGA_B);
c2 : ClkDiv port map(clk=>clk_100, clock_out=>VGACLK);

end Behavioral;
