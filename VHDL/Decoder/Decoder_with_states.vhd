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

entity Decoder_with_states is
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
end Decoder_with_states;

architecture Behavioral of Decoder_with_states is

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


type state_t is (PC, IP, ID, REG_read_and_RAM, ALU, REG_write, JUMPS);
signal State_s : state_t := PC;

begin
operations: process(clk_i, reset_i)
begin
 if reset_i='1' then
    constant_kk_o <= "00000000";
    constant_aaa_o <= "000000000000";   
    mux_i_o_select_o <= '0';
    sIO_write_or_read_o <= '0';
	sIO_enable_o <= '0';
    mux_register_select_o <= "00";
    sRegister_X_adresse_o <= "0000";
    sRegister_Y_adresse_o <= "0000";
	sRegister_write_enable_o <= '0';
    mux_ALU_select_o <= '0';
    sALU_select_o <= "000000";
    mux_stack_select_o <= '0';
    sStack_write_or_read_o <= '0';
    sStack_enable_o <= '0';
    mux_PC_select_o <= '0';
    sRAM_write_or_read_o <= '0';
    sRAM_enable_o <= '0';
    State_s <= PC;
 else
    if rising_edge(clk_i) then--falling edge
        case State_s is
            when PC =>
                sRegister_write_enable_o <= '0';
                sStack_enable_o <= '0';
                sPC_enable_o <= '1';
                State_s <= IP;
            when IP =>
                sPC_enable_o <= '0';
                State_s <= ID;
            when ID =>
            case instruction_i(17 downto 16) is
                when "11" =>--Shifts
                    mux_i_o_select_o <= '0';
                    sIO_write_or_read_o <= '0';
                    mux_register_select_o <= "11";
                    mux_ALU_select_o <= '0';
                    mux_stack_select_o <= '0';
                    sStack_write_or_read_o <= '0';
                    mux_PC_select_o <= '0';
                    sRAM_write_or_read_o <= '0';
                    State_s <= REG_read_and_RAM;
                when "10" =>--Jumps
                    mux_i_o_select_o <= '0';
                    sIO_write_or_read_o <= '0';
                    mux_register_select_o <= "00";
                    mux_ALU_select_o <= '0';
                    sRAM_write_or_read_o <= '0';
                    case instruction_i(17 downto 12) is
                        when operation_JUMP | operation_CALL =>
                            mux_PC_select_o <= '1';
                            mux_stack_select_o <= '0';
                            sStack_write_or_read_o <= '0';
                        when operation_RETURN =>
                            mux_PC_select_o <= '0';
                            mux_stack_select_o <= '1';
                            sStack_write_or_read_o <= '1';
                    end case;
                    if carry_i = '1' then
                        case instruction_i(17 downto 12) is
                            when operation_JUMPC | operation_CALLC =>
                                mux_PC_select_o <= '1';
                                mux_stack_select_o <= '0';
                                sStack_write_or_read_o <= '0';
                            when operation_RETURNC =>
                                mux_PC_select_o <= '0';
                                mux_stack_select_o <= '1';
                                sStack_write_or_read_o <= '1';
                        end case;
                    else
                        case instruction_i(17 downto 12) is
                            when operation_JUMPNC | operation_CALLNC =>
                                mux_PC_select_o <= '1';
                                mux_stack_select_o <= '0';
                                sStack_write_or_read_o <= '0';
                            when operation_RETURNNC =>
                                mux_PC_select_o <= '0';
                                mux_stack_select_o <= '1';
                                sStack_write_or_read_o <= '1';
                        end case;
                    end if;
                    if zero_i = '1' then
                        case instruction_i(17 downto 12) is
                            when operation_JUMPZ | operation_CALLZ =>
                                mux_PC_select_o <= '1';
                                mux_stack_select_o <= '0';
                                sStack_write_or_read_o <= '0';
                            when operation_RETURNZ =>
                                mux_PC_select_o <= '0';
                                mux_stack_select_o <= '1';
                                sStack_write_or_read_o <= '1';
                        end case;
                    else
                        case instruction_i(17 downto 12) is
                            when operation_JUMPNZ | operation_CALLNZ =>
                                mux_PC_select_o <= '1';
                                mux_stack_select_o <= '0';
                                sStack_write_or_read_o <= '0';
                            when operation_RETURNNZ =>
                                mux_PC_select_o <= '0';
                                mux_stack_select_o <= '1';
                                sStack_write_or_read_o <= '1';
                        end case;
                    end if;
                    State_s <= JUMPS;
                when others =>--Constant or register
                    case instruction_i(17 downto 12) is
                        when operation_STORE =>
                            mux_i_o_select_o <= '0';
                            sIO_write_or_read_o <= '0';
                            mux_register_select_o <= "00";
                            mux_stack_select_o <= '0';
                            sStack_write_or_read_o <= '0';
                            mux_PC_select_o <= '0';
                            sRAM_write_or_read_o <= '0';
                            mux_ALU_select_o <= '1';
                        when operation_STORE_ss =>
                            mux_i_o_select_o <= '0';
                            sIO_write_or_read_o <= '0';
                            mux_register_select_o <= "00";
                            mux_stack_select_o <= '0';
                            sStack_write_or_read_o <= '0';
                            mux_PC_select_o <= '0';
                            sRAM_write_or_read_o <= '0';
                            mux_ALU_select_o <= '0';
                        when operation_FETCH =>
                            mux_i_o_select_o <= '0';
                            sIO_write_or_read_o <= '0';
                            mux_register_select_o <= "01";
                            mux_stack_select_o <= '0';
                            sStack_write_or_read_o <= '0';
                            mux_PC_select_o <= '0';
                            sRAM_write_or_read_o <= '1';
                            mux_ALU_select_o <= '1';
                        when operation_FETCH_ss =>
                            mux_i_o_select_o <= '0';
                            sIO_write_or_read_o <= '0';
                            mux_register_select_o <= "01";
                            mux_stack_select_o <= '0';
                            sStack_write_or_read_o <= '0';
                            mux_PC_select_o <= '0';
                            sRAM_write_or_read_o <= '1';
                            mux_ALU_select_o <= '0';
                        when operation_INPUT =>
                            mux_i_o_select_o <= '1';
                            sIO_write_or_read_o <= '0';
                            mux_register_select_o <= "00";
                            mux_stack_select_o <= '0';
                            sStack_write_or_read_o <= '0';
                            mux_PC_select_o <= '0';
                            sRAM_write_or_read_o <= '0';
                            mux_ALU_select_o <= '0';
                        when operation_INPUT_pp =>
                            mux_i_o_select_o <= '0';
                            sIO_write_or_read_o <= '0';
                            mux_register_select_o <= "00";
                            mux_stack_select_o <= '0';
                            sStack_write_or_read_o <= '0';
                            mux_PC_select_o <= '0';
                            sRAM_write_or_read_o <= '0';
                            mux_ALU_select_o <= '0';
                        when operation_OUTPUT =>
                            mux_i_o_select_o <= '1';
                            sIO_write_or_read_o <= '1';
                            mux_register_select_o <= "00";
                            mux_stack_select_o <= '0';
                            sStack_write_or_read_o <= '0';
                            mux_PC_select_o <= '0';
                            sRAM_write_or_read_o <= '0';
                            mux_ALU_select_o <= '0';
                        when operation_OUTPUT_pp =>
                            mux_i_o_select_o <= '0';
                            sIO_write_or_read_o <= '1';
                            mux_register_select_o <= "00";
                            mux_stack_select_o <= '0';
                            sStack_write_or_read_o <= '0';
                            mux_PC_select_o <= '0';
                            sRAM_write_or_read_o <= '0';
                            mux_ALU_select_o <= '0';
                        when others =>
                            mux_i_o_select_o <= '0';
                            sIO_write_or_read_o <= '0';
                            mux_register_select_o <= "11";
                            mux_stack_select_o <= '0';
                            sStack_write_or_read_o <= '0';
                            mux_PC_select_o <= '0';
                            sRAM_write_or_read_o <= '0';
                            if instruction_i(12) = '0' then
                                mux_ALU_select_o <= '1';
                            else
                                mux_ALU_select_o <= '0';
                            end if;
                            State_s <= REG_read_and_RAM;
                    end case;
                end case;
            when REG_read_and_RAM =>
                case instruction_i(17 downto 12) is
                    when operation_STORE | operation_STORE_ss | operation_FETCH | operation_FETCH_ss =>
                        sRAM_enable_o <= '1';
                    when others =>
                        sRAM_enable_o <= '0';
                end case;
                case instruction_i(17 downto 12) is
                    when operation_INPUT | operation_INPUT_pp | operation_OUTPUT | operation_OUTPUT_PP =>
                        sIO_enable_o <= '1';
                    when others =>
                        sIO_enable_o <= '0';
                end case;
                State_s <= ALU;
            when ALU =>
                case instruction_i(17 downto 12) is
                    when operation_STORE | operation_STORE_ss | operation_FETCH | operation_FETCH_ss | operation_INPUT | operation_INPUT_pp | operation_OUTPUT | operation_OUTPUT_PP =>
                        sALU_enable_o <= '0';
                    when others =>
                        sALU_enable_o <= '1';
                end case;
                sRAM_enable_o <= '0';
                sIO_enable_o <= '0';
                State_s <= REG_write;
            when REG_write =>
                sALU_enable_o <= '0';
                case instruction_i(17 downto 12) is
                    when operation_STORE | operation_STORE_ss | operation_OUTPUT | operation_OUTPUT_PP =>
                        sRegister_write_enable_o <= '0';
                    when others =>
                        sRegister_write_enable_o <= '1';
                end case;
                State_s <= PC;
            when JUMPS =>
                case instruction_i(17 downto 12) is
                    when operation_CALL | operation_RETURN =>
                        sStack_enable_o <= '1';
                    when operation_CALLC | operation_RETURNC =>
                        if carry_i = '1' then
                            sStack_enable_o <= '1';
                        else
                            sStack_enable_o <= '0';
                        end if;
                    when operation_CALLNC | operation_RETURNNC =>
                        if carry_i = '0' then
                            sStack_enable_o <= '1';
                        else
                            sStack_enable_o <= '0';
                        end if;
                    when operation_CALLZ | operation_RETURNZ =>
                        if zero_i = '1' then
                            sStack_enable_o <= '1';
                        else
                            sStack_enable_o <= '0';
                        end if;
                    when operation_CALLNZ | operation_RETURNNZ =>
                        if zero_i = '0' then
                            sStack_enable_o <= '1';
                        else
                            sStack_enable_o <= '0';
                        end if;
                    when others =>
                        sStack_enable_o <= '0';
                end case;
                State_s <= PC;
        end case;
      end if;
    constant_kk_o <= instruction_i(7 downto 0);
    constant_aaa_o <= instruction_i(11 downto 0);
    sRegister_X_adresse_o <= instruction_i(11 downto 8);
    sRegister_Y_adresse_o <= instruction_i(7 downto 4);
    sALU_select_o <= instruction_i(17 downto 12);
    end if;
  end process operations;
end Behavioral;