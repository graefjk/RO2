----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.11.2021 15:28:58
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
 Port (sA_i: in std_logic_vector(7 downto 0); --input signals
       sB_i: in std_logic_vector(7 downto 0);
       opcode_select_i: in std_logic_vector(5 downto 0);
       reset_i: in std_logic;
       clk_i: in std_logic;
       
       
       sALU_o: out std_logic_vector(7 downto 0); -- output signals
       sCARRY_o: out std_logic;
       sZERO_o: out std_logic);
end ALU;

architecture Behavioral of ALU is
signal opcode_select_s: std_logic_vector(5 downto 0):= opcode_select_i;

signal result_s : std_logic_vector(7 downto 0) := "00000000"; -- results signals
signal carry_s : std_logic:='0'; 
signal zero_s : std_logic:='0';

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

constant operation_AND: std_logic_vector(5 downto 0):= "001000"; -- opcode logics
constant operation_AND_kk: std_logic_vector(5 downto 0):= "001001";
constant operation_OR: std_logic_vector(5 downto 0):= "001010";
constant operation_OR_kk: std_logic_vector(5 downto 0):= "001011";
constant operation_XOR : std_logic_vector(5 downto 0):="001100";
constant operation_XOR_kk : std_logic_vector(5 downto 0):="001101";






begin

operations: process(clk_i, reset_i)

  begin
 if reset_i='1' then
   result_s<= "00000000";
   carry_s<= '0';
   zero_s<= '0';
 else
    if rising_edge(clk_i) then
      case opcode_select_s is
        when operation_ADD => 
        
        when operation_ADD_kk =>
        
        when operation_ADDCY =>
        
        when operation_ADDCY_kk =>
        
        when operation_SUB =>
        
        when operation_SUB_kk =>
        
        when operation_SUBCY =>
        
        when operation_SUBCY_kk =>
        
        when operation_RL =>
        
        when operation_RR =>
        
        when operation_SL0 =>
        
        when operation_SL1 =>
        
        when operation_SLA =>
        
        when operation_SLX =>
        
        when operation_RL0 =>
        
        when operation_RL1 =>
        
        when operation_RLA =>
        
        when operation_RLX =>
        
        when operation_COMPARE =>
        
        when operation_COMPARE_kk =>
        
        when operation_TEST =>
        
        when operation_TEST_kk =>
        
        when operation_AND =>
        
        when operation_AND_kk =>
        
        when operation_OR =>
        
        when operation_OR_kk=>
        
        when operation_XOR =>
        
        when operation_XOR_kk=>
        
      end case;
    end if;
 end if;
  
  end process operations;
  sALU_o <= result_s;
  sCARRY_o <= carry_s;
  sZERO_o <= zero_s ;
  
  

end Behavioral;
