----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2024 08:07:10
-- Design Name: 
-- Module Name: Add_Sub_7_seg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity R7_7_seg is
    Port ( Input : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           S_LED : out STD_LOGIC_VECTOR (3 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0));
end R7_7_seg;

architecture Behavioral of R7_7_seg is

component LUT_16_7 is 
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0); 
           data : out STD_LOGIC_VECTOR (6 downto 0)); 
end component; 

begin
   
LUT_0: LUT_16_7 
   port map( 
      address=>Input, 
      data=>S_7Seg         
);

S_LED <= Input; 
Anode <= "1110"; 

end Behavioral;
