----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.04.2024 17:46:48
-- Design Name: 
-- Module Name: ROM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Port ( memory_select : in STD_LOGIC_VECTOR (2 downto 0);
           instruction : out STD_LOGIC_VECTOR (11 downto 0));
end ROM;

architecture Behavioral of ROM is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);  
 
signal PROGRAM_ROM : rom_type := (  
 
"100010000010",  --MOV 2 to R1
"100100000011",  --MOV 3 to R2
"101110000001",  --MOV 1 to R7
"001110010000",  --ADD R7 to R1 and store in R7
"001110100000",  --ADD R2 to R7 and store in R7
"110000000101",  --Jump to instruction 5 using R0
"000000000000",
"000000000000"

); 
 
begin 
 
instruction <= PROGRAM_ROM(to_integer(unsigned(memory_select))); 


end Behavioral;
