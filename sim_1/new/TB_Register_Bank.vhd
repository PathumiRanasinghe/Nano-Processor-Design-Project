----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.04.2024 11:18:14
-- Design Name: 
-- Module Name: TB_Register_Bank - Behavioral
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

entity TB_Register_Bank is
--  Port ( );
end TB_Register_Bank;

architecture Behavioral of TB_Register_Bank is

component Register_Bank is
    Port ( Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Input : in STD_LOGIC_VECTOR (2 downto 0);
           Data : in STD_LOGIC_VECTOR (3 downto 0);
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0));             
end component;

signal Clk :  STD_LOGIC :='0';
signal Res :  STD_LOGIC ;
signal Input : STD_LOGIC_VECTOR (2 downto 0);
signal Data : STD_LOGIC_VECTOR (3 downto 0);
signal R0,R1,R2,R3,R4,R5,R6,R7 : STD_LOGIC_VECTOR (3 downto 0); 

begin

UUT: Register_Bank port map(
Res=>Res,
Clk=>Clk,
Input=>Input,
Data=>Data,
R0=>R0,
R1=>R1,
R2=>R2,
R3=>R3,
R4=>R4,
R5=>R5,
R6=>R6,
R7=>R7);

process
begin 
    Clk <= (not Clk); 
    wait for 10 ns; 
     
end process; 

process
begin
    
    Res<='0';     
    Input<="001";
    Data<="0101";
    
    wait for 100ns;
    
    Input<="010";
    Data<="1101";
    
    wait for 100ns;
    
    Input<="011";
    Data<="0101";
    
    wait for 100ns;
    
    Res<='1'; 
    Input<="011";
    Data<="1111";
        
    wait for 100ns;
    
    Res<='0'; 
    Input<="100";
    Data<="0100";
            
    wait for 100ns;
     
    Input<="101";
    Data<="1001";
                
    wait for 100ns;
    
    Input<="110";
    Data<="1101";
            
    wait for 100ns;
    
    Input<="111";
    Data<="0001";
            
    wait for 100ns;
    
    wait;
end process;
end Behavioral;