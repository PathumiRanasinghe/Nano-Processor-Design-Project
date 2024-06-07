----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2024 18:54:05
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
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

entity NanoProcessor is
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Carry_out:out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Sign: out STD_LOGIC;
           Zero : out STD_LOGIC;
           S_LED : out STD_LOGIC_VECTOR (3 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0));
end NanoProcessor;

architecture Behavioral of NanoProcessor is

component PC is
    Port ( Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           I : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Adder_3bit is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           C_in : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Mux_2_way_3_bit is
    Port ( S : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component ROM is
    Port ( memory_select : in STD_LOGIC_VECTOR (2 downto 0);
           instruction : out STD_LOGIC_VECTOR (11 downto 0));
end component ROM;

component Instruction_Decoder is
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
end component;

component Mux_2_way_4_bit is
    Port ( S : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Register_Bank is
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
end component;

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

component R7_7_seg is
    Port ( Input : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           S_LED : out STD_LOGIC_VECTOR (3 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Add_Sub_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Sign: out STD_LOGIC;
           Zero : out STD_LOGIC );
           
end component;

component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;


signal Mux_2_3_out,PC_out,Adder3_out,JMP_Address,Register_enable,Register_select1,Register_select2: STD_LOGIC_VECTOR (2 downto 0);
signal Jump_flag,Load_select, Add_sub_select,slow_clk_out: STD_LOGIC;
signal ROM_out : STD_LOGIC_VECTOR (11 downto 0);
signal Mux1_8_4_out,Mux2_8_4_out,Mux_2_4_out,Immediate_value,Add_sub_out: STD_LOGIC_VECTOR (3 downto 0);
signal R_0,R_1,R_2,R_3,R_4,R_5,R_6,R_7 : STD_LOGIC_VECTOR (3 downto 0);

begin

PC_0: PC port map(
    Res=>Res,
    Clk=>slow_clk_out,
    I=>Mux_2_3_out,
    Q=>PC_out
);

Adder_3bit_0: Adder_3bit port map(
    A=>PC_out,
    B=>"001",
    C_in=>'0',
    S=>Adder3_out    
);

Mux_2_way_3_bit_0: Mux_2_way_3_bit port map(
    S=>Jump_flag,
    A=>Adder3_out,
    B=>JMP_Address,
    Y=>Mux_2_3_out
);

ROM_0: ROM port map(
    memory_select=>PC_out,
    instruction=>ROM_out
);

Instruction_Decoder_0: Instruction_Decoder port map(
    I=>ROM_out,
    R=>Mux1_8_4_out,
    Reg_EN=>Register_enable,
    LS=>Load_select,
    IV=>Immediate_value,
    Reg_S_1=>Register_select1,
    Reg_S_2=>Register_select2,
    Add_Sub=>Add_sub_select,
    JMP=>Jump_flag,
    JMP_Address=>JMP_Address
);

Mux_2_way_4_bit_0: Mux_2_way_4_bit port map(
    S=>Load_select,
    A=>Immediate_value,
    B=>Add_sub_out,
    Y=>Mux_2_4_out
);

Register_Bank_0: Register_Bank port map(
    Res=>Res,
    Clk=>slow_clk_out,
    Input=>Register_enable,
    Data=>Mux_2_4_out,
    R0=>R_0,
    R1=>R_1,
    R2=>R_2,
    R3=>R_3,
    R4=>R_4,
    R5=>R_5,
    R6=>R_6,
    R7=>R_7
);

R7_7_seg_0:  R7_7_seg port map(
    Input =>R_7,
    Clk =>slow_clk_out,
    S_LED=>S_LED,
    S_7Seg=>S_7Seg,
    Anode =>Anode
);

Mux_8_way_4_bit_0: Mux_8_way_4_bit port map(
    S=>Register_select1,
    I_0=>R_0,
    I_1=>R_1,
    I_2=>R_2,
    I_3=>R_3,
    I_4=>R_4,
    I_5=>R_5,
    I_6=>R_6,
    I_7=>R_7,
    Y=>Mux1_8_4_out
    
);

Mux_8_way_4_bit_1:Mux_8_way_4_bit port map(
    S=>Register_select2,
    I_0=>R_0,
    I_1=>R_1,
    I_2=>R_2,
    I_3=>R_3,
    I_4=>R_4,
    I_5=>R_5,
    I_6=>R_6,
    I_7=>R_7,
    Y=>Mux2_8_4_out
);

Add_Sub_4bit_0: Add_Sub_4bit port map(
    A => Mux1_8_4_out,
    B => Mux2_8_4_out,
    M => Add_sub_select,
    S => Add_sub_out,
    C_out=>Carry_out,
    Overflow =>Overflow,
    Sign=>Sign,
    Zero =>Zero
);

Slow_Clk_0: Slow_Clk port map(
    Clk_in =>Clk,
    Clk_out =>slow_clk_out
);


end Behavioral;
