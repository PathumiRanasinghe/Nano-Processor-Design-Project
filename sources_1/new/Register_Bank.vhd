----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2024 20:41:44
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
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
end Register_Bank;

architecture Behavioral of Register_Bank is

 component Decoder_3_to_8 is
     Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
            EN : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (7 downto 0));
 end component;
 
component Reg 
     Port ( D : in STD_LOGIC_VECTOR (3 downto 0); 
        En : in STD_LOGIC; 
        Clk : in STD_LOGIC; 
        Res : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (3 downto 0)); 
 end component; 


signal Y0 : STD_LOGIC_VECTOR (7 downto 0);

begin

Decoder_3_to_8_0 : Decoder_3_to_8 
 port map( 
 I => Input, 
 EN => '1', 
 Y => Y0 ); 
 
Reg_0 : reg 
     port map( 
         D =>"0000", 
         Res => Res,
         En =>Y0(0), 
         Clk => Clk, 
         Q => R0 ); 
         
Reg_1 : reg 
     port map( 
         D =>Data , 
         Res => Res,
         En =>Y0(1), 
         Clk => Clk, 
         Q => R1 ); 
         
Reg_2 : reg 
     port map( 
         D =>Data , 
         Res => Res,
         En =>Y0(2), 
         Clk => Clk, 
         Q => R2 ); 
         
Reg_3 : reg 
     port map( 
         D =>Data , 
         Res => Res,
         En =>Y0(3), 
         Clk => Clk, 
         Q => R3 ); 
         
Reg_4 : reg 
     port map( 
         D =>Data , 
         Res => Res,
         En =>Y0(4), 
         Clk => Clk, 
         Q => R4 ); 
         
Reg_5 : reg 
     port map( 
         D =>Data , 
         Res => Res,
         En =>Y0(5), 
         Clk => Clk, 
         Q => R5 ); 
         
Reg_6 : reg 
     port map( 
         D =>Data, 
         Res => Res,
         En =>Y0(6), 
         Clk => Clk, 
         Q => R6 ); 
         
Reg_7 : reg 
     port map( 
         D =>Data , 
         Res => Res,
         En =>Y0(7), 
         Clk => Clk, 
         Q => R7 ); 
 
end Behavioral;