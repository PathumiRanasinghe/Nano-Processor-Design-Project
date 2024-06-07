----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2024 10:26:09
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( I : in STD_LOGIC_VECTOR (11 downto 0);  --Instruction Bus
           R : in STD_LOGIC_VECTOR (3 downto 0);  -- Register check for jump
           Reg_EN : out STD_LOGIC_VECTOR (2 downto 0);  --Register enable
           LS : out STD_LOGIC; --Load select
           IV : out STD_LOGIC_VECTOR (3 downto 0);  -- Immediate value
           Reg_S_1 : out STD_LOGIC_VECTOR (2 downto 0);  --Register select 1
           Reg_S_2 : out STD_LOGIC_VECTOR (2 downto 0);  --Register select 2
           Add_Sub : out STD_LOGIC;  --Abb/Sub select
           JMP : out STD_LOGIC;  -- Jump Flag
           JMP_Address : out STD_LOGIC_VECTOR (2 downto 0));  -- Address to jump
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

signal opcode: STD_LOGIC_VECTOR (1 downto 0);
signal Reg_A: STD_LOGIC_VECTOR (2 downto 0);
signal Reg_B: STD_LOGIC_VECTOR (2 downto 0);
signal data: STD_LOGIC_VECTOR (3 downto 0);

begin

opcode<=I(11 downto 10);
Reg_A<=I(9 downto 7);
Reg_B<=I(6 downto 4);
data<=I(3 downto 0);

process (opcode,Reg_A,Reg_B,data,R) begin

    if opcode="10" then
            JMP<='0';
            LS<='0';
            Reg_EN<=Reg_A;
            IV<=data;
            
            Reg_S_1 <= "000"; 
            Reg_S_2 <= "000";
            Add_Sub <= '0';
            JMP_Address <= "000";
            
    
    elsif opcode="00" then
            JMP<='0';
            LS<='1';
            Reg_EN<=Reg_A;
            Reg_S_1<=Reg_A;
            Reg_S_2<=Reg_B;
            Add_Sub<='0';
            
            JMP_Address <= "000";
            IV<="0000";
                
    elsif opcode="01" then
            JMP<='0';
            LS<='1';
            Reg_EN<=Reg_A;
            Reg_S_1<="000";
            Reg_S_2<=Reg_A; 
            Add_Sub<='1';
            
            JMP_Address <= "000";
            IV<="0000";
         
    elsif opcode="11" then
            JMP_Address<=data(2 downto 0);
            Reg_S_1<=Reg_A; 
            
            if R="0000" then
                JMP<='1';
            else
                JMP<='0';
            end if;
            
            LS  <= '0';
            Add_Sub<='0';
            Reg_EN <= "000";
            IV <= "0000";
            Reg_S_2 <= "000";
                
                
    end if;

end process;

end Behavioral;
