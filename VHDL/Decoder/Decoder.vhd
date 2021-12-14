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
         
         carry_i: in std_logic;--carry/zero
         zero_i: in std_logic;
         
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
         sALU_enable_o: out std_logic;
         
         
         mux_stack_select_o: out std_logic; --stack signals
		 sStack_write_or_read_o: out std_logic;
         sStack_enable_o: out std_logic;
         
         mux_PC_select_o: out std_logic;-- PC signal
         sPC_enable_o: out std_logic;
         
         sRAM_write_or_read_o: out std_logic; -- RAM signals
         sRAM_enable_o: out std_logic);
end Decoder;

architecture Behavioral of Decoder is

constant operation_ADD: std_logic_vector(5 downto 0):= "000000"; -- opcode arethmetics
constant operation_ADD_kk: std_logic_vector(5 downto 0):= "000001";
constant operation_ADDCY: std_logic_vector(5 downto 0):= "000010";
constant operation_ADDCY_kk: std_logic_vector(5 downto 0):= "000011";
constant operation_SUB : std_logic_vector(5 downto 0):="000100";
constant operation_SUB_kk : std_logic_vector(5 downto 0):="000101";
constant operation_SUBCY : std_logic_vector(5 downto 0):="000110";
constant operation_SUBCY_kk : std_logic_vector(5 downto 0):="000111";
constant operation_LOAD : std_logic_vector(5 downto 0):= "001110";
constant operation_LOAD_kk : std_logic_vector(5 downto 0):= "001111";

constant operation_RL: std_logic_vector(5 downto 0):="110000"; -- opcode rotation
constant operation_RR: std_logic_vector(5 downto 0):="110001";

constant operation_SL0: std_logic_vector(5 downto 0):="110010"; -- opcode shift
constant operation_SL1: std_logic_vector(5 downto 0):="110011";
constant operation_SLA: std_logic_vector(5 downto 0):="110100";
constant operation_SLX: std_logic_vector(5 downto 0):="110101";
constant operation_SR0: std_logic_vector(5 downto 0):="110110";
constant operation_SR1: std_logic_vector(5 downto 0):="110111";
constant operation_SRA: std_logic_vector(5 downto 0):="111000";
constant operation_SRX: std_logic_vector(5 downto 0):="111001";

constant operation_COMPARE: std_logic_vector(5 downto 0):= "011010"; -- opcode compare
constant operation_COMPARE_kk: std_logic_vector(5 downto 0):= "011011";

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

constant operation_RETURN: std_logic_vector(5 downto 0):="101011"; -- opcode return
constant operation_RETURNC: std_logic_vector(5 downto 0):="101100";
constant operation_RETURNNC: std_logic_vector(5 downto 0):="101101";
constant operation_RETURNZ: std_logic_vector(5 downto 0):="101110";
constant operation_RETURNNZ: std_logic_vector(5 downto 0):="101111";

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

type states is (PC, IP, ID, REG_read_and_RAM, ALU, REG_write, JUMPS);
signal state_curr : states;

begin
mealy: process(clk_i, reset_i)
begin
 if reset_i='1' then
    state_curr <= PC;
 elsif rising_edge(clk_i) then
    case state_curr is
        when PC =>
            state_curr <= IP;
        when IP =>
            state_curr <= ID;
        when ID =>
            case instruction_i(17 downto 16) is
                when "10" =>--Jumps
                    state_curr <= JUMPS;
                when others =>
                    state_curr <= REG_read_and_RAM;
                end case;
        when REG_read_and_RAM =>
            state_curr <= ALU;
        when ALU =>
            state_curr <= REG_write;
        when REG_write =>
            state_curr <= PC;
        when JUMPS =>
            state_curr <= PC;
    end case;
 end if;
end process mealy;
        

mux_i_o_select_o <= '0' when instruction_i(17 downto 16) = "11" or instruction_i(17 downto 16) = "10" or
    instruction_i(17 downto 12) = operation_STORE or instruction_i(17 downto 12) = operation_STORE_ss or
    instruction_i(17 downto 12) = operation_FETCH or instruction_i(17 downto 12) = operation_FETCH_ss or
    instruction_i(17 downto 12) = operation_INPUT_pp or instruction_i(17 downto 12) = operation_OUTPUT_pp
else
'1' when instruction_i(17 downto 12) = operation_INPUT or instruction_i(17 downto 12) = operation_OUTPUT else '0';
    
sIO_write_or_read_o <= '0' when instruction_i(17 downto 16) = "11" or instruction_i(17 downto 16) = "10" or
    instruction_i(17 downto 12) = operation_STORE or instruction_i(17 downto 12) = operation_STORE_ss or
    instruction_i(17 downto 12) = operation_FETCH or instruction_i(17 downto 12) = operation_FETCH_ss or
    instruction_i(17 downto 12) = operation_INPUT or instruction_i(17 downto 12) = operation_INPUT_pp
else
'1' when instruction_i(17 downto 12) = operation_OUTPUT or instruction_i(17 downto 12) = operation_OUTPUT_pp else '0';
    
mux_ALU_select_o <= '0' when instruction_i(17 downto 16) = "11" or instruction_i(17 downto 16) = "10" or
    instruction_i(17 downto 12) = operation_STORE_ss or instruction_i(17 downto 12) = operation_FETCH_ss or
    instruction_i(17 downto 12) = operation_INPUT or instruction_i(17 downto 12) = operation_INPUT_pp or
    instruction_i(17 downto 12) = operation_OUTPUT or instruction_i(17 downto 12) = operation_OUTPUT_pp
else
'1' when instruction_i(17 downto 12) = operation_STORE or instruction_i(17 downto 12) = operation_FETCH
else '1' when instruction_i(12) = '0' else '0';
    
mux_stack_select_o <= '0' when instruction_i(17 downto 16) = "11" or (instruction_i(17 downto 12) = operation_JUMP) or
    (instruction_i(17 downto 12) = operation_CALL) or
    ((instruction_i(17 downto 12) = operation_JUMPC) and (carry_i = '1')) or ((instruction_i(17 downto 12) = operation_JUMPNC) and (carry_i = '0')) or
    ((instruction_i(17 downto 12) = operation_CALLC) and (carry_i = '1')) or ((instruction_i(17 downto 12) = operation_CALLNC) and (carry_i = '0')) or
    ((instruction_i(17 downto 12) = operation_JUMPZ) and (zero_i = '1')) or ((instruction_i(17 downto 12) = operation_JUMPNZ) and (zero_i = '0')) or
    ((instruction_i(17 downto 12) = operation_CALLZ) and (zero_i = '1')) or ((instruction_i(17 downto 12) = operation_CALLNZ) and (zero_i = '0')) or
    instruction_i(17 downto 12) = operation_STORE or instruction_i(17 downto 12) = operation_STORE_ss or
    instruction_i(17 downto 12) = operation_FETCH or instruction_i(17 downto 12) = operation_FETCH_ss or
    instruction_i(17 downto 12) = operation_INPUT or instruction_i(17 downto 12) = operation_INPUT_pp or
    instruction_i(17 downto 12) = operation_OUTPUT or instruction_i(17 downto 12) = operation_OUTPUT_pp
else
'1' when (instruction_i(17 downto 12) = operation_RETURN) or
    ((instruction_i(17 downto 12) = operation_RETURNC) and (carry_i = '1')) or ((instruction_i(17 downto 12) = operation_RETURNC) and (carry_i = '0')) or
    ((instruction_i(17 downto 12) = operation_RETURNZ) and (zero_i = '1')) or ((instruction_i(17 downto 12) = operation_RETURNZ) and (zero_i = '0')) else '0';
    
sStack_write_or_read_o <= '0' when instruction_i(17 downto 16) = "11" or (instruction_i(17 downto 12) = operation_JUMP) or
    (instruction_i(17 downto 12) = operation_CALL) or
    ((instruction_i(17 downto 12) = operation_JUMPC) and (carry_i = '1')) or ((instruction_i(17 downto 12) = operation_JUMPNC) and (carry_i = '0')) or
    ((instruction_i(17 downto 12) = operation_CALLC) and (carry_i = '1')) or ((instruction_i(17 downto 12) = operation_CALLNC) and (carry_i = '0')) or
    ((instruction_i(17 downto 12) = operation_JUMPZ) and (zero_i = '1')) or ((instruction_i(17 downto 12) = operation_JUMPNZ) and (zero_i = '0')) or
    ((instruction_i(17 downto 12) = operation_CALLZ) and (zero_i = '1')) or ((instruction_i(17 downto 12) = operation_CALLNZ) and (zero_i = '0')) or
    instruction_i(17 downto 12) = operation_STORE or instruction_i(17 downto 12) = operation_STORE_ss or
    instruction_i(17 downto 12) = operation_FETCH or instruction_i(17 downto 12) = operation_FETCH_ss or
    instruction_i(17 downto 12) = operation_INPUT or instruction_i(17 downto 12) = operation_INPUT_pp or
    instruction_i(17 downto 12) = operation_OUTPUT or instruction_i(17 downto 12) = operation_OUTPUT_pp
else
'1' when (instruction_i(17 downto 12) = operation_RETURN) or
    ((instruction_i(17 downto 12) = operation_RETURNC) and (carry_i = '1')) or ((instruction_i(17 downto 12) = operation_RETURNC) and (carry_i = '0')) or
    ((instruction_i(17 downto 12) = operation_RETURNZ) and (zero_i = '1')) or ((instruction_i(17 downto 12) = operation_RETURNZ) and (zero_i = '0')) else '0';
    
mux_PC_select_o <= '0' when instruction_i(17 downto 16) = "11" or (instruction_i(17 downto 12) = operation_RETURN) or
    ((instruction_i(17 downto 12) = operation_RETURNC) and (carry_i = '1')) or ((instruction_i(17 downto 12) = operation_RETURNC) and (carry_i = '0')) or
    ((instruction_i(17 downto 12) = operation_RETURNZ) and (zero_i = '1')) or ((instruction_i(17 downto 12) = operation_RETURNZ) and (zero_i = '0')) or
    instruction_i(17 downto 12) = operation_STORE or instruction_i(17 downto 12) = operation_STORE_ss or
    instruction_i(17 downto 12) = operation_FETCH or instruction_i(17 downto 12) = operation_FETCH_ss or
    instruction_i(17 downto 12) = operation_INPUT or instruction_i(17 downto 12) = operation_INPUT_pp or
    instruction_i(17 downto 12) = operation_OUTPUT or instruction_i(17 downto 12) = operation_OUTPUT_pp
else
'1' when (instruction_i(17 downto 12) = operation_JUMP) or (instruction_i(17 downto 12) = operation_CALL) or
    ((instruction_i(17 downto 12) = operation_JUMPC) and (carry_i = '1')) or ((instruction_i(17 downto 12) = operation_JUMPNC) and (carry_i = '0')) or
    ((instruction_i(17 downto 12) = operation_CALLC) and (carry_i = '1')) or ((instruction_i(17 downto 12) = operation_CALLNC) and (carry_i = '0')) or
    ((instruction_i(17 downto 12) = operation_JUMPZ) and (zero_i = '1')) or ((instruction_i(17 downto 12) = operation_JUMPNZ) and (zero_i = '0')) or
    ((instruction_i(17 downto 12) = operation_CALLZ) and (zero_i = '1')) or ((instruction_i(17 downto 12) = operation_CALLNZ) and (zero_i = '0')) else '0';
    
sRAM_write_or_read_o <= '0' when instruction_i(17 downto 16) = "11" or instruction_i(17 downto 16) = "10" or
    instruction_i(17 downto 12) = operation_STORE or instruction_i(17 downto 12) = operation_STORE_ss or
    instruction_i(17 downto 12) = operation_INPUT or instruction_i(17 downto 12) = operation_INPUT_pp or
    instruction_i(17 downto 12) = operation_OUTPUT or instruction_i(17 downto 12) = operation_OUTPUT_pp
else
'1' when instruction_i(17 downto 12) = operation_FETCH or instruction_i(17 downto 12) = operation_FETCH_ss else '0';

mux_register_select_o <= "00" when instruction_i(17 downto 16) = "10" or instruction_i(17 downto 12) = operation_STORE or
    instruction_i(17 downto 12) = operation_STORE_ss or
    instruction_i(17 downto 12) = operation_INPUT or instruction_i(17 downto 12) = operation_INPUT_pp or
    instruction_i(17 downto 12) = operation_OUTPUT or instruction_i(17 downto 12) = operation_OUTPUT_pp
else  
"01" when instruction_i(17 downto 12) = operation_FETCH or instruction_i(17 downto 12) = operation_FETCH_ss
else
"11" when instruction_i(17 downto 16) = "11" else "11";

constant_kk_o <= instruction_i(7 downto 0);
constant_aaa_o <= instruction_i(11 downto 0);
sRegister_X_adresse_o <= instruction_i(11 downto 8);
sRegister_Y_adresse_o <= instruction_i(7 downto 4);
sALU_select_o <= instruction_i(17 downto 12);

sALU_enable_o <= '1' when (state_curr = ALU and
    (instruction_i(17 downto 12) /= operation_STORE_ss or instruction_i(17 downto 12) /= operation_FETCH_ss or
    instruction_i(17 downto 12) /= operation_STORE or instruction_i(17 downto 12) /= operation_FETCH or
    instruction_i(17 downto 12) /= operation_INPUT_pp or instruction_i(17 downto 12) /= operation_OUTPUT_pp or
    instruction_i(17 downto 12) /= operation_INPUT or instruction_i(17 downto 12) /= operation_OUTPUT))
else
'0';

sRegister_write_enable_o <= '1' when (state_curr = REG_write and
    (instruction_i(17 downto 12) /= operation_STORE_ss or instruction_i(17 downto 12) /= operation_OUTPUT_pp or
    instruction_i(17 downto 12) /= operation_STORE or instruction_i(17 downto 12) /= operation_OUTPUT))
else
'0';

sStack_enable_o <= '1' when (state_curr = JUMPS and (instruction_i(17 downto 12) = operation_CALL or instruction_i(17 downto 12) = operation_RETURN)) or
    (state_curr = JUMPS and carry_i = '1' and (instruction_i(17 downto 12) = operation_CALLC or instruction_i(17 downto 12) = operation_RETURNC)) or
    (state_curr = JUMPS and carry_i = '0' and (instruction_i(17 downto 12) = operation_CALLNC or instruction_i(17 downto 12) = operation_RETURNNC)) or
    (state_curr = JUMPS and zero_i = '1' and (instruction_i(17 downto 12) = operation_CALLZ or instruction_i(17 downto 12) = operation_RETURNZ)) or
    (state_curr = JUMPS and zero_i = '0' and (instruction_i(17 downto 12) = operation_CALLNZ or instruction_i(17 downto 12) = operation_RETURNNZ))
else
'0';

sIO_enable_o <= '1' when (state_curr = REG_read_and_RAM and
    (instruction_i(17 downto 12) = operation_INPUT_pp or instruction_i(17 downto 12) = operation_OUTPUT_pp or
    instruction_i(17 downto 12) = operation_INPUT or instruction_i(17 downto 12) = operation_OUTPUT))
else
'0';

sRAM_enable_o <= '1' when (state_curr = REG_read_and_RAM and
    (instruction_i(17 downto 12) = operation_STORE_ss or instruction_i(17 downto 12) = operation_FETCH_ss or
    instruction_i(17 downto 12) = operation_STORE or instruction_i(17 downto 12) = operation_FETCH))
else
'0';

sPC_enable_o <= '1' when state_curr = PC
else
'0';

end Behavioral;
