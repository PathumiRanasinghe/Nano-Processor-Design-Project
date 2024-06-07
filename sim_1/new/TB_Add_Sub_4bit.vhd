----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2024 23:21:38
-- Design Name: 
-- Module Name: TB_Add_Sub_4bit - Behavioral
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

entity TB_Add_Sub_4bit is
--  Port ( );
end TB_Add_Sub_4bit;

architecture Behavioral of TB_Add_Sub_4bit is

component Add_Sub_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           S : inout STD_LOGIC_VECTOR (3 downto 0);
           C_out : inout STD_LOGIC;
           Overflow : out STD_LOGIC;
           Sign: out STD_LOGIC;
           Zero : out STD_LOGIC );
end component;

signal A : STD_LOGIC_VECTOR (3 downto 0);
signal  B : STD_LOGIC_VECTOR (3 downto 0);
signal M : STD_LOGIC;
signal  S : STD_LOGIC_VECTOR (3 downto 0);
signal C_out :  STD_LOGIC;
signal Overflow : STD_LOGIC;
signal Sign: STD_LOGIC;
signal  Zero : STD_LOGIC ;

begin
UUT: Add_Sub_4bit port map(
A=>A,
B=>B,
M=>M,
S=>S,
C_out=>C_out,
Overflow=>Overflow,
Sign=>Sign,
Zero=>Zero
);

process
       begin
       
        --ADD--
        
        A<="1110";
        B<="1010";
        M<='0';
        WAIT FOR 100 ns; 
        
        A<="1011";
        B<="1010";
        WAIT FOR 100 ns; 
        
        A<="1101";
        B<="1010";
        WAIT FOR 100 ns;
        
        A<="1111";
        B<="1110";
        WAIT FOR 100 ns;
        
        A<="0011";
        B<="0111";
        WAIT FOR 100 ns;
        
        A<="0000";
        B<="0000";
        WAIT FOR 100 ns;
        
        --SUBSTRACT--     
           
        A<="1111";
        B<="0001";
        M<='1';
        WAIT FOR 100 ns;
        
        A<="1110";
        B<="1010";
        WAIT FOR 100 ns;
         
        A<="1011";
        B<="1110";
        WAIT FOR 100 ns;
        
        A<="1101";
        B<="1010";
        WAIT FOR 100 ns;
        
        A<="0010";
        B<="1011";
        WAIT FOR 100 ns;
        
        A<="1111";
        B<="1111";
        WAIT FOR 100 ns;
        
        WAIT; 
   end process;


end Behavioral;
