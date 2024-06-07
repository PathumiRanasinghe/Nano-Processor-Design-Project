----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.04.2024 23:49:04
-- Design Name: 
-- Module Name: TB_Mux_8_way_4_bit - Behavioral
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

entity TB_Mux_8_way_4_bit is
--  Port ( );
end TB_Mux_8_way_4_bit;

architecture Behavioral of TB_Mux_8_way_4_bit is

component Mux_8_way_4_bit is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           I_0 : in STD_LOGIC_VECTOR (3 downto 0);
           I_1 : in STD_LOGIC_VECTOR (3 downto 0);
           I_2 : in STD_LOGIC_VECTOR (3 downto 0);
           I_3 : in STD_LOGIC_VECTOR (3 downto 0);
           I_4 : in STD_LOGIC_VECTOR (3 downto 0);
           I_5 : in STD_LOGIC_VECTOR (3 downto 0);
           I_6 : in STD_LOGIC_VECTOR (3 downto 0);
           I_7 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal S : STD_LOGIC_VECTOR (2 downto 0);
signal I_0 :  STD_LOGIC_VECTOR (3 downto 0);
signal I_1 :  STD_LOGIC_VECTOR (3 downto 0);
signal I_2 :  STD_LOGIC_VECTOR (3 downto 0);
signal I_3 : STD_LOGIC_VECTOR (3 downto 0);
signal I_4 :  STD_LOGIC_VECTOR (3 downto 0);
signal I_5 :  STD_LOGIC_VECTOR (3 downto 0);
signal I_6 :  STD_LOGIC_VECTOR (3 downto 0);
signal I_7 :  STD_LOGIC_VECTOR (3 downto 0);
signal Y : STD_LOGIC_VECTOR (3 downto 0);
           
begin

UUT:Mux_8_way_4_bit PORT MAP(
S => S,
I_0 => I_0,
I_1 => I_1,
I_2 => I_2,
I_3 => I_3,
I_4 => I_4,
I_5 => I_5,
I_6 => I_6,
I_7 => I_7,
Y => Y);

process
begin

S <="000";
I_0<= "0000";
I_1<= "0001";
I_2<= "0010";
I_3<= "0011";
I_4<= "0100";
I_5<= "0101";
I_6<= "0110";
I_7<= "0111";

wait for 100 ns;

S <="001";
I_0<= "1111";
I_1<= "1110";
I_2<= "1101";
I_3<= "0011";
I_4<= "0100";
I_5<= "0101";
I_6<= "0110";
I_7<= "0111";

wait for 100 ns;

S <="010";
I_0<= "0000";
I_1<= "0001";
I_2<= "0010";
I_3<= "0011";
I_4<= "0100";
I_5<= "0101";
I_6<= "0110";
I_7<= "0111";

wait for 100 ns;

S <="011";
I_0<= "0000";
I_1<= "0001";
I_2<= "0010";
I_3<= "0011";
I_4<= "0100";
I_5<= "0101";
I_6<= "0110";
I_7<= "0111";

wait for 100 ns;

S <="100";
I_0<= "0000";
I_1<= "0001";
I_2<= "0010";
I_3<= "0011";
I_4<= "0100";
I_5<= "0101";
I_6<= "0110";
I_7<= "0111";

wait for 100 ns;

S <="101";
I_0<= "0000";
I_1<= "0001";
I_2<= "0010";
I_3<= "0011";
I_4<= "0100";
I_5<= "0101";
I_6<= "0110";
I_7<= "0111";

wait for 100 ns;

wait;
end process;

end Behavioral;
