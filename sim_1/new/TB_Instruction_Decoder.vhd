----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2024 12:03:55
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is

component Instruction_Decoder is
    Port ( I : in STD_LOGIC_VECTOR (11 downto 0);
           R : in STD_LOGIC_VECTOR (3 downto 0);  -- Register check for jump
           Reg_EN : out STD_LOGIC_VECTOR (2 downto 0);
           LS : out STD_LOGIC;
           IV : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_S_1 : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_S_2 : out STD_LOGIC_VECTOR (2 downto 0);
           Add_Sub : out STD_LOGIC;
           JMP : out STD_LOGIC;
           JMP_Address : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal I :  STD_LOGIC_VECTOR (11 downto 0);
signal  R : STD_LOGIC_VECTOR (3 downto 0);  
signal  Reg_EN : STD_LOGIC_VECTOR (2 downto 0);
signal LS : STD_LOGIC;
signal IV : STD_LOGIC_VECTOR (3 downto 0);
signal Reg_S_1 : STD_LOGIC_VECTOR (2 downto 0);
signal Reg_S_2 : STD_LOGIC_VECTOR (2 downto 0);
signal Add_Sub : STD_LOGIC;
signal JMP : STD_LOGIC;
signal  JMP_Address : STD_LOGIC_VECTOR (2 downto 0);

begin

UUT: Instruction_Decoder port map(
    I=>I,
    R=>R,
    Reg_EN=>Reg_EN,
    LS=>LS,
    IV=>IV,
    Reg_S_1=>Reg_S_1,
    Reg_S_2=>Reg_S_2,
    Add_Sub=>Add_Sub,
    JMP=>JMP,
    JMP_Address=>JMP_Address
);


process 
begin

     I<="100010000010";
     R<="0001";
     
     wait for 100ns;
     
     I<="100100000011";
     R<="0100";
     
     wait for 100ns;
     
     I<="101110000001";
     R<="1101";
     
     wait for 100ns;
     
     I<="001110010000";
     R<="1101";
     
     wait for 100ns;
     
     I<="001110100000";
     R<="0111";
     
     wait for 100ns;
     
     I<="010010000000";
     R<="0001";
     
     wait for 100ns;
     
    I<="001110010000";
    R<="0111";
    
    wait for 100ns;
    
    I<="000000000000";
    R<="0000";
        
    wait for 100ns;
     
     wait;
     
end process;

end Behavioral;
