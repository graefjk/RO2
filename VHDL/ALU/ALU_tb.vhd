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
	   enable_i: in std_logic;
       
       sALU_o: out std_logic_vector(7 downto 0); -- output signals
       sCARRY_o: out std_logic;
       sZERO_o: out std_logic);
end component;

signal sA_s: std_logic_vector(7 downto 0);
signal sB_s: std_logic_vector(7 downto 0);
signal opcode_select_s: std_logic_vector(5 downto 0);
signal reset_s: std_logic;
signal clk_s: std_logic;
signal enable_s: std_logic;

signal sALU_s: std_logic_vector(7 downto 0);
signal sCARRY_s: std_logic;
signal sZERO_s: std_logic;

constant clk_period: time := 20 ns;
constant waitTime: time := 1 ns;

begin

uut: ALU port map (
			sA_i => sA_s,
			sB_i => sB_s,
			opcode_select_i => opcode_select_s, 
			reset_i => reset_s, 
			clk_i => clk_s, 
			enable_i => enable_s,
			sALU_o => sALU_s, 
			sCARRY_o => sCARRY_s, 
			sZERO_o =>sZERO_s);

    clk_process: process
    begin
        clk_s <= '0';
        wait for clk_period / 2;
        clk_s <= '1';
        wait for clk_period / 2;
    end process;
    
    rst_process: process
    begin
        reset_s <= '0';
		wait for 2 ns;
		reset_s <= '1';
		wait for 2 ns;
		reset_s <= '0';
        wait for 275 ns;
        --reset_s <= '1';
        wait for 20 ns;
        reset_s <= '0';
        wait;
    end process;
    
    stimuli: process
	variable err_cnt: integer := 0; 
    begin
		enable_s <= '1';
		wait until falling_edge(clk_s);
		sA_s <= "00001001";
		sB_s <= "00110011";
		opcode_select_s <= "000000"; --ADD
		wait until rising_edge(clk_s);
		wait until falling_edge(clk_s);
		if (not(sALU_s = "00111100" and sCARRY_s = '0' and sZERO_s = '0')) then
			err_cnt := err_cnt+1;
			report "ADD Failed";
		end if;
		
		wait for waitTime;
		sA_s <= "00001001";
		sB_s <= "00110011";
		opcode_select_s <= "000100"; --SUB--
		wait until rising_edge(clk_s);
		wait until falling_edge(clk_s);
		if (not(sALU_s = "11010110" and sCARRY_s = '1' and sZERO_s = '0')) then
			err_cnt := err_cnt+1;
			report "SUB Failed";
		end if;
		
		wait for waitTime;
		sA_s <= "00001001";
		sB_s <= "00110011";
		opcode_select_s <= "110000"; --RL
		wait until rising_edge(clk_s);
		wait until falling_edge(clk_s);
		if (not(sALU_s = "00010010" and sCARRY_s = '0' and sZERO_s = '0')) then
			err_cnt := err_cnt+1;
			report "RL Failed";
		end if;
		
		wait for waitTime;
		sA_s <= "00001001";
		sB_s <= "00110011";
		opcode_select_s <= "110010"; --SL0
		wait until rising_edge(clk_s);
		wait until falling_edge(clk_s);
		if (not(sALU_s = "00010010" and sCARRY_s = '0' and sZERO_s = '0')) then
			err_cnt := err_cnt+1;
			report "SL0 Failed";
		end if;
		
		wait for waitTime;
		sA_s <= "00001001";
		sB_s <= "00110011";
		opcode_select_s <= "110101"; --SLA
		wait until rising_edge(clk_s);
		wait until falling_edge(clk_s);
		if (not(sALU_s = "00010011" and sCARRY_s = '0' and sZERO_s = '0')) then
			err_cnt := err_cnt+1;
			report "SLA Failed";
		end if;
		
		wait for waitTime;
		sA_s <= "00001001";
		sB_s <= "00110011";
		opcode_select_s <= "110111"; --SR1
		wait until rising_edge(clk_s);
		wait until falling_edge(clk_s);
		if (not(sALU_s = "10000100" and sCARRY_s = '1' and sZERO_s = '0')) then
			err_cnt := err_cnt+1;
			report "SR1 Failed";
		end if;
		
		wait for waitTime;
		sA_s <= "10001001";
		sB_s <= "00110011";
		opcode_select_s <= "111001"; --SRX
		wait until rising_edge(clk_s);
		wait until falling_edge(clk_s);
		if (not(sALU_s = "11000100" and sCARRY_s = '1' and sZERO_s = '0')) then
			err_cnt := err_cnt+1;
			report "SRX Failed";
		end if;
		
		wait for waitTime;
		sA_s <= "00001001";
		sB_s <= "00110011";
		opcode_select_s <= "011011"; --CompareKK
		wait until rising_edge(clk_s);
		wait until falling_edge(clk_s);
		if (not(sALU_s = "00001001" and sCARRY_s = '1' and sZERO_s = '0')) then
			err_cnt := err_cnt+1;
			report "CompareKK Failed";
		end if;
		
		wait for waitTime;
		sA_s <= "00001001";
		sB_s <= "00110011";
		opcode_select_s <= "011000"; --Test--
		wait until rising_edge(clk_s);
		wait until falling_edge(clk_s);
		if (not(sALU_s = "00001001" and sCARRY_s = '1' and sZERO_s = '0')) then
			err_cnt := err_cnt+1;
			report "Test Failed";
		end if;
		
		wait for waitTime;
		sA_s <= "00001001";
		sB_s <= "00110011";
		opcode_select_s <= "001000"; --AND
		wait until rising_edge(clk_s);
		wait until falling_edge(clk_s);
		if (not(sALU_s = "00000001" and sCARRY_s = '0' and sZERO_s = '0')) then
			err_cnt := err_cnt+1;
			report "AND Failed";
		end if;
		
		wait for waitTime;
		sA_s <= "00001001";
		sB_s <= "00110011";
		opcode_select_s <= "001011"; --ORKK
		wait until rising_edge(clk_s);
		wait until falling_edge(clk_s);
		if (not(sALU_s = "00111011" and sCARRY_s = '0' and sZERO_s = '0')) then
			err_cnt := err_cnt+1;
			report "ORKK Failed";
		end if;
		
		wait for waitTime;
		sA_s <= "00001001";
		sB_s <= "00110011";
		opcode_select_s <= "001100"; --XOR
		wait until rising_edge(clk_s);
		wait until falling_edge(clk_s);
		if (not(sALU_s = "00111010" and sCARRY_s = '0' and sZERO_s = '0')) then
			err_cnt := err_cnt+1;
			report "XOR Failed";
		end if;
		
		wait for waitTime;
		sA_s <= "00001001";
		sB_s <= "00110011";
		opcode_select_s <= "001111"; --LOAD
		wait until rising_edge(clk_s);
		wait until falling_edge(clk_s);
		if (not(sALU_s = "00110011" and sCARRY_s = '0' and sZERO_s = '0')) then
			err_cnt := err_cnt+1;
			report "LOAD Failed";
		end if;
	
		if err_cnt = 0 then
            report "Ovedrall Test Passed";
        else
            report "Ovedrall Test Failed";
        end if;       
        wait;
    end process;

end Behavioral;
