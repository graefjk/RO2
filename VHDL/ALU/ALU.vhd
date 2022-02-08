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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
 Port (sA_i: in std_ulogic_vector(7 downto 0); --input signals
       sB_i: in std_ulogic_vector(7 downto 0);
       opcode_select_i: in std_ulogic_vector(5 downto 0);
       reset_i: in std_logic;
       clk_i: in std_logic;
       enable_i: in std_logic;
       
       sALU_o: out std_ulogic_vector(7 downto 0); -- output signals
       sCARRY_o: out std_logic;
       sZERO_o: out std_logic);
end ALU;

architecture Behavioral of ALU is

signal result_s : std_ulogic_vector(7 downto 0) := "00000000"; -- results signals
signal carry_s : std_ulogic := '0'; 
signal zero_s : std_ulogic := '0';

constant operation_ADD: std_ulogic_vector(5 downto 0):= "000000"; -- opcode arthmetics
constant operation_ADD_kk: std_ulogic_vector(5 downto 0):= "000001";
constant operation_ADDCY: std_ulogic_vector(5 downto 0):= "000010";
constant operation_ADDCY_kk: std_ulogic_vector(5 downto 0):= "000011";
constant operation_SUB : std_ulogic_vector(5 downto 0):="000100";
constant operation_SUB_kk : std_ulogic_vector(5 downto 0):="000101";
constant operation_SUBCY : std_ulogic_vector(5 downto 0):="000110";
constant operation_SUBCY_kk : std_ulogic_vector(5 downto 0):="000111";

constant operation_RL: std_ulogic_vector(5 downto 0):="110000"; -- opcode rotation
constant operation_RR: std_ulogic_vector(5 downto 0):="110001";

constant operation_SL0: std_ulogic_vector(5 downto 0):="110010"; -- opcode shift
constant operation_SL1: std_ulogic_vector(5 downto 0):="110011";
constant operation_SLA: std_ulogic_vector(5 downto 0):="110100";
constant operation_SLX: std_ulogic_vector(5 downto 0):="110101";
constant operation_SR0: std_ulogic_vector(5 downto 0):="110110";
constant operation_SR1: std_ulogic_vector(5 downto 0):="110111";
constant operation_SRA: std_ulogic_vector(5 downto 0):="111000";
constant operation_SRX: std_ulogic_vector(5 downto 0):="111001";

constant operation_COMPARE: std_ulogic_vector(5 downto 0):= "011010"; -- opcode compare
constant operation_COMPARE_kk: std_ulogic_vector(5 downto 0):= "011011";

constant operation_TEST : std_ulogic_vector(5 downto 0):="011000"; --opcode test
constant operation_TEST_kk : std_ulogic_vector(5 downto 0):="011001";

constant operation_AND: std_ulogic_vector(5 downto 0):= "001000"; -- opcode logics
constant operation_AND_kk: std_ulogic_vector(5 downto 0):= "001001";
constant operation_OR: std_ulogic_vector(5 downto 0):= "001010";
constant operation_OR_kk: std_ulogic_vector(5 downto 0):= "001011";
constant operation_XOR : std_ulogic_vector(5 downto 0):="001100";
constant operation_XOR_kk : std_ulogic_vector(5 downto 0):="001101";

constant operation_LOAD : std_ulogic_vector(5 downto 0):="001110"; -- Load
constant operation_LOAD_kk : std_ulogic_vector(5 downto 0):="001111";


begin
operations: process(clk_i, reset_i)
begin
 if reset_i='1' then --asyncron reset overrides the output
   result_s <= "00000000";
   carry_s <= '0';
   zero_s <= '0';
 else
    if (rising_edge(clk_i)) then
		if (enable_i='1') then --ALU is active
			case opcode_select_i is --The operation the ALU is currently supposed to perform.
			when operation_ADD | operation_ADD_kk => 
				result_s <=  to_stdulogicvector(to_stdlogicvector(sA_i) + to_stdlogicvector(sB_i));
				if (('0'&to_stdlogicvector(sA_i)) + ('0'&to_stdlogicvector(sB_i))) > "011111111" then 
					carry_s <= '1';
				else
					carry_s <= '0';
				end if;
				if (to_stdlogicvector(sA_i) + to_stdlogicvector(sB_i)) = "00000000" then 
					zero_s <= '1';
				else
					zero_s <='0';
				end if;

			when operation_ADDCY | operation_ADDCY_kk =>
				result_s <= to_stdulogicvector(to_stdlogicvector(sA_i) + to_stdlogicvector(sB_i) + carry_s);
				if ((('0'&to_stdlogicvector(sA_i)) + ('0'&to_stdlogicvector(sB_i))) + carry_s) > "011111111" then 
					carry_s <= '1';
				else
					carry_s <= '0';
				end if;
				if (to_stdlogicvector(sA_i) + to_stdlogicvector(sB_i) + carry_s) = "00000000" then 
					zero_s <= '1';
				else
					zero_s <= '0';
				end if;
        
			when operation_SUB | operation_SUB_kk =>
				result_s <= to_stdulogicvector(to_stdlogicvector(sA_i) - to_stdlogicvector(sB_i));
				if (sA_i < sB_i)  then 
					carry_s <= '1';
				else
					carry_s <= '0';
				end if;
				if (to_stdlogicvector(sA_i) - to_stdlogicvector(sB_i)) = "00000000" then 
					zero_s <= '1';
				else
					zero_s <='0';
				end if;
                    
			when operation_SUBCY | operation_SUBCY_kk=>
				result_s <= to_stdulogicvector(to_stdlogicvector(sA_i) - to_stdlogicvector(sB_i) - carry_s);
				if (('1'&to_stdlogicvector(sA_i))-carry_s) < ('1'&to_stdlogicvector(sB_i))  then 
					carry_s <= '1';
				else
					carry_s <= '0';
				end if;
				if (to_stdlogicvector(sA_i) - to_stdlogicvector(sB_i) - carry_s) = "00000000" then 
					zero_s <= '1';
				else
					zero_s <= '0';
				end if;
        
			when operation_RL =>
				carry_s <= sA_i(7);
				result_s <= sA_i(6 downto 0) & sA_i(7);
				if (sA_i(6 downto 0) & sA_i(7) = "00000000") then
					zero_s <= '1';
				else
					zero_s <= '0';
				end if;
        
			when operation_RR => 
				carry_s <= sA_i(0);
				result_s <= sA_i(0) & sA_i(7 downto 1);
				if (sA_i(0) & sA_i(7 downto 1) = "00000000") then
					zero_s <= '1';
				else
					zero_s <= '0';
				end if;
        
			when operation_SL0 =>
				carry_s <= sA_i(7);
				result_s <= sA_i(6 downto 0) & "0";
				if (sA_i(6 downto 0) & "0" = "00000000") then
					zero_s <= '1';
				else
					zero_s <= '0';
				end if;
        
			when operation_SL1 =>
				carry_s <= sA_i(7);
				result_s <= sA_i(6 downto 0) & "1";
				if (sA_i(6 downto 0) & "1" = "00000000") then
					zero_s <= '1';
				else
					zero_s <= '0';
				end if;
		
			when operation_SLA =>
				result_s <= sA_i(6 downto 0) & carry_s;
				if (sA_i(6 downto 0) & carry_s = "00000000") then
					zero_s <= '1';
				else
					zero_s <= '0';
				end if;
				carry_s <= sA_i(7);
        
			when operation_SLX =>
				carry_s <= sA_i(7);
				result_s <= sA_i(6 downto 0) & sA_i(0);
				if (sA_i(6 downto 0) & sA_i(0) = "00000000") then
					zero_s <= '1';
				else
					zero_s <= '0';
				end if;
        
			when operation_SR0 =>
				carry_s <= sA_i(0);
				result_s <= "0" & sA_i(7 downto 1);
				if ("0" & sA_i(7 downto 1) = "00000000") then
					zero_s <= '1';
				else
					zero_s <= '0';
				end if;
        
			when operation_SR1 =>
				carry_s <= sA_i(0);
				result_s <= "1" & sA_i(7 downto 1);
				if ("1" & sA_i(7 downto 1) = "00000000") then
					zero_s <= '1';
				else
					zero_s <= '0';
				end if;
        
			when operation_SRA =>
				result_s <= carry_s & sA_i(7 downto 1);
				if (carry_s & sA_i(7 downto 1) = "00000000") then
					zero_s <= '1';
				else
					zero_s <= '0';
				end if;
				carry_s <= sA_i(0);
        
			when operation_SRX =>
				carry_s <= sA_i(0);
				result_s <= sA_i(7) & sA_i(7 downto 1);
				if (sA_i(7) & sA_i(7 downto 1) = "00000000") then
					zero_s <= '1';
				else
					zero_s <= '0';
				end if;
        
			when operation_COMPARE | operation_COMPARE_kk =>
				result_s <= sA_i;
				if (sA_i < sB_i) then
					carry_s <= '1';
				else
					carry_s <= '0';
				end if;
				if (sA_i = sB_i) then
					zero_s <= '1';
				else
					zero_s <= '0';
				end if;
				
			when operation_TEST | operation_TEST_kk =>
				result_s <= sA_i;
				carry_s <= (sA_i(7) and sB_i(7)) xor (sA_i(6) and sB_i(6)) xor (sA_i(5) and sB_i(5)) xor (sA_i(4) and sB_i(4)) xor (sA_i(3) and sB_i(3)) xor (sA_i(2) and sB_i(2)) xor (sA_i(1) and sB_i(1)) xor (sA_i(0) and sB_i(0));
				if ((sA_i and sB_i) = "00000000") then
					zero_s <= '1';
				else
					zero_s <= '0';
				end if;
				
			when operation_AND | operation_AND_kk =>
				result_s <= sA_i and sB_i;
				carry_s <= '0';
				if ((sA_i and sB_i) = "00000000") then
					zero_s <= '1';
				else
					zero_s <= '0';
				end if;
				
			when operation_OR | operation_OR_kk =>
				result_s <= sA_i or sB_i;
				carry_s <= '0';
				if ((sA_i or sB_i) = "00000000") then
					zero_s <= '1';
				else
					zero_s <= '0';
				end if;
				
			when operation_XOR | operation_XOR_kk =>
				result_s <= sA_i xor sB_i;
				carry_s <= '0';
				if ((sA_i xor sB_i) = "00000000") then
					zero_s <= '1';
				else
					zero_s <= '0';
				end if;
				
			when operation_LOAD | operation_Load_kk=>
				result_s <= sB_i;
				carry_s <= carry_s;
				zero_s <= zero_s;
			when others=>
				result_s <= result_s;
				carry_s <= carry_s;
				zero_s <= zero_s;
			end case;
		end if;
    end if;
 end if;
  
  end process operations;
  
  sALU_o <= result_s;
  sCARRY_o <= carry_s;
  sZERO_o <= zero_s ;

end Behavioral;
