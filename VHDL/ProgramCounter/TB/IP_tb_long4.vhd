----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.01.2021
-- Design Name: 
-- Module Name: sim_IP_4_tb - Behavioral
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
use std.env.finish;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sim_IP_4_tb is
--  Port ( );
end sim_IP_4_tb;

architecture Behavioral of sim_IP_4_tb is
component IP
	generic(File_Name: string := "UndefinedTBFile.data");
    Port ( pc_i : in std_ulogic_vector(11 downto 0);
           clk_i : in std_ulogic;
           instruction_o : out std_ulogic_vector(17 downto 0));
end component;

signal pc_s: std_ulogic_vector(11 downto 0);
signal clk_s: std_logic;

signal instruction_s: std_ulogic_vector(17 downto 0);

constant clk_period: time := 20 ns;
constant waitTime: time := 5 ns;

begin

uut: IP port map (
			pc_i => pc_s, 
			clk_i => clk_s,
			instruction_o => instruction_s);

    clk_process: process
    begin
        clk_s <= '0';
        wait for clk_period / 2;
        clk_s <= '1';
        wait for clk_period / 2;
    end process;
    

    
    stimuli: process
    begin

 wait for waitTime;   
report "The Test has started ";

pc_s <= "000000000000";
wait until rising_edge(clk_s);
wait for waitTime;
assert instruction_s = "000000000000000000" 
	report "IP error before first UUU at 000000000000000000" severity error;

pc_s <= "000000000001";
wait until rising_edge(clk_s);
wait for waitTime;
assert instruction_s = "000000000000000001" 
	report "IP error before first UUU at 000000000000000001" severity error;

pc_s <= "000000000010";
wait until rising_edge(clk_s);
wait for waitTime;
assert instruction_s = "000000000000000010" 
	report "IP error before first UUU at 000000000000000010" severity error;

pc_s <= "000000000011";
wait until rising_edge(clk_s);
wait for waitTime;
assert instruction_s = "000000000000000011" 
	report "IP error before first UUU at 000000000000000011" severity error;

pc_s <= "000000000100";
wait until rising_edge(clk_s);
wait for waitTime;
assert instruction_s = "000000000000000100" 
	report "IP error before first UUU at 000000000000000100" severity error;

pc_s <= "000000000101";
wait until rising_edge(clk_s);
wait for waitTime;
assert instruction_s = "UUUUUUUUUUUUUUUUUU" 
	report "IP error at UUU at Undefined 000000000101" severity error;

pc_s <= "000000000110";
wait until rising_edge(clk_s);
wait for waitTime;
assert instruction_s = "000000000000000110" 
	report "IP error after UUU at 000000000000000110" severity error;

pc_s <= "000000000111";
wait until rising_edge(clk_s);
wait for waitTime;
assert instruction_s = "000000000000000111" 
	report "IP error after UUU at 000000000000000111" severity error;

pc_s <= "000000001000";
wait until rising_edge(clk_s);
wait for waitTime;
assert instruction_s = "000000000000001000" 
	report "IP error after UUU at 000000000000001000" severity error;

pc_s <= "000000001001";
wait until rising_edge(clk_s);
wait for waitTime;
assert instruction_s = "000000000000001001" 
	report "IP error after UUU at 000000000000001001" severity error;

pc_s <= "000000001010";
wait until rising_edge(clk_s);
wait for waitTime;
assert instruction_s = "000000000000001010" 
	report "IP error after UUU at 000000000000001010" severity error;

pc_s <= "000000001011";
wait until rising_edge(clk_s);
wait for waitTime;
assert instruction_s = "UUUUUUUUUUUUUUUUUU" 
	report "IP error second UUU at Undefined 000000001011" severity error;

pc_s <= "000000001100";
wait until rising_edge(clk_s);
wait for waitTime;
assert instruction_s = "000000000000001100" 
	report "IP error after second UUU at 000000000000001100" severity error;

pc_s <= "000000001101";
wait until rising_edge(clk_s);
wait for waitTime;
assert instruction_s = "000000000000001101" 
	report "IP error after second UUU at 000000000000001101" severity error;

pc_s <= "000000001110";
wait until rising_edge(clk_s);
wait for waitTime;
assert instruction_s = "000000000000001110" 
	report "IP error after second UUU at 000000000000001110" severity error;

pc_s <= "000000001111";
wait until rising_edge(clk_s);
wait for waitTime;
assert instruction_s = "000000000000001111" 
	report "IP error after second UUU at 000000000000001111" severity error;

pc_s <= "000000010000";
wait until rising_edge(clk_s);
wait for waitTime;
assert instruction_s = "000000000000010000" 
	report "IP error after second UUU at 000000000000010000" severity error;

report "The Test is finished ";

		finish;
    end process;

end Behavioral;
