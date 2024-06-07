----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2024 19:28:06
-- Design Name: 
-- Module Name: TB_NanoProcessor - Behavioral
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

entity TB_NanoProcessor is
--  Port ( );
end TB_NanoProcessor;

architecture Behavioral of TB_NanoProcessor is

component NanoProcessor is
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Carry_out:out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Sign: out STD_LOGIC;
           Zero : out STD_LOGIC;
           S_LED : out STD_LOGIC_VECTOR (3 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Clk : STD_LOGIC:='0';
signal Res :  STD_LOGIC;
signal Carry_out :  STD_LOGIC;
signal  Overflow : STD_LOGIC;
signal Sign: STD_LOGIC;
signal  Zero : STD_LOGIC;
signal S_LED : STD_LOGIC_VECTOR (3 downto 0);
signal S_7Seg : STD_LOGIC_VECTOR (6 downto 0);
signal Anode : STD_LOGIC_VECTOR (3 downto 0);

begin

UUT: NanoProcessor port map(
Clk=>Clk,
Res=>Res,
Carry_out=>Carry_out,
Overflow=>Overflow,
Sign=>Sign,
Zero=>Zero,
S_LED=>S_LED,
S_7Seg=>S_7Seg,
Anode=>Anode);

process
begin 
    Clk <= (not Clk); 
    wait for 5 ns; 
     
end process; 

process 
begin
    Res<='1';
    wait for 100ns;
    Res<='0';
    wait; 
 
end process;
end Behavioral;
