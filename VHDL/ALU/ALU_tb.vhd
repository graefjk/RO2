----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2021 12:00:50
-- Design Name: 
-- Module Name: sim_ALU_tb - Behavioral
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

entity sim_ALU_tb is
--  Port ( );
end sim_ALU_tb;

architecture Behavioral of sim_ALU_tb is
component ALU
    Port (
       sA_i: in std_logic_vector(7 downto 0); --input signals
       sB_i: in std_logic_vector(7 downto 0);
       opcode_select_i: in std_logic_vector(5 downto 0);
       reset_i: in std_logic;
       clk_i: in std_logic;
       
       sALU_o: out std_logic_vector(7 downto 0); -- output signals
       sCARRY_o: out std_logic;
       sZERO_o: out std_logic);
end component;

signal sA: std_logic_vector(7downto 0);
signal sB: std_logic_vector(7downto 0);
signal opcode_select: std_logic_vector(5 downto 0);
signal reset: std_logic;
signal clk: std_logic;

signal sALU: std_logic_vector(7 downto 0);
signal sCARRY: std_logic;
signal sZERO: std_logic;

constant clk_period: time := 20 ns;

begin

uut: ALU port map (sA, sB, opcode_select, reset, clk, sALU, sCARRY, sZERO);

    clk_process: process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;
    
    rst_process: process
    begin
        reset <= '0';
        wait for 275 ns;
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait;
    end process;
    
    stimuli: process
	variable err_cnt: integer := 0; 
    begin
	
		wait for 10 ns;
		sA <= "00001001";
		sB <= "00110011";
		opcode_select <= "000000"; --ADD
		wait for 10 ns;
		if (not(sALU = "00111100")) then
			err_cnt := err_cnt+1;
			report "ADD Failed";
		end if;
		
		wait for 10 ns;
		sA <= "00001001";
		sB <= "00110011";
		opcode_select <= "000100"; --SUB--
		wait for 10 ns;
		if (not(sALU = "00101010")) then
			err_cnt := err_cnt+1;
			report "SUB Failed";
		end if;
		
		wait for 10 ns;
		sA <= "00001001";
		sB <= "00110011";
		opcode_select <= "110000"; --RL
		wait for 10 ns;
		if (not(sALU = "00010010")) then
			err_cnt := err_cnt+1;
			report "RL Failed";
		end if;
		
		wait for 10 ns;
		sA <= "00001001";
		sB <= "00110011";
		opcode_select <= "110010"; --SL0
		wait for 10 ns;
		if (not(sALU = "00010010")) then
			err_cnt := err_cnt+1;
			report "SL0 Failed";
		end if;
		
		wait for 10 ns;
		sA <= "00001001";
		sB <= "00110011";
		opcode_select <= "110101"; --SLA--
		wait for 10 ns;
		if (not(sALU = "000010011")) then
			err_cnt := err_cnt+1;
			report "SLA Failed";
		end if;
		
		wait for 10 ns;
		sA <= "00001001";
		sB <= "00110011";
		opcode_select <= "110111"; --SR1
		wait for 10 ns;
		if (not(sALU = "10000100")) then
			err_cnt := err_cnt+1;
			report "SR1 Failed";
		end if;
		
		wait for 10 ns;
		sA <= "10001001";
		sB <= "00110011";
		opcode_select <= "111001"; --SRX
		wait for 10 ns;
		if (not(sALU = "11000100")) then
			err_cnt := err_cnt+1;
			report "SRX Failed";
		end if;
		
		wait for 10 ns;
		sA <= "00001001";
		sB <= "00110011";
		opcode_select <= "011011"; --CompareKK
		wait for 10 ns;
		if (not(sALU = "00001001")) then
			err_cnt := err_cnt+1;
			report "CompareKK Failed";
		end if;
		
		wait for 10 ns;
		sA <= "00001001";
		sB <= "00110011";
		opcode_select <= "011000"; --Test--
		wait for 10 ns;
		if (not(sALU = "00001001")) then
			err_cnt := err_cnt+1;
			report "Test Failed";
		end if;
		
		wait for 10 ns;
		sA <= "00001001";
		sB <= "00110011";
		opcode_select <= "001000"; --AND
		wait for 10 ns;
		if (not(sALU = "00000001")) then
			err_cnt := err_cnt+1;
			report "AND Failed";
		end if;
		
		wait for 10 ns;
		sA <= "00001001";
		sB <= "00110011";
		opcode_select <= "001011"; --ORKK
		wait for 10 ns;
		if (not(sALU = "00111011")) then
			err_cnt := err_cnt+1;
			report "ORKK Failed";
		end if;
		
		wait for 10 ns;
		sA <= "00001001";
		sB <= "00110011";
		opcode_select <= "001100"; --XOR
		wait for 10 ns;
		if (not(sALU = "00111010")) then
			err_cnt := err_cnt+1;
			report "XOR Failed";
		end if;
		
		wait for 10 ns;
		sA <= "00001001";
		sB <= "00110011";
		opcode_select <= "001111"; --LOAD
		wait for 10 ns;
		if (not(sALU = "00110011")) then
			err_cnt := err_cnt+1;
			report "LOAD Failed";
		end if;
	
		if err_cnt = 0 then
            report "Test Passed";
        else
            report "Test Failed";
        end if;       
        wait;
    end process;

end Behavioral;
