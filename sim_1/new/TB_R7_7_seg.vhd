----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2024 08:37:24
-- Design Name: 
-- Module Name: TB_R7_7_seg - Behavioral
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

entity TB_R7_7_seg is
--  Port ( );
end TB_R7_7_seg;

architecture Behavioral of TB_R7_7_seg is

component R7_7_seg is
    Port ( Input : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           S_LED : out STD_LOGIC_VECTOR (3 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Input : STD_LOGIC_VECTOR (3 downto 0);
signal Clk : STD_LOGIC:='0';
signal S_LED : STD_LOGIC_VECTOR (3 downto 0);
signal S_7Seg : STD_LOGIC_VECTOR (6 downto 0);
signal Anode : STD_LOGIC_VECTOR (3 downto 0);

begin
UUT: R7_7_seg port map(
    Input=>Input,
    Clk=>Clk,
    S_LED=>S_LED,
    S_7Seg=>S_7Seg,
    Anode=>Anode
);

process  
 begin 
     Clk <= not(Clk); 
     wait for 10ns; 
 end process; 

process 
    begin 
         
        Input<="0000";
        wait for 100ns; 
             
        Input<="0001";
        wait for 100ns; 
        
        Input<="0011";
        wait for 100ns;
        
        Input<="0110";
        wait for 100ns;       
        
         
        end process; 
 
end Behavioral;
