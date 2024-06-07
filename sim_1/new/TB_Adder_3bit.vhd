----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2024 22:16:42
-- Design Name: 
-- Module Name: TB_Adder_3bit - Behavioral
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

entity TB_Adder_3bit is
--  Port ( );
end TB_Adder_3bit;

architecture Behavioral of TB_Adder_3bit is

component Adder_3bit is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           C_in : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal A : STD_LOGIC_VECTOR (2 downto 0);
signal B :  STD_LOGIC_VECTOR (2 downto 0);
signal C_in : STD_LOGIC;
signal C_out : STD_LOGIC;
signal S : STD_LOGIC_VECTOR (2 downto 0);

begin

UUT: Adder_3bit port map(
    A=>A,
    B=>B,
    C_in=>C_in,
    C_out=>C_out,
    S=>S);
    
process
begin

A<= "111";
B<= "101";
C_in<='0';

wait for 100ns;

A<= "101";
B<="101";

wait for 100ns;

A<="110";
B<="101";

wait for 100ns;

A<="111";
B<="111";

wait for 100ns;

A<="001";
B<="001";

wait for 100ns;

A<="011";
B<="001";

wait for 100ns;


wait;
end process;    

end Behavioral;
