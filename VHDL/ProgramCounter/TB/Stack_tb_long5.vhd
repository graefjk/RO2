----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.01.2021
-- Design Name: 
-- Module Name: sim_Stack_tb - Behavioral
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

entity sim_Stack_tb is
--  Port ( );
end sim_Stack_tb;

architecture Behavioral of sim_Stack_tb is
component stack
    port(   sPC_i : in std_ulogic_vector(11 downto 0);
            write_or_read_i: in std_ulogic; -- 0 for write, 1 for read
            enable_i: in std_ulogic;
            reset_i: in std_ulogic;
            clk_i: in std_ulogic;
            
            full_o: out std_ulogic;
            empty_o: out std_ulogic;
            
            sStack_o: out std_ulogic_vector(11 downto 0)); 
end component;

signal pc_s: std_ulogic_vector(11 downto 0);
signal write_or_read_s: std_logic;
signal enable_s: std_logic;
signal reset_s: std_logic;
signal clk_s: std_logic;

signal full_s: std_logic;
signal empty_s: std_logic;
signal sStack_s: std_ulogic_vector(11 downto 0);

constant clk_period: time := 20 ns;
constant waitTime: time := 10 ns;

begin

uut: stack port map (
			sPC_i => pc_s, 
			write_or_read_i => write_or_read_s, 
			enable_i => enable_s, 
			reset_i => reset_s, 
			clk_i => clk_s, 
			full_o => full_s, 
			empty_o => empty_s,
			sStack_o => sStack_s);

    clk_process: process
    begin
        clk_s <= '0';
        wait for clk_period / 2;
        clk_s <= '1';
        wait for clk_period / 2;
    end process;
    

    
    stimuli: process
    begin
	reset_s <= '0';
	enable_s <= '1';

 wait for waitTime;   
report "The Test has started ";

write_or_read_s <= '0';
wait for waitTime;
pc_s <= "000000000000";
wait for waitTime;
wait for waitTime;
pc_s <= "000000000001";
wait for waitTime;
wait for waitTime;
pc_s <= "000000000010";
wait for waitTime;
wait for waitTime;
pc_s <= "000000000011";
wait for waitTime;
wait for waitTime;
pc_s <= "000000000100";
wait for waitTime;
wait for waitTime;
pc_s <= "000000000101";
wait for waitTime;
wait for waitTime;
pc_s <= "000000000110";
wait for waitTime;
wait for waitTime;
pc_s <= "000000000111";
wait for waitTime;
wait for waitTime;
pc_s <= "000000001000";
wait for waitTime;
wait for waitTime;
pc_s <= "000000001001";
wait for waitTime;
wait for waitTime;
pc_s <= "000000001010";
wait for waitTime;
wait for waitTime;
pc_s <= "000000001011";
wait for waitTime;
wait for waitTime;
pc_s <= "000000001100";
wait for waitTime;
wait for waitTime;
pc_s <= "000000001101";
wait for waitTime;
wait for waitTime;
pc_s <= "000000001110";
wait for waitTime;
wait for waitTime;
pc_s <= "000000001111";
wait for waitTime;
wait for waitTime;
pc_s <= "000000010000";
wait for waitTime;
wait for waitTime;
pc_s <= "000000010001";
wait for waitTime;
wait for waitTime;
pc_s <= "000000010010";
wait for waitTime;
wait for waitTime;
pc_s <= "000000010011";
wait for waitTime;
wait for waitTime;
pc_s <= "000000010100";
wait for waitTime;
wait for waitTime;
pc_s <= "000000010101";
wait for waitTime;
wait for waitTime;
pc_s <= "000000010110";
wait for waitTime;
wait for waitTime;
pc_s <= "000000010111";
wait for waitTime;
wait for waitTime;
pc_s <= "000000011000";
wait for waitTime;
wait for waitTime;
pc_s <= "000000011001";
wait for waitTime;
wait for waitTime;
pc_s <= "000000011010";
wait for waitTime;
wait for waitTime;
pc_s <= "000000011011";
wait for waitTime;
wait for waitTime;
pc_s <= "000000011100";
wait for waitTime;
wait for waitTime;
pc_s <= "000000011101";
wait for waitTime;
wait for waitTime;
pc_s <= "000000011110";
wait for waitTime;
wait for waitTime;
pc_s <= "000000011111";
wait for waitTime;
wait for waitTime;
pc_s <= "000000100000";
wait for waitTime;
wait for waitTime;
pc_s <= "000000100001";
wait for waitTime;
wait for waitTime;
pc_s <= "000000100010";
wait for waitTime;
wait for waitTime;
pc_s <= "000000100011";
wait for waitTime;
wait for waitTime;
pc_s <= "000000100100";
wait for waitTime;
wait for waitTime;
pc_s <= "000000100101";
wait for waitTime;
wait for waitTime;
pc_s <= "000000100110";
wait for waitTime;
wait for waitTime;
pc_s <= "000000100111";
wait for waitTime;
wait for waitTime;
pc_s <= "000000101000";
wait for waitTime;
wait for waitTime;
pc_s <= "000000101001";
wait for waitTime;
wait for waitTime;
pc_s <= "000000101010";
wait for waitTime;
wait for waitTime;
pc_s <= "000000101011";
wait for waitTime;
wait for waitTime;
pc_s <= "000000101100";
wait for waitTime;
wait for waitTime;
pc_s <= "000000101101";
wait for waitTime;
wait for waitTime;
pc_s <= "000000101110";
wait for waitTime;
wait for waitTime;
pc_s <= "000000101111";
wait for waitTime;
wait for waitTime;
pc_s <= "000000110000";
wait for waitTime;
wait for waitTime;
pc_s <= "000000110001";
wait for waitTime;
wait for waitTime;
pc_s <= "000000110010";
wait for waitTime;
wait for waitTime;
pc_s <= "000000110011";
wait for waitTime;
wait for waitTime;
pc_s <= "000000110100";
wait for waitTime;
wait for waitTime;
pc_s <= "000000110101";
wait for waitTime;
wait for waitTime;
pc_s <= "000000110110";
wait for waitTime;
wait for waitTime;
pc_s <= "000000110111";
wait for waitTime;
wait for waitTime;
pc_s <= "000000111000";
wait for waitTime;
wait for waitTime;
pc_s <= "000000111001";
wait for waitTime;
wait for waitTime;
pc_s <= "000000111010";
wait for waitTime;
wait for waitTime;
pc_s <= "000000111011";
wait for waitTime;
wait for waitTime;
pc_s <= "000000111100";
wait for waitTime;
wait for waitTime;
pc_s <= "000000111101";
wait for waitTime;
wait for waitTime;
pc_s <= "000000111110";
wait for waitTime;
wait for waitTime;
pc_s <= "000000111111";
wait for waitTime;
wait for waitTime;
pc_s <= "000001000000";
wait for waitTime;
wait for waitTime;
pc_s <= "000001000001";
wait for waitTime;
wait for waitTime;
pc_s <= "000001000010";
wait for waitTime;
wait for waitTime;
pc_s <= "000001000011";
wait for waitTime;
wait for waitTime;
pc_s <= "000001000100";
wait for waitTime;
wait for waitTime;
pc_s <= "000001000101";
wait for waitTime;
wait for waitTime;
pc_s <= "000001000110";
wait for waitTime;
wait for waitTime;
pc_s <= "000001000111";
wait for waitTime;
wait for waitTime;
pc_s <= "000001001000";
wait for waitTime;
wait for waitTime;
pc_s <= "000001001001";
wait for waitTime;
wait for waitTime;
pc_s <= "000001001010";
wait for waitTime;
wait for waitTime;
pc_s <= "000001001011";
wait for waitTime;
wait for waitTime;
pc_s <= "000001001100";
wait for waitTime;
wait for waitTime;
pc_s <= "000001001101";
wait for waitTime;
wait for waitTime;
pc_s <= "000001001110";
wait for waitTime;
wait for waitTime;
pc_s <= "000001001111";
wait for waitTime;
wait for waitTime;
pc_s <= "000001010000";
wait for waitTime;
wait for waitTime;
pc_s <= "000001010001";
wait for waitTime;
wait for waitTime;
pc_s <= "000001010010";
wait for waitTime;
wait for waitTime;
pc_s <= "000001010011";
wait for waitTime;
wait for waitTime;
pc_s <= "000001010100";
wait for waitTime;
wait for waitTime;
pc_s <= "000001010101";
wait for waitTime;
wait for waitTime;
pc_s <= "000001010110";
wait for waitTime;
wait for waitTime;
pc_s <= "000001010111";
wait for waitTime;
wait for waitTime;
pc_s <= "000001011000";
wait for waitTime;
wait for waitTime;
pc_s <= "000001011001";
wait for waitTime;
wait for waitTime;
pc_s <= "000001011010";
wait for waitTime;
wait for waitTime;
pc_s <= "000001011011";
wait for waitTime;
wait for waitTime;
pc_s <= "000001011100";
wait for waitTime;
wait for waitTime;
pc_s <= "000001011101";
wait for waitTime;
wait for waitTime;
pc_s <= "000001011110";
wait for waitTime;
wait for waitTime;
pc_s <= "000001011111";
wait for waitTime;
wait for waitTime;
pc_s <= "000001100000";
wait for waitTime;
wait for waitTime;
pc_s <= "000001100001";
wait for waitTime;
wait for waitTime;
pc_s <= "000001100010";
wait for waitTime;
wait for waitTime;
pc_s <= "000001100011";
wait for waitTime;
wait for waitTime;
pc_s <= "000001100100";
wait for waitTime;
wait for waitTime;
pc_s <= "000001100101";
wait for waitTime;
wait for waitTime;
pc_s <= "000001100110";
wait for waitTime;
wait for waitTime;
pc_s <= "000001100111";
wait for waitTime;
wait for waitTime;
pc_s <= "000001101000";
wait for waitTime;
wait for waitTime;
pc_s <= "000001101001";
wait for waitTime;
wait for waitTime;
pc_s <= "000001101010";
wait for waitTime;
wait for waitTime;
pc_s <= "000001101011";
wait for waitTime;
wait for waitTime;
pc_s <= "000001101100";
wait for waitTime;
wait for waitTime;
pc_s <= "000001101101";
wait for waitTime;
wait for waitTime;
pc_s <= "000001101110";
wait for waitTime;
wait for waitTime;
pc_s <= "000001101111";
wait for waitTime;
wait for waitTime;
pc_s <= "000001110000";
wait for waitTime;
wait for waitTime;
pc_s <= "000001110001";
wait for waitTime;
wait for waitTime;
pc_s <= "000001110010";
wait for waitTime;
wait for waitTime;
pc_s <= "000001110011";
wait for waitTime;
wait for waitTime;
pc_s <= "000001110100";
wait for waitTime;
wait for waitTime;
pc_s <= "000001110101";
wait for waitTime;
wait for waitTime;
pc_s <= "000001110110";
wait for waitTime;
wait for waitTime;
pc_s <= "000001110111";
wait for waitTime;
wait for waitTime;
pc_s <= "000001111000";
wait for waitTime;
wait for waitTime;
pc_s <= "000001111001";
wait for waitTime;
wait for waitTime;
pc_s <= "000001111010";
wait for waitTime;
wait for waitTime;
pc_s <= "000001111011";
wait for waitTime;
wait for waitTime;
pc_s <= "000001111100";
wait for waitTime;
wait for waitTime;
pc_s <= "000001111101";
wait for waitTime;
wait for waitTime;
pc_s <= "000001111110";
wait for waitTime;
wait for waitTime;
wait for waitTime;
write_or_read_s <= '1';
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001111110" 
	report "Stack error at 000001111110" severity error;

assert full_s = '0' 
	report "StackFull error at 000001111110" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001111110" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001111101" 
	report "Stack error at 000001111101" severity error;

assert full_s = '0' 
	report "StackFull error at 000001111101" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001111101" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001111100" 
	report "Stack error at 000001111100" severity error;

assert full_s = '0' 
	report "StackFull error at 000001111100" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001111100" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001111011" 
	report "Stack error at 000001111011" severity error;

assert full_s = '0' 
	report "StackFull error at 000001111011" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001111011" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001111010" 
	report "Stack error at 000001111010" severity error;

assert full_s = '0' 
	report "StackFull error at 000001111010" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001111010" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001111001" 
	report "Stack error at 000001111001" severity error;

assert full_s = '0' 
	report "StackFull error at 000001111001" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001111001" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001111000" 
	report "Stack error at 000001111000" severity error;

assert full_s = '0' 
	report "StackFull error at 000001111000" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001111000" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001110111" 
	report "Stack error at 000001110111" severity error;

assert full_s = '0' 
	report "StackFull error at 000001110111" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001110111" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001110110" 
	report "Stack error at 000001110110" severity error;

assert full_s = '0' 
	report "StackFull error at 000001110110" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001110110" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001110101" 
	report "Stack error at 000001110101" severity error;

assert full_s = '0' 
	report "StackFull error at 000001110101" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001110101" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001110100" 
	report "Stack error at 000001110100" severity error;

assert full_s = '0' 
	report "StackFull error at 000001110100" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001110100" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001110011" 
	report "Stack error at 000001110011" severity error;

assert full_s = '0' 
	report "StackFull error at 000001110011" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001110011" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001110010" 
	report "Stack error at 000001110010" severity error;

assert full_s = '0' 
	report "StackFull error at 000001110010" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001110010" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001110001" 
	report "Stack error at 000001110001" severity error;

assert full_s = '0' 
	report "StackFull error at 000001110001" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001110001" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001110000" 
	report "Stack error at 000001110000" severity error;

assert full_s = '0' 
	report "StackFull error at 000001110000" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001110000" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001101111" 
	report "Stack error at 000001101111" severity error;

assert full_s = '0' 
	report "StackFull error at 000001101111" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001101111" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001101110" 
	report "Stack error at 000001101110" severity error;

assert full_s = '0' 
	report "StackFull error at 000001101110" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001101110" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001101101" 
	report "Stack error at 000001101101" severity error;

assert full_s = '0' 
	report "StackFull error at 000001101101" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001101101" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001101100" 
	report "Stack error at 000001101100" severity error;

assert full_s = '0' 
	report "StackFull error at 000001101100" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001101100" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001101011" 
	report "Stack error at 000001101011" severity error;

assert full_s = '0' 
	report "StackFull error at 000001101011" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001101011" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001101010" 
	report "Stack error at 000001101010" severity error;

assert full_s = '0' 
	report "StackFull error at 000001101010" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001101010" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001101001" 
	report "Stack error at 000001101001" severity error;

assert full_s = '0' 
	report "StackFull error at 000001101001" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001101001" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001101000" 
	report "Stack error at 000001101000" severity error;

assert full_s = '0' 
	report "StackFull error at 000001101000" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001101000" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001100111" 
	report "Stack error at 000001100111" severity error;

assert full_s = '0' 
	report "StackFull error at 000001100111" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001100111" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001100110" 
	report "Stack error at 000001100110" severity error;

assert full_s = '0' 
	report "StackFull error at 000001100110" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001100110" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001100101" 
	report "Stack error at 000001100101" severity error;

assert full_s = '0' 
	report "StackFull error at 000001100101" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001100101" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001100100" 
	report "Stack error at 000001100100" severity error;

assert full_s = '0' 
	report "StackFull error at 000001100100" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001100100" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001100011" 
	report "Stack error at 000001100011" severity error;

assert full_s = '0' 
	report "StackFull error at 000001100011" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001100011" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001100010" 
	report "Stack error at 000001100010" severity error;

assert full_s = '0' 
	report "StackFull error at 000001100010" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001100010" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001100001" 
	report "Stack error at 000001100001" severity error;

assert full_s = '0' 
	report "StackFull error at 000001100001" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001100001" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001100000" 
	report "Stack error at 000001100000" severity error;

assert full_s = '0' 
	report "StackFull error at 000001100000" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001100000" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001011111" 
	report "Stack error at 000001011111" severity error;

assert full_s = '0' 
	report "StackFull error at 000001011111" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001011111" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001011110" 
	report "Stack error at 000001011110" severity error;

assert full_s = '0' 
	report "StackFull error at 000001011110" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001011110" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001011101" 
	report "Stack error at 000001011101" severity error;

assert full_s = '0' 
	report "StackFull error at 000001011101" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001011101" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001011100" 
	report "Stack error at 000001011100" severity error;

assert full_s = '0' 
	report "StackFull error at 000001011100" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001011100" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001011011" 
	report "Stack error at 000001011011" severity error;

assert full_s = '0' 
	report "StackFull error at 000001011011" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001011011" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001011010" 
	report "Stack error at 000001011010" severity error;

assert full_s = '0' 
	report "StackFull error at 000001011010" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001011010" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001011001" 
	report "Stack error at 000001011001" severity error;

assert full_s = '0' 
	report "StackFull error at 000001011001" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001011001" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001011000" 
	report "Stack error at 000001011000" severity error;

assert full_s = '0' 
	report "StackFull error at 000001011000" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001011000" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001010111" 
	report "Stack error at 000001010111" severity error;

assert full_s = '0' 
	report "StackFull error at 000001010111" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001010111" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001010110" 
	report "Stack error at 000001010110" severity error;

assert full_s = '0' 
	report "StackFull error at 000001010110" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001010110" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001010101" 
	report "Stack error at 000001010101" severity error;

assert full_s = '0' 
	report "StackFull error at 000001010101" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001010101" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001010100" 
	report "Stack error at 000001010100" severity error;

assert full_s = '0' 
	report "StackFull error at 000001010100" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001010100" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001010011" 
	report "Stack error at 000001010011" severity error;

assert full_s = '0' 
	report "StackFull error at 000001010011" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001010011" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001010010" 
	report "Stack error at 000001010010" severity error;

assert full_s = '0' 
	report "StackFull error at 000001010010" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001010010" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001010001" 
	report "Stack error at 000001010001" severity error;

assert full_s = '0' 
	report "StackFull error at 000001010001" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001010001" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001010000" 
	report "Stack error at 000001010000" severity error;

assert full_s = '0' 
	report "StackFull error at 000001010000" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001010000" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001001111" 
	report "Stack error at 000001001111" severity error;

assert full_s = '0' 
	report "StackFull error at 000001001111" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001001111" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001001110" 
	report "Stack error at 000001001110" severity error;

assert full_s = '0' 
	report "StackFull error at 000001001110" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001001110" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001001101" 
	report "Stack error at 000001001101" severity error;

assert full_s = '0' 
	report "StackFull error at 000001001101" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001001101" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001001100" 
	report "Stack error at 000001001100" severity error;

assert full_s = '0' 
	report "StackFull error at 000001001100" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001001100" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001001011" 
	report "Stack error at 000001001011" severity error;

assert full_s = '0' 
	report "StackFull error at 000001001011" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001001011" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001001010" 
	report "Stack error at 000001001010" severity error;

assert full_s = '0' 
	report "StackFull error at 000001001010" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001001010" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001001001" 
	report "Stack error at 000001001001" severity error;

assert full_s = '0' 
	report "StackFull error at 000001001001" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001001001" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001001000" 
	report "Stack error at 000001001000" severity error;

assert full_s = '0' 
	report "StackFull error at 000001001000" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001001000" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001000111" 
	report "Stack error at 000001000111" severity error;

assert full_s = '0' 
	report "StackFull error at 000001000111" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001000111" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001000110" 
	report "Stack error at 000001000110" severity error;

assert full_s = '0' 
	report "StackFull error at 000001000110" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001000110" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001000101" 
	report "Stack error at 000001000101" severity error;

assert full_s = '0' 
	report "StackFull error at 000001000101" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001000101" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001000100" 
	report "Stack error at 000001000100" severity error;

assert full_s = '0' 
	report "StackFull error at 000001000100" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001000100" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001000011" 
	report "Stack error at 000001000011" severity error;

assert full_s = '0' 
	report "StackFull error at 000001000011" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001000011" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001000010" 
	report "Stack error at 000001000010" severity error;

assert full_s = '0' 
	report "StackFull error at 000001000010" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001000010" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001000001" 
	report "Stack error at 000001000001" severity error;

assert full_s = '0' 
	report "StackFull error at 000001000001" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001000001" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000001000000" 
	report "Stack error at 000001000000" severity error;

assert full_s = '0' 
	report "StackFull error at 000001000000" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000001000000" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000111111" 
	report "Stack error at 000000111111" severity error;

assert full_s = '0' 
	report "StackFull error at 000000111111" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000111111" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000111110" 
	report "Stack error at 000000111110" severity error;

assert full_s = '0' 
	report "StackFull error at 000000111110" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000111110" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000111101" 
	report "Stack error at 000000111101" severity error;

assert full_s = '0' 
	report "StackFull error at 000000111101" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000111101" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000111100" 
	report "Stack error at 000000111100" severity error;

assert full_s = '0' 
	report "StackFull error at 000000111100" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000111100" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000111011" 
	report "Stack error at 000000111011" severity error;

assert full_s = '0' 
	report "StackFull error at 000000111011" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000111011" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000111010" 
	report "Stack error at 000000111010" severity error;

assert full_s = '0' 
	report "StackFull error at 000000111010" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000111010" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000111001" 
	report "Stack error at 000000111001" severity error;

assert full_s = '0' 
	report "StackFull error at 000000111001" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000111001" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000111000" 
	report "Stack error at 000000111000" severity error;

assert full_s = '0' 
	report "StackFull error at 000000111000" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000111000" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000110111" 
	report "Stack error at 000000110111" severity error;

assert full_s = '0' 
	report "StackFull error at 000000110111" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000110111" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000110110" 
	report "Stack error at 000000110110" severity error;

assert full_s = '0' 
	report "StackFull error at 000000110110" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000110110" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000110101" 
	report "Stack error at 000000110101" severity error;

assert full_s = '0' 
	report "StackFull error at 000000110101" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000110101" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000110100" 
	report "Stack error at 000000110100" severity error;

assert full_s = '0' 
	report "StackFull error at 000000110100" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000110100" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000110011" 
	report "Stack error at 000000110011" severity error;

assert full_s = '0' 
	report "StackFull error at 000000110011" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000110011" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000110010" 
	report "Stack error at 000000110010" severity error;

assert full_s = '0' 
	report "StackFull error at 000000110010" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000110010" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000110001" 
	report "Stack error at 000000110001" severity error;

assert full_s = '0' 
	report "StackFull error at 000000110001" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000110001" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000110000" 
	report "Stack error at 000000110000" severity error;

assert full_s = '0' 
	report "StackFull error at 000000110000" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000110000" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000101111" 
	report "Stack error at 000000101111" severity error;

assert full_s = '0' 
	report "StackFull error at 000000101111" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000101111" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000101110" 
	report "Stack error at 000000101110" severity error;

assert full_s = '0' 
	report "StackFull error at 000000101110" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000101110" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000101101" 
	report "Stack error at 000000101101" severity error;

assert full_s = '0' 
	report "StackFull error at 000000101101" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000101101" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000101100" 
	report "Stack error at 000000101100" severity error;

assert full_s = '0' 
	report "StackFull error at 000000101100" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000101100" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000101011" 
	report "Stack error at 000000101011" severity error;

assert full_s = '0' 
	report "StackFull error at 000000101011" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000101011" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000101010" 
	report "Stack error at 000000101010" severity error;

assert full_s = '0' 
	report "StackFull error at 000000101010" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000101010" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000101001" 
	report "Stack error at 000000101001" severity error;

assert full_s = '0' 
	report "StackFull error at 000000101001" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000101001" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000101000" 
	report "Stack error at 000000101000" severity error;

assert full_s = '0' 
	report "StackFull error at 000000101000" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000101000" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000100111" 
	report "Stack error at 000000100111" severity error;

assert full_s = '0' 
	report "StackFull error at 000000100111" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000100111" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000100110" 
	report "Stack error at 000000100110" severity error;

assert full_s = '0' 
	report "StackFull error at 000000100110" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000100110" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000100101" 
	report "Stack error at 000000100101" severity error;

assert full_s = '0' 
	report "StackFull error at 000000100101" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000100101" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000100100" 
	report "Stack error at 000000100100" severity error;

assert full_s = '0' 
	report "StackFull error at 000000100100" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000100100" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000100011" 
	report "Stack error at 000000100011" severity error;

assert full_s = '0' 
	report "StackFull error at 000000100011" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000100011" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000100010" 
	report "Stack error at 000000100010" severity error;

assert full_s = '0' 
	report "StackFull error at 000000100010" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000100010" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000100001" 
	report "Stack error at 000000100001" severity error;

assert full_s = '0' 
	report "StackFull error at 000000100001" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000100001" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000100000" 
	report "Stack error at 000000100000" severity error;

assert full_s = '0' 
	report "StackFull error at 000000100000" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000100000" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000011111" 
	report "Stack error at 000000011111" severity error;

assert full_s = '0' 
	report "StackFull error at 000000011111" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000011111" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000011110" 
	report "Stack error at 000000011110" severity error;

assert full_s = '0' 
	report "StackFull error at 000000011110" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000011110" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000011101" 
	report "Stack error at 000000011101" severity error;

assert full_s = '0' 
	report "StackFull error at 000000011101" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000011101" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000011100" 
	report "Stack error at 000000011100" severity error;

assert full_s = '0' 
	report "StackFull error at 000000011100" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000011100" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000011011" 
	report "Stack error at 000000011011" severity error;

assert full_s = '0' 
	report "StackFull error at 000000011011" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000011011" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000011010" 
	report "Stack error at 000000011010" severity error;

assert full_s = '0' 
	report "StackFull error at 000000011010" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000011010" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000011001" 
	report "Stack error at 000000011001" severity error;

assert full_s = '0' 
	report "StackFull error at 000000011001" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000011001" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000011000" 
	report "Stack error at 000000011000" severity error;

assert full_s = '0' 
	report "StackFull error at 000000011000" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000011000" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000010111" 
	report "Stack error at 000000010111" severity error;

assert full_s = '0' 
	report "StackFull error at 000000010111" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000010111" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000010110" 
	report "Stack error at 000000010110" severity error;

assert full_s = '0' 
	report "StackFull error at 000000010110" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000010110" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000010101" 
	report "Stack error at 000000010101" severity error;

assert full_s = '0' 
	report "StackFull error at 000000010101" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000010101" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000010100" 
	report "Stack error at 000000010100" severity error;

assert full_s = '0' 
	report "StackFull error at 000000010100" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000010100" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000010011" 
	report "Stack error at 000000010011" severity error;

assert full_s = '0' 
	report "StackFull error at 000000010011" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000010011" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000010010" 
	report "Stack error at 000000010010" severity error;

assert full_s = '0' 
	report "StackFull error at 000000010010" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000010010" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000010001" 
	report "Stack error at 000000010001" severity error;

assert full_s = '0' 
	report "StackFull error at 000000010001" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000010001" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000010000" 
	report "Stack error at 000000010000" severity error;

assert full_s = '0' 
	report "StackFull error at 000000010000" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000010000" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000001111" 
	report "Stack error at 000000001111" severity error;

assert full_s = '0' 
	report "StackFull error at 000000001111" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000001111" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000001110" 
	report "Stack error at 000000001110" severity error;

assert full_s = '0' 
	report "StackFull error at 000000001110" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000001110" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000001101" 
	report "Stack error at 000000001101" severity error;

assert full_s = '0' 
	report "StackFull error at 000000001101" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000001101" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000001100" 
	report "Stack error at 000000001100" severity error;

assert full_s = '0' 
	report "StackFull error at 000000001100" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000001100" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000001011" 
	report "Stack error at 000000001011" severity error;

assert full_s = '0' 
	report "StackFull error at 000000001011" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000001011" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000001010" 
	report "Stack error at 000000001010" severity error;

assert full_s = '0' 
	report "StackFull error at 000000001010" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000001010" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000001001" 
	report "Stack error at 000000001001" severity error;

assert full_s = '0' 
	report "StackFull error at 000000001001" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000001001" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000001000" 
	report "Stack error at 000000001000" severity error;

assert full_s = '0' 
	report "StackFull error at 000000001000" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000001000" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000000111" 
	report "Stack error at 000000000111" severity error;

assert full_s = '0' 
	report "StackFull error at 000000000111" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000000111" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000000110" 
	report "Stack error at 000000000110" severity error;

assert full_s = '0' 
	report "StackFull error at 000000000110" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000000110" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000000101" 
	report "Stack error at 000000000101" severity error;

assert full_s = '0' 
	report "StackFull error at 000000000101" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000000101" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000000100" 
	report "Stack error at 000000000100" severity error;

assert full_s = '0' 
	report "StackFull error at 000000000100" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000000100" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000000011" 
	report "Stack error at 000000000011" severity error;

assert full_s = '0' 
	report "StackFull error at 000000000011" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000000011" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000000010" 
	report "Stack error at 000000000010" severity error;

assert full_s = '0' 
	report "StackFull error at 000000000010" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000000010" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000000001" 
	report "Stack error at 000000000001" severity error;

assert full_s = '0' 
	report "StackFull error at 000000000001" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000000001" severity error;

wait for waitTime;
pc_s <= "001111001111";
wait for waitTime;
assert sStack_s = "000000000000" 
	report "Stack error at 000000000000" severity error;

assert full_s = '0' 
	report "StackFull error at 000000000000" severity error;

assert empty_s = '0' 
	report "StackEmpty error at 000000000000" severity error;

wait for waitTime;
report "The Test is finished ";

wait for 10ns;
		finish;
    end process;

end Behavioral;
