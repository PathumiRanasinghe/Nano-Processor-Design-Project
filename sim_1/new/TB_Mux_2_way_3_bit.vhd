----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2024 01:47:45
-- Design Name: 
-- Module Name: TB_Mux_2_way_3_bit - Behavioral
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

entity TB_Mux_2_way_3_bit is
--  Port ( );
end TB_Mux_2_way_3_bit;

architecture Behavioral of TB_Mux_2_way_3_bit is

component Mux_2_way_3_bit is
    Port ( S : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal S :  STD_LOGIC;
signal A :  STD_LOGIC_VECTOR (2 downto 0);
signal B : STD_LOGIC_VECTOR (2 downto 0);
signal  Y : STD_LOGIC_VECTOR (2 downto 0);

begin
UUT:Mux_2_way_3_bit PORT MAP(
S => S,
A => A,
B => B,
Y => Y);

process
begin

S<='0';
A<= "000";
B<="111";

wait for 100 ns;

S<='1';
A<="111";
B<="010";

wait for 100 ns;

S<='0';
A<= "101";
B<="110";

wait for 100 ns;

S<='1';
A<="100";
B<="000";

wait for 100 ns;

S<='0';
A<="001";
B<="011";

wait for 100 ns;

S<='1';
A<="000";
B<="111";

wait for 100 ns;


wait;
end process;

end Behavioral;
