----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2024 13:06:22
-- Design Name: 
-- Module Name: TB_PC - Behavioral
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

entity TB_PC is
--  Port ( );
end TB_PC;

architecture Behavioral of TB_PC is

component PC is
    Port ( Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           I : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal Res : STD_LOGIC;
signal Clk : STD_LOGIC := '0';
signal I : STD_LOGIC_VECTOR (2 downto 0);
signal Q : STD_LOGIC_VECTOR (2 downto 0);

begin

UUT: PC port map(  
    Res => Res, 
    Clk => Clk, 
    I => I,
    Q => Q 
); 

process 
begin 
    Clk <= (not Clk); 
    wait for 10 ns; 
     
end process; 
 
process 
begin 
     
    Res <= '1';   
    I <= "001";
    wait for 100 ns;
   
    I <= "101";
    wait for 100 ns;

    Res <= '0';    
    I <= "000";
    wait for 100 ns;            

    I <= "001";
    wait for 100 ns;
    
    I <= "010";
    wait for 100 ns;
    
    I <= "011";
    wait for 100 ns;
  
   
     
   
end process; 

end Behavioral;
