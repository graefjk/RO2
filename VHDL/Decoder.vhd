----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.11.2021 15:37:19
-- Design Name: 
-- Module Name: Decoder - Behavioral
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

entity Decoder is
  Port ( instruction_i: in std_logic_vector(17 downto 0); -- input signals
         clk_i: in std_logic;
         reset_i: in std_logic;
         
         constant_kk_o: out std_logic_vector(7 downto 0); -- output signals -- Constant
         constant_aaa_o: out std_logic_vector(11 downto 0);
         
         mux_i_o_select_o: out std_logic; -- i/o signals
		 sIO_write_or_read_o: out std_logic;
		 sIO_enable_o: out std_logic;
         
         mux_register_select_o: out std_logic_vector(1 downto 0); --register signals
	 sRegister_X_adresse_o: out std_logic_vector(3 downto 0); 
         sRegister_Y_adresse_o: out std_logic_vector(3 downto 0);
	 sRegister_write_enable_o: out std_logic;
         
         mux_ALU_select_o: out std_logic; --ALU signals
         sALU_select_o: out std_logic_vector(5 downto 0);
         
         
         mux_stack_select_o: out std_logic; --stack signals
		 sStack_write_or_read_o: out std_logic;
         sStack_enable_o: out std_logic;
         
         mux_PC_select_o: out std_logic_vector(1 downto 0);-- PC signals
         or_PC_o: out std_logic;
         
         sRAM_write_or_read_o: out std_logic; -- RAM signals
         sRAM_enable_o: out std_logic);
end Decoder;

architecture Behavioral of Decoder is

constant operation_ADD: std_logic_vector(5 downto 0):= "000000"; -- opcode arthmetics
constant operation_ADD_kk: std_logic_vector(5 downto 0):= "000001";
constant operation_ADDCY: std_logic_vector(5 downto 0):= "000010";
constant operation_ADDCY_kk: std_logic_vector(5 downto 0):= "000011";
constant operation_SUB : std_logic_vector(5 downto 0):="000100";
constant operation_SUB_kk : std_logic_vector(5 downto 0):="000101";
constant operation_SUBCY : std_logic_vector(5 downto 0):="000110";
constant operation_SUBCY_kk : std_logic_vector(5 downto 0):="000111";

constant operation_RL: std_logic_vector(5 downto 0):="110000"; -- opcode rotation
constant operation_RR: std_logic_vector(5 downto 0):="110001";

constant operation_SL0: std_logic_vector(5 downto 0):="110010"; -- opcode shift
constant operation_SL1: std_logic_vector(5 downto 0):="110011";
constant operation_SLA: std_logic_vector(5 downto 0):="110100";
constant operation_SLX: std_logic_vector(5 downto 0):="110101";
constant operation_RL0: std_logic_vector(5 downto 0):="110111";
constant operation_RL1: std_logic_vector(5 downto 0):="110111";
constant operation_RLA: std_logic_vector(5 downto 0):="111000";
constant operation_RLX: std_logic_vector(5 downto 0):="111001";


constant operation_COMPARE: std_logic_vector(5 downto 0):= "000010"; -- opcode compare
constant operation_COMPARE_kk: std_logic_vector(5 downto 0):= "000011";

constant operation_TEST : std_logic_vector(5 downto 0):="011000"; --opcode test
constant operation_TEST_kk : std_logic_vector(5 downto 0):="011001";

constant operation_CALL: std_logic_vector(5 downto 0):= "100001"; -- opcode Calls
constant operation_CALLC: std_logic_vector(5 downto 0):= "100010";
constant operation_CALLNC: std_logic_vector(5 downto 0):= "100011";
constant operation_CALLZ: std_logic_vector(5 downto 0):= "100101";
constant operation_CALLNZ: std_logic_vector(5 downto 0):= "100100";

constant operation_JUMP: std_logic_vector(5 downto 0):= "100110"; -- opcode jump
constant operation_JUMPC: std_logic_vector(5 downto 0):= "100111";
constant operation_JUMPNC: std_logic_vector(5 downto 0):= "101000";
constant operation_JUMPZ: std_logic_vector(5 downto 0):= "101010";
constant operation_JUMPNZ: std_logic_vector(5 downto 0):= "101001";

constant operation_RETURN: std_logic_vector(5 downto 0):="111010"; -- opcode return
constant operation_RETURNC: std_logic_vector(5 downto 0):="111011";
constant operation_RETURNNC: std_logic_vector(5 downto 0):="111100";
constant operation_RETURNZ: std_logic_vector(5 downto 0):="111101";
constant operation_RETURNNZ: std_logic_vector(5 downto 0):="111110";

constant operation_AND: std_logic_vector(5 downto 0):= "001000"; -- opcode logics
constant operation_AND_kk: std_logic_vector(5 downto 0):= "001001";
constant operation_OR: std_logic_vector(5 downto 0):= "001010";
constant operation_OR_kk: std_logic_vector(5 downto 0):= "001011";
constant operation_XOR : std_logic_vector(5 downto 0):="001100";
constant operation_XOR_kk : std_logic_vector(5 downto 0):="001101";


constant operation_FETCH : std_logic_vector(5 downto 0):= "010010"; -- opcode RAM
constant operation_FETCH_ss : std_logic_vector(5 downto 0):= "010011";
constant operation_STORE : std_logic_vector(5 downto 0):= "010000";
constant operation_STORE_ss : std_logic_vector(5 downto 0):= "010001";

constant operation_INPUT: std_logic_vector(5 downto 0):="010110"; -- opcode I/O
constant operation_INPUT_pp: std_logic_vector(5 downto 0):="010111";
constant operation_OUTPUT: std_logic_vector(5 downto 0):="010100";
constant operation_OUTPUT_pp: std_logic_vector(5 downto 0):="010101";

begin


end Behavioral;
