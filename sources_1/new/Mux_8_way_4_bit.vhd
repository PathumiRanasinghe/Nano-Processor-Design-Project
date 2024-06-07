----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2024 13:24:28
-- Design Name: 
-- Module Name: Mux_8_way_4_bit - Behavioral
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

entity Mux_8_way_4_bit is
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
end Mux_8_way_4_bit;

architecture Behavioral of Mux_8_way_4_bit is

component Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end component;

signal Y0,Y1,Y2,Y3: STD_LOGIC; 

begin

Mux_8_to_1_0 : Mux_8_to_1
 port map( 
 S => S, 
 D(0)=> I_0(0),
 D(1)=> I_1(0),
 D(2)=> I_2(0),
 D(3)=> I_3(0),
 D(4)=> I_4(0),
 D(5)=> I_5(0),
 D(6)=> I_6(0),
 D(7)=> I_7(0),
 EN => '1', 
 Y => Y0 ); 
 
 Mux_8_to_1_1 : Mux_8_to_1
 port map( 
 S => S, 
 D(0)=> I_0(1),
 D(1)=> I_1(1),
 D(2)=> I_2(1),
 D(3)=> I_3(1),
 D(4)=> I_4(1),
 D(5)=> I_5(1),
 D(6)=> I_6(1),
 D(7)=> I_7(1),
 EN => '1', 
 Y => Y1 ); 
 
 Mux_8_to_1_2 : Mux_8_to_1
  port map( 
  S => S, 
  D(0)=> I_0(2),
  D(1)=> I_1(2),
  D(2)=> I_2(2),
  D(3)=> I_3(2),
  D(4)=> I_4(2),
  D(5)=> I_5(2),
  D(6)=> I_6(2),
  D(7)=> I_7(2),
  EN => '1', 
  Y => Y2 ); 
  
 Mux_8_to_1_3 : Mux_8_to_1
   port map( 
   S => S, 
   D(0)=> I_0(3),
   D(1)=> I_1(3),
   D(2)=> I_2(3),
   D(3)=> I_3(3),
   D(4)=> I_4(3),
   D(5)=> I_5(3),
   D(6)=> I_6(3),
   D(7)=> I_7(3),
   EN => '1', 
   Y => Y3 ); 

Y(0) <= Y0;
Y(1) <= Y1;
Y(2) <= Y2;
Y(3) <= Y3;
 
end Behavioral;
