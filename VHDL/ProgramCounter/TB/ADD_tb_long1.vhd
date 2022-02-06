----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.01.2021
-- Design Name: 
-- Module Name: sim_ADD_1_tb - Behavioral
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

entity sim_ADD_1_tb is
--  Port ( );
end sim_ADD_1_tb;

architecture Behavioral of sim_ADD_1_tb is
component ADD
    port (  sA_i : in std_ulogic_vector(11 downto 0);
            sB_o : out std_ulogic_vector(11 downto 0));
end component;

signal sA_s: std_ulogic_vector(11 downto 0);
signal clk_s: std_logic;

signal sB_s: std_ulogic_vector(11 downto 0);

constant clk_period: time := 20 ns;
constant waitTime: time := 5 ns;

begin

uut: ADD port map (
			sA_i => sA_s, 
			sB_o => sB_s);

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

sA_s <= "000000000000";
wait for 1ns;
assert sB_s = "000000000001" 
	report "ADD error at 000000000001" severity error;

wait for waitTime;
sA_s <= "000000000001";
wait for 1ns;
assert sB_s = "000000000010" 
	report "ADD error at 000000000010" severity error;

wait for waitTime;
sA_s <= "000000000010";
wait for 1ns;
assert sB_s = "000000000011" 
	report "ADD error at 000000000011" severity error;

wait for waitTime;
sA_s <= "000000000011";
wait for 1ns;
assert sB_s = "000000000100" 
	report "ADD error at 000000000100" severity error;

wait for waitTime;
sA_s <= "000000000100";
wait for 1ns;
assert sB_s = "000000000101" 
	report "ADD error at 000000000101" severity error;

wait for waitTime;
sA_s <= "000000000101";
wait for 1ns;
assert sB_s = "000000000110" 
	report "ADD error at 000000000110" severity error;

wait for waitTime;
sA_s <= "000000000110";
wait for 1ns;
assert sB_s = "000000000111" 
	report "ADD error at 000000000111" severity error;

wait for waitTime;
sA_s <= "000000000111";
wait for 1ns;
assert sB_s = "000000001000" 
	report "ADD error at 000000001000" severity error;

wait for waitTime;
sA_s <= "000000001000";
wait for 1ns;
assert sB_s = "000000001001" 
	report "ADD error at 000000001001" severity error;

wait for waitTime;
sA_s <= "000000001001";
wait for 1ns;
assert sB_s = "000000001010" 
	report "ADD error at 000000001010" severity error;

wait for waitTime;
sA_s <= "000000001010";
wait for 1ns;
assert sB_s = "000000001011" 
	report "ADD error at 000000001011" severity error;

wait for waitTime;
sA_s <= "000000001011";
wait for 1ns;
assert sB_s = "000000001100" 
	report "ADD error at 000000001100" severity error;

wait for waitTime;
sA_s <= "000000001100";
wait for 1ns;
assert sB_s = "000000001101" 
	report "ADD error at 000000001101" severity error;

wait for waitTime;
sA_s <= "000000001101";
wait for 1ns;
assert sB_s = "000000001110" 
	report "ADD error at 000000001110" severity error;

wait for waitTime;
sA_s <= "000000001110";
wait for 1ns;
assert sB_s = "000000001111" 
	report "ADD error at 000000001111" severity error;

wait for waitTime;
sA_s <= "000000001111";
wait for 1ns;
assert sB_s = "000000010000" 
	report "ADD error at 000000010000" severity error;

wait for waitTime;
sA_s <= "000000010000";
wait for 1ns;
assert sB_s = "000000010001" 
	report "ADD error at 000000010001" severity error;

wait for waitTime;
sA_s <= "000000010001";
wait for 1ns;
assert sB_s = "000000010010" 
	report "ADD error at 000000010010" severity error;

wait for waitTime;
sA_s <= "000000010010";
wait for 1ns;
assert sB_s = "000000010011" 
	report "ADD error at 000000010011" severity error;

wait for waitTime;
sA_s <= "000000010011";
wait for 1ns;
assert sB_s = "000000010100" 
	report "ADD error at 000000010100" severity error;

wait for waitTime;
sA_s <= "000000010100";
wait for 1ns;
assert sB_s = "000000010101" 
	report "ADD error at 000000010101" severity error;

wait for waitTime;
sA_s <= "000000010101";
wait for 1ns;
assert sB_s = "000000010110" 
	report "ADD error at 000000010110" severity error;

wait for waitTime;
sA_s <= "000000010110";
wait for 1ns;
assert sB_s = "000000010111" 
	report "ADD error at 000000010111" severity error;

wait for waitTime;
sA_s <= "000000010111";
wait for 1ns;
assert sB_s = "000000011000" 
	report "ADD error at 000000011000" severity error;

wait for waitTime;
sA_s <= "000000011000";
wait for 1ns;
assert sB_s = "000000011001" 
	report "ADD error at 000000011001" severity error;

wait for waitTime;
sA_s <= "000000011001";
wait for 1ns;
assert sB_s = "000000011010" 
	report "ADD error at 000000011010" severity error;

wait for waitTime;
sA_s <= "000000011010";
wait for 1ns;
assert sB_s = "000000011011" 
	report "ADD error at 000000011011" severity error;

wait for waitTime;
sA_s <= "000000011011";
wait for 1ns;
assert sB_s = "000000011100" 
	report "ADD error at 000000011100" severity error;

wait for waitTime;
sA_s <= "000000011100";
wait for 1ns;
assert sB_s = "000000011101" 
	report "ADD error at 000000011101" severity error;

wait for waitTime;
sA_s <= "000000011101";
wait for 1ns;
assert sB_s = "000000011110" 
	report "ADD error at 000000011110" severity error;

wait for waitTime;
sA_s <= "000000011110";
wait for 1ns;
assert sB_s = "000000011111" 
	report "ADD error at 000000011111" severity error;

wait for waitTime;
sA_s <= "000000011111";
wait for 1ns;
assert sB_s = "000000100000" 
	report "ADD error at 000000100000" severity error;

wait for waitTime;
sA_s <= "000000100000";
wait for 1ns;
assert sB_s = "000000100001" 
	report "ADD error at 000000100001" severity error;

wait for waitTime;
sA_s <= "000000100001";
wait for 1ns;
assert sB_s = "000000100010" 
	report "ADD error at 000000100010" severity error;

wait for waitTime;
sA_s <= "000000100010";
wait for 1ns;
assert sB_s = "000000100011" 
	report "ADD error at 000000100011" severity error;

wait for waitTime;
sA_s <= "000000100011";
wait for 1ns;
assert sB_s = "000000100100" 
	report "ADD error at 000000100100" severity error;

wait for waitTime;
sA_s <= "000000100100";
wait for 1ns;
assert sB_s = "000000100101" 
	report "ADD error at 000000100101" severity error;

wait for waitTime;
sA_s <= "000000100101";
wait for 1ns;
assert sB_s = "000000100110" 
	report "ADD error at 000000100110" severity error;

wait for waitTime;
sA_s <= "000000100110";
wait for 1ns;
assert sB_s = "000000100111" 
	report "ADD error at 000000100111" severity error;

wait for waitTime;
sA_s <= "000000100111";
wait for 1ns;
assert sB_s = "000000101000" 
	report "ADD error at 000000101000" severity error;

wait for waitTime;
sA_s <= "000000101000";
wait for 1ns;
assert sB_s = "000000101001" 
	report "ADD error at 000000101001" severity error;

wait for waitTime;
sA_s <= "000000101001";
wait for 1ns;
assert sB_s = "000000101010" 
	report "ADD error at 000000101010" severity error;

wait for waitTime;
sA_s <= "000000101010";
wait for 1ns;
assert sB_s = "000000101011" 
	report "ADD error at 000000101011" severity error;

wait for waitTime;
sA_s <= "000000101011";
wait for 1ns;
assert sB_s = "000000101100" 
	report "ADD error at 000000101100" severity error;

wait for waitTime;
sA_s <= "000000101100";
wait for 1ns;
assert sB_s = "000000101101" 
	report "ADD error at 000000101101" severity error;

wait for waitTime;
sA_s <= "000000101101";
wait for 1ns;
assert sB_s = "000000101110" 
	report "ADD error at 000000101110" severity error;

wait for waitTime;
sA_s <= "000000101110";
wait for 1ns;
assert sB_s = "000000101111" 
	report "ADD error at 000000101111" severity error;

wait for waitTime;
sA_s <= "000000101111";
wait for 1ns;
assert sB_s = "000000110000" 
	report "ADD error at 000000110000" severity error;

wait for waitTime;
sA_s <= "000000110000";
wait for 1ns;
assert sB_s = "000000110001" 
	report "ADD error at 000000110001" severity error;

wait for waitTime;
sA_s <= "000000110001";
wait for 1ns;
assert sB_s = "000000110010" 
	report "ADD error at 000000110010" severity error;

wait for waitTime;
sA_s <= "000000110010";
wait for 1ns;
assert sB_s = "000000110011" 
	report "ADD error at 000000110011" severity error;

wait for waitTime;
sA_s <= "000000110011";
wait for 1ns;
assert sB_s = "000000110100" 
	report "ADD error at 000000110100" severity error;

wait for waitTime;
sA_s <= "000000110100";
wait for 1ns;
assert sB_s = "000000110101" 
	report "ADD error at 000000110101" severity error;

wait for waitTime;
sA_s <= "000000110101";
wait for 1ns;
assert sB_s = "000000110110" 
	report "ADD error at 000000110110" severity error;

wait for waitTime;
sA_s <= "000000110110";
wait for 1ns;
assert sB_s = "000000110111" 
	report "ADD error at 000000110111" severity error;

wait for waitTime;
sA_s <= "000000110111";
wait for 1ns;
assert sB_s = "000000111000" 
	report "ADD error at 000000111000" severity error;

wait for waitTime;
sA_s <= "000000111000";
wait for 1ns;
assert sB_s = "000000111001" 
	report "ADD error at 000000111001" severity error;

wait for waitTime;
sA_s <= "000000111001";
wait for 1ns;
assert sB_s = "000000111010" 
	report "ADD error at 000000111010" severity error;

wait for waitTime;
sA_s <= "000000111010";
wait for 1ns;
assert sB_s = "000000111011" 
	report "ADD error at 000000111011" severity error;

wait for waitTime;
sA_s <= "000000111011";
wait for 1ns;
assert sB_s = "000000111100" 
	report "ADD error at 000000111100" severity error;

wait for waitTime;
sA_s <= "000000111100";
wait for 1ns;
assert sB_s = "000000111101" 
	report "ADD error at 000000111101" severity error;

wait for waitTime;
sA_s <= "000000111101";
wait for 1ns;
assert sB_s = "000000111110" 
	report "ADD error at 000000111110" severity error;

wait for waitTime;
sA_s <= "000000111110";
wait for 1ns;
assert sB_s = "000000111111" 
	report "ADD error at 000000111111" severity error;

wait for waitTime;
sA_s <= "000000111111";
wait for 1ns;
assert sB_s = "000001000000" 
	report "ADD error at 000001000000" severity error;

wait for waitTime;
sA_s <= "000001000000";
wait for 1ns;
assert sB_s = "000001000001" 
	report "ADD error at 000001000001" severity error;

wait for waitTime;
sA_s <= "000001000001";
wait for 1ns;
assert sB_s = "000001000010" 
	report "ADD error at 000001000010" severity error;

wait for waitTime;
sA_s <= "000001000010";
wait for 1ns;
assert sB_s = "000001000011" 
	report "ADD error at 000001000011" severity error;

wait for waitTime;
sA_s <= "000001000011";
wait for 1ns;
assert sB_s = "000001000100" 
	report "ADD error at 000001000100" severity error;

wait for waitTime;
sA_s <= "000001000100";
wait for 1ns;
assert sB_s = "000001000101" 
	report "ADD error at 000001000101" severity error;

wait for waitTime;
sA_s <= "000001000101";
wait for 1ns;
assert sB_s = "000001000110" 
	report "ADD error at 000001000110" severity error;

wait for waitTime;
sA_s <= "000001000110";
wait for 1ns;
assert sB_s = "000001000111" 
	report "ADD error at 000001000111" severity error;

wait for waitTime;
sA_s <= "000001000111";
wait for 1ns;
assert sB_s = "000001001000" 
	report "ADD error at 000001001000" severity error;

wait for waitTime;
sA_s <= "000001001000";
wait for 1ns;
assert sB_s = "000001001001" 
	report "ADD error at 000001001001" severity error;

wait for waitTime;
sA_s <= "000001001001";
wait for 1ns;
assert sB_s = "000001001010" 
	report "ADD error at 000001001010" severity error;

wait for waitTime;
sA_s <= "000001001010";
wait for 1ns;
assert sB_s = "000001001011" 
	report "ADD error at 000001001011" severity error;

wait for waitTime;
sA_s <= "000001001011";
wait for 1ns;
assert sB_s = "000001001100" 
	report "ADD error at 000001001100" severity error;

wait for waitTime;
sA_s <= "000001001100";
wait for 1ns;
assert sB_s = "000001001101" 
	report "ADD error at 000001001101" severity error;

wait for waitTime;
sA_s <= "000001001101";
wait for 1ns;
assert sB_s = "000001001110" 
	report "ADD error at 000001001110" severity error;

wait for waitTime;
sA_s <= "000001001110";
wait for 1ns;
assert sB_s = "000001001111" 
	report "ADD error at 000001001111" severity error;

wait for waitTime;
sA_s <= "000001001111";
wait for 1ns;
assert sB_s = "000001010000" 
	report "ADD error at 000001010000" severity error;

wait for waitTime;
sA_s <= "000001010000";
wait for 1ns;
assert sB_s = "000001010001" 
	report "ADD error at 000001010001" severity error;

wait for waitTime;
sA_s <= "000001010001";
wait for 1ns;
assert sB_s = "000001010010" 
	report "ADD error at 000001010010" severity error;

wait for waitTime;
sA_s <= "000001010010";
wait for 1ns;
assert sB_s = "000001010011" 
	report "ADD error at 000001010011" severity error;

wait for waitTime;
sA_s <= "000001010011";
wait for 1ns;
assert sB_s = "000001010100" 
	report "ADD error at 000001010100" severity error;

wait for waitTime;
sA_s <= "000001010100";
wait for 1ns;
assert sB_s = "000001010101" 
	report "ADD error at 000001010101" severity error;

wait for waitTime;
sA_s <= "000001010101";
wait for 1ns;
assert sB_s = "000001010110" 
	report "ADD error at 000001010110" severity error;

wait for waitTime;
sA_s <= "000001010110";
wait for 1ns;
assert sB_s = "000001010111" 
	report "ADD error at 000001010111" severity error;

wait for waitTime;
sA_s <= "000001010111";
wait for 1ns;
assert sB_s = "000001011000" 
	report "ADD error at 000001011000" severity error;

wait for waitTime;
sA_s <= "000001011000";
wait for 1ns;
assert sB_s = "000001011001" 
	report "ADD error at 000001011001" severity error;

wait for waitTime;
sA_s <= "000001011001";
wait for 1ns;
assert sB_s = "000001011010" 
	report "ADD error at 000001011010" severity error;

wait for waitTime;
sA_s <= "000001011010";
wait for 1ns;
assert sB_s = "000001011011" 
	report "ADD error at 000001011011" severity error;

wait for waitTime;
sA_s <= "000001011011";
wait for 1ns;
assert sB_s = "000001011100" 
	report "ADD error at 000001011100" severity error;

wait for waitTime;
sA_s <= "000001011100";
wait for 1ns;
assert sB_s = "000001011101" 
	report "ADD error at 000001011101" severity error;

wait for waitTime;
sA_s <= "000001011101";
wait for 1ns;
assert sB_s = "000001011110" 
	report "ADD error at 000001011110" severity error;

wait for waitTime;
sA_s <= "000001011110";
wait for 1ns;
assert sB_s = "000001011111" 
	report "ADD error at 000001011111" severity error;

wait for waitTime;
sA_s <= "000001011111";
wait for 1ns;
assert sB_s = "000001100000" 
	report "ADD error at 000001100000" severity error;

wait for waitTime;
sA_s <= "000001100000";
wait for 1ns;
assert sB_s = "000001100001" 
	report "ADD error at 000001100001" severity error;

wait for waitTime;
sA_s <= "000001100001";
wait for 1ns;
assert sB_s = "000001100010" 
	report "ADD error at 000001100010" severity error;

wait for waitTime;
sA_s <= "000001100010";
wait for 1ns;
assert sB_s = "000001100011" 
	report "ADD error at 000001100011" severity error;

wait for waitTime;
sA_s <= "000001100011";
wait for 1ns;
assert sB_s = "000001100100" 
	report "ADD error at 000001100100" severity error;

wait for waitTime;
sA_s <= "000001100100";
wait for 1ns;
assert sB_s = "000001100101" 
	report "ADD error at 000001100101" severity error;

wait for waitTime;
sA_s <= "000001100101";
wait for 1ns;
assert sB_s = "000001100110" 
	report "ADD error at 000001100110" severity error;

wait for waitTime;
sA_s <= "000001100110";
wait for 1ns;
assert sB_s = "000001100111" 
	report "ADD error at 000001100111" severity error;

wait for waitTime;
sA_s <= "000001100111";
wait for 1ns;
assert sB_s = "000001101000" 
	report "ADD error at 000001101000" severity error;

wait for waitTime;
sA_s <= "000001101000";
wait for 1ns;
assert sB_s = "000001101001" 
	report "ADD error at 000001101001" severity error;

wait for waitTime;
sA_s <= "000001101001";
wait for 1ns;
assert sB_s = "000001101010" 
	report "ADD error at 000001101010" severity error;

wait for waitTime;
sA_s <= "000001101010";
wait for 1ns;
assert sB_s = "000001101011" 
	report "ADD error at 000001101011" severity error;

wait for waitTime;
sA_s <= "000001101011";
wait for 1ns;
assert sB_s = "000001101100" 
	report "ADD error at 000001101100" severity error;

wait for waitTime;
sA_s <= "000001101100";
wait for 1ns;
assert sB_s = "000001101101" 
	report "ADD error at 000001101101" severity error;

wait for waitTime;
sA_s <= "000001101101";
wait for 1ns;
assert sB_s = "000001101110" 
	report "ADD error at 000001101110" severity error;

wait for waitTime;
sA_s <= "000001101110";
wait for 1ns;
assert sB_s = "000001101111" 
	report "ADD error at 000001101111" severity error;

wait for waitTime;
sA_s <= "000001101111";
wait for 1ns;
assert sB_s = "000001110000" 
	report "ADD error at 000001110000" severity error;

wait for waitTime;
sA_s <= "000001110000";
wait for 1ns;
assert sB_s = "000001110001" 
	report "ADD error at 000001110001" severity error;

wait for waitTime;
sA_s <= "000001110001";
wait for 1ns;
assert sB_s = "000001110010" 
	report "ADD error at 000001110010" severity error;

wait for waitTime;
sA_s <= "000001110010";
wait for 1ns;
assert sB_s = "000001110011" 
	report "ADD error at 000001110011" severity error;

wait for waitTime;
sA_s <= "000001110011";
wait for 1ns;
assert sB_s = "000001110100" 
	report "ADD error at 000001110100" severity error;

wait for waitTime;
sA_s <= "000001110100";
wait for 1ns;
assert sB_s = "000001110101" 
	report "ADD error at 000001110101" severity error;

wait for waitTime;
sA_s <= "000001110101";
wait for 1ns;
assert sB_s = "000001110110" 
	report "ADD error at 000001110110" severity error;

wait for waitTime;
sA_s <= "000001110110";
wait for 1ns;
assert sB_s = "000001110111" 
	report "ADD error at 000001110111" severity error;

wait for waitTime;
sA_s <= "000001110111";
wait for 1ns;
assert sB_s = "000001111000" 
	report "ADD error at 000001111000" severity error;

wait for waitTime;
sA_s <= "000001111000";
wait for 1ns;
assert sB_s = "000001111001" 
	report "ADD error at 000001111001" severity error;

wait for waitTime;
sA_s <= "000001111001";
wait for 1ns;
assert sB_s = "000001111010" 
	report "ADD error at 000001111010" severity error;

wait for waitTime;
sA_s <= "000001111010";
wait for 1ns;
assert sB_s = "000001111011" 
	report "ADD error at 000001111011" severity error;

wait for waitTime;
sA_s <= "000001111011";
wait for 1ns;
assert sB_s = "000001111100" 
	report "ADD error at 000001111100" severity error;

wait for waitTime;
sA_s <= "000001111100";
wait for 1ns;
assert sB_s = "000001111101" 
	report "ADD error at 000001111101" severity error;

wait for waitTime;
sA_s <= "000001111101";
wait for 1ns;
assert sB_s = "000001111110" 
	report "ADD error at 000001111110" severity error;

wait for waitTime;
sA_s <= "000001111110";
wait for 1ns;
assert sB_s = "000001111111" 
	report "ADD error at 000001111111" severity error;

wait for waitTime;
sA_s <= "000001111111";
wait for 1ns;
assert sB_s = "000010000000" 
	report "ADD error at 000010000000" severity error;

wait for waitTime;
sA_s <= "000010000000";
wait for 1ns;
assert sB_s = "000010000001" 
	report "ADD error at 000010000001" severity error;

wait for waitTime;
sA_s <= "000010000001";
wait for 1ns;
assert sB_s = "000010000010" 
	report "ADD error at 000010000010" severity error;

wait for waitTime;
sA_s <= "000010000010";
wait for 1ns;
assert sB_s = "000010000011" 
	report "ADD error at 000010000011" severity error;

wait for waitTime;
sA_s <= "000010000011";
wait for 1ns;
assert sB_s = "000010000100" 
	report "ADD error at 000010000100" severity error;

wait for waitTime;
sA_s <= "000010000100";
wait for 1ns;
assert sB_s = "000010000101" 
	report "ADD error at 000010000101" severity error;

wait for waitTime;
sA_s <= "000010000101";
wait for 1ns;
assert sB_s = "000010000110" 
	report "ADD error at 000010000110" severity error;

wait for waitTime;
sA_s <= "000010000110";
wait for 1ns;
assert sB_s = "000010000111" 
	report "ADD error at 000010000111" severity error;

wait for waitTime;
sA_s <= "000010000111";
wait for 1ns;
assert sB_s = "000010001000" 
	report "ADD error at 000010001000" severity error;

wait for waitTime;
sA_s <= "000010001000";
wait for 1ns;
assert sB_s = "000010001001" 
	report "ADD error at 000010001001" severity error;

wait for waitTime;
sA_s <= "000010001001";
wait for 1ns;
assert sB_s = "000010001010" 
	report "ADD error at 000010001010" severity error;

wait for waitTime;
sA_s <= "000010001010";
wait for 1ns;
assert sB_s = "000010001011" 
	report "ADD error at 000010001011" severity error;

wait for waitTime;
sA_s <= "000010001011";
wait for 1ns;
assert sB_s = "000010001100" 
	report "ADD error at 000010001100" severity error;

wait for waitTime;
sA_s <= "000010001100";
wait for 1ns;
assert sB_s = "000010001101" 
	report "ADD error at 000010001101" severity error;

wait for waitTime;
sA_s <= "000010001101";
wait for 1ns;
assert sB_s = "000010001110" 
	report "ADD error at 000010001110" severity error;

wait for waitTime;
sA_s <= "000010001110";
wait for 1ns;
assert sB_s = "000010001111" 
	report "ADD error at 000010001111" severity error;

wait for waitTime;
sA_s <= "000010001111";
wait for 1ns;
assert sB_s = "000010010000" 
	report "ADD error at 000010010000" severity error;

wait for waitTime;
sA_s <= "000010010000";
wait for 1ns;
assert sB_s = "000010010001" 
	report "ADD error at 000010010001" severity error;

wait for waitTime;
sA_s <= "000010010001";
wait for 1ns;
assert sB_s = "000010010010" 
	report "ADD error at 000010010010" severity error;

wait for waitTime;
sA_s <= "000010010010";
wait for 1ns;
assert sB_s = "000010010011" 
	report "ADD error at 000010010011" severity error;

wait for waitTime;
sA_s <= "000010010011";
wait for 1ns;
assert sB_s = "000010010100" 
	report "ADD error at 000010010100" severity error;

wait for waitTime;
sA_s <= "000010010100";
wait for 1ns;
assert sB_s = "000010010101" 
	report "ADD error at 000010010101" severity error;

wait for waitTime;
sA_s <= "000010010101";
wait for 1ns;
assert sB_s = "000010010110" 
	report "ADD error at 000010010110" severity error;

wait for waitTime;
sA_s <= "000010010110";
wait for 1ns;
assert sB_s = "000010010111" 
	report "ADD error at 000010010111" severity error;

wait for waitTime;
sA_s <= "000010010111";
wait for 1ns;
assert sB_s = "000010011000" 
	report "ADD error at 000010011000" severity error;

wait for waitTime;
sA_s <= "000010011000";
wait for 1ns;
assert sB_s = "000010011001" 
	report "ADD error at 000010011001" severity error;

wait for waitTime;
sA_s <= "000010011001";
wait for 1ns;
assert sB_s = "000010011010" 
	report "ADD error at 000010011010" severity error;

wait for waitTime;
sA_s <= "000010011010";
wait for 1ns;
assert sB_s = "000010011011" 
	report "ADD error at 000010011011" severity error;

wait for waitTime;
sA_s <= "000010011011";
wait for 1ns;
assert sB_s = "000010011100" 
	report "ADD error at 000010011100" severity error;

wait for waitTime;
sA_s <= "000010011100";
wait for 1ns;
assert sB_s = "000010011101" 
	report "ADD error at 000010011101" severity error;

wait for waitTime;
sA_s <= "000010011101";
wait for 1ns;
assert sB_s = "000010011110" 
	report "ADD error at 000010011110" severity error;

wait for waitTime;
sA_s <= "000010011110";
wait for 1ns;
assert sB_s = "000010011111" 
	report "ADD error at 000010011111" severity error;

wait for waitTime;
sA_s <= "000010011111";
wait for 1ns;
assert sB_s = "000010100000" 
	report "ADD error at 000010100000" severity error;

wait for waitTime;
sA_s <= "000010100000";
wait for 1ns;
assert sB_s = "000010100001" 
	report "ADD error at 000010100001" severity error;

wait for waitTime;
sA_s <= "000010100001";
wait for 1ns;
assert sB_s = "000010100010" 
	report "ADD error at 000010100010" severity error;

wait for waitTime;
sA_s <= "000010100010";
wait for 1ns;
assert sB_s = "000010100011" 
	report "ADD error at 000010100011" severity error;

wait for waitTime;
sA_s <= "000010100011";
wait for 1ns;
assert sB_s = "000010100100" 
	report "ADD error at 000010100100" severity error;

wait for waitTime;
sA_s <= "000010100100";
wait for 1ns;
assert sB_s = "000010100101" 
	report "ADD error at 000010100101" severity error;

wait for waitTime;
sA_s <= "000010100101";
wait for 1ns;
assert sB_s = "000010100110" 
	report "ADD error at 000010100110" severity error;

wait for waitTime;
sA_s <= "000010100110";
wait for 1ns;
assert sB_s = "000010100111" 
	report "ADD error at 000010100111" severity error;

wait for waitTime;
sA_s <= "000010100111";
wait for 1ns;
assert sB_s = "000010101000" 
	report "ADD error at 000010101000" severity error;

wait for waitTime;
sA_s <= "000010101000";
wait for 1ns;
assert sB_s = "000010101001" 
	report "ADD error at 000010101001" severity error;

wait for waitTime;
sA_s <= "000010101001";
wait for 1ns;
assert sB_s = "000010101010" 
	report "ADD error at 000010101010" severity error;

wait for waitTime;
sA_s <= "000010101010";
wait for 1ns;
assert sB_s = "000010101011" 
	report "ADD error at 000010101011" severity error;

wait for waitTime;
sA_s <= "000010101011";
wait for 1ns;
assert sB_s = "000010101100" 
	report "ADD error at 000010101100" severity error;

wait for waitTime;
sA_s <= "000010101100";
wait for 1ns;
assert sB_s = "000010101101" 
	report "ADD error at 000010101101" severity error;

wait for waitTime;
sA_s <= "000010101101";
wait for 1ns;
assert sB_s = "000010101110" 
	report "ADD error at 000010101110" severity error;

wait for waitTime;
sA_s <= "000010101110";
wait for 1ns;
assert sB_s = "000010101111" 
	report "ADD error at 000010101111" severity error;

wait for waitTime;
sA_s <= "000010101111";
wait for 1ns;
assert sB_s = "000010110000" 
	report "ADD error at 000010110000" severity error;

wait for waitTime;
sA_s <= "000010110000";
wait for 1ns;
assert sB_s = "000010110001" 
	report "ADD error at 000010110001" severity error;

wait for waitTime;
sA_s <= "000010110001";
wait for 1ns;
assert sB_s = "000010110010" 
	report "ADD error at 000010110010" severity error;

wait for waitTime;
sA_s <= "000010110010";
wait for 1ns;
assert sB_s = "000010110011" 
	report "ADD error at 000010110011" severity error;

wait for waitTime;
sA_s <= "000010110011";
wait for 1ns;
assert sB_s = "000010110100" 
	report "ADD error at 000010110100" severity error;

wait for waitTime;
sA_s <= "000010110100";
wait for 1ns;
assert sB_s = "000010110101" 
	report "ADD error at 000010110101" severity error;

wait for waitTime;
sA_s <= "000010110101";
wait for 1ns;
assert sB_s = "000010110110" 
	report "ADD error at 000010110110" severity error;

wait for waitTime;
sA_s <= "000010110110";
wait for 1ns;
assert sB_s = "000010110111" 
	report "ADD error at 000010110111" severity error;

wait for waitTime;
sA_s <= "000010110111";
wait for 1ns;
assert sB_s = "000010111000" 
	report "ADD error at 000010111000" severity error;

wait for waitTime;
sA_s <= "000010111000";
wait for 1ns;
assert sB_s = "000010111001" 
	report "ADD error at 000010111001" severity error;

wait for waitTime;
sA_s <= "000010111001";
wait for 1ns;
assert sB_s = "000010111010" 
	report "ADD error at 000010111010" severity error;

wait for waitTime;
sA_s <= "000010111010";
wait for 1ns;
assert sB_s = "000010111011" 
	report "ADD error at 000010111011" severity error;

wait for waitTime;
sA_s <= "000010111011";
wait for 1ns;
assert sB_s = "000010111100" 
	report "ADD error at 000010111100" severity error;

wait for waitTime;
sA_s <= "000010111100";
wait for 1ns;
assert sB_s = "000010111101" 
	report "ADD error at 000010111101" severity error;

wait for waitTime;
sA_s <= "000010111101";
wait for 1ns;
assert sB_s = "000010111110" 
	report "ADD error at 000010111110" severity error;

wait for waitTime;
sA_s <= "000010111110";
wait for 1ns;
assert sB_s = "000010111111" 
	report "ADD error at 000010111111" severity error;

wait for waitTime;
sA_s <= "000010111111";
wait for 1ns;
assert sB_s = "000011000000" 
	report "ADD error at 000011000000" severity error;

wait for waitTime;
sA_s <= "000011000000";
wait for 1ns;
assert sB_s = "000011000001" 
	report "ADD error at 000011000001" severity error;

wait for waitTime;
sA_s <= "000011000001";
wait for 1ns;
assert sB_s = "000011000010" 
	report "ADD error at 000011000010" severity error;

wait for waitTime;
sA_s <= "000011000010";
wait for 1ns;
assert sB_s = "000011000011" 
	report "ADD error at 000011000011" severity error;

wait for waitTime;
sA_s <= "000011000011";
wait for 1ns;
assert sB_s = "000011000100" 
	report "ADD error at 000011000100" severity error;

wait for waitTime;
sA_s <= "000011000100";
wait for 1ns;
assert sB_s = "000011000101" 
	report "ADD error at 000011000101" severity error;

wait for waitTime;
sA_s <= "000011000101";
wait for 1ns;
assert sB_s = "000011000110" 
	report "ADD error at 000011000110" severity error;

wait for waitTime;
sA_s <= "000011000110";
wait for 1ns;
assert sB_s = "000011000111" 
	report "ADD error at 000011000111" severity error;

wait for waitTime;
sA_s <= "000011000111";
wait for 1ns;
assert sB_s = "000011001000" 
	report "ADD error at 000011001000" severity error;

wait for waitTime;
sA_s <= "000011001000";
wait for 1ns;
assert sB_s = "000011001001" 
	report "ADD error at 000011001001" severity error;

wait for waitTime;
sA_s <= "000011001001";
wait for 1ns;
assert sB_s = "000011001010" 
	report "ADD error at 000011001010" severity error;

wait for waitTime;
sA_s <= "000011001010";
wait for 1ns;
assert sB_s = "000011001011" 
	report "ADD error at 000011001011" severity error;

wait for waitTime;
sA_s <= "000011001011";
wait for 1ns;
assert sB_s = "000011001100" 
	report "ADD error at 000011001100" severity error;

wait for waitTime;
sA_s <= "000011001100";
wait for 1ns;
assert sB_s = "000011001101" 
	report "ADD error at 000011001101" severity error;

wait for waitTime;
sA_s <= "000011001101";
wait for 1ns;
assert sB_s = "000011001110" 
	report "ADD error at 000011001110" severity error;

wait for waitTime;
sA_s <= "000011001110";
wait for 1ns;
assert sB_s = "000011001111" 
	report "ADD error at 000011001111" severity error;

wait for waitTime;
sA_s <= "000011001111";
wait for 1ns;
assert sB_s = "000011010000" 
	report "ADD error at 000011010000" severity error;

wait for waitTime;
sA_s <= "000011010000";
wait for 1ns;
assert sB_s = "000011010001" 
	report "ADD error at 000011010001" severity error;

wait for waitTime;
sA_s <= "000011010001";
wait for 1ns;
assert sB_s = "000011010010" 
	report "ADD error at 000011010010" severity error;

wait for waitTime;
sA_s <= "000011010010";
wait for 1ns;
assert sB_s = "000011010011" 
	report "ADD error at 000011010011" severity error;

wait for waitTime;
sA_s <= "000011010011";
wait for 1ns;
assert sB_s = "000011010100" 
	report "ADD error at 000011010100" severity error;

wait for waitTime;
sA_s <= "000011010100";
wait for 1ns;
assert sB_s = "000011010101" 
	report "ADD error at 000011010101" severity error;

wait for waitTime;
sA_s <= "000011010101";
wait for 1ns;
assert sB_s = "000011010110" 
	report "ADD error at 000011010110" severity error;

wait for waitTime;
sA_s <= "000011010110";
wait for 1ns;
assert sB_s = "000011010111" 
	report "ADD error at 000011010111" severity error;

wait for waitTime;
sA_s <= "000011010111";
wait for 1ns;
assert sB_s = "000011011000" 
	report "ADD error at 000011011000" severity error;

wait for waitTime;
sA_s <= "000011011000";
wait for 1ns;
assert sB_s = "000011011001" 
	report "ADD error at 000011011001" severity error;

wait for waitTime;
sA_s <= "000011011001";
wait for 1ns;
assert sB_s = "000011011010" 
	report "ADD error at 000011011010" severity error;

wait for waitTime;
sA_s <= "000011011010";
wait for 1ns;
assert sB_s = "000011011011" 
	report "ADD error at 000011011011" severity error;

wait for waitTime;
sA_s <= "000011011011";
wait for 1ns;
assert sB_s = "000011011100" 
	report "ADD error at 000011011100" severity error;

wait for waitTime;
sA_s <= "000011011100";
wait for 1ns;
assert sB_s = "000011011101" 
	report "ADD error at 000011011101" severity error;

wait for waitTime;
sA_s <= "000011011101";
wait for 1ns;
assert sB_s = "000011011110" 
	report "ADD error at 000011011110" severity error;

wait for waitTime;
sA_s <= "000011011110";
wait for 1ns;
assert sB_s = "000011011111" 
	report "ADD error at 000011011111" severity error;

wait for waitTime;
sA_s <= "000011011111";
wait for 1ns;
assert sB_s = "000011100000" 
	report "ADD error at 000011100000" severity error;

wait for waitTime;
sA_s <= "000011100000";
wait for 1ns;
assert sB_s = "000011100001" 
	report "ADD error at 000011100001" severity error;

wait for waitTime;
sA_s <= "000011100001";
wait for 1ns;
assert sB_s = "000011100010" 
	report "ADD error at 000011100010" severity error;

wait for waitTime;
sA_s <= "000011100010";
wait for 1ns;
assert sB_s = "000011100011" 
	report "ADD error at 000011100011" severity error;

wait for waitTime;
sA_s <= "000011100011";
wait for 1ns;
assert sB_s = "000011100100" 
	report "ADD error at 000011100100" severity error;

wait for waitTime;
sA_s <= "000011100100";
wait for 1ns;
assert sB_s = "000011100101" 
	report "ADD error at 000011100101" severity error;

wait for waitTime;
sA_s <= "000011100101";
wait for 1ns;
assert sB_s = "000011100110" 
	report "ADD error at 000011100110" severity error;

wait for waitTime;
sA_s <= "000011100110";
wait for 1ns;
assert sB_s = "000011100111" 
	report "ADD error at 000011100111" severity error;

wait for waitTime;
sA_s <= "000011100111";
wait for 1ns;
assert sB_s = "000011101000" 
	report "ADD error at 000011101000" severity error;

wait for waitTime;
sA_s <= "000011101000";
wait for 1ns;
assert sB_s = "000011101001" 
	report "ADD error at 000011101001" severity error;

wait for waitTime;
sA_s <= "000011101001";
wait for 1ns;
assert sB_s = "000011101010" 
	report "ADD error at 000011101010" severity error;

wait for waitTime;
sA_s <= "000011101010";
wait for 1ns;
assert sB_s = "000011101011" 
	report "ADD error at 000011101011" severity error;

wait for waitTime;
sA_s <= "000011101011";
wait for 1ns;
assert sB_s = "000011101100" 
	report "ADD error at 000011101100" severity error;

wait for waitTime;
sA_s <= "000011101100";
wait for 1ns;
assert sB_s = "000011101101" 
	report "ADD error at 000011101101" severity error;

wait for waitTime;
sA_s <= "000011101101";
wait for 1ns;
assert sB_s = "000011101110" 
	report "ADD error at 000011101110" severity error;

wait for waitTime;
sA_s <= "000011101110";
wait for 1ns;
assert sB_s = "000011101111" 
	report "ADD error at 000011101111" severity error;

wait for waitTime;
sA_s <= "000011101111";
wait for 1ns;
assert sB_s = "000011110000" 
	report "ADD error at 000011110000" severity error;

wait for waitTime;
sA_s <= "000011110000";
wait for 1ns;
assert sB_s = "000011110001" 
	report "ADD error at 000011110001" severity error;

wait for waitTime;
sA_s <= "000011110001";
wait for 1ns;
assert sB_s = "000011110010" 
	report "ADD error at 000011110010" severity error;

wait for waitTime;
sA_s <= "000011110010";
wait for 1ns;
assert sB_s = "000011110011" 
	report "ADD error at 000011110011" severity error;

wait for waitTime;
sA_s <= "000011110011";
wait for 1ns;
assert sB_s = "000011110100" 
	report "ADD error at 000011110100" severity error;

wait for waitTime;
sA_s <= "000011110100";
wait for 1ns;
assert sB_s = "000011110101" 
	report "ADD error at 000011110101" severity error;

wait for waitTime;
sA_s <= "000011110101";
wait for 1ns;
assert sB_s = "000011110110" 
	report "ADD error at 000011110110" severity error;

wait for waitTime;
sA_s <= "000011110110";
wait for 1ns;
assert sB_s = "000011110111" 
	report "ADD error at 000011110111" severity error;

wait for waitTime;
sA_s <= "000011110111";
wait for 1ns;
assert sB_s = "000011111000" 
	report "ADD error at 000011111000" severity error;

wait for waitTime;
sA_s <= "000011111000";
wait for 1ns;
assert sB_s = "000011111001" 
	report "ADD error at 000011111001" severity error;

wait for waitTime;
sA_s <= "000011111001";
wait for 1ns;
assert sB_s = "000011111010" 
	report "ADD error at 000011111010" severity error;

wait for waitTime;
sA_s <= "000011111010";
wait for 1ns;
assert sB_s = "000011111011" 
	report "ADD error at 000011111011" severity error;

wait for waitTime;
sA_s <= "000011111011";
wait for 1ns;
assert sB_s = "000011111100" 
	report "ADD error at 000011111100" severity error;

wait for waitTime;
sA_s <= "000011111100";
wait for 1ns;
assert sB_s = "000011111101" 
	report "ADD error at 000011111101" severity error;

wait for waitTime;
sA_s <= "000011111101";
wait for 1ns;
assert sB_s = "000011111110" 
	report "ADD error at 000011111110" severity error;

wait for waitTime;
sA_s <= "000011111110";
wait for 1ns;
assert sB_s = "000011111111" 
	report "ADD error at 000011111111" severity error;

wait for waitTime;
sA_s <= "000011111111";
wait for 1ns;
assert sB_s = "000100000000" 
	report "ADD error at 000100000000" severity error;

wait for waitTime;
sA_s <= "000100000000";
wait for 1ns;
assert sB_s = "000100000001" 
	report "ADD error at 000100000001" severity error;

wait for waitTime;
sA_s <= "000100000001";
wait for 1ns;
assert sB_s = "000100000010" 
	report "ADD error at 000100000010" severity error;

wait for waitTime;
sA_s <= "000100000010";
wait for 1ns;
assert sB_s = "000100000011" 
	report "ADD error at 000100000011" severity error;

wait for waitTime;
sA_s <= "000100000011";
wait for 1ns;
assert sB_s = "000100000100" 
	report "ADD error at 000100000100" severity error;

wait for waitTime;
sA_s <= "000100000100";
wait for 1ns;
assert sB_s = "000100000101" 
	report "ADD error at 000100000101" severity error;

wait for waitTime;
sA_s <= "000100000101";
wait for 1ns;
assert sB_s = "000100000110" 
	report "ADD error at 000100000110" severity error;

wait for waitTime;
sA_s <= "000100000110";
wait for 1ns;
assert sB_s = "000100000111" 
	report "ADD error at 000100000111" severity error;

wait for waitTime;
sA_s <= "000100000111";
wait for 1ns;
assert sB_s = "000100001000" 
	report "ADD error at 000100001000" severity error;

wait for waitTime;
sA_s <= "000100001000";
wait for 1ns;
assert sB_s = "000100001001" 
	report "ADD error at 000100001001" severity error;

wait for waitTime;
sA_s <= "000100001001";
wait for 1ns;
assert sB_s = "000100001010" 
	report "ADD error at 000100001010" severity error;

wait for waitTime;
sA_s <= "000100001010";
wait for 1ns;
assert sB_s = "000100001011" 
	report "ADD error at 000100001011" severity error;

wait for waitTime;
sA_s <= "000100001011";
wait for 1ns;
assert sB_s = "000100001100" 
	report "ADD error at 000100001100" severity error;

wait for waitTime;
sA_s <= "000100001100";
wait for 1ns;
assert sB_s = "000100001101" 
	report "ADD error at 000100001101" severity error;

wait for waitTime;
sA_s <= "000100001101";
wait for 1ns;
assert sB_s = "000100001110" 
	report "ADD error at 000100001110" severity error;

wait for waitTime;
sA_s <= "000100001110";
wait for 1ns;
assert sB_s = "000100001111" 
	report "ADD error at 000100001111" severity error;

wait for waitTime;
sA_s <= "000100001111";
wait for 1ns;
assert sB_s = "000100010000" 
	report "ADD error at 000100010000" severity error;

wait for waitTime;
sA_s <= "000100010000";
wait for 1ns;
assert sB_s = "000100010001" 
	report "ADD error at 000100010001" severity error;

wait for waitTime;
sA_s <= "000100010001";
wait for 1ns;
assert sB_s = "000100010010" 
	report "ADD error at 000100010010" severity error;

wait for waitTime;
sA_s <= "000100010010";
wait for 1ns;
assert sB_s = "000100010011" 
	report "ADD error at 000100010011" severity error;

wait for waitTime;
sA_s <= "000100010011";
wait for 1ns;
assert sB_s = "000100010100" 
	report "ADD error at 000100010100" severity error;

wait for waitTime;
sA_s <= "000100010100";
wait for 1ns;
assert sB_s = "000100010101" 
	report "ADD error at 000100010101" severity error;

wait for waitTime;
sA_s <= "000100010101";
wait for 1ns;
assert sB_s = "000100010110" 
	report "ADD error at 000100010110" severity error;

wait for waitTime;
sA_s <= "000100010110";
wait for 1ns;
assert sB_s = "000100010111" 
	report "ADD error at 000100010111" severity error;

wait for waitTime;
sA_s <= "000100010111";
wait for 1ns;
assert sB_s = "000100011000" 
	report "ADD error at 000100011000" severity error;

wait for waitTime;
sA_s <= "000100011000";
wait for 1ns;
assert sB_s = "000100011001" 
	report "ADD error at 000100011001" severity error;

wait for waitTime;
sA_s <= "000100011001";
wait for 1ns;
assert sB_s = "000100011010" 
	report "ADD error at 000100011010" severity error;

wait for waitTime;
sA_s <= "000100011010";
wait for 1ns;
assert sB_s = "000100011011" 
	report "ADD error at 000100011011" severity error;

wait for waitTime;
sA_s <= "000100011011";
wait for 1ns;
assert sB_s = "000100011100" 
	report "ADD error at 000100011100" severity error;

wait for waitTime;
sA_s <= "000100011100";
wait for 1ns;
assert sB_s = "000100011101" 
	report "ADD error at 000100011101" severity error;

wait for waitTime;
sA_s <= "000100011101";
wait for 1ns;
assert sB_s = "000100011110" 
	report "ADD error at 000100011110" severity error;

wait for waitTime;
sA_s <= "000100011110";
wait for 1ns;
assert sB_s = "000100011111" 
	report "ADD error at 000100011111" severity error;

wait for waitTime;
sA_s <= "000100011111";
wait for 1ns;
assert sB_s = "000100100000" 
	report "ADD error at 000100100000" severity error;

wait for waitTime;
sA_s <= "000100100000";
wait for 1ns;
assert sB_s = "000100100001" 
	report "ADD error at 000100100001" severity error;

wait for waitTime;
sA_s <= "000100100001";
wait for 1ns;
assert sB_s = "000100100010" 
	report "ADD error at 000100100010" severity error;

wait for waitTime;
sA_s <= "000100100010";
wait for 1ns;
assert sB_s = "000100100011" 
	report "ADD error at 000100100011" severity error;

wait for waitTime;
sA_s <= "000100100011";
wait for 1ns;
assert sB_s = "000100100100" 
	report "ADD error at 000100100100" severity error;

wait for waitTime;
sA_s <= "000100100100";
wait for 1ns;
assert sB_s = "000100100101" 
	report "ADD error at 000100100101" severity error;

wait for waitTime;
sA_s <= "000100100101";
wait for 1ns;
assert sB_s = "000100100110" 
	report "ADD error at 000100100110" severity error;

wait for waitTime;
sA_s <= "000100100110";
wait for 1ns;
assert sB_s = "000100100111" 
	report "ADD error at 000100100111" severity error;

wait for waitTime;
sA_s <= "000100100111";
wait for 1ns;
assert sB_s = "000100101000" 
	report "ADD error at 000100101000" severity error;

wait for waitTime;
sA_s <= "000100101000";
wait for 1ns;
assert sB_s = "000100101001" 
	report "ADD error at 000100101001" severity error;

wait for waitTime;
sA_s <= "000100101001";
wait for 1ns;
assert sB_s = "000100101010" 
	report "ADD error at 000100101010" severity error;

wait for waitTime;
sA_s <= "000100101010";
wait for 1ns;
assert sB_s = "000100101011" 
	report "ADD error at 000100101011" severity error;

wait for waitTime;
sA_s <= "000100101011";
wait for 1ns;
assert sB_s = "000100101100" 
	report "ADD error at 000100101100" severity error;

wait for waitTime;
sA_s <= "000100101100";
wait for 1ns;
assert sB_s = "000100101101" 
	report "ADD error at 000100101101" severity error;

wait for waitTime;
sA_s <= "000100101101";
wait for 1ns;
assert sB_s = "000100101110" 
	report "ADD error at 000100101110" severity error;

wait for waitTime;
sA_s <= "000100101110";
wait for 1ns;
assert sB_s = "000100101111" 
	report "ADD error at 000100101111" severity error;

wait for waitTime;
sA_s <= "000100101111";
wait for 1ns;
assert sB_s = "000100110000" 
	report "ADD error at 000100110000" severity error;

wait for waitTime;
sA_s <= "000100110000";
wait for 1ns;
assert sB_s = "000100110001" 
	report "ADD error at 000100110001" severity error;

wait for waitTime;
sA_s <= "000100110001";
wait for 1ns;
assert sB_s = "000100110010" 
	report "ADD error at 000100110010" severity error;

wait for waitTime;
sA_s <= "000100110010";
wait for 1ns;
assert sB_s = "000100110011" 
	report "ADD error at 000100110011" severity error;

wait for waitTime;
sA_s <= "000100110011";
wait for 1ns;
assert sB_s = "000100110100" 
	report "ADD error at 000100110100" severity error;

wait for waitTime;
sA_s <= "000100110100";
wait for 1ns;
assert sB_s = "000100110101" 
	report "ADD error at 000100110101" severity error;

wait for waitTime;
sA_s <= "000100110101";
wait for 1ns;
assert sB_s = "000100110110" 
	report "ADD error at 000100110110" severity error;

wait for waitTime;
sA_s <= "000100110110";
wait for 1ns;
assert sB_s = "000100110111" 
	report "ADD error at 000100110111" severity error;

wait for waitTime;
sA_s <= "000100110111";
wait for 1ns;
assert sB_s = "000100111000" 
	report "ADD error at 000100111000" severity error;

wait for waitTime;
sA_s <= "000100111000";
wait for 1ns;
assert sB_s = "000100111001" 
	report "ADD error at 000100111001" severity error;

wait for waitTime;
sA_s <= "000100111001";
wait for 1ns;
assert sB_s = "000100111010" 
	report "ADD error at 000100111010" severity error;

wait for waitTime;
sA_s <= "000100111010";
wait for 1ns;
assert sB_s = "000100111011" 
	report "ADD error at 000100111011" severity error;

wait for waitTime;
sA_s <= "000100111011";
wait for 1ns;
assert sB_s = "000100111100" 
	report "ADD error at 000100111100" severity error;

wait for waitTime;
sA_s <= "000100111100";
wait for 1ns;
assert sB_s = "000100111101" 
	report "ADD error at 000100111101" severity error;

wait for waitTime;
sA_s <= "000100111101";
wait for 1ns;
assert sB_s = "000100111110" 
	report "ADD error at 000100111110" severity error;

wait for waitTime;
sA_s <= "000100111110";
wait for 1ns;
assert sB_s = "000100111111" 
	report "ADD error at 000100111111" severity error;

wait for waitTime;
sA_s <= "000100111111";
wait for 1ns;
assert sB_s = "000101000000" 
	report "ADD error at 000101000000" severity error;

wait for waitTime;
sA_s <= "000101000000";
wait for 1ns;
assert sB_s = "000101000001" 
	report "ADD error at 000101000001" severity error;

wait for waitTime;
sA_s <= "000101000001";
wait for 1ns;
assert sB_s = "000101000010" 
	report "ADD error at 000101000010" severity error;

wait for waitTime;
sA_s <= "000101000010";
wait for 1ns;
assert sB_s = "000101000011" 
	report "ADD error at 000101000011" severity error;

wait for waitTime;
sA_s <= "000101000011";
wait for 1ns;
assert sB_s = "000101000100" 
	report "ADD error at 000101000100" severity error;

wait for waitTime;
sA_s <= "000101000100";
wait for 1ns;
assert sB_s = "000101000101" 
	report "ADD error at 000101000101" severity error;

wait for waitTime;
sA_s <= "000101000101";
wait for 1ns;
assert sB_s = "000101000110" 
	report "ADD error at 000101000110" severity error;

wait for waitTime;
sA_s <= "000101000110";
wait for 1ns;
assert sB_s = "000101000111" 
	report "ADD error at 000101000111" severity error;

wait for waitTime;
sA_s <= "000101000111";
wait for 1ns;
assert sB_s = "000101001000" 
	report "ADD error at 000101001000" severity error;

wait for waitTime;
sA_s <= "000101001000";
wait for 1ns;
assert sB_s = "000101001001" 
	report "ADD error at 000101001001" severity error;

wait for waitTime;
sA_s <= "000101001001";
wait for 1ns;
assert sB_s = "000101001010" 
	report "ADD error at 000101001010" severity error;

wait for waitTime;
sA_s <= "000101001010";
wait for 1ns;
assert sB_s = "000101001011" 
	report "ADD error at 000101001011" severity error;

wait for waitTime;
sA_s <= "000101001011";
wait for 1ns;
assert sB_s = "000101001100" 
	report "ADD error at 000101001100" severity error;

wait for waitTime;
sA_s <= "000101001100";
wait for 1ns;
assert sB_s = "000101001101" 
	report "ADD error at 000101001101" severity error;

wait for waitTime;
sA_s <= "000101001101";
wait for 1ns;
assert sB_s = "000101001110" 
	report "ADD error at 000101001110" severity error;

wait for waitTime;
sA_s <= "000101001110";
wait for 1ns;
assert sB_s = "000101001111" 
	report "ADD error at 000101001111" severity error;

wait for waitTime;
sA_s <= "000101001111";
wait for 1ns;
assert sB_s = "000101010000" 
	report "ADD error at 000101010000" severity error;

wait for waitTime;
sA_s <= "000101010000";
wait for 1ns;
assert sB_s = "000101010001" 
	report "ADD error at 000101010001" severity error;

wait for waitTime;
sA_s <= "000101010001";
wait for 1ns;
assert sB_s = "000101010010" 
	report "ADD error at 000101010010" severity error;

wait for waitTime;
sA_s <= "000101010010";
wait for 1ns;
assert sB_s = "000101010011" 
	report "ADD error at 000101010011" severity error;

wait for waitTime;
sA_s <= "000101010011";
wait for 1ns;
assert sB_s = "000101010100" 
	report "ADD error at 000101010100" severity error;

wait for waitTime;
sA_s <= "000101010100";
wait for 1ns;
assert sB_s = "000101010101" 
	report "ADD error at 000101010101" severity error;

wait for waitTime;
sA_s <= "000101010101";
wait for 1ns;
assert sB_s = "000101010110" 
	report "ADD error at 000101010110" severity error;

wait for waitTime;
sA_s <= "000101010110";
wait for 1ns;
assert sB_s = "000101010111" 
	report "ADD error at 000101010111" severity error;

wait for waitTime;
sA_s <= "000101010111";
wait for 1ns;
assert sB_s = "000101011000" 
	report "ADD error at 000101011000" severity error;

wait for waitTime;
sA_s <= "000101011000";
wait for 1ns;
assert sB_s = "000101011001" 
	report "ADD error at 000101011001" severity error;

wait for waitTime;
sA_s <= "000101011001";
wait for 1ns;
assert sB_s = "000101011010" 
	report "ADD error at 000101011010" severity error;

wait for waitTime;
sA_s <= "000101011010";
wait for 1ns;
assert sB_s = "000101011011" 
	report "ADD error at 000101011011" severity error;

wait for waitTime;
sA_s <= "000101011011";
wait for 1ns;
assert sB_s = "000101011100" 
	report "ADD error at 000101011100" severity error;

wait for waitTime;
sA_s <= "000101011100";
wait for 1ns;
assert sB_s = "000101011101" 
	report "ADD error at 000101011101" severity error;

wait for waitTime;
sA_s <= "000101011101";
wait for 1ns;
assert sB_s = "000101011110" 
	report "ADD error at 000101011110" severity error;

wait for waitTime;
sA_s <= "000101011110";
wait for 1ns;
assert sB_s = "000101011111" 
	report "ADD error at 000101011111" severity error;

wait for waitTime;
sA_s <= "000101011111";
wait for 1ns;
assert sB_s = "000101100000" 
	report "ADD error at 000101100000" severity error;

wait for waitTime;
sA_s <= "000101100000";
wait for 1ns;
assert sB_s = "000101100001" 
	report "ADD error at 000101100001" severity error;

wait for waitTime;
sA_s <= "000101100001";
wait for 1ns;
assert sB_s = "000101100010" 
	report "ADD error at 000101100010" severity error;

wait for waitTime;
sA_s <= "000101100010";
wait for 1ns;
assert sB_s = "000101100011" 
	report "ADD error at 000101100011" severity error;

wait for waitTime;
sA_s <= "000101100011";
wait for 1ns;
assert sB_s = "000101100100" 
	report "ADD error at 000101100100" severity error;

wait for waitTime;
sA_s <= "000101100100";
wait for 1ns;
assert sB_s = "000101100101" 
	report "ADD error at 000101100101" severity error;

wait for waitTime;
sA_s <= "000101100101";
wait for 1ns;
assert sB_s = "000101100110" 
	report "ADD error at 000101100110" severity error;

wait for waitTime;
sA_s <= "000101100110";
wait for 1ns;
assert sB_s = "000101100111" 
	report "ADD error at 000101100111" severity error;

wait for waitTime;
sA_s <= "000101100111";
wait for 1ns;
assert sB_s = "000101101000" 
	report "ADD error at 000101101000" severity error;

wait for waitTime;
sA_s <= "000101101000";
wait for 1ns;
assert sB_s = "000101101001" 
	report "ADD error at 000101101001" severity error;

wait for waitTime;
sA_s <= "000101101001";
wait for 1ns;
assert sB_s = "000101101010" 
	report "ADD error at 000101101010" severity error;

wait for waitTime;
sA_s <= "000101101010";
wait for 1ns;
assert sB_s = "000101101011" 
	report "ADD error at 000101101011" severity error;

wait for waitTime;
sA_s <= "000101101011";
wait for 1ns;
assert sB_s = "000101101100" 
	report "ADD error at 000101101100" severity error;

wait for waitTime;
sA_s <= "000101101100";
wait for 1ns;
assert sB_s = "000101101101" 
	report "ADD error at 000101101101" severity error;

wait for waitTime;
sA_s <= "000101101101";
wait for 1ns;
assert sB_s = "000101101110" 
	report "ADD error at 000101101110" severity error;

wait for waitTime;
sA_s <= "000101101110";
wait for 1ns;
assert sB_s = "000101101111" 
	report "ADD error at 000101101111" severity error;

wait for waitTime;
sA_s <= "000101101111";
wait for 1ns;
assert sB_s = "000101110000" 
	report "ADD error at 000101110000" severity error;

wait for waitTime;
sA_s <= "000101110000";
wait for 1ns;
assert sB_s = "000101110001" 
	report "ADD error at 000101110001" severity error;

wait for waitTime;
sA_s <= "000101110001";
wait for 1ns;
assert sB_s = "000101110010" 
	report "ADD error at 000101110010" severity error;

wait for waitTime;
sA_s <= "000101110010";
wait for 1ns;
assert sB_s = "000101110011" 
	report "ADD error at 000101110011" severity error;

wait for waitTime;
sA_s <= "000101110011";
wait for 1ns;
assert sB_s = "000101110100" 
	report "ADD error at 000101110100" severity error;

wait for waitTime;
sA_s <= "000101110100";
wait for 1ns;
assert sB_s = "000101110101" 
	report "ADD error at 000101110101" severity error;

wait for waitTime;
sA_s <= "000101110101";
wait for 1ns;
assert sB_s = "000101110110" 
	report "ADD error at 000101110110" severity error;

wait for waitTime;
sA_s <= "000101110110";
wait for 1ns;
assert sB_s = "000101110111" 
	report "ADD error at 000101110111" severity error;

wait for waitTime;
sA_s <= "000101110111";
wait for 1ns;
assert sB_s = "000101111000" 
	report "ADD error at 000101111000" severity error;

wait for waitTime;
sA_s <= "000101111000";
wait for 1ns;
assert sB_s = "000101111001" 
	report "ADD error at 000101111001" severity error;

wait for waitTime;
sA_s <= "000101111001";
wait for 1ns;
assert sB_s = "000101111010" 
	report "ADD error at 000101111010" severity error;

wait for waitTime;
sA_s <= "000101111010";
wait for 1ns;
assert sB_s = "000101111011" 
	report "ADD error at 000101111011" severity error;

wait for waitTime;
sA_s <= "000101111011";
wait for 1ns;
assert sB_s = "000101111100" 
	report "ADD error at 000101111100" severity error;

wait for waitTime;
sA_s <= "000101111100";
wait for 1ns;
assert sB_s = "000101111101" 
	report "ADD error at 000101111101" severity error;

wait for waitTime;
sA_s <= "000101111101";
wait for 1ns;
assert sB_s = "000101111110" 
	report "ADD error at 000101111110" severity error;

wait for waitTime;
sA_s <= "000101111110";
wait for 1ns;
assert sB_s = "000101111111" 
	report "ADD error at 000101111111" severity error;

wait for waitTime;
sA_s <= "000101111111";
wait for 1ns;
assert sB_s = "000110000000" 
	report "ADD error at 000110000000" severity error;

wait for waitTime;
sA_s <= "000110000000";
wait for 1ns;
assert sB_s = "000110000001" 
	report "ADD error at 000110000001" severity error;

wait for waitTime;
sA_s <= "000110000001";
wait for 1ns;
assert sB_s = "000110000010" 
	report "ADD error at 000110000010" severity error;

wait for waitTime;
sA_s <= "000110000010";
wait for 1ns;
assert sB_s = "000110000011" 
	report "ADD error at 000110000011" severity error;

wait for waitTime;
sA_s <= "000110000011";
wait for 1ns;
assert sB_s = "000110000100" 
	report "ADD error at 000110000100" severity error;

wait for waitTime;
sA_s <= "000110000100";
wait for 1ns;
assert sB_s = "000110000101" 
	report "ADD error at 000110000101" severity error;

wait for waitTime;
sA_s <= "000110000101";
wait for 1ns;
assert sB_s = "000110000110" 
	report "ADD error at 000110000110" severity error;

wait for waitTime;
sA_s <= "000110000110";
wait for 1ns;
assert sB_s = "000110000111" 
	report "ADD error at 000110000111" severity error;

wait for waitTime;
sA_s <= "000110000111";
wait for 1ns;
assert sB_s = "000110001000" 
	report "ADD error at 000110001000" severity error;

wait for waitTime;
sA_s <= "000110001000";
wait for 1ns;
assert sB_s = "000110001001" 
	report "ADD error at 000110001001" severity error;

wait for waitTime;
sA_s <= "000110001001";
wait for 1ns;
assert sB_s = "000110001010" 
	report "ADD error at 000110001010" severity error;

wait for waitTime;
sA_s <= "000110001010";
wait for 1ns;
assert sB_s = "000110001011" 
	report "ADD error at 000110001011" severity error;

wait for waitTime;
sA_s <= "000110001011";
wait for 1ns;
assert sB_s = "000110001100" 
	report "ADD error at 000110001100" severity error;

wait for waitTime;
sA_s <= "000110001100";
wait for 1ns;
assert sB_s = "000110001101" 
	report "ADD error at 000110001101" severity error;

wait for waitTime;
sA_s <= "000110001101";
wait for 1ns;
assert sB_s = "000110001110" 
	report "ADD error at 000110001110" severity error;

wait for waitTime;
sA_s <= "000110001110";
wait for 1ns;
assert sB_s = "000110001111" 
	report "ADD error at 000110001111" severity error;

wait for waitTime;
sA_s <= "000110001111";
wait for 1ns;
assert sB_s = "000110010000" 
	report "ADD error at 000110010000" severity error;

wait for waitTime;
sA_s <= "000110010000";
wait for 1ns;
assert sB_s = "000110010001" 
	report "ADD error at 000110010001" severity error;

wait for waitTime;
sA_s <= "000110010001";
wait for 1ns;
assert sB_s = "000110010010" 
	report "ADD error at 000110010010" severity error;

wait for waitTime;
sA_s <= "000110010010";
wait for 1ns;
assert sB_s = "000110010011" 
	report "ADD error at 000110010011" severity error;

wait for waitTime;
sA_s <= "000110010011";
wait for 1ns;
assert sB_s = "000110010100" 
	report "ADD error at 000110010100" severity error;

wait for waitTime;
sA_s <= "000110010100";
wait for 1ns;
assert sB_s = "000110010101" 
	report "ADD error at 000110010101" severity error;

wait for waitTime;
sA_s <= "000110010101";
wait for 1ns;
assert sB_s = "000110010110" 
	report "ADD error at 000110010110" severity error;

wait for waitTime;
sA_s <= "000110010110";
wait for 1ns;
assert sB_s = "000110010111" 
	report "ADD error at 000110010111" severity error;

wait for waitTime;
sA_s <= "000110010111";
wait for 1ns;
assert sB_s = "000110011000" 
	report "ADD error at 000110011000" severity error;

wait for waitTime;
sA_s <= "000110011000";
wait for 1ns;
assert sB_s = "000110011001" 
	report "ADD error at 000110011001" severity error;

wait for waitTime;
sA_s <= "000110011001";
wait for 1ns;
assert sB_s = "000110011010" 
	report "ADD error at 000110011010" severity error;

wait for waitTime;
sA_s <= "000110011010";
wait for 1ns;
assert sB_s = "000110011011" 
	report "ADD error at 000110011011" severity error;

wait for waitTime;
sA_s <= "000110011011";
wait for 1ns;
assert sB_s = "000110011100" 
	report "ADD error at 000110011100" severity error;

wait for waitTime;
sA_s <= "000110011100";
wait for 1ns;
assert sB_s = "000110011101" 
	report "ADD error at 000110011101" severity error;

wait for waitTime;
sA_s <= "000110011101";
wait for 1ns;
assert sB_s = "000110011110" 
	report "ADD error at 000110011110" severity error;

wait for waitTime;
sA_s <= "000110011110";
wait for 1ns;
assert sB_s = "000110011111" 
	report "ADD error at 000110011111" severity error;

wait for waitTime;
sA_s <= "000110011111";
wait for 1ns;
assert sB_s = "000110100000" 
	report "ADD error at 000110100000" severity error;

wait for waitTime;
sA_s <= "000110100000";
wait for 1ns;
assert sB_s = "000110100001" 
	report "ADD error at 000110100001" severity error;

wait for waitTime;
sA_s <= "000110100001";
wait for 1ns;
assert sB_s = "000110100010" 
	report "ADD error at 000110100010" severity error;

wait for waitTime;
sA_s <= "000110100010";
wait for 1ns;
assert sB_s = "000110100011" 
	report "ADD error at 000110100011" severity error;

wait for waitTime;
sA_s <= "000110100011";
wait for 1ns;
assert sB_s = "000110100100" 
	report "ADD error at 000110100100" severity error;

wait for waitTime;
sA_s <= "000110100100";
wait for 1ns;
assert sB_s = "000110100101" 
	report "ADD error at 000110100101" severity error;

wait for waitTime;
sA_s <= "000110100101";
wait for 1ns;
assert sB_s = "000110100110" 
	report "ADD error at 000110100110" severity error;

wait for waitTime;
sA_s <= "000110100110";
wait for 1ns;
assert sB_s = "000110100111" 
	report "ADD error at 000110100111" severity error;

wait for waitTime;
sA_s <= "000110100111";
wait for 1ns;
assert sB_s = "000110101000" 
	report "ADD error at 000110101000" severity error;

wait for waitTime;
sA_s <= "000110101000";
wait for 1ns;
assert sB_s = "000110101001" 
	report "ADD error at 000110101001" severity error;

wait for waitTime;
sA_s <= "000110101001";
wait for 1ns;
assert sB_s = "000110101010" 
	report "ADD error at 000110101010" severity error;

wait for waitTime;
sA_s <= "000110101010";
wait for 1ns;
assert sB_s = "000110101011" 
	report "ADD error at 000110101011" severity error;

wait for waitTime;
sA_s <= "000110101011";
wait for 1ns;
assert sB_s = "000110101100" 
	report "ADD error at 000110101100" severity error;

wait for waitTime;
sA_s <= "000110101100";
wait for 1ns;
assert sB_s = "000110101101" 
	report "ADD error at 000110101101" severity error;

wait for waitTime;
sA_s <= "000110101101";
wait for 1ns;
assert sB_s = "000110101110" 
	report "ADD error at 000110101110" severity error;

wait for waitTime;
sA_s <= "000110101110";
wait for 1ns;
assert sB_s = "000110101111" 
	report "ADD error at 000110101111" severity error;

wait for waitTime;
sA_s <= "000110101111";
wait for 1ns;
assert sB_s = "000110110000" 
	report "ADD error at 000110110000" severity error;

wait for waitTime;
sA_s <= "000110110000";
wait for 1ns;
assert sB_s = "000110110001" 
	report "ADD error at 000110110001" severity error;

wait for waitTime;
sA_s <= "000110110001";
wait for 1ns;
assert sB_s = "000110110010" 
	report "ADD error at 000110110010" severity error;

wait for waitTime;
sA_s <= "000110110010";
wait for 1ns;
assert sB_s = "000110110011" 
	report "ADD error at 000110110011" severity error;

wait for waitTime;
sA_s <= "000110110011";
wait for 1ns;
assert sB_s = "000110110100" 
	report "ADD error at 000110110100" severity error;

wait for waitTime;
sA_s <= "000110110100";
wait for 1ns;
assert sB_s = "000110110101" 
	report "ADD error at 000110110101" severity error;

wait for waitTime;
sA_s <= "000110110101";
wait for 1ns;
assert sB_s = "000110110110" 
	report "ADD error at 000110110110" severity error;

wait for waitTime;
sA_s <= "000110110110";
wait for 1ns;
assert sB_s = "000110110111" 
	report "ADD error at 000110110111" severity error;

wait for waitTime;
sA_s <= "000110110111";
wait for 1ns;
assert sB_s = "000110111000" 
	report "ADD error at 000110111000" severity error;

wait for waitTime;
sA_s <= "000110111000";
wait for 1ns;
assert sB_s = "000110111001" 
	report "ADD error at 000110111001" severity error;

wait for waitTime;
sA_s <= "000110111001";
wait for 1ns;
assert sB_s = "000110111010" 
	report "ADD error at 000110111010" severity error;

wait for waitTime;
sA_s <= "000110111010";
wait for 1ns;
assert sB_s = "000110111011" 
	report "ADD error at 000110111011" severity error;

wait for waitTime;
sA_s <= "000110111011";
wait for 1ns;
assert sB_s = "000110111100" 
	report "ADD error at 000110111100" severity error;

wait for waitTime;
sA_s <= "000110111100";
wait for 1ns;
assert sB_s = "000110111101" 
	report "ADD error at 000110111101" severity error;

wait for waitTime;
sA_s <= "000110111101";
wait for 1ns;
assert sB_s = "000110111110" 
	report "ADD error at 000110111110" severity error;

wait for waitTime;
sA_s <= "000110111110";
wait for 1ns;
assert sB_s = "000110111111" 
	report "ADD error at 000110111111" severity error;

wait for waitTime;
sA_s <= "000110111111";
wait for 1ns;
assert sB_s = "000111000000" 
	report "ADD error at 000111000000" severity error;

wait for waitTime;
sA_s <= "000111000000";
wait for 1ns;
assert sB_s = "000111000001" 
	report "ADD error at 000111000001" severity error;

wait for waitTime;
sA_s <= "000111000001";
wait for 1ns;
assert sB_s = "000111000010" 
	report "ADD error at 000111000010" severity error;

wait for waitTime;
sA_s <= "000111000010";
wait for 1ns;
assert sB_s = "000111000011" 
	report "ADD error at 000111000011" severity error;

wait for waitTime;
sA_s <= "000111000011";
wait for 1ns;
assert sB_s = "000111000100" 
	report "ADD error at 000111000100" severity error;

wait for waitTime;
sA_s <= "000111000100";
wait for 1ns;
assert sB_s = "000111000101" 
	report "ADD error at 000111000101" severity error;

wait for waitTime;
sA_s <= "000111000101";
wait for 1ns;
assert sB_s = "000111000110" 
	report "ADD error at 000111000110" severity error;

wait for waitTime;
sA_s <= "000111000110";
wait for 1ns;
assert sB_s = "000111000111" 
	report "ADD error at 000111000111" severity error;

wait for waitTime;
sA_s <= "000111000111";
wait for 1ns;
assert sB_s = "000111001000" 
	report "ADD error at 000111001000" severity error;

wait for waitTime;
sA_s <= "000111001000";
wait for 1ns;
assert sB_s = "000111001001" 
	report "ADD error at 000111001001" severity error;

wait for waitTime;
sA_s <= "000111001001";
wait for 1ns;
assert sB_s = "000111001010" 
	report "ADD error at 000111001010" severity error;

wait for waitTime;
sA_s <= "000111001010";
wait for 1ns;
assert sB_s = "000111001011" 
	report "ADD error at 000111001011" severity error;

wait for waitTime;
sA_s <= "000111001011";
wait for 1ns;
assert sB_s = "000111001100" 
	report "ADD error at 000111001100" severity error;

wait for waitTime;
sA_s <= "000111001100";
wait for 1ns;
assert sB_s = "000111001101" 
	report "ADD error at 000111001101" severity error;

wait for waitTime;
sA_s <= "000111001101";
wait for 1ns;
assert sB_s = "000111001110" 
	report "ADD error at 000111001110" severity error;

wait for waitTime;
sA_s <= "000111001110";
wait for 1ns;
assert sB_s = "000111001111" 
	report "ADD error at 000111001111" severity error;

wait for waitTime;
sA_s <= "000111001111";
wait for 1ns;
assert sB_s = "000111010000" 
	report "ADD error at 000111010000" severity error;

wait for waitTime;
sA_s <= "000111010000";
wait for 1ns;
assert sB_s = "000111010001" 
	report "ADD error at 000111010001" severity error;

wait for waitTime;
sA_s <= "000111010001";
wait for 1ns;
assert sB_s = "000111010010" 
	report "ADD error at 000111010010" severity error;

wait for waitTime;
sA_s <= "000111010010";
wait for 1ns;
assert sB_s = "000111010011" 
	report "ADD error at 000111010011" severity error;

wait for waitTime;
sA_s <= "000111010011";
wait for 1ns;
assert sB_s = "000111010100" 
	report "ADD error at 000111010100" severity error;

wait for waitTime;
sA_s <= "000111010100";
wait for 1ns;
assert sB_s = "000111010101" 
	report "ADD error at 000111010101" severity error;

wait for waitTime;
sA_s <= "000111010101";
wait for 1ns;
assert sB_s = "000111010110" 
	report "ADD error at 000111010110" severity error;

wait for waitTime;
sA_s <= "000111010110";
wait for 1ns;
assert sB_s = "000111010111" 
	report "ADD error at 000111010111" severity error;

wait for waitTime;
sA_s <= "000111010111";
wait for 1ns;
assert sB_s = "000111011000" 
	report "ADD error at 000111011000" severity error;

wait for waitTime;
sA_s <= "000111011000";
wait for 1ns;
assert sB_s = "000111011001" 
	report "ADD error at 000111011001" severity error;

wait for waitTime;
sA_s <= "000111011001";
wait for 1ns;
assert sB_s = "000111011010" 
	report "ADD error at 000111011010" severity error;

wait for waitTime;
sA_s <= "000111011010";
wait for 1ns;
assert sB_s = "000111011011" 
	report "ADD error at 000111011011" severity error;

wait for waitTime;
sA_s <= "000111011011";
wait for 1ns;
assert sB_s = "000111011100" 
	report "ADD error at 000111011100" severity error;

wait for waitTime;
sA_s <= "000111011100";
wait for 1ns;
assert sB_s = "000111011101" 
	report "ADD error at 000111011101" severity error;

wait for waitTime;
sA_s <= "000111011101";
wait for 1ns;
assert sB_s = "000111011110" 
	report "ADD error at 000111011110" severity error;

wait for waitTime;
sA_s <= "000111011110";
wait for 1ns;
assert sB_s = "000111011111" 
	report "ADD error at 000111011111" severity error;

wait for waitTime;
sA_s <= "000111011111";
wait for 1ns;
assert sB_s = "000111100000" 
	report "ADD error at 000111100000" severity error;

wait for waitTime;
sA_s <= "000111100000";
wait for 1ns;
assert sB_s = "000111100001" 
	report "ADD error at 000111100001" severity error;

wait for waitTime;
sA_s <= "000111100001";
wait for 1ns;
assert sB_s = "000111100010" 
	report "ADD error at 000111100010" severity error;

wait for waitTime;
sA_s <= "000111100010";
wait for 1ns;
assert sB_s = "000111100011" 
	report "ADD error at 000111100011" severity error;

wait for waitTime;
sA_s <= "000111100011";
wait for 1ns;
assert sB_s = "000111100100" 
	report "ADD error at 000111100100" severity error;

wait for waitTime;
sA_s <= "000111100100";
wait for 1ns;
assert sB_s = "000111100101" 
	report "ADD error at 000111100101" severity error;

wait for waitTime;
sA_s <= "000111100101";
wait for 1ns;
assert sB_s = "000111100110" 
	report "ADD error at 000111100110" severity error;

wait for waitTime;
sA_s <= "000111100110";
wait for 1ns;
assert sB_s = "000111100111" 
	report "ADD error at 000111100111" severity error;

wait for waitTime;
sA_s <= "000111100111";
wait for 1ns;
assert sB_s = "000111101000" 
	report "ADD error at 000111101000" severity error;

wait for waitTime;
sA_s <= "000111101000";
wait for 1ns;
assert sB_s = "000111101001" 
	report "ADD error at 000111101001" severity error;

wait for waitTime;
sA_s <= "000111101001";
wait for 1ns;
assert sB_s = "000111101010" 
	report "ADD error at 000111101010" severity error;

wait for waitTime;
sA_s <= "000111101010";
wait for 1ns;
assert sB_s = "000111101011" 
	report "ADD error at 000111101011" severity error;

wait for waitTime;
sA_s <= "000111101011";
wait for 1ns;
assert sB_s = "000111101100" 
	report "ADD error at 000111101100" severity error;

wait for waitTime;
sA_s <= "000111101100";
wait for 1ns;
assert sB_s = "000111101101" 
	report "ADD error at 000111101101" severity error;

wait for waitTime;
sA_s <= "000111101101";
wait for 1ns;
assert sB_s = "000111101110" 
	report "ADD error at 000111101110" severity error;

wait for waitTime;
sA_s <= "000111101110";
wait for 1ns;
assert sB_s = "000111101111" 
	report "ADD error at 000111101111" severity error;

wait for waitTime;
sA_s <= "000111101111";
wait for 1ns;
assert sB_s = "000111110000" 
	report "ADD error at 000111110000" severity error;

wait for waitTime;
sA_s <= "000111110000";
wait for 1ns;
assert sB_s = "000111110001" 
	report "ADD error at 000111110001" severity error;

wait for waitTime;
sA_s <= "000111110001";
wait for 1ns;
assert sB_s = "000111110010" 
	report "ADD error at 000111110010" severity error;

wait for waitTime;
sA_s <= "000111110010";
wait for 1ns;
assert sB_s = "000111110011" 
	report "ADD error at 000111110011" severity error;

wait for waitTime;
sA_s <= "000111110011";
wait for 1ns;
assert sB_s = "000111110100" 
	report "ADD error at 000111110100" severity error;

wait for waitTime;
sA_s <= "000111110100";
wait for 1ns;
assert sB_s = "000111110101" 
	report "ADD error at 000111110101" severity error;

wait for waitTime;
sA_s <= "000111110101";
wait for 1ns;
assert sB_s = "000111110110" 
	report "ADD error at 000111110110" severity error;

wait for waitTime;
sA_s <= "000111110110";
wait for 1ns;
assert sB_s = "000111110111" 
	report "ADD error at 000111110111" severity error;

wait for waitTime;
sA_s <= "000111110111";
wait for 1ns;
assert sB_s = "000111111000" 
	report "ADD error at 000111111000" severity error;

wait for waitTime;
sA_s <= "000111111000";
wait for 1ns;
assert sB_s = "000111111001" 
	report "ADD error at 000111111001" severity error;

wait for waitTime;
sA_s <= "000111111001";
wait for 1ns;
assert sB_s = "000111111010" 
	report "ADD error at 000111111010" severity error;

wait for waitTime;
sA_s <= "000111111010";
wait for 1ns;
assert sB_s = "000111111011" 
	report "ADD error at 000111111011" severity error;

wait for waitTime;
sA_s <= "000111111011";
wait for 1ns;
assert sB_s = "000111111100" 
	report "ADD error at 000111111100" severity error;

wait for waitTime;
sA_s <= "000111111100";
wait for 1ns;
assert sB_s = "000111111101" 
	report "ADD error at 000111111101" severity error;

wait for waitTime;
sA_s <= "000111111101";
wait for 1ns;
assert sB_s = "000111111110" 
	report "ADD error at 000111111110" severity error;

wait for waitTime;
sA_s <= "000111111110";
wait for 1ns;
assert sB_s = "000111111111" 
	report "ADD error at 000111111111" severity error;

wait for waitTime;
sA_s <= "000111111111";
wait for 1ns;
assert sB_s = "001000000000" 
	report "ADD error at 001000000000" severity error;

wait for waitTime;
sA_s <= "001000000000";
wait for 1ns;
assert sB_s = "001000000001" 
	report "ADD error at 001000000001" severity error;

wait for waitTime;
sA_s <= "001000000001";
wait for 1ns;
assert sB_s = "001000000010" 
	report "ADD error at 001000000010" severity error;

wait for waitTime;
sA_s <= "001000000010";
wait for 1ns;
assert sB_s = "001000000011" 
	report "ADD error at 001000000011" severity error;

wait for waitTime;
sA_s <= "001000000011";
wait for 1ns;
assert sB_s = "001000000100" 
	report "ADD error at 001000000100" severity error;

wait for waitTime;
sA_s <= "001000000100";
wait for 1ns;
assert sB_s = "001000000101" 
	report "ADD error at 001000000101" severity error;

wait for waitTime;
sA_s <= "001000000101";
wait for 1ns;
assert sB_s = "001000000110" 
	report "ADD error at 001000000110" severity error;

wait for waitTime;
sA_s <= "001000000110";
wait for 1ns;
assert sB_s = "001000000111" 
	report "ADD error at 001000000111" severity error;

wait for waitTime;
sA_s <= "001000000111";
wait for 1ns;
assert sB_s = "001000001000" 
	report "ADD error at 001000001000" severity error;

wait for waitTime;
sA_s <= "001000001000";
wait for 1ns;
assert sB_s = "001000001001" 
	report "ADD error at 001000001001" severity error;

wait for waitTime;
sA_s <= "001000001001";
wait for 1ns;
assert sB_s = "001000001010" 
	report "ADD error at 001000001010" severity error;

wait for waitTime;
sA_s <= "001000001010";
wait for 1ns;
assert sB_s = "001000001011" 
	report "ADD error at 001000001011" severity error;

wait for waitTime;
sA_s <= "001000001011";
wait for 1ns;
assert sB_s = "001000001100" 
	report "ADD error at 001000001100" severity error;

wait for waitTime;
sA_s <= "001000001100";
wait for 1ns;
assert sB_s = "001000001101" 
	report "ADD error at 001000001101" severity error;

wait for waitTime;
sA_s <= "001000001101";
wait for 1ns;
assert sB_s = "001000001110" 
	report "ADD error at 001000001110" severity error;

wait for waitTime;
sA_s <= "001000001110";
wait for 1ns;
assert sB_s = "001000001111" 
	report "ADD error at 001000001111" severity error;

wait for waitTime;
sA_s <= "001000001111";
wait for 1ns;
assert sB_s = "001000010000" 
	report "ADD error at 001000010000" severity error;

wait for waitTime;
sA_s <= "001000010000";
wait for 1ns;
assert sB_s = "001000010001" 
	report "ADD error at 001000010001" severity error;

wait for waitTime;
sA_s <= "001000010001";
wait for 1ns;
assert sB_s = "001000010010" 
	report "ADD error at 001000010010" severity error;

wait for waitTime;
sA_s <= "001000010010";
wait for 1ns;
assert sB_s = "001000010011" 
	report "ADD error at 001000010011" severity error;

wait for waitTime;
sA_s <= "001000010011";
wait for 1ns;
assert sB_s = "001000010100" 
	report "ADD error at 001000010100" severity error;

wait for waitTime;
sA_s <= "001000010100";
wait for 1ns;
assert sB_s = "001000010101" 
	report "ADD error at 001000010101" severity error;

wait for waitTime;
sA_s <= "001000010101";
wait for 1ns;
assert sB_s = "001000010110" 
	report "ADD error at 001000010110" severity error;

wait for waitTime;
sA_s <= "001000010110";
wait for 1ns;
assert sB_s = "001000010111" 
	report "ADD error at 001000010111" severity error;

wait for waitTime;
sA_s <= "001000010111";
wait for 1ns;
assert sB_s = "001000011000" 
	report "ADD error at 001000011000" severity error;

wait for waitTime;
sA_s <= "001000011000";
wait for 1ns;
assert sB_s = "001000011001" 
	report "ADD error at 001000011001" severity error;

wait for waitTime;
sA_s <= "001000011001";
wait for 1ns;
assert sB_s = "001000011010" 
	report "ADD error at 001000011010" severity error;

wait for waitTime;
sA_s <= "001000011010";
wait for 1ns;
assert sB_s = "001000011011" 
	report "ADD error at 001000011011" severity error;

wait for waitTime;
sA_s <= "001000011011";
wait for 1ns;
assert sB_s = "001000011100" 
	report "ADD error at 001000011100" severity error;

wait for waitTime;
sA_s <= "001000011100";
wait for 1ns;
assert sB_s = "001000011101" 
	report "ADD error at 001000011101" severity error;

wait for waitTime;
sA_s <= "001000011101";
wait for 1ns;
assert sB_s = "001000011110" 
	report "ADD error at 001000011110" severity error;

wait for waitTime;
sA_s <= "001000011110";
wait for 1ns;
assert sB_s = "001000011111" 
	report "ADD error at 001000011111" severity error;

wait for waitTime;
sA_s <= "001000011111";
wait for 1ns;
assert sB_s = "001000100000" 
	report "ADD error at 001000100000" severity error;

wait for waitTime;
sA_s <= "001000100000";
wait for 1ns;
assert sB_s = "001000100001" 
	report "ADD error at 001000100001" severity error;

wait for waitTime;
sA_s <= "001000100001";
wait for 1ns;
assert sB_s = "001000100010" 
	report "ADD error at 001000100010" severity error;

wait for waitTime;
sA_s <= "001000100010";
wait for 1ns;
assert sB_s = "001000100011" 
	report "ADD error at 001000100011" severity error;

wait for waitTime;
sA_s <= "001000100011";
wait for 1ns;
assert sB_s = "001000100100" 
	report "ADD error at 001000100100" severity error;

wait for waitTime;
sA_s <= "001000100100";
wait for 1ns;
assert sB_s = "001000100101" 
	report "ADD error at 001000100101" severity error;

wait for waitTime;
sA_s <= "001000100101";
wait for 1ns;
assert sB_s = "001000100110" 
	report "ADD error at 001000100110" severity error;

wait for waitTime;
sA_s <= "001000100110";
wait for 1ns;
assert sB_s = "001000100111" 
	report "ADD error at 001000100111" severity error;

wait for waitTime;
sA_s <= "001000100111";
wait for 1ns;
assert sB_s = "001000101000" 
	report "ADD error at 001000101000" severity error;

wait for waitTime;
sA_s <= "001000101000";
wait for 1ns;
assert sB_s = "001000101001" 
	report "ADD error at 001000101001" severity error;

wait for waitTime;
sA_s <= "001000101001";
wait for 1ns;
assert sB_s = "001000101010" 
	report "ADD error at 001000101010" severity error;

wait for waitTime;
sA_s <= "001000101010";
wait for 1ns;
assert sB_s = "001000101011" 
	report "ADD error at 001000101011" severity error;

wait for waitTime;
sA_s <= "001000101011";
wait for 1ns;
assert sB_s = "001000101100" 
	report "ADD error at 001000101100" severity error;

wait for waitTime;
sA_s <= "001000101100";
wait for 1ns;
assert sB_s = "001000101101" 
	report "ADD error at 001000101101" severity error;

wait for waitTime;
sA_s <= "001000101101";
wait for 1ns;
assert sB_s = "001000101110" 
	report "ADD error at 001000101110" severity error;

wait for waitTime;
sA_s <= "001000101110";
wait for 1ns;
assert sB_s = "001000101111" 
	report "ADD error at 001000101111" severity error;

wait for waitTime;
sA_s <= "001000101111";
wait for 1ns;
assert sB_s = "001000110000" 
	report "ADD error at 001000110000" severity error;

wait for waitTime;
sA_s <= "001000110000";
wait for 1ns;
assert sB_s = "001000110001" 
	report "ADD error at 001000110001" severity error;

wait for waitTime;
sA_s <= "001000110001";
wait for 1ns;
assert sB_s = "001000110010" 
	report "ADD error at 001000110010" severity error;

wait for waitTime;
sA_s <= "001000110010";
wait for 1ns;
assert sB_s = "001000110011" 
	report "ADD error at 001000110011" severity error;

wait for waitTime;
sA_s <= "001000110011";
wait for 1ns;
assert sB_s = "001000110100" 
	report "ADD error at 001000110100" severity error;

wait for waitTime;
sA_s <= "001000110100";
wait for 1ns;
assert sB_s = "001000110101" 
	report "ADD error at 001000110101" severity error;

wait for waitTime;
sA_s <= "001000110101";
wait for 1ns;
assert sB_s = "001000110110" 
	report "ADD error at 001000110110" severity error;

wait for waitTime;
sA_s <= "001000110110";
wait for 1ns;
assert sB_s = "001000110111" 
	report "ADD error at 001000110111" severity error;

wait for waitTime;
sA_s <= "001000110111";
wait for 1ns;
assert sB_s = "001000111000" 
	report "ADD error at 001000111000" severity error;

wait for waitTime;
sA_s <= "001000111000";
wait for 1ns;
assert sB_s = "001000111001" 
	report "ADD error at 001000111001" severity error;

wait for waitTime;
sA_s <= "001000111001";
wait for 1ns;
assert sB_s = "001000111010" 
	report "ADD error at 001000111010" severity error;

wait for waitTime;
sA_s <= "001000111010";
wait for 1ns;
assert sB_s = "001000111011" 
	report "ADD error at 001000111011" severity error;

wait for waitTime;
sA_s <= "001000111011";
wait for 1ns;
assert sB_s = "001000111100" 
	report "ADD error at 001000111100" severity error;

wait for waitTime;
sA_s <= "001000111100";
wait for 1ns;
assert sB_s = "001000111101" 
	report "ADD error at 001000111101" severity error;

wait for waitTime;
sA_s <= "001000111101";
wait for 1ns;
assert sB_s = "001000111110" 
	report "ADD error at 001000111110" severity error;

wait for waitTime;
sA_s <= "001000111110";
wait for 1ns;
assert sB_s = "001000111111" 
	report "ADD error at 001000111111" severity error;

wait for waitTime;
sA_s <= "001000111111";
wait for 1ns;
assert sB_s = "001001000000" 
	report "ADD error at 001001000000" severity error;

wait for waitTime;
sA_s <= "001001000000";
wait for 1ns;
assert sB_s = "001001000001" 
	report "ADD error at 001001000001" severity error;

wait for waitTime;
sA_s <= "001001000001";
wait for 1ns;
assert sB_s = "001001000010" 
	report "ADD error at 001001000010" severity error;

wait for waitTime;
sA_s <= "001001000010";
wait for 1ns;
assert sB_s = "001001000011" 
	report "ADD error at 001001000011" severity error;

wait for waitTime;
sA_s <= "001001000011";
wait for 1ns;
assert sB_s = "001001000100" 
	report "ADD error at 001001000100" severity error;

wait for waitTime;
sA_s <= "001001000100";
wait for 1ns;
assert sB_s = "001001000101" 
	report "ADD error at 001001000101" severity error;

wait for waitTime;
sA_s <= "001001000101";
wait for 1ns;
assert sB_s = "001001000110" 
	report "ADD error at 001001000110" severity error;

wait for waitTime;
sA_s <= "001001000110";
wait for 1ns;
assert sB_s = "001001000111" 
	report "ADD error at 001001000111" severity error;

wait for waitTime;
sA_s <= "001001000111";
wait for 1ns;
assert sB_s = "001001001000" 
	report "ADD error at 001001001000" severity error;

wait for waitTime;
sA_s <= "001001001000";
wait for 1ns;
assert sB_s = "001001001001" 
	report "ADD error at 001001001001" severity error;

wait for waitTime;
sA_s <= "001001001001";
wait for 1ns;
assert sB_s = "001001001010" 
	report "ADD error at 001001001010" severity error;

wait for waitTime;
sA_s <= "001001001010";
wait for 1ns;
assert sB_s = "001001001011" 
	report "ADD error at 001001001011" severity error;

wait for waitTime;
sA_s <= "001001001011";
wait for 1ns;
assert sB_s = "001001001100" 
	report "ADD error at 001001001100" severity error;

wait for waitTime;
sA_s <= "001001001100";
wait for 1ns;
assert sB_s = "001001001101" 
	report "ADD error at 001001001101" severity error;

wait for waitTime;
sA_s <= "001001001101";
wait for 1ns;
assert sB_s = "001001001110" 
	report "ADD error at 001001001110" severity error;

wait for waitTime;
sA_s <= "001001001110";
wait for 1ns;
assert sB_s = "001001001111" 
	report "ADD error at 001001001111" severity error;

wait for waitTime;
sA_s <= "001001001111";
wait for 1ns;
assert sB_s = "001001010000" 
	report "ADD error at 001001010000" severity error;

wait for waitTime;
sA_s <= "001001010000";
wait for 1ns;
assert sB_s = "001001010001" 
	report "ADD error at 001001010001" severity error;

wait for waitTime;
sA_s <= "001001010001";
wait for 1ns;
assert sB_s = "001001010010" 
	report "ADD error at 001001010010" severity error;

wait for waitTime;
sA_s <= "001001010010";
wait for 1ns;
assert sB_s = "001001010011" 
	report "ADD error at 001001010011" severity error;

wait for waitTime;
sA_s <= "001001010011";
wait for 1ns;
assert sB_s = "001001010100" 
	report "ADD error at 001001010100" severity error;

wait for waitTime;
sA_s <= "001001010100";
wait for 1ns;
assert sB_s = "001001010101" 
	report "ADD error at 001001010101" severity error;

wait for waitTime;
sA_s <= "001001010101";
wait for 1ns;
assert sB_s = "001001010110" 
	report "ADD error at 001001010110" severity error;

wait for waitTime;
sA_s <= "001001010110";
wait for 1ns;
assert sB_s = "001001010111" 
	report "ADD error at 001001010111" severity error;

wait for waitTime;
sA_s <= "001001010111";
wait for 1ns;
assert sB_s = "001001011000" 
	report "ADD error at 001001011000" severity error;

wait for waitTime;
sA_s <= "001001011000";
wait for 1ns;
assert sB_s = "001001011001" 
	report "ADD error at 001001011001" severity error;

wait for waitTime;
sA_s <= "001001011001";
wait for 1ns;
assert sB_s = "001001011010" 
	report "ADD error at 001001011010" severity error;

wait for waitTime;
sA_s <= "001001011010";
wait for 1ns;
assert sB_s = "001001011011" 
	report "ADD error at 001001011011" severity error;

wait for waitTime;
sA_s <= "001001011011";
wait for 1ns;
assert sB_s = "001001011100" 
	report "ADD error at 001001011100" severity error;

wait for waitTime;
sA_s <= "001001011100";
wait for 1ns;
assert sB_s = "001001011101" 
	report "ADD error at 001001011101" severity error;

wait for waitTime;
sA_s <= "001001011101";
wait for 1ns;
assert sB_s = "001001011110" 
	report "ADD error at 001001011110" severity error;

wait for waitTime;
sA_s <= "001001011110";
wait for 1ns;
assert sB_s = "001001011111" 
	report "ADD error at 001001011111" severity error;

wait for waitTime;
sA_s <= "001001011111";
wait for 1ns;
assert sB_s = "001001100000" 
	report "ADD error at 001001100000" severity error;

wait for waitTime;
sA_s <= "001001100000";
wait for 1ns;
assert sB_s = "001001100001" 
	report "ADD error at 001001100001" severity error;

wait for waitTime;
sA_s <= "001001100001";
wait for 1ns;
assert sB_s = "001001100010" 
	report "ADD error at 001001100010" severity error;

wait for waitTime;
sA_s <= "001001100010";
wait for 1ns;
assert sB_s = "001001100011" 
	report "ADD error at 001001100011" severity error;

wait for waitTime;
sA_s <= "001001100011";
wait for 1ns;
assert sB_s = "001001100100" 
	report "ADD error at 001001100100" severity error;

wait for waitTime;
sA_s <= "001001100100";
wait for 1ns;
assert sB_s = "001001100101" 
	report "ADD error at 001001100101" severity error;

wait for waitTime;
sA_s <= "001001100101";
wait for 1ns;
assert sB_s = "001001100110" 
	report "ADD error at 001001100110" severity error;

wait for waitTime;
sA_s <= "001001100110";
wait for 1ns;
assert sB_s = "001001100111" 
	report "ADD error at 001001100111" severity error;

wait for waitTime;
sA_s <= "001001100111";
wait for 1ns;
assert sB_s = "001001101000" 
	report "ADD error at 001001101000" severity error;

wait for waitTime;
sA_s <= "001001101000";
wait for 1ns;
assert sB_s = "001001101001" 
	report "ADD error at 001001101001" severity error;

wait for waitTime;
sA_s <= "001001101001";
wait for 1ns;
assert sB_s = "001001101010" 
	report "ADD error at 001001101010" severity error;

wait for waitTime;
sA_s <= "001001101010";
wait for 1ns;
assert sB_s = "001001101011" 
	report "ADD error at 001001101011" severity error;

wait for waitTime;
sA_s <= "001001101011";
wait for 1ns;
assert sB_s = "001001101100" 
	report "ADD error at 001001101100" severity error;

wait for waitTime;
sA_s <= "001001101100";
wait for 1ns;
assert sB_s = "001001101101" 
	report "ADD error at 001001101101" severity error;

wait for waitTime;
sA_s <= "001001101101";
wait for 1ns;
assert sB_s = "001001101110" 
	report "ADD error at 001001101110" severity error;

wait for waitTime;
sA_s <= "001001101110";
wait for 1ns;
assert sB_s = "001001101111" 
	report "ADD error at 001001101111" severity error;

wait for waitTime;
sA_s <= "001001101111";
wait for 1ns;
assert sB_s = "001001110000" 
	report "ADD error at 001001110000" severity error;

wait for waitTime;
sA_s <= "001001110000";
wait for 1ns;
assert sB_s = "001001110001" 
	report "ADD error at 001001110001" severity error;

wait for waitTime;
sA_s <= "001001110001";
wait for 1ns;
assert sB_s = "001001110010" 
	report "ADD error at 001001110010" severity error;

wait for waitTime;
sA_s <= "001001110010";
wait for 1ns;
assert sB_s = "001001110011" 
	report "ADD error at 001001110011" severity error;

wait for waitTime;
sA_s <= "001001110011";
wait for 1ns;
assert sB_s = "001001110100" 
	report "ADD error at 001001110100" severity error;

wait for waitTime;
sA_s <= "001001110100";
wait for 1ns;
assert sB_s = "001001110101" 
	report "ADD error at 001001110101" severity error;

wait for waitTime;
sA_s <= "001001110101";
wait for 1ns;
assert sB_s = "001001110110" 
	report "ADD error at 001001110110" severity error;

wait for waitTime;
sA_s <= "001001110110";
wait for 1ns;
assert sB_s = "001001110111" 
	report "ADD error at 001001110111" severity error;

wait for waitTime;
sA_s <= "001001110111";
wait for 1ns;
assert sB_s = "001001111000" 
	report "ADD error at 001001111000" severity error;

wait for waitTime;
sA_s <= "001001111000";
wait for 1ns;
assert sB_s = "001001111001" 
	report "ADD error at 001001111001" severity error;

wait for waitTime;
sA_s <= "001001111001";
wait for 1ns;
assert sB_s = "001001111010" 
	report "ADD error at 001001111010" severity error;

wait for waitTime;
sA_s <= "001001111010";
wait for 1ns;
assert sB_s = "001001111011" 
	report "ADD error at 001001111011" severity error;

wait for waitTime;
sA_s <= "001001111011";
wait for 1ns;
assert sB_s = "001001111100" 
	report "ADD error at 001001111100" severity error;

wait for waitTime;
sA_s <= "001001111100";
wait for 1ns;
assert sB_s = "001001111101" 
	report "ADD error at 001001111101" severity error;

wait for waitTime;
sA_s <= "001001111101";
wait for 1ns;
assert sB_s = "001001111110" 
	report "ADD error at 001001111110" severity error;

wait for waitTime;
sA_s <= "001001111110";
wait for 1ns;
assert sB_s = "001001111111" 
	report "ADD error at 001001111111" severity error;

wait for waitTime;
sA_s <= "001001111111";
wait for 1ns;
assert sB_s = "001010000000" 
	report "ADD error at 001010000000" severity error;

wait for waitTime;
sA_s <= "001010000000";
wait for 1ns;
assert sB_s = "001010000001" 
	report "ADD error at 001010000001" severity error;

wait for waitTime;
sA_s <= "001010000001";
wait for 1ns;
assert sB_s = "001010000010" 
	report "ADD error at 001010000010" severity error;

wait for waitTime;
sA_s <= "001010000010";
wait for 1ns;
assert sB_s = "001010000011" 
	report "ADD error at 001010000011" severity error;

wait for waitTime;
sA_s <= "001010000011";
wait for 1ns;
assert sB_s = "001010000100" 
	report "ADD error at 001010000100" severity error;

wait for waitTime;
sA_s <= "001010000100";
wait for 1ns;
assert sB_s = "001010000101" 
	report "ADD error at 001010000101" severity error;

wait for waitTime;
sA_s <= "001010000101";
wait for 1ns;
assert sB_s = "001010000110" 
	report "ADD error at 001010000110" severity error;

wait for waitTime;
sA_s <= "001010000110";
wait for 1ns;
assert sB_s = "001010000111" 
	report "ADD error at 001010000111" severity error;

wait for waitTime;
sA_s <= "001010000111";
wait for 1ns;
assert sB_s = "001010001000" 
	report "ADD error at 001010001000" severity error;

wait for waitTime;
sA_s <= "001010001000";
wait for 1ns;
assert sB_s = "001010001001" 
	report "ADD error at 001010001001" severity error;

wait for waitTime;
sA_s <= "001010001001";
wait for 1ns;
assert sB_s = "001010001010" 
	report "ADD error at 001010001010" severity error;

wait for waitTime;
sA_s <= "001010001010";
wait for 1ns;
assert sB_s = "001010001011" 
	report "ADD error at 001010001011" severity error;

wait for waitTime;
sA_s <= "001010001011";
wait for 1ns;
assert sB_s = "001010001100" 
	report "ADD error at 001010001100" severity error;

wait for waitTime;
sA_s <= "001010001100";
wait for 1ns;
assert sB_s = "001010001101" 
	report "ADD error at 001010001101" severity error;

wait for waitTime;
sA_s <= "001010001101";
wait for 1ns;
assert sB_s = "001010001110" 
	report "ADD error at 001010001110" severity error;

wait for waitTime;
sA_s <= "001010001110";
wait for 1ns;
assert sB_s = "001010001111" 
	report "ADD error at 001010001111" severity error;

wait for waitTime;
sA_s <= "001010001111";
wait for 1ns;
assert sB_s = "001010010000" 
	report "ADD error at 001010010000" severity error;

wait for waitTime;
sA_s <= "001010010000";
wait for 1ns;
assert sB_s = "001010010001" 
	report "ADD error at 001010010001" severity error;

wait for waitTime;
sA_s <= "001010010001";
wait for 1ns;
assert sB_s = "001010010010" 
	report "ADD error at 001010010010" severity error;

wait for waitTime;
sA_s <= "001010010010";
wait for 1ns;
assert sB_s = "001010010011" 
	report "ADD error at 001010010011" severity error;

wait for waitTime;
sA_s <= "001010010011";
wait for 1ns;
assert sB_s = "001010010100" 
	report "ADD error at 001010010100" severity error;

wait for waitTime;
sA_s <= "001010010100";
wait for 1ns;
assert sB_s = "001010010101" 
	report "ADD error at 001010010101" severity error;

wait for waitTime;
sA_s <= "001010010101";
wait for 1ns;
assert sB_s = "001010010110" 
	report "ADD error at 001010010110" severity error;

wait for waitTime;
sA_s <= "001010010110";
wait for 1ns;
assert sB_s = "001010010111" 
	report "ADD error at 001010010111" severity error;

wait for waitTime;
sA_s <= "001010010111";
wait for 1ns;
assert sB_s = "001010011000" 
	report "ADD error at 001010011000" severity error;

wait for waitTime;
sA_s <= "001010011000";
wait for 1ns;
assert sB_s = "001010011001" 
	report "ADD error at 001010011001" severity error;

wait for waitTime;
sA_s <= "001010011001";
wait for 1ns;
assert sB_s = "001010011010" 
	report "ADD error at 001010011010" severity error;

wait for waitTime;
sA_s <= "001010011010";
wait for 1ns;
assert sB_s = "001010011011" 
	report "ADD error at 001010011011" severity error;

wait for waitTime;
sA_s <= "001010011011";
wait for 1ns;
assert sB_s = "001010011100" 
	report "ADD error at 001010011100" severity error;

wait for waitTime;
sA_s <= "001010011100";
wait for 1ns;
assert sB_s = "001010011101" 
	report "ADD error at 001010011101" severity error;

wait for waitTime;
sA_s <= "001010011101";
wait for 1ns;
assert sB_s = "001010011110" 
	report "ADD error at 001010011110" severity error;

wait for waitTime;
sA_s <= "001010011110";
wait for 1ns;
assert sB_s = "001010011111" 
	report "ADD error at 001010011111" severity error;

wait for waitTime;
sA_s <= "001010011111";
wait for 1ns;
assert sB_s = "001010100000" 
	report "ADD error at 001010100000" severity error;

wait for waitTime;
sA_s <= "001010100000";
wait for 1ns;
assert sB_s = "001010100001" 
	report "ADD error at 001010100001" severity error;

wait for waitTime;
sA_s <= "001010100001";
wait for 1ns;
assert sB_s = "001010100010" 
	report "ADD error at 001010100010" severity error;

wait for waitTime;
sA_s <= "001010100010";
wait for 1ns;
assert sB_s = "001010100011" 
	report "ADD error at 001010100011" severity error;

wait for waitTime;
sA_s <= "001010100011";
wait for 1ns;
assert sB_s = "001010100100" 
	report "ADD error at 001010100100" severity error;

wait for waitTime;
sA_s <= "001010100100";
wait for 1ns;
assert sB_s = "001010100101" 
	report "ADD error at 001010100101" severity error;

wait for waitTime;
sA_s <= "001010100101";
wait for 1ns;
assert sB_s = "001010100110" 
	report "ADD error at 001010100110" severity error;

wait for waitTime;
sA_s <= "001010100110";
wait for 1ns;
assert sB_s = "001010100111" 
	report "ADD error at 001010100111" severity error;

wait for waitTime;
sA_s <= "001010100111";
wait for 1ns;
assert sB_s = "001010101000" 
	report "ADD error at 001010101000" severity error;

wait for waitTime;
sA_s <= "001010101000";
wait for 1ns;
assert sB_s = "001010101001" 
	report "ADD error at 001010101001" severity error;

wait for waitTime;
sA_s <= "001010101001";
wait for 1ns;
assert sB_s = "001010101010" 
	report "ADD error at 001010101010" severity error;

wait for waitTime;
sA_s <= "001010101010";
wait for 1ns;
assert sB_s = "001010101011" 
	report "ADD error at 001010101011" severity error;

wait for waitTime;
sA_s <= "001010101011";
wait for 1ns;
assert sB_s = "001010101100" 
	report "ADD error at 001010101100" severity error;

wait for waitTime;
sA_s <= "001010101100";
wait for 1ns;
assert sB_s = "001010101101" 
	report "ADD error at 001010101101" severity error;

wait for waitTime;
sA_s <= "001010101101";
wait for 1ns;
assert sB_s = "001010101110" 
	report "ADD error at 001010101110" severity error;

wait for waitTime;
sA_s <= "001010101110";
wait for 1ns;
assert sB_s = "001010101111" 
	report "ADD error at 001010101111" severity error;

wait for waitTime;
sA_s <= "001010101111";
wait for 1ns;
assert sB_s = "001010110000" 
	report "ADD error at 001010110000" severity error;

wait for waitTime;
sA_s <= "001010110000";
wait for 1ns;
assert sB_s = "001010110001" 
	report "ADD error at 001010110001" severity error;

wait for waitTime;
sA_s <= "001010110001";
wait for 1ns;
assert sB_s = "001010110010" 
	report "ADD error at 001010110010" severity error;

wait for waitTime;
sA_s <= "001010110010";
wait for 1ns;
assert sB_s = "001010110011" 
	report "ADD error at 001010110011" severity error;

wait for waitTime;
sA_s <= "001010110011";
wait for 1ns;
assert sB_s = "001010110100" 
	report "ADD error at 001010110100" severity error;

wait for waitTime;
sA_s <= "001010110100";
wait for 1ns;
assert sB_s = "001010110101" 
	report "ADD error at 001010110101" severity error;

wait for waitTime;
sA_s <= "001010110101";
wait for 1ns;
assert sB_s = "001010110110" 
	report "ADD error at 001010110110" severity error;

wait for waitTime;
sA_s <= "001010110110";
wait for 1ns;
assert sB_s = "001010110111" 
	report "ADD error at 001010110111" severity error;

wait for waitTime;
sA_s <= "001010110111";
wait for 1ns;
assert sB_s = "001010111000" 
	report "ADD error at 001010111000" severity error;

wait for waitTime;
sA_s <= "001010111000";
wait for 1ns;
assert sB_s = "001010111001" 
	report "ADD error at 001010111001" severity error;

wait for waitTime;
sA_s <= "001010111001";
wait for 1ns;
assert sB_s = "001010111010" 
	report "ADD error at 001010111010" severity error;

wait for waitTime;
sA_s <= "001010111010";
wait for 1ns;
assert sB_s = "001010111011" 
	report "ADD error at 001010111011" severity error;

wait for waitTime;
sA_s <= "001010111011";
wait for 1ns;
assert sB_s = "001010111100" 
	report "ADD error at 001010111100" severity error;

wait for waitTime;
sA_s <= "001010111100";
wait for 1ns;
assert sB_s = "001010111101" 
	report "ADD error at 001010111101" severity error;

wait for waitTime;
sA_s <= "001010111101";
wait for 1ns;
assert sB_s = "001010111110" 
	report "ADD error at 001010111110" severity error;

wait for waitTime;
sA_s <= "001010111110";
wait for 1ns;
assert sB_s = "001010111111" 
	report "ADD error at 001010111111" severity error;

wait for waitTime;
sA_s <= "001010111111";
wait for 1ns;
assert sB_s = "001011000000" 
	report "ADD error at 001011000000" severity error;

wait for waitTime;
sA_s <= "001011000000";
wait for 1ns;
assert sB_s = "001011000001" 
	report "ADD error at 001011000001" severity error;

wait for waitTime;
sA_s <= "001011000001";
wait for 1ns;
assert sB_s = "001011000010" 
	report "ADD error at 001011000010" severity error;

wait for waitTime;
sA_s <= "001011000010";
wait for 1ns;
assert sB_s = "001011000011" 
	report "ADD error at 001011000011" severity error;

wait for waitTime;
sA_s <= "001011000011";
wait for 1ns;
assert sB_s = "001011000100" 
	report "ADD error at 001011000100" severity error;

wait for waitTime;
sA_s <= "001011000100";
wait for 1ns;
assert sB_s = "001011000101" 
	report "ADD error at 001011000101" severity error;

wait for waitTime;
sA_s <= "001011000101";
wait for 1ns;
assert sB_s = "001011000110" 
	report "ADD error at 001011000110" severity error;

wait for waitTime;
sA_s <= "001011000110";
wait for 1ns;
assert sB_s = "001011000111" 
	report "ADD error at 001011000111" severity error;

wait for waitTime;
sA_s <= "001011000111";
wait for 1ns;
assert sB_s = "001011001000" 
	report "ADD error at 001011001000" severity error;

wait for waitTime;
sA_s <= "001011001000";
wait for 1ns;
assert sB_s = "001011001001" 
	report "ADD error at 001011001001" severity error;

wait for waitTime;
sA_s <= "001011001001";
wait for 1ns;
assert sB_s = "001011001010" 
	report "ADD error at 001011001010" severity error;

wait for waitTime;
sA_s <= "001011001010";
wait for 1ns;
assert sB_s = "001011001011" 
	report "ADD error at 001011001011" severity error;

wait for waitTime;
sA_s <= "001011001011";
wait for 1ns;
assert sB_s = "001011001100" 
	report "ADD error at 001011001100" severity error;

wait for waitTime;
sA_s <= "001011001100";
wait for 1ns;
assert sB_s = "001011001101" 
	report "ADD error at 001011001101" severity error;

wait for waitTime;
sA_s <= "001011001101";
wait for 1ns;
assert sB_s = "001011001110" 
	report "ADD error at 001011001110" severity error;

wait for waitTime;
sA_s <= "001011001110";
wait for 1ns;
assert sB_s = "001011001111" 
	report "ADD error at 001011001111" severity error;

wait for waitTime;
sA_s <= "001011001111";
wait for 1ns;
assert sB_s = "001011010000" 
	report "ADD error at 001011010000" severity error;

wait for waitTime;
sA_s <= "001011010000";
wait for 1ns;
assert sB_s = "001011010001" 
	report "ADD error at 001011010001" severity error;

wait for waitTime;
sA_s <= "001011010001";
wait for 1ns;
assert sB_s = "001011010010" 
	report "ADD error at 001011010010" severity error;

wait for waitTime;
sA_s <= "001011010010";
wait for 1ns;
assert sB_s = "001011010011" 
	report "ADD error at 001011010011" severity error;

wait for waitTime;
sA_s <= "001011010011";
wait for 1ns;
assert sB_s = "001011010100" 
	report "ADD error at 001011010100" severity error;

wait for waitTime;
sA_s <= "001011010100";
wait for 1ns;
assert sB_s = "001011010101" 
	report "ADD error at 001011010101" severity error;

wait for waitTime;
sA_s <= "001011010101";
wait for 1ns;
assert sB_s = "001011010110" 
	report "ADD error at 001011010110" severity error;

wait for waitTime;
sA_s <= "001011010110";
wait for 1ns;
assert sB_s = "001011010111" 
	report "ADD error at 001011010111" severity error;

wait for waitTime;
sA_s <= "001011010111";
wait for 1ns;
assert sB_s = "001011011000" 
	report "ADD error at 001011011000" severity error;

wait for waitTime;
sA_s <= "001011011000";
wait for 1ns;
assert sB_s = "001011011001" 
	report "ADD error at 001011011001" severity error;

wait for waitTime;
sA_s <= "001011011001";
wait for 1ns;
assert sB_s = "001011011010" 
	report "ADD error at 001011011010" severity error;

wait for waitTime;
sA_s <= "001011011010";
wait for 1ns;
assert sB_s = "001011011011" 
	report "ADD error at 001011011011" severity error;

wait for waitTime;
sA_s <= "001011011011";
wait for 1ns;
assert sB_s = "001011011100" 
	report "ADD error at 001011011100" severity error;

wait for waitTime;
sA_s <= "001011011100";
wait for 1ns;
assert sB_s = "001011011101" 
	report "ADD error at 001011011101" severity error;

wait for waitTime;
sA_s <= "001011011101";
wait for 1ns;
assert sB_s = "001011011110" 
	report "ADD error at 001011011110" severity error;

wait for waitTime;
sA_s <= "001011011110";
wait for 1ns;
assert sB_s = "001011011111" 
	report "ADD error at 001011011111" severity error;

wait for waitTime;
sA_s <= "001011011111";
wait for 1ns;
assert sB_s = "001011100000" 
	report "ADD error at 001011100000" severity error;

wait for waitTime;
sA_s <= "001011100000";
wait for 1ns;
assert sB_s = "001011100001" 
	report "ADD error at 001011100001" severity error;

wait for waitTime;
sA_s <= "001011100001";
wait for 1ns;
assert sB_s = "001011100010" 
	report "ADD error at 001011100010" severity error;

wait for waitTime;
sA_s <= "001011100010";
wait for 1ns;
assert sB_s = "001011100011" 
	report "ADD error at 001011100011" severity error;

wait for waitTime;
sA_s <= "001011100011";
wait for 1ns;
assert sB_s = "001011100100" 
	report "ADD error at 001011100100" severity error;

wait for waitTime;
sA_s <= "001011100100";
wait for 1ns;
assert sB_s = "001011100101" 
	report "ADD error at 001011100101" severity error;

wait for waitTime;
sA_s <= "001011100101";
wait for 1ns;
assert sB_s = "001011100110" 
	report "ADD error at 001011100110" severity error;

wait for waitTime;
sA_s <= "001011100110";
wait for 1ns;
assert sB_s = "001011100111" 
	report "ADD error at 001011100111" severity error;

wait for waitTime;
sA_s <= "001011100111";
wait for 1ns;
assert sB_s = "001011101000" 
	report "ADD error at 001011101000" severity error;

wait for waitTime;
sA_s <= "001011101000";
wait for 1ns;
assert sB_s = "001011101001" 
	report "ADD error at 001011101001" severity error;

wait for waitTime;
sA_s <= "001011101001";
wait for 1ns;
assert sB_s = "001011101010" 
	report "ADD error at 001011101010" severity error;

wait for waitTime;
sA_s <= "001011101010";
wait for 1ns;
assert sB_s = "001011101011" 
	report "ADD error at 001011101011" severity error;

wait for waitTime;
sA_s <= "001011101011";
wait for 1ns;
assert sB_s = "001011101100" 
	report "ADD error at 001011101100" severity error;

wait for waitTime;
sA_s <= "001011101100";
wait for 1ns;
assert sB_s = "001011101101" 
	report "ADD error at 001011101101" severity error;

wait for waitTime;
sA_s <= "001011101101";
wait for 1ns;
assert sB_s = "001011101110" 
	report "ADD error at 001011101110" severity error;

wait for waitTime;
sA_s <= "001011101110";
wait for 1ns;
assert sB_s = "001011101111" 
	report "ADD error at 001011101111" severity error;

wait for waitTime;
sA_s <= "001011101111";
wait for 1ns;
assert sB_s = "001011110000" 
	report "ADD error at 001011110000" severity error;

wait for waitTime;
sA_s <= "001011110000";
wait for 1ns;
assert sB_s = "001011110001" 
	report "ADD error at 001011110001" severity error;

wait for waitTime;
sA_s <= "001011110001";
wait for 1ns;
assert sB_s = "001011110010" 
	report "ADD error at 001011110010" severity error;

wait for waitTime;
sA_s <= "001011110010";
wait for 1ns;
assert sB_s = "001011110011" 
	report "ADD error at 001011110011" severity error;

wait for waitTime;
sA_s <= "001011110011";
wait for 1ns;
assert sB_s = "001011110100" 
	report "ADD error at 001011110100" severity error;

wait for waitTime;
sA_s <= "001011110100";
wait for 1ns;
assert sB_s = "001011110101" 
	report "ADD error at 001011110101" severity error;

wait for waitTime;
sA_s <= "001011110101";
wait for 1ns;
assert sB_s = "001011110110" 
	report "ADD error at 001011110110" severity error;

wait for waitTime;
sA_s <= "001011110110";
wait for 1ns;
assert sB_s = "001011110111" 
	report "ADD error at 001011110111" severity error;

wait for waitTime;
sA_s <= "001011110111";
wait for 1ns;
assert sB_s = "001011111000" 
	report "ADD error at 001011111000" severity error;

wait for waitTime;
sA_s <= "001011111000";
wait for 1ns;
assert sB_s = "001011111001" 
	report "ADD error at 001011111001" severity error;

wait for waitTime;
sA_s <= "001011111001";
wait for 1ns;
assert sB_s = "001011111010" 
	report "ADD error at 001011111010" severity error;

wait for waitTime;
sA_s <= "001011111010";
wait for 1ns;
assert sB_s = "001011111011" 
	report "ADD error at 001011111011" severity error;

wait for waitTime;
sA_s <= "001011111011";
wait for 1ns;
assert sB_s = "001011111100" 
	report "ADD error at 001011111100" severity error;

wait for waitTime;
sA_s <= "001011111100";
wait for 1ns;
assert sB_s = "001011111101" 
	report "ADD error at 001011111101" severity error;

wait for waitTime;
sA_s <= "001011111101";
wait for 1ns;
assert sB_s = "001011111110" 
	report "ADD error at 001011111110" severity error;

wait for waitTime;
sA_s <= "001011111110";
wait for 1ns;
assert sB_s = "001011111111" 
	report "ADD error at 001011111111" severity error;

wait for waitTime;
sA_s <= "001011111111";
wait for 1ns;
assert sB_s = "001100000000" 
	report "ADD error at 001100000000" severity error;

wait for waitTime;
sA_s <= "001100000000";
wait for 1ns;
assert sB_s = "001100000001" 
	report "ADD error at 001100000001" severity error;

wait for waitTime;
sA_s <= "001100000001";
wait for 1ns;
assert sB_s = "001100000010" 
	report "ADD error at 001100000010" severity error;

wait for waitTime;
sA_s <= "001100000010";
wait for 1ns;
assert sB_s = "001100000011" 
	report "ADD error at 001100000011" severity error;

wait for waitTime;
sA_s <= "001100000011";
wait for 1ns;
assert sB_s = "001100000100" 
	report "ADD error at 001100000100" severity error;

wait for waitTime;
sA_s <= "001100000100";
wait for 1ns;
assert sB_s = "001100000101" 
	report "ADD error at 001100000101" severity error;

wait for waitTime;
sA_s <= "001100000101";
wait for 1ns;
assert sB_s = "001100000110" 
	report "ADD error at 001100000110" severity error;

wait for waitTime;
sA_s <= "001100000110";
wait for 1ns;
assert sB_s = "001100000111" 
	report "ADD error at 001100000111" severity error;

wait for waitTime;
sA_s <= "001100000111";
wait for 1ns;
assert sB_s = "001100001000" 
	report "ADD error at 001100001000" severity error;

wait for waitTime;
sA_s <= "001100001000";
wait for 1ns;
assert sB_s = "001100001001" 
	report "ADD error at 001100001001" severity error;

wait for waitTime;
sA_s <= "001100001001";
wait for 1ns;
assert sB_s = "001100001010" 
	report "ADD error at 001100001010" severity error;

wait for waitTime;
sA_s <= "001100001010";
wait for 1ns;
assert sB_s = "001100001011" 
	report "ADD error at 001100001011" severity error;

wait for waitTime;
sA_s <= "001100001011";
wait for 1ns;
assert sB_s = "001100001100" 
	report "ADD error at 001100001100" severity error;

wait for waitTime;
sA_s <= "001100001100";
wait for 1ns;
assert sB_s = "001100001101" 
	report "ADD error at 001100001101" severity error;

wait for waitTime;
sA_s <= "001100001101";
wait for 1ns;
assert sB_s = "001100001110" 
	report "ADD error at 001100001110" severity error;

wait for waitTime;
sA_s <= "001100001110";
wait for 1ns;
assert sB_s = "001100001111" 
	report "ADD error at 001100001111" severity error;

wait for waitTime;
sA_s <= "001100001111";
wait for 1ns;
assert sB_s = "001100010000" 
	report "ADD error at 001100010000" severity error;

wait for waitTime;
sA_s <= "001100010000";
wait for 1ns;
assert sB_s = "001100010001" 
	report "ADD error at 001100010001" severity error;

wait for waitTime;
sA_s <= "001100010001";
wait for 1ns;
assert sB_s = "001100010010" 
	report "ADD error at 001100010010" severity error;

wait for waitTime;
sA_s <= "001100010010";
wait for 1ns;
assert sB_s = "001100010011" 
	report "ADD error at 001100010011" severity error;

wait for waitTime;
sA_s <= "001100010011";
wait for 1ns;
assert sB_s = "001100010100" 
	report "ADD error at 001100010100" severity error;

wait for waitTime;
sA_s <= "001100010100";
wait for 1ns;
assert sB_s = "001100010101" 
	report "ADD error at 001100010101" severity error;

wait for waitTime;
sA_s <= "001100010101";
wait for 1ns;
assert sB_s = "001100010110" 
	report "ADD error at 001100010110" severity error;

wait for waitTime;
sA_s <= "001100010110";
wait for 1ns;
assert sB_s = "001100010111" 
	report "ADD error at 001100010111" severity error;

wait for waitTime;
sA_s <= "001100010111";
wait for 1ns;
assert sB_s = "001100011000" 
	report "ADD error at 001100011000" severity error;

wait for waitTime;
sA_s <= "001100011000";
wait for 1ns;
assert sB_s = "001100011001" 
	report "ADD error at 001100011001" severity error;

wait for waitTime;
sA_s <= "001100011001";
wait for 1ns;
assert sB_s = "001100011010" 
	report "ADD error at 001100011010" severity error;

wait for waitTime;
sA_s <= "001100011010";
wait for 1ns;
assert sB_s = "001100011011" 
	report "ADD error at 001100011011" severity error;

wait for waitTime;
sA_s <= "001100011011";
wait for 1ns;
assert sB_s = "001100011100" 
	report "ADD error at 001100011100" severity error;

wait for waitTime;
sA_s <= "001100011100";
wait for 1ns;
assert sB_s = "001100011101" 
	report "ADD error at 001100011101" severity error;

wait for waitTime;
sA_s <= "001100011101";
wait for 1ns;
assert sB_s = "001100011110" 
	report "ADD error at 001100011110" severity error;

wait for waitTime;
sA_s <= "001100011110";
wait for 1ns;
assert sB_s = "001100011111" 
	report "ADD error at 001100011111" severity error;

wait for waitTime;
sA_s <= "001100011111";
wait for 1ns;
assert sB_s = "001100100000" 
	report "ADD error at 001100100000" severity error;

wait for waitTime;
sA_s <= "001100100000";
wait for 1ns;
assert sB_s = "001100100001" 
	report "ADD error at 001100100001" severity error;

wait for waitTime;
sA_s <= "001100100001";
wait for 1ns;
assert sB_s = "001100100010" 
	report "ADD error at 001100100010" severity error;

wait for waitTime;
sA_s <= "001100100010";
wait for 1ns;
assert sB_s = "001100100011" 
	report "ADD error at 001100100011" severity error;

wait for waitTime;
sA_s <= "001100100011";
wait for 1ns;
assert sB_s = "001100100100" 
	report "ADD error at 001100100100" severity error;

wait for waitTime;
sA_s <= "001100100100";
wait for 1ns;
assert sB_s = "001100100101" 
	report "ADD error at 001100100101" severity error;

wait for waitTime;
sA_s <= "001100100101";
wait for 1ns;
assert sB_s = "001100100110" 
	report "ADD error at 001100100110" severity error;

wait for waitTime;
sA_s <= "001100100110";
wait for 1ns;
assert sB_s = "001100100111" 
	report "ADD error at 001100100111" severity error;

wait for waitTime;
sA_s <= "001100100111";
wait for 1ns;
assert sB_s = "001100101000" 
	report "ADD error at 001100101000" severity error;

wait for waitTime;
sA_s <= "001100101000";
wait for 1ns;
assert sB_s = "001100101001" 
	report "ADD error at 001100101001" severity error;

wait for waitTime;
sA_s <= "001100101001";
wait for 1ns;
assert sB_s = "001100101010" 
	report "ADD error at 001100101010" severity error;

wait for waitTime;
sA_s <= "001100101010";
wait for 1ns;
assert sB_s = "001100101011" 
	report "ADD error at 001100101011" severity error;

wait for waitTime;
sA_s <= "001100101011";
wait for 1ns;
assert sB_s = "001100101100" 
	report "ADD error at 001100101100" severity error;

wait for waitTime;
sA_s <= "001100101100";
wait for 1ns;
assert sB_s = "001100101101" 
	report "ADD error at 001100101101" severity error;

wait for waitTime;
sA_s <= "001100101101";
wait for 1ns;
assert sB_s = "001100101110" 
	report "ADD error at 001100101110" severity error;

wait for waitTime;
sA_s <= "001100101110";
wait for 1ns;
assert sB_s = "001100101111" 
	report "ADD error at 001100101111" severity error;

wait for waitTime;
sA_s <= "001100101111";
wait for 1ns;
assert sB_s = "001100110000" 
	report "ADD error at 001100110000" severity error;

wait for waitTime;
sA_s <= "001100110000";
wait for 1ns;
assert sB_s = "001100110001" 
	report "ADD error at 001100110001" severity error;

wait for waitTime;
sA_s <= "001100110001";
wait for 1ns;
assert sB_s = "001100110010" 
	report "ADD error at 001100110010" severity error;

wait for waitTime;
sA_s <= "001100110010";
wait for 1ns;
assert sB_s = "001100110011" 
	report "ADD error at 001100110011" severity error;

wait for waitTime;
sA_s <= "001100110011";
wait for 1ns;
assert sB_s = "001100110100" 
	report "ADD error at 001100110100" severity error;

wait for waitTime;
sA_s <= "001100110100";
wait for 1ns;
assert sB_s = "001100110101" 
	report "ADD error at 001100110101" severity error;

wait for waitTime;
sA_s <= "001100110101";
wait for 1ns;
assert sB_s = "001100110110" 
	report "ADD error at 001100110110" severity error;

wait for waitTime;
sA_s <= "001100110110";
wait for 1ns;
assert sB_s = "001100110111" 
	report "ADD error at 001100110111" severity error;

wait for waitTime;
sA_s <= "001100110111";
wait for 1ns;
assert sB_s = "001100111000" 
	report "ADD error at 001100111000" severity error;

wait for waitTime;
sA_s <= "001100111000";
wait for 1ns;
assert sB_s = "001100111001" 
	report "ADD error at 001100111001" severity error;

wait for waitTime;
sA_s <= "001100111001";
wait for 1ns;
assert sB_s = "001100111010" 
	report "ADD error at 001100111010" severity error;

wait for waitTime;
sA_s <= "001100111010";
wait for 1ns;
assert sB_s = "001100111011" 
	report "ADD error at 001100111011" severity error;

wait for waitTime;
sA_s <= "001100111011";
wait for 1ns;
assert sB_s = "001100111100" 
	report "ADD error at 001100111100" severity error;

wait for waitTime;
sA_s <= "001100111100";
wait for 1ns;
assert sB_s = "001100111101" 
	report "ADD error at 001100111101" severity error;

wait for waitTime;
sA_s <= "001100111101";
wait for 1ns;
assert sB_s = "001100111110" 
	report "ADD error at 001100111110" severity error;

wait for waitTime;
sA_s <= "001100111110";
wait for 1ns;
assert sB_s = "001100111111" 
	report "ADD error at 001100111111" severity error;

wait for waitTime;
sA_s <= "001100111111";
wait for 1ns;
assert sB_s = "001101000000" 
	report "ADD error at 001101000000" severity error;

wait for waitTime;
sA_s <= "001101000000";
wait for 1ns;
assert sB_s = "001101000001" 
	report "ADD error at 001101000001" severity error;

wait for waitTime;
sA_s <= "001101000001";
wait for 1ns;
assert sB_s = "001101000010" 
	report "ADD error at 001101000010" severity error;

wait for waitTime;
sA_s <= "001101000010";
wait for 1ns;
assert sB_s = "001101000011" 
	report "ADD error at 001101000011" severity error;

wait for waitTime;
sA_s <= "001101000011";
wait for 1ns;
assert sB_s = "001101000100" 
	report "ADD error at 001101000100" severity error;

wait for waitTime;
sA_s <= "001101000100";
wait for 1ns;
assert sB_s = "001101000101" 
	report "ADD error at 001101000101" severity error;

wait for waitTime;
sA_s <= "001101000101";
wait for 1ns;
assert sB_s = "001101000110" 
	report "ADD error at 001101000110" severity error;

wait for waitTime;
sA_s <= "001101000110";
wait for 1ns;
assert sB_s = "001101000111" 
	report "ADD error at 001101000111" severity error;

wait for waitTime;
sA_s <= "001101000111";
wait for 1ns;
assert sB_s = "001101001000" 
	report "ADD error at 001101001000" severity error;

wait for waitTime;
sA_s <= "001101001000";
wait for 1ns;
assert sB_s = "001101001001" 
	report "ADD error at 001101001001" severity error;

wait for waitTime;
sA_s <= "001101001001";
wait for 1ns;
assert sB_s = "001101001010" 
	report "ADD error at 001101001010" severity error;

wait for waitTime;
sA_s <= "001101001010";
wait for 1ns;
assert sB_s = "001101001011" 
	report "ADD error at 001101001011" severity error;

wait for waitTime;
sA_s <= "001101001011";
wait for 1ns;
assert sB_s = "001101001100" 
	report "ADD error at 001101001100" severity error;

wait for waitTime;
sA_s <= "001101001100";
wait for 1ns;
assert sB_s = "001101001101" 
	report "ADD error at 001101001101" severity error;

wait for waitTime;
sA_s <= "001101001101";
wait for 1ns;
assert sB_s = "001101001110" 
	report "ADD error at 001101001110" severity error;

wait for waitTime;
sA_s <= "001101001110";
wait for 1ns;
assert sB_s = "001101001111" 
	report "ADD error at 001101001111" severity error;

wait for waitTime;
sA_s <= "001101001111";
wait for 1ns;
assert sB_s = "001101010000" 
	report "ADD error at 001101010000" severity error;

wait for waitTime;
sA_s <= "001101010000";
wait for 1ns;
assert sB_s = "001101010001" 
	report "ADD error at 001101010001" severity error;

wait for waitTime;
sA_s <= "001101010001";
wait for 1ns;
assert sB_s = "001101010010" 
	report "ADD error at 001101010010" severity error;

wait for waitTime;
sA_s <= "001101010010";
wait for 1ns;
assert sB_s = "001101010011" 
	report "ADD error at 001101010011" severity error;

wait for waitTime;
sA_s <= "001101010011";
wait for 1ns;
assert sB_s = "001101010100" 
	report "ADD error at 001101010100" severity error;

wait for waitTime;
sA_s <= "001101010100";
wait for 1ns;
assert sB_s = "001101010101" 
	report "ADD error at 001101010101" severity error;

wait for waitTime;
sA_s <= "001101010101";
wait for 1ns;
assert sB_s = "001101010110" 
	report "ADD error at 001101010110" severity error;

wait for waitTime;
sA_s <= "001101010110";
wait for 1ns;
assert sB_s = "001101010111" 
	report "ADD error at 001101010111" severity error;

wait for waitTime;
sA_s <= "001101010111";
wait for 1ns;
assert sB_s = "001101011000" 
	report "ADD error at 001101011000" severity error;

wait for waitTime;
sA_s <= "001101011000";
wait for 1ns;
assert sB_s = "001101011001" 
	report "ADD error at 001101011001" severity error;

wait for waitTime;
sA_s <= "001101011001";
wait for 1ns;
assert sB_s = "001101011010" 
	report "ADD error at 001101011010" severity error;

wait for waitTime;
sA_s <= "001101011010";
wait for 1ns;
assert sB_s = "001101011011" 
	report "ADD error at 001101011011" severity error;

wait for waitTime;
sA_s <= "001101011011";
wait for 1ns;
assert sB_s = "001101011100" 
	report "ADD error at 001101011100" severity error;

wait for waitTime;
sA_s <= "001101011100";
wait for 1ns;
assert sB_s = "001101011101" 
	report "ADD error at 001101011101" severity error;

wait for waitTime;
sA_s <= "001101011101";
wait for 1ns;
assert sB_s = "001101011110" 
	report "ADD error at 001101011110" severity error;

wait for waitTime;
sA_s <= "001101011110";
wait for 1ns;
assert sB_s = "001101011111" 
	report "ADD error at 001101011111" severity error;

wait for waitTime;
sA_s <= "001101011111";
wait for 1ns;
assert sB_s = "001101100000" 
	report "ADD error at 001101100000" severity error;

wait for waitTime;
sA_s <= "001101100000";
wait for 1ns;
assert sB_s = "001101100001" 
	report "ADD error at 001101100001" severity error;

wait for waitTime;
sA_s <= "001101100001";
wait for 1ns;
assert sB_s = "001101100010" 
	report "ADD error at 001101100010" severity error;

wait for waitTime;
sA_s <= "001101100010";
wait for 1ns;
assert sB_s = "001101100011" 
	report "ADD error at 001101100011" severity error;

wait for waitTime;
sA_s <= "001101100011";
wait for 1ns;
assert sB_s = "001101100100" 
	report "ADD error at 001101100100" severity error;

wait for waitTime;
sA_s <= "001101100100";
wait for 1ns;
assert sB_s = "001101100101" 
	report "ADD error at 001101100101" severity error;

wait for waitTime;
sA_s <= "001101100101";
wait for 1ns;
assert sB_s = "001101100110" 
	report "ADD error at 001101100110" severity error;

wait for waitTime;
sA_s <= "001101100110";
wait for 1ns;
assert sB_s = "001101100111" 
	report "ADD error at 001101100111" severity error;

wait for waitTime;
sA_s <= "001101100111";
wait for 1ns;
assert sB_s = "001101101000" 
	report "ADD error at 001101101000" severity error;

wait for waitTime;
sA_s <= "001101101000";
wait for 1ns;
assert sB_s = "001101101001" 
	report "ADD error at 001101101001" severity error;

wait for waitTime;
sA_s <= "001101101001";
wait for 1ns;
assert sB_s = "001101101010" 
	report "ADD error at 001101101010" severity error;

wait for waitTime;
sA_s <= "001101101010";
wait for 1ns;
assert sB_s = "001101101011" 
	report "ADD error at 001101101011" severity error;

wait for waitTime;
sA_s <= "001101101011";
wait for 1ns;
assert sB_s = "001101101100" 
	report "ADD error at 001101101100" severity error;

wait for waitTime;
sA_s <= "001101101100";
wait for 1ns;
assert sB_s = "001101101101" 
	report "ADD error at 001101101101" severity error;

wait for waitTime;
sA_s <= "001101101101";
wait for 1ns;
assert sB_s = "001101101110" 
	report "ADD error at 001101101110" severity error;

wait for waitTime;
sA_s <= "001101101110";
wait for 1ns;
assert sB_s = "001101101111" 
	report "ADD error at 001101101111" severity error;

wait for waitTime;
sA_s <= "001101101111";
wait for 1ns;
assert sB_s = "001101110000" 
	report "ADD error at 001101110000" severity error;

wait for waitTime;
sA_s <= "001101110000";
wait for 1ns;
assert sB_s = "001101110001" 
	report "ADD error at 001101110001" severity error;

wait for waitTime;
sA_s <= "001101110001";
wait for 1ns;
assert sB_s = "001101110010" 
	report "ADD error at 001101110010" severity error;

wait for waitTime;
sA_s <= "001101110010";
wait for 1ns;
assert sB_s = "001101110011" 
	report "ADD error at 001101110011" severity error;

wait for waitTime;
sA_s <= "001101110011";
wait for 1ns;
assert sB_s = "001101110100" 
	report "ADD error at 001101110100" severity error;

wait for waitTime;
sA_s <= "001101110100";
wait for 1ns;
assert sB_s = "001101110101" 
	report "ADD error at 001101110101" severity error;

wait for waitTime;
sA_s <= "001101110101";
wait for 1ns;
assert sB_s = "001101110110" 
	report "ADD error at 001101110110" severity error;

wait for waitTime;
sA_s <= "001101110110";
wait for 1ns;
assert sB_s = "001101110111" 
	report "ADD error at 001101110111" severity error;

wait for waitTime;
sA_s <= "001101110111";
wait for 1ns;
assert sB_s = "001101111000" 
	report "ADD error at 001101111000" severity error;

wait for waitTime;
sA_s <= "001101111000";
wait for 1ns;
assert sB_s = "001101111001" 
	report "ADD error at 001101111001" severity error;

wait for waitTime;
sA_s <= "001101111001";
wait for 1ns;
assert sB_s = "001101111010" 
	report "ADD error at 001101111010" severity error;

wait for waitTime;
sA_s <= "001101111010";
wait for 1ns;
assert sB_s = "001101111011" 
	report "ADD error at 001101111011" severity error;

wait for waitTime;
sA_s <= "001101111011";
wait for 1ns;
assert sB_s = "001101111100" 
	report "ADD error at 001101111100" severity error;

wait for waitTime;
sA_s <= "001101111100";
wait for 1ns;
assert sB_s = "001101111101" 
	report "ADD error at 001101111101" severity error;

wait for waitTime;
sA_s <= "001101111101";
wait for 1ns;
assert sB_s = "001101111110" 
	report "ADD error at 001101111110" severity error;

wait for waitTime;
sA_s <= "001101111110";
wait for 1ns;
assert sB_s = "001101111111" 
	report "ADD error at 001101111111" severity error;

wait for waitTime;
sA_s <= "001101111111";
wait for 1ns;
assert sB_s = "001110000000" 
	report "ADD error at 001110000000" severity error;

wait for waitTime;
sA_s <= "001110000000";
wait for 1ns;
assert sB_s = "001110000001" 
	report "ADD error at 001110000001" severity error;

wait for waitTime;
sA_s <= "001110000001";
wait for 1ns;
assert sB_s = "001110000010" 
	report "ADD error at 001110000010" severity error;

wait for waitTime;
sA_s <= "001110000010";
wait for 1ns;
assert sB_s = "001110000011" 
	report "ADD error at 001110000011" severity error;

wait for waitTime;
sA_s <= "001110000011";
wait for 1ns;
assert sB_s = "001110000100" 
	report "ADD error at 001110000100" severity error;

wait for waitTime;
sA_s <= "001110000100";
wait for 1ns;
assert sB_s = "001110000101" 
	report "ADD error at 001110000101" severity error;

wait for waitTime;
sA_s <= "001110000101";
wait for 1ns;
assert sB_s = "001110000110" 
	report "ADD error at 001110000110" severity error;

wait for waitTime;
sA_s <= "001110000110";
wait for 1ns;
assert sB_s = "001110000111" 
	report "ADD error at 001110000111" severity error;

wait for waitTime;
sA_s <= "001110000111";
wait for 1ns;
assert sB_s = "001110001000" 
	report "ADD error at 001110001000" severity error;

wait for waitTime;
sA_s <= "001110001000";
wait for 1ns;
assert sB_s = "001110001001" 
	report "ADD error at 001110001001" severity error;

wait for waitTime;
sA_s <= "001110001001";
wait for 1ns;
assert sB_s = "001110001010" 
	report "ADD error at 001110001010" severity error;

wait for waitTime;
sA_s <= "001110001010";
wait for 1ns;
assert sB_s = "001110001011" 
	report "ADD error at 001110001011" severity error;

wait for waitTime;
sA_s <= "001110001011";
wait for 1ns;
assert sB_s = "001110001100" 
	report "ADD error at 001110001100" severity error;

wait for waitTime;
sA_s <= "001110001100";
wait for 1ns;
assert sB_s = "001110001101" 
	report "ADD error at 001110001101" severity error;

wait for waitTime;
sA_s <= "001110001101";
wait for 1ns;
assert sB_s = "001110001110" 
	report "ADD error at 001110001110" severity error;

wait for waitTime;
sA_s <= "001110001110";
wait for 1ns;
assert sB_s = "001110001111" 
	report "ADD error at 001110001111" severity error;

wait for waitTime;
sA_s <= "001110001111";
wait for 1ns;
assert sB_s = "001110010000" 
	report "ADD error at 001110010000" severity error;

wait for waitTime;
sA_s <= "001110010000";
wait for 1ns;
assert sB_s = "001110010001" 
	report "ADD error at 001110010001" severity error;

wait for waitTime;
sA_s <= "001110010001";
wait for 1ns;
assert sB_s = "001110010010" 
	report "ADD error at 001110010010" severity error;

wait for waitTime;
sA_s <= "001110010010";
wait for 1ns;
assert sB_s = "001110010011" 
	report "ADD error at 001110010011" severity error;

wait for waitTime;
sA_s <= "001110010011";
wait for 1ns;
assert sB_s = "001110010100" 
	report "ADD error at 001110010100" severity error;

wait for waitTime;
sA_s <= "001110010100";
wait for 1ns;
assert sB_s = "001110010101" 
	report "ADD error at 001110010101" severity error;

wait for waitTime;
sA_s <= "001110010101";
wait for 1ns;
assert sB_s = "001110010110" 
	report "ADD error at 001110010110" severity error;

wait for waitTime;
sA_s <= "001110010110";
wait for 1ns;
assert sB_s = "001110010111" 
	report "ADD error at 001110010111" severity error;

wait for waitTime;
sA_s <= "001110010111";
wait for 1ns;
assert sB_s = "001110011000" 
	report "ADD error at 001110011000" severity error;

wait for waitTime;
sA_s <= "001110011000";
wait for 1ns;
assert sB_s = "001110011001" 
	report "ADD error at 001110011001" severity error;

wait for waitTime;
sA_s <= "001110011001";
wait for 1ns;
assert sB_s = "001110011010" 
	report "ADD error at 001110011010" severity error;

wait for waitTime;
sA_s <= "001110011010";
wait for 1ns;
assert sB_s = "001110011011" 
	report "ADD error at 001110011011" severity error;

wait for waitTime;
sA_s <= "001110011011";
wait for 1ns;
assert sB_s = "001110011100" 
	report "ADD error at 001110011100" severity error;

wait for waitTime;
sA_s <= "001110011100";
wait for 1ns;
assert sB_s = "001110011101" 
	report "ADD error at 001110011101" severity error;

wait for waitTime;
sA_s <= "001110011101";
wait for 1ns;
assert sB_s = "001110011110" 
	report "ADD error at 001110011110" severity error;

wait for waitTime;
sA_s <= "001110011110";
wait for 1ns;
assert sB_s = "001110011111" 
	report "ADD error at 001110011111" severity error;

wait for waitTime;
sA_s <= "001110011111";
wait for 1ns;
assert sB_s = "001110100000" 
	report "ADD error at 001110100000" severity error;

wait for waitTime;
sA_s <= "001110100000";
wait for 1ns;
assert sB_s = "001110100001" 
	report "ADD error at 001110100001" severity error;

wait for waitTime;
sA_s <= "001110100001";
wait for 1ns;
assert sB_s = "001110100010" 
	report "ADD error at 001110100010" severity error;

wait for waitTime;
sA_s <= "001110100010";
wait for 1ns;
assert sB_s = "001110100011" 
	report "ADD error at 001110100011" severity error;

wait for waitTime;
sA_s <= "001110100011";
wait for 1ns;
assert sB_s = "001110100100" 
	report "ADD error at 001110100100" severity error;

wait for waitTime;
sA_s <= "001110100100";
wait for 1ns;
assert sB_s = "001110100101" 
	report "ADD error at 001110100101" severity error;

wait for waitTime;
sA_s <= "001110100101";
wait for 1ns;
assert sB_s = "001110100110" 
	report "ADD error at 001110100110" severity error;

wait for waitTime;
sA_s <= "001110100110";
wait for 1ns;
assert sB_s = "001110100111" 
	report "ADD error at 001110100111" severity error;

wait for waitTime;
sA_s <= "001110100111";
wait for 1ns;
assert sB_s = "001110101000" 
	report "ADD error at 001110101000" severity error;

wait for waitTime;
sA_s <= "001110101000";
wait for 1ns;
assert sB_s = "001110101001" 
	report "ADD error at 001110101001" severity error;

wait for waitTime;
sA_s <= "001110101001";
wait for 1ns;
assert sB_s = "001110101010" 
	report "ADD error at 001110101010" severity error;

wait for waitTime;
sA_s <= "001110101010";
wait for 1ns;
assert sB_s = "001110101011" 
	report "ADD error at 001110101011" severity error;

wait for waitTime;
sA_s <= "001110101011";
wait for 1ns;
assert sB_s = "001110101100" 
	report "ADD error at 001110101100" severity error;

wait for waitTime;
sA_s <= "001110101100";
wait for 1ns;
assert sB_s = "001110101101" 
	report "ADD error at 001110101101" severity error;

wait for waitTime;
sA_s <= "001110101101";
wait for 1ns;
assert sB_s = "001110101110" 
	report "ADD error at 001110101110" severity error;

wait for waitTime;
sA_s <= "001110101110";
wait for 1ns;
assert sB_s = "001110101111" 
	report "ADD error at 001110101111" severity error;

wait for waitTime;
sA_s <= "001110101111";
wait for 1ns;
assert sB_s = "001110110000" 
	report "ADD error at 001110110000" severity error;

wait for waitTime;
sA_s <= "001110110000";
wait for 1ns;
assert sB_s = "001110110001" 
	report "ADD error at 001110110001" severity error;

wait for waitTime;
sA_s <= "001110110001";
wait for 1ns;
assert sB_s = "001110110010" 
	report "ADD error at 001110110010" severity error;

wait for waitTime;
sA_s <= "001110110010";
wait for 1ns;
assert sB_s = "001110110011" 
	report "ADD error at 001110110011" severity error;

wait for waitTime;
sA_s <= "001110110011";
wait for 1ns;
assert sB_s = "001110110100" 
	report "ADD error at 001110110100" severity error;

wait for waitTime;
sA_s <= "001110110100";
wait for 1ns;
assert sB_s = "001110110101" 
	report "ADD error at 001110110101" severity error;

wait for waitTime;
sA_s <= "001110110101";
wait for 1ns;
assert sB_s = "001110110110" 
	report "ADD error at 001110110110" severity error;

wait for waitTime;
sA_s <= "001110110110";
wait for 1ns;
assert sB_s = "001110110111" 
	report "ADD error at 001110110111" severity error;

wait for waitTime;
sA_s <= "001110110111";
wait for 1ns;
assert sB_s = "001110111000" 
	report "ADD error at 001110111000" severity error;

wait for waitTime;
sA_s <= "001110111000";
wait for 1ns;
assert sB_s = "001110111001" 
	report "ADD error at 001110111001" severity error;

wait for waitTime;
sA_s <= "001110111001";
wait for 1ns;
assert sB_s = "001110111010" 
	report "ADD error at 001110111010" severity error;

wait for waitTime;
sA_s <= "001110111010";
wait for 1ns;
assert sB_s = "001110111011" 
	report "ADD error at 001110111011" severity error;

wait for waitTime;
sA_s <= "001110111011";
wait for 1ns;
assert sB_s = "001110111100" 
	report "ADD error at 001110111100" severity error;

wait for waitTime;
sA_s <= "001110111100";
wait for 1ns;
assert sB_s = "001110111101" 
	report "ADD error at 001110111101" severity error;

wait for waitTime;
sA_s <= "001110111101";
wait for 1ns;
assert sB_s = "001110111110" 
	report "ADD error at 001110111110" severity error;

wait for waitTime;
sA_s <= "001110111110";
wait for 1ns;
assert sB_s = "001110111111" 
	report "ADD error at 001110111111" severity error;

wait for waitTime;
sA_s <= "001110111111";
wait for 1ns;
assert sB_s = "001111000000" 
	report "ADD error at 001111000000" severity error;

wait for waitTime;
sA_s <= "001111000000";
wait for 1ns;
assert sB_s = "001111000001" 
	report "ADD error at 001111000001" severity error;

wait for waitTime;
sA_s <= "001111000001";
wait for 1ns;
assert sB_s = "001111000010" 
	report "ADD error at 001111000010" severity error;

wait for waitTime;
sA_s <= "001111000010";
wait for 1ns;
assert sB_s = "001111000011" 
	report "ADD error at 001111000011" severity error;

wait for waitTime;
sA_s <= "001111000011";
wait for 1ns;
assert sB_s = "001111000100" 
	report "ADD error at 001111000100" severity error;

wait for waitTime;
sA_s <= "001111000100";
wait for 1ns;
assert sB_s = "001111000101" 
	report "ADD error at 001111000101" severity error;

wait for waitTime;
sA_s <= "001111000101";
wait for 1ns;
assert sB_s = "001111000110" 
	report "ADD error at 001111000110" severity error;

wait for waitTime;
sA_s <= "001111000110";
wait for 1ns;
assert sB_s = "001111000111" 
	report "ADD error at 001111000111" severity error;

wait for waitTime;
sA_s <= "001111000111";
wait for 1ns;
assert sB_s = "001111001000" 
	report "ADD error at 001111001000" severity error;

wait for waitTime;
sA_s <= "001111001000";
wait for 1ns;
assert sB_s = "001111001001" 
	report "ADD error at 001111001001" severity error;

wait for waitTime;
sA_s <= "001111001001";
wait for 1ns;
assert sB_s = "001111001010" 
	report "ADD error at 001111001010" severity error;

wait for waitTime;
sA_s <= "001111001010";
wait for 1ns;
assert sB_s = "001111001011" 
	report "ADD error at 001111001011" severity error;

wait for waitTime;
sA_s <= "001111001011";
wait for 1ns;
assert sB_s = "001111001100" 
	report "ADD error at 001111001100" severity error;

wait for waitTime;
sA_s <= "001111001100";
wait for 1ns;
assert sB_s = "001111001101" 
	report "ADD error at 001111001101" severity error;

wait for waitTime;
sA_s <= "001111001101";
wait for 1ns;
assert sB_s = "001111001110" 
	report "ADD error at 001111001110" severity error;

wait for waitTime;
sA_s <= "001111001110";
wait for 1ns;
assert sB_s = "001111001111" 
	report "ADD error at 001111001111" severity error;

wait for waitTime;
sA_s <= "001111001111";
wait for 1ns;
assert sB_s = "001111010000" 
	report "ADD error at 001111010000" severity error;

wait for waitTime;
sA_s <= "001111010000";
wait for 1ns;
assert sB_s = "001111010001" 
	report "ADD error at 001111010001" severity error;

wait for waitTime;
sA_s <= "001111010001";
wait for 1ns;
assert sB_s = "001111010010" 
	report "ADD error at 001111010010" severity error;

wait for waitTime;
sA_s <= "001111010010";
wait for 1ns;
assert sB_s = "001111010011" 
	report "ADD error at 001111010011" severity error;

wait for waitTime;
sA_s <= "001111010011";
wait for 1ns;
assert sB_s = "001111010100" 
	report "ADD error at 001111010100" severity error;

wait for waitTime;
sA_s <= "001111010100";
wait for 1ns;
assert sB_s = "001111010101" 
	report "ADD error at 001111010101" severity error;

wait for waitTime;
sA_s <= "001111010101";
wait for 1ns;
assert sB_s = "001111010110" 
	report "ADD error at 001111010110" severity error;

wait for waitTime;
sA_s <= "001111010110";
wait for 1ns;
assert sB_s = "001111010111" 
	report "ADD error at 001111010111" severity error;

wait for waitTime;
sA_s <= "001111010111";
wait for 1ns;
assert sB_s = "001111011000" 
	report "ADD error at 001111011000" severity error;

wait for waitTime;
sA_s <= "001111011000";
wait for 1ns;
assert sB_s = "001111011001" 
	report "ADD error at 001111011001" severity error;

wait for waitTime;
sA_s <= "001111011001";
wait for 1ns;
assert sB_s = "001111011010" 
	report "ADD error at 001111011010" severity error;

wait for waitTime;
sA_s <= "001111011010";
wait for 1ns;
assert sB_s = "001111011011" 
	report "ADD error at 001111011011" severity error;

wait for waitTime;
sA_s <= "001111011011";
wait for 1ns;
assert sB_s = "001111011100" 
	report "ADD error at 001111011100" severity error;

wait for waitTime;
sA_s <= "001111011100";
wait for 1ns;
assert sB_s = "001111011101" 
	report "ADD error at 001111011101" severity error;

wait for waitTime;
sA_s <= "001111011101";
wait for 1ns;
assert sB_s = "001111011110" 
	report "ADD error at 001111011110" severity error;

wait for waitTime;
sA_s <= "001111011110";
wait for 1ns;
assert sB_s = "001111011111" 
	report "ADD error at 001111011111" severity error;

wait for waitTime;
sA_s <= "001111011111";
wait for 1ns;
assert sB_s = "001111100000" 
	report "ADD error at 001111100000" severity error;

wait for waitTime;
sA_s <= "001111100000";
wait for 1ns;
assert sB_s = "001111100001" 
	report "ADD error at 001111100001" severity error;

wait for waitTime;
sA_s <= "001111100001";
wait for 1ns;
assert sB_s = "001111100010" 
	report "ADD error at 001111100010" severity error;

wait for waitTime;
sA_s <= "001111100010";
wait for 1ns;
assert sB_s = "001111100011" 
	report "ADD error at 001111100011" severity error;

wait for waitTime;
sA_s <= "001111100011";
wait for 1ns;
assert sB_s = "001111100100" 
	report "ADD error at 001111100100" severity error;

wait for waitTime;
sA_s <= "001111100100";
wait for 1ns;
assert sB_s = "001111100101" 
	report "ADD error at 001111100101" severity error;

wait for waitTime;
sA_s <= "001111100101";
wait for 1ns;
assert sB_s = "001111100110" 
	report "ADD error at 001111100110" severity error;

wait for waitTime;
sA_s <= "001111100110";
wait for 1ns;
assert sB_s = "001111100111" 
	report "ADD error at 001111100111" severity error;

wait for waitTime;
sA_s <= "001111100111";
wait for 1ns;
assert sB_s = "001111101000" 
	report "ADD error at 001111101000" severity error;

wait for waitTime;
sA_s <= "001111101000";
wait for 1ns;
assert sB_s = "001111101001" 
	report "ADD error at 001111101001" severity error;

wait for waitTime;
sA_s <= "001111101001";
wait for 1ns;
assert sB_s = "001111101010" 
	report "ADD error at 001111101010" severity error;

wait for waitTime;
sA_s <= "001111101010";
wait for 1ns;
assert sB_s = "001111101011" 
	report "ADD error at 001111101011" severity error;

wait for waitTime;
sA_s <= "001111101011";
wait for 1ns;
assert sB_s = "001111101100" 
	report "ADD error at 001111101100" severity error;

wait for waitTime;
sA_s <= "001111101100";
wait for 1ns;
assert sB_s = "001111101101" 
	report "ADD error at 001111101101" severity error;

wait for waitTime;
sA_s <= "001111101101";
wait for 1ns;
assert sB_s = "001111101110" 
	report "ADD error at 001111101110" severity error;

wait for waitTime;
sA_s <= "001111101110";
wait for 1ns;
assert sB_s = "001111101111" 
	report "ADD error at 001111101111" severity error;

wait for waitTime;
sA_s <= "001111101111";
wait for 1ns;
assert sB_s = "001111110000" 
	report "ADD error at 001111110000" severity error;

wait for waitTime;
sA_s <= "001111110000";
wait for 1ns;
assert sB_s = "001111110001" 
	report "ADD error at 001111110001" severity error;

wait for waitTime;
sA_s <= "001111110001";
wait for 1ns;
assert sB_s = "001111110010" 
	report "ADD error at 001111110010" severity error;

wait for waitTime;
sA_s <= "001111110010";
wait for 1ns;
assert sB_s = "001111110011" 
	report "ADD error at 001111110011" severity error;

wait for waitTime;
sA_s <= "001111110011";
wait for 1ns;
assert sB_s = "001111110100" 
	report "ADD error at 001111110100" severity error;

wait for waitTime;
sA_s <= "001111110100";
wait for 1ns;
assert sB_s = "001111110101" 
	report "ADD error at 001111110101" severity error;

wait for waitTime;
sA_s <= "001111110101";
wait for 1ns;
assert sB_s = "001111110110" 
	report "ADD error at 001111110110" severity error;

wait for waitTime;
sA_s <= "001111110110";
wait for 1ns;
assert sB_s = "001111110111" 
	report "ADD error at 001111110111" severity error;

wait for waitTime;
sA_s <= "001111110111";
wait for 1ns;
assert sB_s = "001111111000" 
	report "ADD error at 001111111000" severity error;

wait for waitTime;
sA_s <= "001111111000";
wait for 1ns;
assert sB_s = "001111111001" 
	report "ADD error at 001111111001" severity error;

wait for waitTime;
sA_s <= "001111111001";
wait for 1ns;
assert sB_s = "001111111010" 
	report "ADD error at 001111111010" severity error;

wait for waitTime;
sA_s <= "001111111010";
wait for 1ns;
assert sB_s = "001111111011" 
	report "ADD error at 001111111011" severity error;

wait for waitTime;
sA_s <= "001111111011";
wait for 1ns;
assert sB_s = "001111111100" 
	report "ADD error at 001111111100" severity error;

wait for waitTime;
sA_s <= "001111111100";
wait for 1ns;
assert sB_s = "001111111101" 
	report "ADD error at 001111111101" severity error;

wait for waitTime;
sA_s <= "001111111101";
wait for 1ns;
assert sB_s = "001111111110" 
	report "ADD error at 001111111110" severity error;

wait for waitTime;
sA_s <= "001111111110";
wait for 1ns;
assert sB_s = "001111111111" 
	report "ADD error at 001111111111" severity error;

wait for waitTime;
sA_s <= "001111111111";
wait for 1ns;
assert sB_s = "010000000000" 
	report "ADD error at 010000000000" severity error;

wait for waitTime;
sA_s <= "010000000000";
wait for 1ns;
assert sB_s = "010000000001" 
	report "ADD error at 010000000001" severity error;

wait for waitTime;
sA_s <= "010000000001";
wait for 1ns;
assert sB_s = "010000000010" 
	report "ADD error at 010000000010" severity error;

wait for waitTime;
sA_s <= "010000000010";
wait for 1ns;
assert sB_s = "010000000011" 
	report "ADD error at 010000000011" severity error;

wait for waitTime;
sA_s <= "010000000011";
wait for 1ns;
assert sB_s = "010000000100" 
	report "ADD error at 010000000100" severity error;

wait for waitTime;
sA_s <= "010000000100";
wait for 1ns;
assert sB_s = "010000000101" 
	report "ADD error at 010000000101" severity error;

wait for waitTime;
sA_s <= "010000000101";
wait for 1ns;
assert sB_s = "010000000110" 
	report "ADD error at 010000000110" severity error;

wait for waitTime;
sA_s <= "010000000110";
wait for 1ns;
assert sB_s = "010000000111" 
	report "ADD error at 010000000111" severity error;

wait for waitTime;
sA_s <= "010000000111";
wait for 1ns;
assert sB_s = "010000001000" 
	report "ADD error at 010000001000" severity error;

wait for waitTime;
sA_s <= "010000001000";
wait for 1ns;
assert sB_s = "010000001001" 
	report "ADD error at 010000001001" severity error;

wait for waitTime;
sA_s <= "010000001001";
wait for 1ns;
assert sB_s = "010000001010" 
	report "ADD error at 010000001010" severity error;

wait for waitTime;
sA_s <= "010000001010";
wait for 1ns;
assert sB_s = "010000001011" 
	report "ADD error at 010000001011" severity error;

wait for waitTime;
sA_s <= "010000001011";
wait for 1ns;
assert sB_s = "010000001100" 
	report "ADD error at 010000001100" severity error;

wait for waitTime;
sA_s <= "010000001100";
wait for 1ns;
assert sB_s = "010000001101" 
	report "ADD error at 010000001101" severity error;

wait for waitTime;
sA_s <= "010000001101";
wait for 1ns;
assert sB_s = "010000001110" 
	report "ADD error at 010000001110" severity error;

wait for waitTime;
sA_s <= "010000001110";
wait for 1ns;
assert sB_s = "010000001111" 
	report "ADD error at 010000001111" severity error;

wait for waitTime;
sA_s <= "010000001111";
wait for 1ns;
assert sB_s = "010000010000" 
	report "ADD error at 010000010000" severity error;

wait for waitTime;
sA_s <= "010000010000";
wait for 1ns;
assert sB_s = "010000010001" 
	report "ADD error at 010000010001" severity error;

wait for waitTime;
sA_s <= "010000010001";
wait for 1ns;
assert sB_s = "010000010010" 
	report "ADD error at 010000010010" severity error;

wait for waitTime;
sA_s <= "010000010010";
wait for 1ns;
assert sB_s = "010000010011" 
	report "ADD error at 010000010011" severity error;

wait for waitTime;
sA_s <= "010000010011";
wait for 1ns;
assert sB_s = "010000010100" 
	report "ADD error at 010000010100" severity error;

wait for waitTime;
sA_s <= "010000010100";
wait for 1ns;
assert sB_s = "010000010101" 
	report "ADD error at 010000010101" severity error;

wait for waitTime;
sA_s <= "010000010101";
wait for 1ns;
assert sB_s = "010000010110" 
	report "ADD error at 010000010110" severity error;

wait for waitTime;
sA_s <= "010000010110";
wait for 1ns;
assert sB_s = "010000010111" 
	report "ADD error at 010000010111" severity error;

wait for waitTime;
sA_s <= "010000010111";
wait for 1ns;
assert sB_s = "010000011000" 
	report "ADD error at 010000011000" severity error;

wait for waitTime;
sA_s <= "010000011000";
wait for 1ns;
assert sB_s = "010000011001" 
	report "ADD error at 010000011001" severity error;

wait for waitTime;
sA_s <= "010000011001";
wait for 1ns;
assert sB_s = "010000011010" 
	report "ADD error at 010000011010" severity error;

wait for waitTime;
sA_s <= "010000011010";
wait for 1ns;
assert sB_s = "010000011011" 
	report "ADD error at 010000011011" severity error;

wait for waitTime;
sA_s <= "010000011011";
wait for 1ns;
assert sB_s = "010000011100" 
	report "ADD error at 010000011100" severity error;

wait for waitTime;
sA_s <= "010000011100";
wait for 1ns;
assert sB_s = "010000011101" 
	report "ADD error at 010000011101" severity error;

wait for waitTime;
sA_s <= "010000011101";
wait for 1ns;
assert sB_s = "010000011110" 
	report "ADD error at 010000011110" severity error;

wait for waitTime;
sA_s <= "010000011110";
wait for 1ns;
assert sB_s = "010000011111" 
	report "ADD error at 010000011111" severity error;

wait for waitTime;
sA_s <= "010000011111";
wait for 1ns;
assert sB_s = "010000100000" 
	report "ADD error at 010000100000" severity error;

wait for waitTime;
sA_s <= "010000100000";
wait for 1ns;
assert sB_s = "010000100001" 
	report "ADD error at 010000100001" severity error;

wait for waitTime;
sA_s <= "010000100001";
wait for 1ns;
assert sB_s = "010000100010" 
	report "ADD error at 010000100010" severity error;

wait for waitTime;
sA_s <= "010000100010";
wait for 1ns;
assert sB_s = "010000100011" 
	report "ADD error at 010000100011" severity error;

wait for waitTime;
sA_s <= "010000100011";
wait for 1ns;
assert sB_s = "010000100100" 
	report "ADD error at 010000100100" severity error;

wait for waitTime;
sA_s <= "010000100100";
wait for 1ns;
assert sB_s = "010000100101" 
	report "ADD error at 010000100101" severity error;

wait for waitTime;
sA_s <= "010000100101";
wait for 1ns;
assert sB_s = "010000100110" 
	report "ADD error at 010000100110" severity error;

wait for waitTime;
sA_s <= "010000100110";
wait for 1ns;
assert sB_s = "010000100111" 
	report "ADD error at 010000100111" severity error;

wait for waitTime;
sA_s <= "010000100111";
wait for 1ns;
assert sB_s = "010000101000" 
	report "ADD error at 010000101000" severity error;

wait for waitTime;
sA_s <= "010000101000";
wait for 1ns;
assert sB_s = "010000101001" 
	report "ADD error at 010000101001" severity error;

wait for waitTime;
sA_s <= "010000101001";
wait for 1ns;
assert sB_s = "010000101010" 
	report "ADD error at 010000101010" severity error;

wait for waitTime;
sA_s <= "010000101010";
wait for 1ns;
assert sB_s = "010000101011" 
	report "ADD error at 010000101011" severity error;

wait for waitTime;
sA_s <= "010000101011";
wait for 1ns;
assert sB_s = "010000101100" 
	report "ADD error at 010000101100" severity error;

wait for waitTime;
sA_s <= "010000101100";
wait for 1ns;
assert sB_s = "010000101101" 
	report "ADD error at 010000101101" severity error;

wait for waitTime;
sA_s <= "010000101101";
wait for 1ns;
assert sB_s = "010000101110" 
	report "ADD error at 010000101110" severity error;

wait for waitTime;
sA_s <= "010000101110";
wait for 1ns;
assert sB_s = "010000101111" 
	report "ADD error at 010000101111" severity error;

wait for waitTime;
sA_s <= "010000101111";
wait for 1ns;
assert sB_s = "010000110000" 
	report "ADD error at 010000110000" severity error;

wait for waitTime;
sA_s <= "010000110000";
wait for 1ns;
assert sB_s = "010000110001" 
	report "ADD error at 010000110001" severity error;

wait for waitTime;
sA_s <= "010000110001";
wait for 1ns;
assert sB_s = "010000110010" 
	report "ADD error at 010000110010" severity error;

wait for waitTime;
sA_s <= "010000110010";
wait for 1ns;
assert sB_s = "010000110011" 
	report "ADD error at 010000110011" severity error;

wait for waitTime;
sA_s <= "010000110011";
wait for 1ns;
assert sB_s = "010000110100" 
	report "ADD error at 010000110100" severity error;

wait for waitTime;
sA_s <= "010000110100";
wait for 1ns;
assert sB_s = "010000110101" 
	report "ADD error at 010000110101" severity error;

wait for waitTime;
sA_s <= "010000110101";
wait for 1ns;
assert sB_s = "010000110110" 
	report "ADD error at 010000110110" severity error;

wait for waitTime;
sA_s <= "010000110110";
wait for 1ns;
assert sB_s = "010000110111" 
	report "ADD error at 010000110111" severity error;

wait for waitTime;
sA_s <= "010000110111";
wait for 1ns;
assert sB_s = "010000111000" 
	report "ADD error at 010000111000" severity error;

wait for waitTime;
sA_s <= "010000111000";
wait for 1ns;
assert sB_s = "010000111001" 
	report "ADD error at 010000111001" severity error;

wait for waitTime;
sA_s <= "010000111001";
wait for 1ns;
assert sB_s = "010000111010" 
	report "ADD error at 010000111010" severity error;

wait for waitTime;
sA_s <= "010000111010";
wait for 1ns;
assert sB_s = "010000111011" 
	report "ADD error at 010000111011" severity error;

wait for waitTime;
sA_s <= "010000111011";
wait for 1ns;
assert sB_s = "010000111100" 
	report "ADD error at 010000111100" severity error;

wait for waitTime;
sA_s <= "010000111100";
wait for 1ns;
assert sB_s = "010000111101" 
	report "ADD error at 010000111101" severity error;

wait for waitTime;
sA_s <= "010000111101";
wait for 1ns;
assert sB_s = "010000111110" 
	report "ADD error at 010000111110" severity error;

wait for waitTime;
sA_s <= "010000111110";
wait for 1ns;
assert sB_s = "010000111111" 
	report "ADD error at 010000111111" severity error;

wait for waitTime;
sA_s <= "010000111111";
wait for 1ns;
assert sB_s = "010001000000" 
	report "ADD error at 010001000000" severity error;

wait for waitTime;
sA_s <= "010001000000";
wait for 1ns;
assert sB_s = "010001000001" 
	report "ADD error at 010001000001" severity error;

wait for waitTime;
sA_s <= "010001000001";
wait for 1ns;
assert sB_s = "010001000010" 
	report "ADD error at 010001000010" severity error;

wait for waitTime;
sA_s <= "010001000010";
wait for 1ns;
assert sB_s = "010001000011" 
	report "ADD error at 010001000011" severity error;

wait for waitTime;
sA_s <= "010001000011";
wait for 1ns;
assert sB_s = "010001000100" 
	report "ADD error at 010001000100" severity error;

wait for waitTime;
sA_s <= "010001000100";
wait for 1ns;
assert sB_s = "010001000101" 
	report "ADD error at 010001000101" severity error;

wait for waitTime;
sA_s <= "010001000101";
wait for 1ns;
assert sB_s = "010001000110" 
	report "ADD error at 010001000110" severity error;

wait for waitTime;
sA_s <= "010001000110";
wait for 1ns;
assert sB_s = "010001000111" 
	report "ADD error at 010001000111" severity error;

wait for waitTime;
sA_s <= "010001000111";
wait for 1ns;
assert sB_s = "010001001000" 
	report "ADD error at 010001001000" severity error;

wait for waitTime;
sA_s <= "010001001000";
wait for 1ns;
assert sB_s = "010001001001" 
	report "ADD error at 010001001001" severity error;

wait for waitTime;
sA_s <= "010001001001";
wait for 1ns;
assert sB_s = "010001001010" 
	report "ADD error at 010001001010" severity error;

wait for waitTime;
sA_s <= "010001001010";
wait for 1ns;
assert sB_s = "010001001011" 
	report "ADD error at 010001001011" severity error;

wait for waitTime;
sA_s <= "010001001011";
wait for 1ns;
assert sB_s = "010001001100" 
	report "ADD error at 010001001100" severity error;

wait for waitTime;
sA_s <= "010001001100";
wait for 1ns;
assert sB_s = "010001001101" 
	report "ADD error at 010001001101" severity error;

wait for waitTime;
sA_s <= "010001001101";
wait for 1ns;
assert sB_s = "010001001110" 
	report "ADD error at 010001001110" severity error;

wait for waitTime;
sA_s <= "010001001110";
wait for 1ns;
assert sB_s = "010001001111" 
	report "ADD error at 010001001111" severity error;

wait for waitTime;
sA_s <= "010001001111";
wait for 1ns;
assert sB_s = "010001010000" 
	report "ADD error at 010001010000" severity error;

wait for waitTime;
sA_s <= "010001010000";
wait for 1ns;
assert sB_s = "010001010001" 
	report "ADD error at 010001010001" severity error;

wait for waitTime;
sA_s <= "010001010001";
wait for 1ns;
assert sB_s = "010001010010" 
	report "ADD error at 010001010010" severity error;

wait for waitTime;
sA_s <= "010001010010";
wait for 1ns;
assert sB_s = "010001010011" 
	report "ADD error at 010001010011" severity error;

wait for waitTime;
sA_s <= "010001010011";
wait for 1ns;
assert sB_s = "010001010100" 
	report "ADD error at 010001010100" severity error;

wait for waitTime;
sA_s <= "010001010100";
wait for 1ns;
assert sB_s = "010001010101" 
	report "ADD error at 010001010101" severity error;

wait for waitTime;
sA_s <= "010001010101";
wait for 1ns;
assert sB_s = "010001010110" 
	report "ADD error at 010001010110" severity error;

wait for waitTime;
sA_s <= "010001010110";
wait for 1ns;
assert sB_s = "010001010111" 
	report "ADD error at 010001010111" severity error;

wait for waitTime;
sA_s <= "010001010111";
wait for 1ns;
assert sB_s = "010001011000" 
	report "ADD error at 010001011000" severity error;

wait for waitTime;
sA_s <= "010001011000";
wait for 1ns;
assert sB_s = "010001011001" 
	report "ADD error at 010001011001" severity error;

wait for waitTime;
sA_s <= "010001011001";
wait for 1ns;
assert sB_s = "010001011010" 
	report "ADD error at 010001011010" severity error;

wait for waitTime;
sA_s <= "010001011010";
wait for 1ns;
assert sB_s = "010001011011" 
	report "ADD error at 010001011011" severity error;

wait for waitTime;
sA_s <= "010001011011";
wait for 1ns;
assert sB_s = "010001011100" 
	report "ADD error at 010001011100" severity error;

wait for waitTime;
sA_s <= "010001011100";
wait for 1ns;
assert sB_s = "010001011101" 
	report "ADD error at 010001011101" severity error;

wait for waitTime;
sA_s <= "010001011101";
wait for 1ns;
assert sB_s = "010001011110" 
	report "ADD error at 010001011110" severity error;

wait for waitTime;
sA_s <= "010001011110";
wait for 1ns;
assert sB_s = "010001011111" 
	report "ADD error at 010001011111" severity error;

wait for waitTime;
sA_s <= "010001011111";
wait for 1ns;
assert sB_s = "010001100000" 
	report "ADD error at 010001100000" severity error;

wait for waitTime;
sA_s <= "010001100000";
wait for 1ns;
assert sB_s = "010001100001" 
	report "ADD error at 010001100001" severity error;

wait for waitTime;
sA_s <= "010001100001";
wait for 1ns;
assert sB_s = "010001100010" 
	report "ADD error at 010001100010" severity error;

wait for waitTime;
sA_s <= "010001100010";
wait for 1ns;
assert sB_s = "010001100011" 
	report "ADD error at 010001100011" severity error;

wait for waitTime;
sA_s <= "010001100011";
wait for 1ns;
assert sB_s = "010001100100" 
	report "ADD error at 010001100100" severity error;

wait for waitTime;
sA_s <= "010001100100";
wait for 1ns;
assert sB_s = "010001100101" 
	report "ADD error at 010001100101" severity error;

wait for waitTime;
sA_s <= "010001100101";
wait for 1ns;
assert sB_s = "010001100110" 
	report "ADD error at 010001100110" severity error;

wait for waitTime;
sA_s <= "010001100110";
wait for 1ns;
assert sB_s = "010001100111" 
	report "ADD error at 010001100111" severity error;

wait for waitTime;
sA_s <= "010001100111";
wait for 1ns;
assert sB_s = "010001101000" 
	report "ADD error at 010001101000" severity error;

wait for waitTime;
sA_s <= "010001101000";
wait for 1ns;
assert sB_s = "010001101001" 
	report "ADD error at 010001101001" severity error;

wait for waitTime;
sA_s <= "010001101001";
wait for 1ns;
assert sB_s = "010001101010" 
	report "ADD error at 010001101010" severity error;

wait for waitTime;
sA_s <= "010001101010";
wait for 1ns;
assert sB_s = "010001101011" 
	report "ADD error at 010001101011" severity error;

wait for waitTime;
sA_s <= "010001101011";
wait for 1ns;
assert sB_s = "010001101100" 
	report "ADD error at 010001101100" severity error;

wait for waitTime;
sA_s <= "010001101100";
wait for 1ns;
assert sB_s = "010001101101" 
	report "ADD error at 010001101101" severity error;

wait for waitTime;
sA_s <= "010001101101";
wait for 1ns;
assert sB_s = "010001101110" 
	report "ADD error at 010001101110" severity error;

wait for waitTime;
sA_s <= "010001101110";
wait for 1ns;
assert sB_s = "010001101111" 
	report "ADD error at 010001101111" severity error;

wait for waitTime;
sA_s <= "010001101111";
wait for 1ns;
assert sB_s = "010001110000" 
	report "ADD error at 010001110000" severity error;

wait for waitTime;
sA_s <= "010001110000";
wait for 1ns;
assert sB_s = "010001110001" 
	report "ADD error at 010001110001" severity error;

wait for waitTime;
sA_s <= "010001110001";
wait for 1ns;
assert sB_s = "010001110010" 
	report "ADD error at 010001110010" severity error;

wait for waitTime;
sA_s <= "010001110010";
wait for 1ns;
assert sB_s = "010001110011" 
	report "ADD error at 010001110011" severity error;

wait for waitTime;
sA_s <= "010001110011";
wait for 1ns;
assert sB_s = "010001110100" 
	report "ADD error at 010001110100" severity error;

wait for waitTime;
sA_s <= "010001110100";
wait for 1ns;
assert sB_s = "010001110101" 
	report "ADD error at 010001110101" severity error;

wait for waitTime;
sA_s <= "010001110101";
wait for 1ns;
assert sB_s = "010001110110" 
	report "ADD error at 010001110110" severity error;

wait for waitTime;
sA_s <= "010001110110";
wait for 1ns;
assert sB_s = "010001110111" 
	report "ADD error at 010001110111" severity error;

wait for waitTime;
sA_s <= "010001110111";
wait for 1ns;
assert sB_s = "010001111000" 
	report "ADD error at 010001111000" severity error;

wait for waitTime;
sA_s <= "010001111000";
wait for 1ns;
assert sB_s = "010001111001" 
	report "ADD error at 010001111001" severity error;

wait for waitTime;
sA_s <= "010001111001";
wait for 1ns;
assert sB_s = "010001111010" 
	report "ADD error at 010001111010" severity error;

wait for waitTime;
sA_s <= "010001111010";
wait for 1ns;
assert sB_s = "010001111011" 
	report "ADD error at 010001111011" severity error;

wait for waitTime;
sA_s <= "010001111011";
wait for 1ns;
assert sB_s = "010001111100" 
	report "ADD error at 010001111100" severity error;

wait for waitTime;
sA_s <= "010001111100";
wait for 1ns;
assert sB_s = "010001111101" 
	report "ADD error at 010001111101" severity error;

wait for waitTime;
sA_s <= "010001111101";
wait for 1ns;
assert sB_s = "010001111110" 
	report "ADD error at 010001111110" severity error;

wait for waitTime;
sA_s <= "010001111110";
wait for 1ns;
assert sB_s = "010001111111" 
	report "ADD error at 010001111111" severity error;

wait for waitTime;
sA_s <= "010001111111";
wait for 1ns;
assert sB_s = "010010000000" 
	report "ADD error at 010010000000" severity error;

wait for waitTime;
sA_s <= "010010000000";
wait for 1ns;
assert sB_s = "010010000001" 
	report "ADD error at 010010000001" severity error;

wait for waitTime;
sA_s <= "010010000001";
wait for 1ns;
assert sB_s = "010010000010" 
	report "ADD error at 010010000010" severity error;

wait for waitTime;
sA_s <= "010010000010";
wait for 1ns;
assert sB_s = "010010000011" 
	report "ADD error at 010010000011" severity error;

wait for waitTime;
sA_s <= "010010000011";
wait for 1ns;
assert sB_s = "010010000100" 
	report "ADD error at 010010000100" severity error;

wait for waitTime;
sA_s <= "010010000100";
wait for 1ns;
assert sB_s = "010010000101" 
	report "ADD error at 010010000101" severity error;

wait for waitTime;
sA_s <= "010010000101";
wait for 1ns;
assert sB_s = "010010000110" 
	report "ADD error at 010010000110" severity error;

wait for waitTime;
sA_s <= "010010000110";
wait for 1ns;
assert sB_s = "010010000111" 
	report "ADD error at 010010000111" severity error;

wait for waitTime;
sA_s <= "010010000111";
wait for 1ns;
assert sB_s = "010010001000" 
	report "ADD error at 010010001000" severity error;

wait for waitTime;
sA_s <= "010010001000";
wait for 1ns;
assert sB_s = "010010001001" 
	report "ADD error at 010010001001" severity error;

wait for waitTime;
sA_s <= "010010001001";
wait for 1ns;
assert sB_s = "010010001010" 
	report "ADD error at 010010001010" severity error;

wait for waitTime;
sA_s <= "010010001010";
wait for 1ns;
assert sB_s = "010010001011" 
	report "ADD error at 010010001011" severity error;

wait for waitTime;
sA_s <= "010010001011";
wait for 1ns;
assert sB_s = "010010001100" 
	report "ADD error at 010010001100" severity error;

wait for waitTime;
sA_s <= "010010001100";
wait for 1ns;
assert sB_s = "010010001101" 
	report "ADD error at 010010001101" severity error;

wait for waitTime;
sA_s <= "010010001101";
wait for 1ns;
assert sB_s = "010010001110" 
	report "ADD error at 010010001110" severity error;

wait for waitTime;
sA_s <= "010010001110";
wait for 1ns;
assert sB_s = "010010001111" 
	report "ADD error at 010010001111" severity error;

wait for waitTime;
sA_s <= "010010001111";
wait for 1ns;
assert sB_s = "010010010000" 
	report "ADD error at 010010010000" severity error;

wait for waitTime;
sA_s <= "010010010000";
wait for 1ns;
assert sB_s = "010010010001" 
	report "ADD error at 010010010001" severity error;

wait for waitTime;
sA_s <= "010010010001";
wait for 1ns;
assert sB_s = "010010010010" 
	report "ADD error at 010010010010" severity error;

wait for waitTime;
sA_s <= "010010010010";
wait for 1ns;
assert sB_s = "010010010011" 
	report "ADD error at 010010010011" severity error;

wait for waitTime;
sA_s <= "010010010011";
wait for 1ns;
assert sB_s = "010010010100" 
	report "ADD error at 010010010100" severity error;

wait for waitTime;
sA_s <= "010010010100";
wait for 1ns;
assert sB_s = "010010010101" 
	report "ADD error at 010010010101" severity error;

wait for waitTime;
sA_s <= "010010010101";
wait for 1ns;
assert sB_s = "010010010110" 
	report "ADD error at 010010010110" severity error;

wait for waitTime;
sA_s <= "010010010110";
wait for 1ns;
assert sB_s = "010010010111" 
	report "ADD error at 010010010111" severity error;

wait for waitTime;
sA_s <= "010010010111";
wait for 1ns;
assert sB_s = "010010011000" 
	report "ADD error at 010010011000" severity error;

wait for waitTime;
sA_s <= "010010011000";
wait for 1ns;
assert sB_s = "010010011001" 
	report "ADD error at 010010011001" severity error;

wait for waitTime;
sA_s <= "010010011001";
wait for 1ns;
assert sB_s = "010010011010" 
	report "ADD error at 010010011010" severity error;

wait for waitTime;
sA_s <= "010010011010";
wait for 1ns;
assert sB_s = "010010011011" 
	report "ADD error at 010010011011" severity error;

wait for waitTime;
sA_s <= "010010011011";
wait for 1ns;
assert sB_s = "010010011100" 
	report "ADD error at 010010011100" severity error;

wait for waitTime;
sA_s <= "010010011100";
wait for 1ns;
assert sB_s = "010010011101" 
	report "ADD error at 010010011101" severity error;

wait for waitTime;
sA_s <= "010010011101";
wait for 1ns;
assert sB_s = "010010011110" 
	report "ADD error at 010010011110" severity error;

wait for waitTime;
sA_s <= "010010011110";
wait for 1ns;
assert sB_s = "010010011111" 
	report "ADD error at 010010011111" severity error;

wait for waitTime;
sA_s <= "010010011111";
wait for 1ns;
assert sB_s = "010010100000" 
	report "ADD error at 010010100000" severity error;

wait for waitTime;
sA_s <= "010010100000";
wait for 1ns;
assert sB_s = "010010100001" 
	report "ADD error at 010010100001" severity error;

wait for waitTime;
sA_s <= "010010100001";
wait for 1ns;
assert sB_s = "010010100010" 
	report "ADD error at 010010100010" severity error;

wait for waitTime;
sA_s <= "010010100010";
wait for 1ns;
assert sB_s = "010010100011" 
	report "ADD error at 010010100011" severity error;

wait for waitTime;
sA_s <= "010010100011";
wait for 1ns;
assert sB_s = "010010100100" 
	report "ADD error at 010010100100" severity error;

wait for waitTime;
sA_s <= "010010100100";
wait for 1ns;
assert sB_s = "010010100101" 
	report "ADD error at 010010100101" severity error;

wait for waitTime;
sA_s <= "010010100101";
wait for 1ns;
assert sB_s = "010010100110" 
	report "ADD error at 010010100110" severity error;

wait for waitTime;
sA_s <= "010010100110";
wait for 1ns;
assert sB_s = "010010100111" 
	report "ADD error at 010010100111" severity error;

wait for waitTime;
sA_s <= "010010100111";
wait for 1ns;
assert sB_s = "010010101000" 
	report "ADD error at 010010101000" severity error;

wait for waitTime;
sA_s <= "010010101000";
wait for 1ns;
assert sB_s = "010010101001" 
	report "ADD error at 010010101001" severity error;

wait for waitTime;
sA_s <= "010010101001";
wait for 1ns;
assert sB_s = "010010101010" 
	report "ADD error at 010010101010" severity error;

wait for waitTime;
sA_s <= "010010101010";
wait for 1ns;
assert sB_s = "010010101011" 
	report "ADD error at 010010101011" severity error;

wait for waitTime;
sA_s <= "010010101011";
wait for 1ns;
assert sB_s = "010010101100" 
	report "ADD error at 010010101100" severity error;

wait for waitTime;
sA_s <= "010010101100";
wait for 1ns;
assert sB_s = "010010101101" 
	report "ADD error at 010010101101" severity error;

wait for waitTime;
sA_s <= "010010101101";
wait for 1ns;
assert sB_s = "010010101110" 
	report "ADD error at 010010101110" severity error;

wait for waitTime;
sA_s <= "010010101110";
wait for 1ns;
assert sB_s = "010010101111" 
	report "ADD error at 010010101111" severity error;

wait for waitTime;
sA_s <= "010010101111";
wait for 1ns;
assert sB_s = "010010110000" 
	report "ADD error at 010010110000" severity error;

wait for waitTime;
sA_s <= "010010110000";
wait for 1ns;
assert sB_s = "010010110001" 
	report "ADD error at 010010110001" severity error;

wait for waitTime;
sA_s <= "010010110001";
wait for 1ns;
assert sB_s = "010010110010" 
	report "ADD error at 010010110010" severity error;

wait for waitTime;
sA_s <= "010010110010";
wait for 1ns;
assert sB_s = "010010110011" 
	report "ADD error at 010010110011" severity error;

wait for waitTime;
sA_s <= "010010110011";
wait for 1ns;
assert sB_s = "010010110100" 
	report "ADD error at 010010110100" severity error;

wait for waitTime;
sA_s <= "010010110100";
wait for 1ns;
assert sB_s = "010010110101" 
	report "ADD error at 010010110101" severity error;

wait for waitTime;
sA_s <= "010010110101";
wait for 1ns;
assert sB_s = "010010110110" 
	report "ADD error at 010010110110" severity error;

wait for waitTime;
sA_s <= "010010110110";
wait for 1ns;
assert sB_s = "010010110111" 
	report "ADD error at 010010110111" severity error;

wait for waitTime;
sA_s <= "010010110111";
wait for 1ns;
assert sB_s = "010010111000" 
	report "ADD error at 010010111000" severity error;

wait for waitTime;
sA_s <= "010010111000";
wait for 1ns;
assert sB_s = "010010111001" 
	report "ADD error at 010010111001" severity error;

wait for waitTime;
sA_s <= "010010111001";
wait for 1ns;
assert sB_s = "010010111010" 
	report "ADD error at 010010111010" severity error;

wait for waitTime;
sA_s <= "010010111010";
wait for 1ns;
assert sB_s = "010010111011" 
	report "ADD error at 010010111011" severity error;

wait for waitTime;
sA_s <= "010010111011";
wait for 1ns;
assert sB_s = "010010111100" 
	report "ADD error at 010010111100" severity error;

wait for waitTime;
sA_s <= "010010111100";
wait for 1ns;
assert sB_s = "010010111101" 
	report "ADD error at 010010111101" severity error;

wait for waitTime;
sA_s <= "010010111101";
wait for 1ns;
assert sB_s = "010010111110" 
	report "ADD error at 010010111110" severity error;

wait for waitTime;
sA_s <= "010010111110";
wait for 1ns;
assert sB_s = "010010111111" 
	report "ADD error at 010010111111" severity error;

wait for waitTime;
sA_s <= "010010111111";
wait for 1ns;
assert sB_s = "010011000000" 
	report "ADD error at 010011000000" severity error;

wait for waitTime;
sA_s <= "010011000000";
wait for 1ns;
assert sB_s = "010011000001" 
	report "ADD error at 010011000001" severity error;

wait for waitTime;
sA_s <= "010011000001";
wait for 1ns;
assert sB_s = "010011000010" 
	report "ADD error at 010011000010" severity error;

wait for waitTime;
sA_s <= "010011000010";
wait for 1ns;
assert sB_s = "010011000011" 
	report "ADD error at 010011000011" severity error;

wait for waitTime;
sA_s <= "010011000011";
wait for 1ns;
assert sB_s = "010011000100" 
	report "ADD error at 010011000100" severity error;

wait for waitTime;
sA_s <= "010011000100";
wait for 1ns;
assert sB_s = "010011000101" 
	report "ADD error at 010011000101" severity error;

wait for waitTime;
sA_s <= "010011000101";
wait for 1ns;
assert sB_s = "010011000110" 
	report "ADD error at 010011000110" severity error;

wait for waitTime;
sA_s <= "010011000110";
wait for 1ns;
assert sB_s = "010011000111" 
	report "ADD error at 010011000111" severity error;

wait for waitTime;
sA_s <= "010011000111";
wait for 1ns;
assert sB_s = "010011001000" 
	report "ADD error at 010011001000" severity error;

wait for waitTime;
sA_s <= "010011001000";
wait for 1ns;
assert sB_s = "010011001001" 
	report "ADD error at 010011001001" severity error;

wait for waitTime;
sA_s <= "010011001001";
wait for 1ns;
assert sB_s = "010011001010" 
	report "ADD error at 010011001010" severity error;

wait for waitTime;
sA_s <= "010011001010";
wait for 1ns;
assert sB_s = "010011001011" 
	report "ADD error at 010011001011" severity error;

wait for waitTime;
sA_s <= "010011001011";
wait for 1ns;
assert sB_s = "010011001100" 
	report "ADD error at 010011001100" severity error;

wait for waitTime;
sA_s <= "010011001100";
wait for 1ns;
assert sB_s = "010011001101" 
	report "ADD error at 010011001101" severity error;

wait for waitTime;
sA_s <= "010011001101";
wait for 1ns;
assert sB_s = "010011001110" 
	report "ADD error at 010011001110" severity error;

wait for waitTime;
sA_s <= "010011001110";
wait for 1ns;
assert sB_s = "010011001111" 
	report "ADD error at 010011001111" severity error;

wait for waitTime;
sA_s <= "010011001111";
wait for 1ns;
assert sB_s = "010011010000" 
	report "ADD error at 010011010000" severity error;

wait for waitTime;
sA_s <= "010011010000";
wait for 1ns;
assert sB_s = "010011010001" 
	report "ADD error at 010011010001" severity error;

wait for waitTime;
sA_s <= "010011010001";
wait for 1ns;
assert sB_s = "010011010010" 
	report "ADD error at 010011010010" severity error;

wait for waitTime;
sA_s <= "010011010010";
wait for 1ns;
assert sB_s = "010011010011" 
	report "ADD error at 010011010011" severity error;

wait for waitTime;
sA_s <= "010011010011";
wait for 1ns;
assert sB_s = "010011010100" 
	report "ADD error at 010011010100" severity error;

wait for waitTime;
sA_s <= "010011010100";
wait for 1ns;
assert sB_s = "010011010101" 
	report "ADD error at 010011010101" severity error;

wait for waitTime;
sA_s <= "010011010101";
wait for 1ns;
assert sB_s = "010011010110" 
	report "ADD error at 010011010110" severity error;

wait for waitTime;
sA_s <= "010011010110";
wait for 1ns;
assert sB_s = "010011010111" 
	report "ADD error at 010011010111" severity error;

wait for waitTime;
sA_s <= "010011010111";
wait for 1ns;
assert sB_s = "010011011000" 
	report "ADD error at 010011011000" severity error;

wait for waitTime;
sA_s <= "010011011000";
wait for 1ns;
assert sB_s = "010011011001" 
	report "ADD error at 010011011001" severity error;

wait for waitTime;
sA_s <= "010011011001";
wait for 1ns;
assert sB_s = "010011011010" 
	report "ADD error at 010011011010" severity error;

wait for waitTime;
sA_s <= "010011011010";
wait for 1ns;
assert sB_s = "010011011011" 
	report "ADD error at 010011011011" severity error;

wait for waitTime;
sA_s <= "010011011011";
wait for 1ns;
assert sB_s = "010011011100" 
	report "ADD error at 010011011100" severity error;

wait for waitTime;
sA_s <= "010011011100";
wait for 1ns;
assert sB_s = "010011011101" 
	report "ADD error at 010011011101" severity error;

wait for waitTime;
sA_s <= "010011011101";
wait for 1ns;
assert sB_s = "010011011110" 
	report "ADD error at 010011011110" severity error;

wait for waitTime;
sA_s <= "010011011110";
wait for 1ns;
assert sB_s = "010011011111" 
	report "ADD error at 010011011111" severity error;

wait for waitTime;
sA_s <= "010011011111";
wait for 1ns;
assert sB_s = "010011100000" 
	report "ADD error at 010011100000" severity error;

wait for waitTime;
sA_s <= "010011100000";
wait for 1ns;
assert sB_s = "010011100001" 
	report "ADD error at 010011100001" severity error;

wait for waitTime;
sA_s <= "010011100001";
wait for 1ns;
assert sB_s = "010011100010" 
	report "ADD error at 010011100010" severity error;

wait for waitTime;
sA_s <= "010011100010";
wait for 1ns;
assert sB_s = "010011100011" 
	report "ADD error at 010011100011" severity error;

wait for waitTime;
sA_s <= "010011100011";
wait for 1ns;
assert sB_s = "010011100100" 
	report "ADD error at 010011100100" severity error;

wait for waitTime;
sA_s <= "010011100100";
wait for 1ns;
assert sB_s = "010011100101" 
	report "ADD error at 010011100101" severity error;

wait for waitTime;
sA_s <= "010011100101";
wait for 1ns;
assert sB_s = "010011100110" 
	report "ADD error at 010011100110" severity error;

wait for waitTime;
sA_s <= "010011100110";
wait for 1ns;
assert sB_s = "010011100111" 
	report "ADD error at 010011100111" severity error;

wait for waitTime;
sA_s <= "010011100111";
wait for 1ns;
assert sB_s = "010011101000" 
	report "ADD error at 010011101000" severity error;

wait for waitTime;
sA_s <= "010011101000";
wait for 1ns;
assert sB_s = "010011101001" 
	report "ADD error at 010011101001" severity error;

wait for waitTime;
sA_s <= "010011101001";
wait for 1ns;
assert sB_s = "010011101010" 
	report "ADD error at 010011101010" severity error;

wait for waitTime;
sA_s <= "010011101010";
wait for 1ns;
assert sB_s = "010011101011" 
	report "ADD error at 010011101011" severity error;

wait for waitTime;
sA_s <= "010011101011";
wait for 1ns;
assert sB_s = "010011101100" 
	report "ADD error at 010011101100" severity error;

wait for waitTime;
sA_s <= "010011101100";
wait for 1ns;
assert sB_s = "010011101101" 
	report "ADD error at 010011101101" severity error;

wait for waitTime;
sA_s <= "010011101101";
wait for 1ns;
assert sB_s = "010011101110" 
	report "ADD error at 010011101110" severity error;

wait for waitTime;
sA_s <= "010011101110";
wait for 1ns;
assert sB_s = "010011101111" 
	report "ADD error at 010011101111" severity error;

wait for waitTime;
sA_s <= "010011101111";
wait for 1ns;
assert sB_s = "010011110000" 
	report "ADD error at 010011110000" severity error;

wait for waitTime;
sA_s <= "010011110000";
wait for 1ns;
assert sB_s = "010011110001" 
	report "ADD error at 010011110001" severity error;

wait for waitTime;
sA_s <= "010011110001";
wait for 1ns;
assert sB_s = "010011110010" 
	report "ADD error at 010011110010" severity error;

wait for waitTime;
sA_s <= "010011110010";
wait for 1ns;
assert sB_s = "010011110011" 
	report "ADD error at 010011110011" severity error;

wait for waitTime;
sA_s <= "010011110011";
wait for 1ns;
assert sB_s = "010011110100" 
	report "ADD error at 010011110100" severity error;

wait for waitTime;
sA_s <= "010011110100";
wait for 1ns;
assert sB_s = "010011110101" 
	report "ADD error at 010011110101" severity error;

wait for waitTime;
sA_s <= "010011110101";
wait for 1ns;
assert sB_s = "010011110110" 
	report "ADD error at 010011110110" severity error;

wait for waitTime;
sA_s <= "010011110110";
wait for 1ns;
assert sB_s = "010011110111" 
	report "ADD error at 010011110111" severity error;

wait for waitTime;
sA_s <= "010011110111";
wait for 1ns;
assert sB_s = "010011111000" 
	report "ADD error at 010011111000" severity error;

wait for waitTime;
sA_s <= "010011111000";
wait for 1ns;
assert sB_s = "010011111001" 
	report "ADD error at 010011111001" severity error;

wait for waitTime;
sA_s <= "010011111001";
wait for 1ns;
assert sB_s = "010011111010" 
	report "ADD error at 010011111010" severity error;

wait for waitTime;
sA_s <= "010011111010";
wait for 1ns;
assert sB_s = "010011111011" 
	report "ADD error at 010011111011" severity error;

wait for waitTime;
sA_s <= "010011111011";
wait for 1ns;
assert sB_s = "010011111100" 
	report "ADD error at 010011111100" severity error;

wait for waitTime;
sA_s <= "010011111100";
wait for 1ns;
assert sB_s = "010011111101" 
	report "ADD error at 010011111101" severity error;

wait for waitTime;
sA_s <= "010011111101";
wait for 1ns;
assert sB_s = "010011111110" 
	report "ADD error at 010011111110" severity error;

wait for waitTime;
sA_s <= "010011111110";
wait for 1ns;
assert sB_s = "010011111111" 
	report "ADD error at 010011111111" severity error;

wait for waitTime;
sA_s <= "010011111111";
wait for 1ns;
assert sB_s = "010100000000" 
	report "ADD error at 010100000000" severity error;

wait for waitTime;
sA_s <= "010100000000";
wait for 1ns;
assert sB_s = "010100000001" 
	report "ADD error at 010100000001" severity error;

wait for waitTime;
sA_s <= "010100000001";
wait for 1ns;
assert sB_s = "010100000010" 
	report "ADD error at 010100000010" severity error;

wait for waitTime;
sA_s <= "010100000010";
wait for 1ns;
assert sB_s = "010100000011" 
	report "ADD error at 010100000011" severity error;

wait for waitTime;
sA_s <= "010100000011";
wait for 1ns;
assert sB_s = "010100000100" 
	report "ADD error at 010100000100" severity error;

wait for waitTime;
sA_s <= "010100000100";
wait for 1ns;
assert sB_s = "010100000101" 
	report "ADD error at 010100000101" severity error;

wait for waitTime;
sA_s <= "010100000101";
wait for 1ns;
assert sB_s = "010100000110" 
	report "ADD error at 010100000110" severity error;

wait for waitTime;
sA_s <= "010100000110";
wait for 1ns;
assert sB_s = "010100000111" 
	report "ADD error at 010100000111" severity error;

wait for waitTime;
sA_s <= "010100000111";
wait for 1ns;
assert sB_s = "010100001000" 
	report "ADD error at 010100001000" severity error;

wait for waitTime;
sA_s <= "010100001000";
wait for 1ns;
assert sB_s = "010100001001" 
	report "ADD error at 010100001001" severity error;

wait for waitTime;
sA_s <= "010100001001";
wait for 1ns;
assert sB_s = "010100001010" 
	report "ADD error at 010100001010" severity error;

wait for waitTime;
sA_s <= "010100001010";
wait for 1ns;
assert sB_s = "010100001011" 
	report "ADD error at 010100001011" severity error;

wait for waitTime;
sA_s <= "010100001011";
wait for 1ns;
assert sB_s = "010100001100" 
	report "ADD error at 010100001100" severity error;

wait for waitTime;
sA_s <= "010100001100";
wait for 1ns;
assert sB_s = "010100001101" 
	report "ADD error at 010100001101" severity error;

wait for waitTime;
sA_s <= "010100001101";
wait for 1ns;
assert sB_s = "010100001110" 
	report "ADD error at 010100001110" severity error;

wait for waitTime;
sA_s <= "010100001110";
wait for 1ns;
assert sB_s = "010100001111" 
	report "ADD error at 010100001111" severity error;

wait for waitTime;
sA_s <= "010100001111";
wait for 1ns;
assert sB_s = "010100010000" 
	report "ADD error at 010100010000" severity error;

wait for waitTime;
sA_s <= "010100010000";
wait for 1ns;
assert sB_s = "010100010001" 
	report "ADD error at 010100010001" severity error;

wait for waitTime;
sA_s <= "010100010001";
wait for 1ns;
assert sB_s = "010100010010" 
	report "ADD error at 010100010010" severity error;

wait for waitTime;
sA_s <= "010100010010";
wait for 1ns;
assert sB_s = "010100010011" 
	report "ADD error at 010100010011" severity error;

wait for waitTime;
sA_s <= "010100010011";
wait for 1ns;
assert sB_s = "010100010100" 
	report "ADD error at 010100010100" severity error;

wait for waitTime;
sA_s <= "010100010100";
wait for 1ns;
assert sB_s = "010100010101" 
	report "ADD error at 010100010101" severity error;

wait for waitTime;
sA_s <= "010100010101";
wait for 1ns;
assert sB_s = "010100010110" 
	report "ADD error at 010100010110" severity error;

wait for waitTime;
sA_s <= "010100010110";
wait for 1ns;
assert sB_s = "010100010111" 
	report "ADD error at 010100010111" severity error;

wait for waitTime;
sA_s <= "010100010111";
wait for 1ns;
assert sB_s = "010100011000" 
	report "ADD error at 010100011000" severity error;

wait for waitTime;
sA_s <= "010100011000";
wait for 1ns;
assert sB_s = "010100011001" 
	report "ADD error at 010100011001" severity error;

wait for waitTime;
sA_s <= "010100011001";
wait for 1ns;
assert sB_s = "010100011010" 
	report "ADD error at 010100011010" severity error;

wait for waitTime;
sA_s <= "010100011010";
wait for 1ns;
assert sB_s = "010100011011" 
	report "ADD error at 010100011011" severity error;

wait for waitTime;
sA_s <= "010100011011";
wait for 1ns;
assert sB_s = "010100011100" 
	report "ADD error at 010100011100" severity error;

wait for waitTime;
sA_s <= "010100011100";
wait for 1ns;
assert sB_s = "010100011101" 
	report "ADD error at 010100011101" severity error;

wait for waitTime;
sA_s <= "010100011101";
wait for 1ns;
assert sB_s = "010100011110" 
	report "ADD error at 010100011110" severity error;

wait for waitTime;
sA_s <= "010100011110";
wait for 1ns;
assert sB_s = "010100011111" 
	report "ADD error at 010100011111" severity error;

wait for waitTime;
sA_s <= "010100011111";
wait for 1ns;
assert sB_s = "010100100000" 
	report "ADD error at 010100100000" severity error;

wait for waitTime;
sA_s <= "010100100000";
wait for 1ns;
assert sB_s = "010100100001" 
	report "ADD error at 010100100001" severity error;

wait for waitTime;
sA_s <= "010100100001";
wait for 1ns;
assert sB_s = "010100100010" 
	report "ADD error at 010100100010" severity error;

wait for waitTime;
sA_s <= "010100100010";
wait for 1ns;
assert sB_s = "010100100011" 
	report "ADD error at 010100100011" severity error;

wait for waitTime;
sA_s <= "010100100011";
wait for 1ns;
assert sB_s = "010100100100" 
	report "ADD error at 010100100100" severity error;

wait for waitTime;
sA_s <= "010100100100";
wait for 1ns;
assert sB_s = "010100100101" 
	report "ADD error at 010100100101" severity error;

wait for waitTime;
sA_s <= "010100100101";
wait for 1ns;
assert sB_s = "010100100110" 
	report "ADD error at 010100100110" severity error;

wait for waitTime;
sA_s <= "010100100110";
wait for 1ns;
assert sB_s = "010100100111" 
	report "ADD error at 010100100111" severity error;

wait for waitTime;
sA_s <= "010100100111";
wait for 1ns;
assert sB_s = "010100101000" 
	report "ADD error at 010100101000" severity error;

wait for waitTime;
sA_s <= "010100101000";
wait for 1ns;
assert sB_s = "010100101001" 
	report "ADD error at 010100101001" severity error;

wait for waitTime;
sA_s <= "010100101001";
wait for 1ns;
assert sB_s = "010100101010" 
	report "ADD error at 010100101010" severity error;

wait for waitTime;
sA_s <= "010100101010";
wait for 1ns;
assert sB_s = "010100101011" 
	report "ADD error at 010100101011" severity error;

wait for waitTime;
sA_s <= "010100101011";
wait for 1ns;
assert sB_s = "010100101100" 
	report "ADD error at 010100101100" severity error;

wait for waitTime;
sA_s <= "010100101100";
wait for 1ns;
assert sB_s = "010100101101" 
	report "ADD error at 010100101101" severity error;

wait for waitTime;
sA_s <= "010100101101";
wait for 1ns;
assert sB_s = "010100101110" 
	report "ADD error at 010100101110" severity error;

wait for waitTime;
sA_s <= "010100101110";
wait for 1ns;
assert sB_s = "010100101111" 
	report "ADD error at 010100101111" severity error;

wait for waitTime;
sA_s <= "010100101111";
wait for 1ns;
assert sB_s = "010100110000" 
	report "ADD error at 010100110000" severity error;

wait for waitTime;
sA_s <= "010100110000";
wait for 1ns;
assert sB_s = "010100110001" 
	report "ADD error at 010100110001" severity error;

wait for waitTime;
sA_s <= "010100110001";
wait for 1ns;
assert sB_s = "010100110010" 
	report "ADD error at 010100110010" severity error;

wait for waitTime;
sA_s <= "010100110010";
wait for 1ns;
assert sB_s = "010100110011" 
	report "ADD error at 010100110011" severity error;

wait for waitTime;
sA_s <= "010100110011";
wait for 1ns;
assert sB_s = "010100110100" 
	report "ADD error at 010100110100" severity error;

wait for waitTime;
sA_s <= "010100110100";
wait for 1ns;
assert sB_s = "010100110101" 
	report "ADD error at 010100110101" severity error;

wait for waitTime;
sA_s <= "010100110101";
wait for 1ns;
assert sB_s = "010100110110" 
	report "ADD error at 010100110110" severity error;

wait for waitTime;
sA_s <= "010100110110";
wait for 1ns;
assert sB_s = "010100110111" 
	report "ADD error at 010100110111" severity error;

wait for waitTime;
sA_s <= "010100110111";
wait for 1ns;
assert sB_s = "010100111000" 
	report "ADD error at 010100111000" severity error;

wait for waitTime;
sA_s <= "010100111000";
wait for 1ns;
assert sB_s = "010100111001" 
	report "ADD error at 010100111001" severity error;

wait for waitTime;
sA_s <= "010100111001";
wait for 1ns;
assert sB_s = "010100111010" 
	report "ADD error at 010100111010" severity error;

wait for waitTime;
sA_s <= "010100111010";
wait for 1ns;
assert sB_s = "010100111011" 
	report "ADD error at 010100111011" severity error;

wait for waitTime;
sA_s <= "010100111011";
wait for 1ns;
assert sB_s = "010100111100" 
	report "ADD error at 010100111100" severity error;

wait for waitTime;
sA_s <= "010100111100";
wait for 1ns;
assert sB_s = "010100111101" 
	report "ADD error at 010100111101" severity error;

wait for waitTime;
sA_s <= "010100111101";
wait for 1ns;
assert sB_s = "010100111110" 
	report "ADD error at 010100111110" severity error;

wait for waitTime;
sA_s <= "010100111110";
wait for 1ns;
assert sB_s = "010100111111" 
	report "ADD error at 010100111111" severity error;

wait for waitTime;
sA_s <= "010100111111";
wait for 1ns;
assert sB_s = "010101000000" 
	report "ADD error at 010101000000" severity error;

wait for waitTime;
sA_s <= "010101000000";
wait for 1ns;
assert sB_s = "010101000001" 
	report "ADD error at 010101000001" severity error;

wait for waitTime;
sA_s <= "010101000001";
wait for 1ns;
assert sB_s = "010101000010" 
	report "ADD error at 010101000010" severity error;

wait for waitTime;
sA_s <= "010101000010";
wait for 1ns;
assert sB_s = "010101000011" 
	report "ADD error at 010101000011" severity error;

wait for waitTime;
sA_s <= "010101000011";
wait for 1ns;
assert sB_s = "010101000100" 
	report "ADD error at 010101000100" severity error;

wait for waitTime;
sA_s <= "010101000100";
wait for 1ns;
assert sB_s = "010101000101" 
	report "ADD error at 010101000101" severity error;

wait for waitTime;
sA_s <= "010101000101";
wait for 1ns;
assert sB_s = "010101000110" 
	report "ADD error at 010101000110" severity error;

wait for waitTime;
sA_s <= "010101000110";
wait for 1ns;
assert sB_s = "010101000111" 
	report "ADD error at 010101000111" severity error;

wait for waitTime;
sA_s <= "010101000111";
wait for 1ns;
assert sB_s = "010101001000" 
	report "ADD error at 010101001000" severity error;

wait for waitTime;
sA_s <= "010101001000";
wait for 1ns;
assert sB_s = "010101001001" 
	report "ADD error at 010101001001" severity error;

wait for waitTime;
sA_s <= "010101001001";
wait for 1ns;
assert sB_s = "010101001010" 
	report "ADD error at 010101001010" severity error;

wait for waitTime;
sA_s <= "010101001010";
wait for 1ns;
assert sB_s = "010101001011" 
	report "ADD error at 010101001011" severity error;

wait for waitTime;
sA_s <= "010101001011";
wait for 1ns;
assert sB_s = "010101001100" 
	report "ADD error at 010101001100" severity error;

wait for waitTime;
sA_s <= "010101001100";
wait for 1ns;
assert sB_s = "010101001101" 
	report "ADD error at 010101001101" severity error;

wait for waitTime;
sA_s <= "010101001101";
wait for 1ns;
assert sB_s = "010101001110" 
	report "ADD error at 010101001110" severity error;

wait for waitTime;
sA_s <= "010101001110";
wait for 1ns;
assert sB_s = "010101001111" 
	report "ADD error at 010101001111" severity error;

wait for waitTime;
sA_s <= "010101001111";
wait for 1ns;
assert sB_s = "010101010000" 
	report "ADD error at 010101010000" severity error;

wait for waitTime;
sA_s <= "010101010000";
wait for 1ns;
assert sB_s = "010101010001" 
	report "ADD error at 010101010001" severity error;

wait for waitTime;
sA_s <= "010101010001";
wait for 1ns;
assert sB_s = "010101010010" 
	report "ADD error at 010101010010" severity error;

wait for waitTime;
sA_s <= "010101010010";
wait for 1ns;
assert sB_s = "010101010011" 
	report "ADD error at 010101010011" severity error;

wait for waitTime;
sA_s <= "010101010011";
wait for 1ns;
assert sB_s = "010101010100" 
	report "ADD error at 010101010100" severity error;

wait for waitTime;
sA_s <= "010101010100";
wait for 1ns;
assert sB_s = "010101010101" 
	report "ADD error at 010101010101" severity error;

wait for waitTime;
sA_s <= "010101010101";
wait for 1ns;
assert sB_s = "010101010110" 
	report "ADD error at 010101010110" severity error;

wait for waitTime;
sA_s <= "010101010110";
wait for 1ns;
assert sB_s = "010101010111" 
	report "ADD error at 010101010111" severity error;

wait for waitTime;
sA_s <= "010101010111";
wait for 1ns;
assert sB_s = "010101011000" 
	report "ADD error at 010101011000" severity error;

wait for waitTime;
sA_s <= "010101011000";
wait for 1ns;
assert sB_s = "010101011001" 
	report "ADD error at 010101011001" severity error;

wait for waitTime;
sA_s <= "010101011001";
wait for 1ns;
assert sB_s = "010101011010" 
	report "ADD error at 010101011010" severity error;

wait for waitTime;
sA_s <= "010101011010";
wait for 1ns;
assert sB_s = "010101011011" 
	report "ADD error at 010101011011" severity error;

wait for waitTime;
sA_s <= "010101011011";
wait for 1ns;
assert sB_s = "010101011100" 
	report "ADD error at 010101011100" severity error;

wait for waitTime;
sA_s <= "010101011100";
wait for 1ns;
assert sB_s = "010101011101" 
	report "ADD error at 010101011101" severity error;

wait for waitTime;
sA_s <= "010101011101";
wait for 1ns;
assert sB_s = "010101011110" 
	report "ADD error at 010101011110" severity error;

wait for waitTime;
sA_s <= "010101011110";
wait for 1ns;
assert sB_s = "010101011111" 
	report "ADD error at 010101011111" severity error;

wait for waitTime;
sA_s <= "010101011111";
wait for 1ns;
assert sB_s = "010101100000" 
	report "ADD error at 010101100000" severity error;

wait for waitTime;
sA_s <= "010101100000";
wait for 1ns;
assert sB_s = "010101100001" 
	report "ADD error at 010101100001" severity error;

wait for waitTime;
sA_s <= "010101100001";
wait for 1ns;
assert sB_s = "010101100010" 
	report "ADD error at 010101100010" severity error;

wait for waitTime;
sA_s <= "010101100010";
wait for 1ns;
assert sB_s = "010101100011" 
	report "ADD error at 010101100011" severity error;

wait for waitTime;
sA_s <= "010101100011";
wait for 1ns;
assert sB_s = "010101100100" 
	report "ADD error at 010101100100" severity error;

wait for waitTime;
sA_s <= "010101100100";
wait for 1ns;
assert sB_s = "010101100101" 
	report "ADD error at 010101100101" severity error;

wait for waitTime;
sA_s <= "010101100101";
wait for 1ns;
assert sB_s = "010101100110" 
	report "ADD error at 010101100110" severity error;

wait for waitTime;
sA_s <= "010101100110";
wait for 1ns;
assert sB_s = "010101100111" 
	report "ADD error at 010101100111" severity error;

wait for waitTime;
sA_s <= "010101100111";
wait for 1ns;
assert sB_s = "010101101000" 
	report "ADD error at 010101101000" severity error;

wait for waitTime;
sA_s <= "010101101000";
wait for 1ns;
assert sB_s = "010101101001" 
	report "ADD error at 010101101001" severity error;

wait for waitTime;
sA_s <= "010101101001";
wait for 1ns;
assert sB_s = "010101101010" 
	report "ADD error at 010101101010" severity error;

wait for waitTime;
sA_s <= "010101101010";
wait for 1ns;
assert sB_s = "010101101011" 
	report "ADD error at 010101101011" severity error;

wait for waitTime;
sA_s <= "010101101011";
wait for 1ns;
assert sB_s = "010101101100" 
	report "ADD error at 010101101100" severity error;

wait for waitTime;
sA_s <= "010101101100";
wait for 1ns;
assert sB_s = "010101101101" 
	report "ADD error at 010101101101" severity error;

wait for waitTime;
sA_s <= "010101101101";
wait for 1ns;
assert sB_s = "010101101110" 
	report "ADD error at 010101101110" severity error;

wait for waitTime;
sA_s <= "010101101110";
wait for 1ns;
assert sB_s = "010101101111" 
	report "ADD error at 010101101111" severity error;

wait for waitTime;
sA_s <= "010101101111";
wait for 1ns;
assert sB_s = "010101110000" 
	report "ADD error at 010101110000" severity error;

wait for waitTime;
sA_s <= "010101110000";
wait for 1ns;
assert sB_s = "010101110001" 
	report "ADD error at 010101110001" severity error;

wait for waitTime;
sA_s <= "010101110001";
wait for 1ns;
assert sB_s = "010101110010" 
	report "ADD error at 010101110010" severity error;

wait for waitTime;
sA_s <= "010101110010";
wait for 1ns;
assert sB_s = "010101110011" 
	report "ADD error at 010101110011" severity error;

wait for waitTime;
sA_s <= "010101110011";
wait for 1ns;
assert sB_s = "010101110100" 
	report "ADD error at 010101110100" severity error;

wait for waitTime;
sA_s <= "010101110100";
wait for 1ns;
assert sB_s = "010101110101" 
	report "ADD error at 010101110101" severity error;

wait for waitTime;
sA_s <= "010101110101";
wait for 1ns;
assert sB_s = "010101110110" 
	report "ADD error at 010101110110" severity error;

wait for waitTime;
sA_s <= "010101110110";
wait for 1ns;
assert sB_s = "010101110111" 
	report "ADD error at 010101110111" severity error;

wait for waitTime;
sA_s <= "010101110111";
wait for 1ns;
assert sB_s = "010101111000" 
	report "ADD error at 010101111000" severity error;

wait for waitTime;
sA_s <= "010101111000";
wait for 1ns;
assert sB_s = "010101111001" 
	report "ADD error at 010101111001" severity error;

wait for waitTime;
sA_s <= "010101111001";
wait for 1ns;
assert sB_s = "010101111010" 
	report "ADD error at 010101111010" severity error;

wait for waitTime;
sA_s <= "010101111010";
wait for 1ns;
assert sB_s = "010101111011" 
	report "ADD error at 010101111011" severity error;

wait for waitTime;
sA_s <= "010101111011";
wait for 1ns;
assert sB_s = "010101111100" 
	report "ADD error at 010101111100" severity error;

wait for waitTime;
sA_s <= "010101111100";
wait for 1ns;
assert sB_s = "010101111101" 
	report "ADD error at 010101111101" severity error;

wait for waitTime;
sA_s <= "010101111101";
wait for 1ns;
assert sB_s = "010101111110" 
	report "ADD error at 010101111110" severity error;

wait for waitTime;
sA_s <= "010101111110";
wait for 1ns;
assert sB_s = "010101111111" 
	report "ADD error at 010101111111" severity error;

wait for waitTime;
sA_s <= "010101111111";
wait for 1ns;
assert sB_s = "010110000000" 
	report "ADD error at 010110000000" severity error;

wait for waitTime;
sA_s <= "010110000000";
wait for 1ns;
assert sB_s = "010110000001" 
	report "ADD error at 010110000001" severity error;

wait for waitTime;
sA_s <= "010110000001";
wait for 1ns;
assert sB_s = "010110000010" 
	report "ADD error at 010110000010" severity error;

wait for waitTime;
sA_s <= "010110000010";
wait for 1ns;
assert sB_s = "010110000011" 
	report "ADD error at 010110000011" severity error;

wait for waitTime;
sA_s <= "010110000011";
wait for 1ns;
assert sB_s = "010110000100" 
	report "ADD error at 010110000100" severity error;

wait for waitTime;
sA_s <= "010110000100";
wait for 1ns;
assert sB_s = "010110000101" 
	report "ADD error at 010110000101" severity error;

wait for waitTime;
sA_s <= "010110000101";
wait for 1ns;
assert sB_s = "010110000110" 
	report "ADD error at 010110000110" severity error;

wait for waitTime;
sA_s <= "010110000110";
wait for 1ns;
assert sB_s = "010110000111" 
	report "ADD error at 010110000111" severity error;

wait for waitTime;
sA_s <= "010110000111";
wait for 1ns;
assert sB_s = "010110001000" 
	report "ADD error at 010110001000" severity error;

wait for waitTime;
sA_s <= "010110001000";
wait for 1ns;
assert sB_s = "010110001001" 
	report "ADD error at 010110001001" severity error;

wait for waitTime;
sA_s <= "010110001001";
wait for 1ns;
assert sB_s = "010110001010" 
	report "ADD error at 010110001010" severity error;

wait for waitTime;
sA_s <= "010110001010";
wait for 1ns;
assert sB_s = "010110001011" 
	report "ADD error at 010110001011" severity error;

wait for waitTime;
sA_s <= "010110001011";
wait for 1ns;
assert sB_s = "010110001100" 
	report "ADD error at 010110001100" severity error;

wait for waitTime;
sA_s <= "010110001100";
wait for 1ns;
assert sB_s = "010110001101" 
	report "ADD error at 010110001101" severity error;

wait for waitTime;
sA_s <= "010110001101";
wait for 1ns;
assert sB_s = "010110001110" 
	report "ADD error at 010110001110" severity error;

wait for waitTime;
sA_s <= "010110001110";
wait for 1ns;
assert sB_s = "010110001111" 
	report "ADD error at 010110001111" severity error;

wait for waitTime;
sA_s <= "010110001111";
wait for 1ns;
assert sB_s = "010110010000" 
	report "ADD error at 010110010000" severity error;

wait for waitTime;
sA_s <= "010110010000";
wait for 1ns;
assert sB_s = "010110010001" 
	report "ADD error at 010110010001" severity error;

wait for waitTime;
sA_s <= "010110010001";
wait for 1ns;
assert sB_s = "010110010010" 
	report "ADD error at 010110010010" severity error;

wait for waitTime;
sA_s <= "010110010010";
wait for 1ns;
assert sB_s = "010110010011" 
	report "ADD error at 010110010011" severity error;

wait for waitTime;
sA_s <= "010110010011";
wait for 1ns;
assert sB_s = "010110010100" 
	report "ADD error at 010110010100" severity error;

wait for waitTime;
sA_s <= "010110010100";
wait for 1ns;
assert sB_s = "010110010101" 
	report "ADD error at 010110010101" severity error;

wait for waitTime;
sA_s <= "010110010101";
wait for 1ns;
assert sB_s = "010110010110" 
	report "ADD error at 010110010110" severity error;

wait for waitTime;
sA_s <= "010110010110";
wait for 1ns;
assert sB_s = "010110010111" 
	report "ADD error at 010110010111" severity error;

wait for waitTime;
sA_s <= "010110010111";
wait for 1ns;
assert sB_s = "010110011000" 
	report "ADD error at 010110011000" severity error;

wait for waitTime;
sA_s <= "010110011000";
wait for 1ns;
assert sB_s = "010110011001" 
	report "ADD error at 010110011001" severity error;

wait for waitTime;
sA_s <= "010110011001";
wait for 1ns;
assert sB_s = "010110011010" 
	report "ADD error at 010110011010" severity error;

wait for waitTime;
sA_s <= "010110011010";
wait for 1ns;
assert sB_s = "010110011011" 
	report "ADD error at 010110011011" severity error;

wait for waitTime;
sA_s <= "010110011011";
wait for 1ns;
assert sB_s = "010110011100" 
	report "ADD error at 010110011100" severity error;

wait for waitTime;
sA_s <= "010110011100";
wait for 1ns;
assert sB_s = "010110011101" 
	report "ADD error at 010110011101" severity error;

wait for waitTime;
sA_s <= "010110011101";
wait for 1ns;
assert sB_s = "010110011110" 
	report "ADD error at 010110011110" severity error;

wait for waitTime;
sA_s <= "010110011110";
wait for 1ns;
assert sB_s = "010110011111" 
	report "ADD error at 010110011111" severity error;

wait for waitTime;
sA_s <= "010110011111";
wait for 1ns;
assert sB_s = "010110100000" 
	report "ADD error at 010110100000" severity error;

wait for waitTime;
sA_s <= "010110100000";
wait for 1ns;
assert sB_s = "010110100001" 
	report "ADD error at 010110100001" severity error;

wait for waitTime;
sA_s <= "010110100001";
wait for 1ns;
assert sB_s = "010110100010" 
	report "ADD error at 010110100010" severity error;

wait for waitTime;
sA_s <= "010110100010";
wait for 1ns;
assert sB_s = "010110100011" 
	report "ADD error at 010110100011" severity error;

wait for waitTime;
sA_s <= "010110100011";
wait for 1ns;
assert sB_s = "010110100100" 
	report "ADD error at 010110100100" severity error;

wait for waitTime;
sA_s <= "010110100100";
wait for 1ns;
assert sB_s = "010110100101" 
	report "ADD error at 010110100101" severity error;

wait for waitTime;
sA_s <= "010110100101";
wait for 1ns;
assert sB_s = "010110100110" 
	report "ADD error at 010110100110" severity error;

wait for waitTime;
sA_s <= "010110100110";
wait for 1ns;
assert sB_s = "010110100111" 
	report "ADD error at 010110100111" severity error;

wait for waitTime;
sA_s <= "010110100111";
wait for 1ns;
assert sB_s = "010110101000" 
	report "ADD error at 010110101000" severity error;

wait for waitTime;
sA_s <= "010110101000";
wait for 1ns;
assert sB_s = "010110101001" 
	report "ADD error at 010110101001" severity error;

wait for waitTime;
sA_s <= "010110101001";
wait for 1ns;
assert sB_s = "010110101010" 
	report "ADD error at 010110101010" severity error;

wait for waitTime;
sA_s <= "010110101010";
wait for 1ns;
assert sB_s = "010110101011" 
	report "ADD error at 010110101011" severity error;

wait for waitTime;
sA_s <= "010110101011";
wait for 1ns;
assert sB_s = "010110101100" 
	report "ADD error at 010110101100" severity error;

wait for waitTime;
sA_s <= "010110101100";
wait for 1ns;
assert sB_s = "010110101101" 
	report "ADD error at 010110101101" severity error;

wait for waitTime;
sA_s <= "010110101101";
wait for 1ns;
assert sB_s = "010110101110" 
	report "ADD error at 010110101110" severity error;

wait for waitTime;
sA_s <= "010110101110";
wait for 1ns;
assert sB_s = "010110101111" 
	report "ADD error at 010110101111" severity error;

wait for waitTime;
sA_s <= "010110101111";
wait for 1ns;
assert sB_s = "010110110000" 
	report "ADD error at 010110110000" severity error;

wait for waitTime;
sA_s <= "010110110000";
wait for 1ns;
assert sB_s = "010110110001" 
	report "ADD error at 010110110001" severity error;

wait for waitTime;
sA_s <= "010110110001";
wait for 1ns;
assert sB_s = "010110110010" 
	report "ADD error at 010110110010" severity error;

wait for waitTime;
sA_s <= "010110110010";
wait for 1ns;
assert sB_s = "010110110011" 
	report "ADD error at 010110110011" severity error;

wait for waitTime;
sA_s <= "010110110011";
wait for 1ns;
assert sB_s = "010110110100" 
	report "ADD error at 010110110100" severity error;

wait for waitTime;
sA_s <= "010110110100";
wait for 1ns;
assert sB_s = "010110110101" 
	report "ADD error at 010110110101" severity error;

wait for waitTime;
sA_s <= "010110110101";
wait for 1ns;
assert sB_s = "010110110110" 
	report "ADD error at 010110110110" severity error;

wait for waitTime;
sA_s <= "010110110110";
wait for 1ns;
assert sB_s = "010110110111" 
	report "ADD error at 010110110111" severity error;

wait for waitTime;
sA_s <= "010110110111";
wait for 1ns;
assert sB_s = "010110111000" 
	report "ADD error at 010110111000" severity error;

wait for waitTime;
sA_s <= "010110111000";
wait for 1ns;
assert sB_s = "010110111001" 
	report "ADD error at 010110111001" severity error;

wait for waitTime;
sA_s <= "010110111001";
wait for 1ns;
assert sB_s = "010110111010" 
	report "ADD error at 010110111010" severity error;

wait for waitTime;
sA_s <= "010110111010";
wait for 1ns;
assert sB_s = "010110111011" 
	report "ADD error at 010110111011" severity error;

wait for waitTime;
sA_s <= "010110111011";
wait for 1ns;
assert sB_s = "010110111100" 
	report "ADD error at 010110111100" severity error;

wait for waitTime;
sA_s <= "010110111100";
wait for 1ns;
assert sB_s = "010110111101" 
	report "ADD error at 010110111101" severity error;

wait for waitTime;
sA_s <= "010110111101";
wait for 1ns;
assert sB_s = "010110111110" 
	report "ADD error at 010110111110" severity error;

wait for waitTime;
sA_s <= "010110111110";
wait for 1ns;
assert sB_s = "010110111111" 
	report "ADD error at 010110111111" severity error;

wait for waitTime;
sA_s <= "010110111111";
wait for 1ns;
assert sB_s = "010111000000" 
	report "ADD error at 010111000000" severity error;

wait for waitTime;
sA_s <= "010111000000";
wait for 1ns;
assert sB_s = "010111000001" 
	report "ADD error at 010111000001" severity error;

wait for waitTime;
sA_s <= "010111000001";
wait for 1ns;
assert sB_s = "010111000010" 
	report "ADD error at 010111000010" severity error;

wait for waitTime;
sA_s <= "010111000010";
wait for 1ns;
assert sB_s = "010111000011" 
	report "ADD error at 010111000011" severity error;

wait for waitTime;
sA_s <= "010111000011";
wait for 1ns;
assert sB_s = "010111000100" 
	report "ADD error at 010111000100" severity error;

wait for waitTime;
sA_s <= "010111000100";
wait for 1ns;
assert sB_s = "010111000101" 
	report "ADD error at 010111000101" severity error;

wait for waitTime;
sA_s <= "010111000101";
wait for 1ns;
assert sB_s = "010111000110" 
	report "ADD error at 010111000110" severity error;

wait for waitTime;
sA_s <= "010111000110";
wait for 1ns;
assert sB_s = "010111000111" 
	report "ADD error at 010111000111" severity error;

wait for waitTime;
sA_s <= "010111000111";
wait for 1ns;
assert sB_s = "010111001000" 
	report "ADD error at 010111001000" severity error;

wait for waitTime;
sA_s <= "010111001000";
wait for 1ns;
assert sB_s = "010111001001" 
	report "ADD error at 010111001001" severity error;

wait for waitTime;
sA_s <= "010111001001";
wait for 1ns;
assert sB_s = "010111001010" 
	report "ADD error at 010111001010" severity error;

wait for waitTime;
sA_s <= "010111001010";
wait for 1ns;
assert sB_s = "010111001011" 
	report "ADD error at 010111001011" severity error;

wait for waitTime;
sA_s <= "010111001011";
wait for 1ns;
assert sB_s = "010111001100" 
	report "ADD error at 010111001100" severity error;

wait for waitTime;
sA_s <= "010111001100";
wait for 1ns;
assert sB_s = "010111001101" 
	report "ADD error at 010111001101" severity error;

wait for waitTime;
sA_s <= "010111001101";
wait for 1ns;
assert sB_s = "010111001110" 
	report "ADD error at 010111001110" severity error;

wait for waitTime;
sA_s <= "010111001110";
wait for 1ns;
assert sB_s = "010111001111" 
	report "ADD error at 010111001111" severity error;

wait for waitTime;
sA_s <= "010111001111";
wait for 1ns;
assert sB_s = "010111010000" 
	report "ADD error at 010111010000" severity error;

wait for waitTime;
sA_s <= "010111010000";
wait for 1ns;
assert sB_s = "010111010001" 
	report "ADD error at 010111010001" severity error;

wait for waitTime;
sA_s <= "010111010001";
wait for 1ns;
assert sB_s = "010111010010" 
	report "ADD error at 010111010010" severity error;

wait for waitTime;
sA_s <= "010111010010";
wait for 1ns;
assert sB_s = "010111010011" 
	report "ADD error at 010111010011" severity error;

wait for waitTime;
sA_s <= "010111010011";
wait for 1ns;
assert sB_s = "010111010100" 
	report "ADD error at 010111010100" severity error;

wait for waitTime;
sA_s <= "010111010100";
wait for 1ns;
assert sB_s = "010111010101" 
	report "ADD error at 010111010101" severity error;

wait for waitTime;
sA_s <= "010111010101";
wait for 1ns;
assert sB_s = "010111010110" 
	report "ADD error at 010111010110" severity error;

wait for waitTime;
sA_s <= "010111010110";
wait for 1ns;
assert sB_s = "010111010111" 
	report "ADD error at 010111010111" severity error;

wait for waitTime;
sA_s <= "010111010111";
wait for 1ns;
assert sB_s = "010111011000" 
	report "ADD error at 010111011000" severity error;

wait for waitTime;
sA_s <= "010111011000";
wait for 1ns;
assert sB_s = "010111011001" 
	report "ADD error at 010111011001" severity error;

wait for waitTime;
sA_s <= "010111011001";
wait for 1ns;
assert sB_s = "010111011010" 
	report "ADD error at 010111011010" severity error;

wait for waitTime;
sA_s <= "010111011010";
wait for 1ns;
assert sB_s = "010111011011" 
	report "ADD error at 010111011011" severity error;

wait for waitTime;
sA_s <= "010111011011";
wait for 1ns;
assert sB_s = "010111011100" 
	report "ADD error at 010111011100" severity error;

wait for waitTime;
sA_s <= "010111011100";
wait for 1ns;
assert sB_s = "010111011101" 
	report "ADD error at 010111011101" severity error;

wait for waitTime;
sA_s <= "010111011101";
wait for 1ns;
assert sB_s = "010111011110" 
	report "ADD error at 010111011110" severity error;

wait for waitTime;
sA_s <= "010111011110";
wait for 1ns;
assert sB_s = "010111011111" 
	report "ADD error at 010111011111" severity error;

wait for waitTime;
sA_s <= "010111011111";
wait for 1ns;
assert sB_s = "010111100000" 
	report "ADD error at 010111100000" severity error;

wait for waitTime;
sA_s <= "010111100000";
wait for 1ns;
assert sB_s = "010111100001" 
	report "ADD error at 010111100001" severity error;

wait for waitTime;
sA_s <= "010111100001";
wait for 1ns;
assert sB_s = "010111100010" 
	report "ADD error at 010111100010" severity error;

wait for waitTime;
sA_s <= "010111100010";
wait for 1ns;
assert sB_s = "010111100011" 
	report "ADD error at 010111100011" severity error;

wait for waitTime;
sA_s <= "010111100011";
wait for 1ns;
assert sB_s = "010111100100" 
	report "ADD error at 010111100100" severity error;

wait for waitTime;
sA_s <= "010111100100";
wait for 1ns;
assert sB_s = "010111100101" 
	report "ADD error at 010111100101" severity error;

wait for waitTime;
sA_s <= "010111100101";
wait for 1ns;
assert sB_s = "010111100110" 
	report "ADD error at 010111100110" severity error;

wait for waitTime;
sA_s <= "010111100110";
wait for 1ns;
assert sB_s = "010111100111" 
	report "ADD error at 010111100111" severity error;

wait for waitTime;
sA_s <= "010111100111";
wait for 1ns;
assert sB_s = "010111101000" 
	report "ADD error at 010111101000" severity error;

wait for waitTime;
sA_s <= "010111101000";
wait for 1ns;
assert sB_s = "010111101001" 
	report "ADD error at 010111101001" severity error;

wait for waitTime;
sA_s <= "010111101001";
wait for 1ns;
assert sB_s = "010111101010" 
	report "ADD error at 010111101010" severity error;

wait for waitTime;
sA_s <= "010111101010";
wait for 1ns;
assert sB_s = "010111101011" 
	report "ADD error at 010111101011" severity error;

wait for waitTime;
sA_s <= "010111101011";
wait for 1ns;
assert sB_s = "010111101100" 
	report "ADD error at 010111101100" severity error;

wait for waitTime;
sA_s <= "010111101100";
wait for 1ns;
assert sB_s = "010111101101" 
	report "ADD error at 010111101101" severity error;

wait for waitTime;
sA_s <= "010111101101";
wait for 1ns;
assert sB_s = "010111101110" 
	report "ADD error at 010111101110" severity error;

wait for waitTime;
sA_s <= "010111101110";
wait for 1ns;
assert sB_s = "010111101111" 
	report "ADD error at 010111101111" severity error;

wait for waitTime;
sA_s <= "010111101111";
wait for 1ns;
assert sB_s = "010111110000" 
	report "ADD error at 010111110000" severity error;

wait for waitTime;
sA_s <= "010111110000";
wait for 1ns;
assert sB_s = "010111110001" 
	report "ADD error at 010111110001" severity error;

wait for waitTime;
sA_s <= "010111110001";
wait for 1ns;
assert sB_s = "010111110010" 
	report "ADD error at 010111110010" severity error;

wait for waitTime;
sA_s <= "010111110010";
wait for 1ns;
assert sB_s = "010111110011" 
	report "ADD error at 010111110011" severity error;

wait for waitTime;
sA_s <= "010111110011";
wait for 1ns;
assert sB_s = "010111110100" 
	report "ADD error at 010111110100" severity error;

wait for waitTime;
sA_s <= "010111110100";
wait for 1ns;
assert sB_s = "010111110101" 
	report "ADD error at 010111110101" severity error;

wait for waitTime;
sA_s <= "010111110101";
wait for 1ns;
assert sB_s = "010111110110" 
	report "ADD error at 010111110110" severity error;

wait for waitTime;
sA_s <= "010111110110";
wait for 1ns;
assert sB_s = "010111110111" 
	report "ADD error at 010111110111" severity error;

wait for waitTime;
sA_s <= "010111110111";
wait for 1ns;
assert sB_s = "010111111000" 
	report "ADD error at 010111111000" severity error;

wait for waitTime;
sA_s <= "010111111000";
wait for 1ns;
assert sB_s = "010111111001" 
	report "ADD error at 010111111001" severity error;

wait for waitTime;
sA_s <= "010111111001";
wait for 1ns;
assert sB_s = "010111111010" 
	report "ADD error at 010111111010" severity error;

wait for waitTime;
sA_s <= "010111111010";
wait for 1ns;
assert sB_s = "010111111011" 
	report "ADD error at 010111111011" severity error;

wait for waitTime;
sA_s <= "010111111011";
wait for 1ns;
assert sB_s = "010111111100" 
	report "ADD error at 010111111100" severity error;

wait for waitTime;
sA_s <= "010111111100";
wait for 1ns;
assert sB_s = "010111111101" 
	report "ADD error at 010111111101" severity error;

wait for waitTime;
sA_s <= "010111111101";
wait for 1ns;
assert sB_s = "010111111110" 
	report "ADD error at 010111111110" severity error;

wait for waitTime;
sA_s <= "010111111110";
wait for 1ns;
assert sB_s = "010111111111" 
	report "ADD error at 010111111111" severity error;

wait for waitTime;
sA_s <= "010111111111";
wait for 1ns;
assert sB_s = "011000000000" 
	report "ADD error at 011000000000" severity error;

wait for waitTime;
sA_s <= "011000000000";
wait for 1ns;
assert sB_s = "011000000001" 
	report "ADD error at 011000000001" severity error;

wait for waitTime;
sA_s <= "011000000001";
wait for 1ns;
assert sB_s = "011000000010" 
	report "ADD error at 011000000010" severity error;

wait for waitTime;
sA_s <= "011000000010";
wait for 1ns;
assert sB_s = "011000000011" 
	report "ADD error at 011000000011" severity error;

wait for waitTime;
sA_s <= "011000000011";
wait for 1ns;
assert sB_s = "011000000100" 
	report "ADD error at 011000000100" severity error;

wait for waitTime;
sA_s <= "011000000100";
wait for 1ns;
assert sB_s = "011000000101" 
	report "ADD error at 011000000101" severity error;

wait for waitTime;
sA_s <= "011000000101";
wait for 1ns;
assert sB_s = "011000000110" 
	report "ADD error at 011000000110" severity error;

wait for waitTime;
sA_s <= "011000000110";
wait for 1ns;
assert sB_s = "011000000111" 
	report "ADD error at 011000000111" severity error;

wait for waitTime;
sA_s <= "011000000111";
wait for 1ns;
assert sB_s = "011000001000" 
	report "ADD error at 011000001000" severity error;

wait for waitTime;
sA_s <= "011000001000";
wait for 1ns;
assert sB_s = "011000001001" 
	report "ADD error at 011000001001" severity error;

wait for waitTime;
sA_s <= "011000001001";
wait for 1ns;
assert sB_s = "011000001010" 
	report "ADD error at 011000001010" severity error;

wait for waitTime;
sA_s <= "011000001010";
wait for 1ns;
assert sB_s = "011000001011" 
	report "ADD error at 011000001011" severity error;

wait for waitTime;
sA_s <= "011000001011";
wait for 1ns;
assert sB_s = "011000001100" 
	report "ADD error at 011000001100" severity error;

wait for waitTime;
sA_s <= "011000001100";
wait for 1ns;
assert sB_s = "011000001101" 
	report "ADD error at 011000001101" severity error;

wait for waitTime;
sA_s <= "011000001101";
wait for 1ns;
assert sB_s = "011000001110" 
	report "ADD error at 011000001110" severity error;

wait for waitTime;
sA_s <= "011000001110";
wait for 1ns;
assert sB_s = "011000001111" 
	report "ADD error at 011000001111" severity error;

wait for waitTime;
sA_s <= "011000001111";
wait for 1ns;
assert sB_s = "011000010000" 
	report "ADD error at 011000010000" severity error;

wait for waitTime;
sA_s <= "011000010000";
wait for 1ns;
assert sB_s = "011000010001" 
	report "ADD error at 011000010001" severity error;

wait for waitTime;
sA_s <= "011000010001";
wait for 1ns;
assert sB_s = "011000010010" 
	report "ADD error at 011000010010" severity error;

wait for waitTime;
sA_s <= "011000010010";
wait for 1ns;
assert sB_s = "011000010011" 
	report "ADD error at 011000010011" severity error;

wait for waitTime;
sA_s <= "011000010011";
wait for 1ns;
assert sB_s = "011000010100" 
	report "ADD error at 011000010100" severity error;

wait for waitTime;
sA_s <= "011000010100";
wait for 1ns;
assert sB_s = "011000010101" 
	report "ADD error at 011000010101" severity error;

wait for waitTime;
sA_s <= "011000010101";
wait for 1ns;
assert sB_s = "011000010110" 
	report "ADD error at 011000010110" severity error;

wait for waitTime;
sA_s <= "011000010110";
wait for 1ns;
assert sB_s = "011000010111" 
	report "ADD error at 011000010111" severity error;

wait for waitTime;
sA_s <= "011000010111";
wait for 1ns;
assert sB_s = "011000011000" 
	report "ADD error at 011000011000" severity error;

wait for waitTime;
sA_s <= "011000011000";
wait for 1ns;
assert sB_s = "011000011001" 
	report "ADD error at 011000011001" severity error;

wait for waitTime;
sA_s <= "011000011001";
wait for 1ns;
assert sB_s = "011000011010" 
	report "ADD error at 011000011010" severity error;

wait for waitTime;
sA_s <= "011000011010";
wait for 1ns;
assert sB_s = "011000011011" 
	report "ADD error at 011000011011" severity error;

wait for waitTime;
sA_s <= "011000011011";
wait for 1ns;
assert sB_s = "011000011100" 
	report "ADD error at 011000011100" severity error;

wait for waitTime;
sA_s <= "011000011100";
wait for 1ns;
assert sB_s = "011000011101" 
	report "ADD error at 011000011101" severity error;

wait for waitTime;
sA_s <= "011000011101";
wait for 1ns;
assert sB_s = "011000011110" 
	report "ADD error at 011000011110" severity error;

wait for waitTime;
sA_s <= "011000011110";
wait for 1ns;
assert sB_s = "011000011111" 
	report "ADD error at 011000011111" severity error;

wait for waitTime;
sA_s <= "011000011111";
wait for 1ns;
assert sB_s = "011000100000" 
	report "ADD error at 011000100000" severity error;

wait for waitTime;
sA_s <= "011000100000";
wait for 1ns;
assert sB_s = "011000100001" 
	report "ADD error at 011000100001" severity error;

wait for waitTime;
sA_s <= "011000100001";
wait for 1ns;
assert sB_s = "011000100010" 
	report "ADD error at 011000100010" severity error;

wait for waitTime;
sA_s <= "011000100010";
wait for 1ns;
assert sB_s = "011000100011" 
	report "ADD error at 011000100011" severity error;

wait for waitTime;
sA_s <= "011000100011";
wait for 1ns;
assert sB_s = "011000100100" 
	report "ADD error at 011000100100" severity error;

wait for waitTime;
sA_s <= "011000100100";
wait for 1ns;
assert sB_s = "011000100101" 
	report "ADD error at 011000100101" severity error;

wait for waitTime;
sA_s <= "011000100101";
wait for 1ns;
assert sB_s = "011000100110" 
	report "ADD error at 011000100110" severity error;

wait for waitTime;
sA_s <= "011000100110";
wait for 1ns;
assert sB_s = "011000100111" 
	report "ADD error at 011000100111" severity error;

wait for waitTime;
sA_s <= "011000100111";
wait for 1ns;
assert sB_s = "011000101000" 
	report "ADD error at 011000101000" severity error;

wait for waitTime;
sA_s <= "011000101000";
wait for 1ns;
assert sB_s = "011000101001" 
	report "ADD error at 011000101001" severity error;

wait for waitTime;
sA_s <= "011000101001";
wait for 1ns;
assert sB_s = "011000101010" 
	report "ADD error at 011000101010" severity error;

wait for waitTime;
sA_s <= "011000101010";
wait for 1ns;
assert sB_s = "011000101011" 
	report "ADD error at 011000101011" severity error;

wait for waitTime;
sA_s <= "011000101011";
wait for 1ns;
assert sB_s = "011000101100" 
	report "ADD error at 011000101100" severity error;

wait for waitTime;
sA_s <= "011000101100";
wait for 1ns;
assert sB_s = "011000101101" 
	report "ADD error at 011000101101" severity error;

wait for waitTime;
sA_s <= "011000101101";
wait for 1ns;
assert sB_s = "011000101110" 
	report "ADD error at 011000101110" severity error;

wait for waitTime;
sA_s <= "011000101110";
wait for 1ns;
assert sB_s = "011000101111" 
	report "ADD error at 011000101111" severity error;

wait for waitTime;
sA_s <= "011000101111";
wait for 1ns;
assert sB_s = "011000110000" 
	report "ADD error at 011000110000" severity error;

wait for waitTime;
sA_s <= "011000110000";
wait for 1ns;
assert sB_s = "011000110001" 
	report "ADD error at 011000110001" severity error;

wait for waitTime;
sA_s <= "011000110001";
wait for 1ns;
assert sB_s = "011000110010" 
	report "ADD error at 011000110010" severity error;

wait for waitTime;
sA_s <= "011000110010";
wait for 1ns;
assert sB_s = "011000110011" 
	report "ADD error at 011000110011" severity error;

wait for waitTime;
sA_s <= "011000110011";
wait for 1ns;
assert sB_s = "011000110100" 
	report "ADD error at 011000110100" severity error;

wait for waitTime;
sA_s <= "011000110100";
wait for 1ns;
assert sB_s = "011000110101" 
	report "ADD error at 011000110101" severity error;

wait for waitTime;
sA_s <= "011000110101";
wait for 1ns;
assert sB_s = "011000110110" 
	report "ADD error at 011000110110" severity error;

wait for waitTime;
sA_s <= "011000110110";
wait for 1ns;
assert sB_s = "011000110111" 
	report "ADD error at 011000110111" severity error;

wait for waitTime;
sA_s <= "011000110111";
wait for 1ns;
assert sB_s = "011000111000" 
	report "ADD error at 011000111000" severity error;

wait for waitTime;
sA_s <= "011000111000";
wait for 1ns;
assert sB_s = "011000111001" 
	report "ADD error at 011000111001" severity error;

wait for waitTime;
sA_s <= "011000111001";
wait for 1ns;
assert sB_s = "011000111010" 
	report "ADD error at 011000111010" severity error;

wait for waitTime;
sA_s <= "011000111010";
wait for 1ns;
assert sB_s = "011000111011" 
	report "ADD error at 011000111011" severity error;

wait for waitTime;
sA_s <= "011000111011";
wait for 1ns;
assert sB_s = "011000111100" 
	report "ADD error at 011000111100" severity error;

wait for waitTime;
sA_s <= "011000111100";
wait for 1ns;
assert sB_s = "011000111101" 
	report "ADD error at 011000111101" severity error;

wait for waitTime;
sA_s <= "011000111101";
wait for 1ns;
assert sB_s = "011000111110" 
	report "ADD error at 011000111110" severity error;

wait for waitTime;
sA_s <= "011000111110";
wait for 1ns;
assert sB_s = "011000111111" 
	report "ADD error at 011000111111" severity error;

wait for waitTime;
sA_s <= "011000111111";
wait for 1ns;
assert sB_s = "011001000000" 
	report "ADD error at 011001000000" severity error;

wait for waitTime;
sA_s <= "011001000000";
wait for 1ns;
assert sB_s = "011001000001" 
	report "ADD error at 011001000001" severity error;

wait for waitTime;
sA_s <= "011001000001";
wait for 1ns;
assert sB_s = "011001000010" 
	report "ADD error at 011001000010" severity error;

wait for waitTime;
sA_s <= "011001000010";
wait for 1ns;
assert sB_s = "011001000011" 
	report "ADD error at 011001000011" severity error;

wait for waitTime;
sA_s <= "011001000011";
wait for 1ns;
assert sB_s = "011001000100" 
	report "ADD error at 011001000100" severity error;

wait for waitTime;
sA_s <= "011001000100";
wait for 1ns;
assert sB_s = "011001000101" 
	report "ADD error at 011001000101" severity error;

wait for waitTime;
sA_s <= "011001000101";
wait for 1ns;
assert sB_s = "011001000110" 
	report "ADD error at 011001000110" severity error;

wait for waitTime;
sA_s <= "011001000110";
wait for 1ns;
assert sB_s = "011001000111" 
	report "ADD error at 011001000111" severity error;

wait for waitTime;
sA_s <= "011001000111";
wait for 1ns;
assert sB_s = "011001001000" 
	report "ADD error at 011001001000" severity error;

wait for waitTime;
sA_s <= "011001001000";
wait for 1ns;
assert sB_s = "011001001001" 
	report "ADD error at 011001001001" severity error;

wait for waitTime;
sA_s <= "011001001001";
wait for 1ns;
assert sB_s = "011001001010" 
	report "ADD error at 011001001010" severity error;

wait for waitTime;
sA_s <= "011001001010";
wait for 1ns;
assert sB_s = "011001001011" 
	report "ADD error at 011001001011" severity error;

wait for waitTime;
sA_s <= "011001001011";
wait for 1ns;
assert sB_s = "011001001100" 
	report "ADD error at 011001001100" severity error;

wait for waitTime;
sA_s <= "011001001100";
wait for 1ns;
assert sB_s = "011001001101" 
	report "ADD error at 011001001101" severity error;

wait for waitTime;
sA_s <= "011001001101";
wait for 1ns;
assert sB_s = "011001001110" 
	report "ADD error at 011001001110" severity error;

wait for waitTime;
sA_s <= "011001001110";
wait for 1ns;
assert sB_s = "011001001111" 
	report "ADD error at 011001001111" severity error;

wait for waitTime;
sA_s <= "011001001111";
wait for 1ns;
assert sB_s = "011001010000" 
	report "ADD error at 011001010000" severity error;

wait for waitTime;
sA_s <= "011001010000";
wait for 1ns;
assert sB_s = "011001010001" 
	report "ADD error at 011001010001" severity error;

wait for waitTime;
sA_s <= "011001010001";
wait for 1ns;
assert sB_s = "011001010010" 
	report "ADD error at 011001010010" severity error;

wait for waitTime;
sA_s <= "011001010010";
wait for 1ns;
assert sB_s = "011001010011" 
	report "ADD error at 011001010011" severity error;

wait for waitTime;
sA_s <= "011001010011";
wait for 1ns;
assert sB_s = "011001010100" 
	report "ADD error at 011001010100" severity error;

wait for waitTime;
sA_s <= "011001010100";
wait for 1ns;
assert sB_s = "011001010101" 
	report "ADD error at 011001010101" severity error;

wait for waitTime;
sA_s <= "011001010101";
wait for 1ns;
assert sB_s = "011001010110" 
	report "ADD error at 011001010110" severity error;

wait for waitTime;
sA_s <= "011001010110";
wait for 1ns;
assert sB_s = "011001010111" 
	report "ADD error at 011001010111" severity error;

wait for waitTime;
sA_s <= "011001010111";
wait for 1ns;
assert sB_s = "011001011000" 
	report "ADD error at 011001011000" severity error;

wait for waitTime;
sA_s <= "011001011000";
wait for 1ns;
assert sB_s = "011001011001" 
	report "ADD error at 011001011001" severity error;

wait for waitTime;
sA_s <= "011001011001";
wait for 1ns;
assert sB_s = "011001011010" 
	report "ADD error at 011001011010" severity error;

wait for waitTime;
sA_s <= "011001011010";
wait for 1ns;
assert sB_s = "011001011011" 
	report "ADD error at 011001011011" severity error;

wait for waitTime;
sA_s <= "011001011011";
wait for 1ns;
assert sB_s = "011001011100" 
	report "ADD error at 011001011100" severity error;

wait for waitTime;
sA_s <= "011001011100";
wait for 1ns;
assert sB_s = "011001011101" 
	report "ADD error at 011001011101" severity error;

wait for waitTime;
sA_s <= "011001011101";
wait for 1ns;
assert sB_s = "011001011110" 
	report "ADD error at 011001011110" severity error;

wait for waitTime;
sA_s <= "011001011110";
wait for 1ns;
assert sB_s = "011001011111" 
	report "ADD error at 011001011111" severity error;

wait for waitTime;
sA_s <= "011001011111";
wait for 1ns;
assert sB_s = "011001100000" 
	report "ADD error at 011001100000" severity error;

wait for waitTime;
sA_s <= "011001100000";
wait for 1ns;
assert sB_s = "011001100001" 
	report "ADD error at 011001100001" severity error;

wait for waitTime;
sA_s <= "011001100001";
wait for 1ns;
assert sB_s = "011001100010" 
	report "ADD error at 011001100010" severity error;

wait for waitTime;
sA_s <= "011001100010";
wait for 1ns;
assert sB_s = "011001100011" 
	report "ADD error at 011001100011" severity error;

wait for waitTime;
sA_s <= "011001100011";
wait for 1ns;
assert sB_s = "011001100100" 
	report "ADD error at 011001100100" severity error;

wait for waitTime;
sA_s <= "011001100100";
wait for 1ns;
assert sB_s = "011001100101" 
	report "ADD error at 011001100101" severity error;

wait for waitTime;
sA_s <= "011001100101";
wait for 1ns;
assert sB_s = "011001100110" 
	report "ADD error at 011001100110" severity error;

wait for waitTime;
sA_s <= "011001100110";
wait for 1ns;
assert sB_s = "011001100111" 
	report "ADD error at 011001100111" severity error;

wait for waitTime;
sA_s <= "011001100111";
wait for 1ns;
assert sB_s = "011001101000" 
	report "ADD error at 011001101000" severity error;

wait for waitTime;
sA_s <= "011001101000";
wait for 1ns;
assert sB_s = "011001101001" 
	report "ADD error at 011001101001" severity error;

wait for waitTime;
sA_s <= "011001101001";
wait for 1ns;
assert sB_s = "011001101010" 
	report "ADD error at 011001101010" severity error;

wait for waitTime;
sA_s <= "011001101010";
wait for 1ns;
assert sB_s = "011001101011" 
	report "ADD error at 011001101011" severity error;

wait for waitTime;
sA_s <= "011001101011";
wait for 1ns;
assert sB_s = "011001101100" 
	report "ADD error at 011001101100" severity error;

wait for waitTime;
sA_s <= "011001101100";
wait for 1ns;
assert sB_s = "011001101101" 
	report "ADD error at 011001101101" severity error;

wait for waitTime;
sA_s <= "011001101101";
wait for 1ns;
assert sB_s = "011001101110" 
	report "ADD error at 011001101110" severity error;

wait for waitTime;
sA_s <= "011001101110";
wait for 1ns;
assert sB_s = "011001101111" 
	report "ADD error at 011001101111" severity error;

wait for waitTime;
sA_s <= "011001101111";
wait for 1ns;
assert sB_s = "011001110000" 
	report "ADD error at 011001110000" severity error;

wait for waitTime;
sA_s <= "011001110000";
wait for 1ns;
assert sB_s = "011001110001" 
	report "ADD error at 011001110001" severity error;

wait for waitTime;
sA_s <= "011001110001";
wait for 1ns;
assert sB_s = "011001110010" 
	report "ADD error at 011001110010" severity error;

wait for waitTime;
sA_s <= "011001110010";
wait for 1ns;
assert sB_s = "011001110011" 
	report "ADD error at 011001110011" severity error;

wait for waitTime;
sA_s <= "011001110011";
wait for 1ns;
assert sB_s = "011001110100" 
	report "ADD error at 011001110100" severity error;

wait for waitTime;
sA_s <= "011001110100";
wait for 1ns;
assert sB_s = "011001110101" 
	report "ADD error at 011001110101" severity error;

wait for waitTime;
sA_s <= "011001110101";
wait for 1ns;
assert sB_s = "011001110110" 
	report "ADD error at 011001110110" severity error;

wait for waitTime;
sA_s <= "011001110110";
wait for 1ns;
assert sB_s = "011001110111" 
	report "ADD error at 011001110111" severity error;

wait for waitTime;
sA_s <= "011001110111";
wait for 1ns;
assert sB_s = "011001111000" 
	report "ADD error at 011001111000" severity error;

wait for waitTime;
sA_s <= "011001111000";
wait for 1ns;
assert sB_s = "011001111001" 
	report "ADD error at 011001111001" severity error;

wait for waitTime;
sA_s <= "011001111001";
wait for 1ns;
assert sB_s = "011001111010" 
	report "ADD error at 011001111010" severity error;

wait for waitTime;
sA_s <= "011001111010";
wait for 1ns;
assert sB_s = "011001111011" 
	report "ADD error at 011001111011" severity error;

wait for waitTime;
sA_s <= "011001111011";
wait for 1ns;
assert sB_s = "011001111100" 
	report "ADD error at 011001111100" severity error;

wait for waitTime;
sA_s <= "011001111100";
wait for 1ns;
assert sB_s = "011001111101" 
	report "ADD error at 011001111101" severity error;

wait for waitTime;
sA_s <= "011001111101";
wait for 1ns;
assert sB_s = "011001111110" 
	report "ADD error at 011001111110" severity error;

wait for waitTime;
sA_s <= "011001111110";
wait for 1ns;
assert sB_s = "011001111111" 
	report "ADD error at 011001111111" severity error;

wait for waitTime;
sA_s <= "011001111111";
wait for 1ns;
assert sB_s = "011010000000" 
	report "ADD error at 011010000000" severity error;

wait for waitTime;
sA_s <= "011010000000";
wait for 1ns;
assert sB_s = "011010000001" 
	report "ADD error at 011010000001" severity error;

wait for waitTime;
sA_s <= "011010000001";
wait for 1ns;
assert sB_s = "011010000010" 
	report "ADD error at 011010000010" severity error;

wait for waitTime;
sA_s <= "011010000010";
wait for 1ns;
assert sB_s = "011010000011" 
	report "ADD error at 011010000011" severity error;

wait for waitTime;
sA_s <= "011010000011";
wait for 1ns;
assert sB_s = "011010000100" 
	report "ADD error at 011010000100" severity error;

wait for waitTime;
sA_s <= "011010000100";
wait for 1ns;
assert sB_s = "011010000101" 
	report "ADD error at 011010000101" severity error;

wait for waitTime;
sA_s <= "011010000101";
wait for 1ns;
assert sB_s = "011010000110" 
	report "ADD error at 011010000110" severity error;

wait for waitTime;
sA_s <= "011010000110";
wait for 1ns;
assert sB_s = "011010000111" 
	report "ADD error at 011010000111" severity error;

wait for waitTime;
sA_s <= "011010000111";
wait for 1ns;
assert sB_s = "011010001000" 
	report "ADD error at 011010001000" severity error;

wait for waitTime;
sA_s <= "011010001000";
wait for 1ns;
assert sB_s = "011010001001" 
	report "ADD error at 011010001001" severity error;

wait for waitTime;
sA_s <= "011010001001";
wait for 1ns;
assert sB_s = "011010001010" 
	report "ADD error at 011010001010" severity error;

wait for waitTime;
sA_s <= "011010001010";
wait for 1ns;
assert sB_s = "011010001011" 
	report "ADD error at 011010001011" severity error;

wait for waitTime;
sA_s <= "011010001011";
wait for 1ns;
assert sB_s = "011010001100" 
	report "ADD error at 011010001100" severity error;

wait for waitTime;
sA_s <= "011010001100";
wait for 1ns;
assert sB_s = "011010001101" 
	report "ADD error at 011010001101" severity error;

wait for waitTime;
sA_s <= "011010001101";
wait for 1ns;
assert sB_s = "011010001110" 
	report "ADD error at 011010001110" severity error;

wait for waitTime;
sA_s <= "011010001110";
wait for 1ns;
assert sB_s = "011010001111" 
	report "ADD error at 011010001111" severity error;

wait for waitTime;
sA_s <= "011010001111";
wait for 1ns;
assert sB_s = "011010010000" 
	report "ADD error at 011010010000" severity error;

wait for waitTime;
sA_s <= "011010010000";
wait for 1ns;
assert sB_s = "011010010001" 
	report "ADD error at 011010010001" severity error;

wait for waitTime;
sA_s <= "011010010001";
wait for 1ns;
assert sB_s = "011010010010" 
	report "ADD error at 011010010010" severity error;

wait for waitTime;
sA_s <= "011010010010";
wait for 1ns;
assert sB_s = "011010010011" 
	report "ADD error at 011010010011" severity error;

wait for waitTime;
sA_s <= "011010010011";
wait for 1ns;
assert sB_s = "011010010100" 
	report "ADD error at 011010010100" severity error;

wait for waitTime;
sA_s <= "011010010100";
wait for 1ns;
assert sB_s = "011010010101" 
	report "ADD error at 011010010101" severity error;

wait for waitTime;
sA_s <= "011010010101";
wait for 1ns;
assert sB_s = "011010010110" 
	report "ADD error at 011010010110" severity error;

wait for waitTime;
sA_s <= "011010010110";
wait for 1ns;
assert sB_s = "011010010111" 
	report "ADD error at 011010010111" severity error;

wait for waitTime;
sA_s <= "011010010111";
wait for 1ns;
assert sB_s = "011010011000" 
	report "ADD error at 011010011000" severity error;

wait for waitTime;
sA_s <= "011010011000";
wait for 1ns;
assert sB_s = "011010011001" 
	report "ADD error at 011010011001" severity error;

wait for waitTime;
sA_s <= "011010011001";
wait for 1ns;
assert sB_s = "011010011010" 
	report "ADD error at 011010011010" severity error;

wait for waitTime;
sA_s <= "011010011010";
wait for 1ns;
assert sB_s = "011010011011" 
	report "ADD error at 011010011011" severity error;

wait for waitTime;
sA_s <= "011010011011";
wait for 1ns;
assert sB_s = "011010011100" 
	report "ADD error at 011010011100" severity error;

wait for waitTime;
sA_s <= "011010011100";
wait for 1ns;
assert sB_s = "011010011101" 
	report "ADD error at 011010011101" severity error;

wait for waitTime;
sA_s <= "011010011101";
wait for 1ns;
assert sB_s = "011010011110" 
	report "ADD error at 011010011110" severity error;

wait for waitTime;
sA_s <= "011010011110";
wait for 1ns;
assert sB_s = "011010011111" 
	report "ADD error at 011010011111" severity error;

wait for waitTime;
sA_s <= "011010011111";
wait for 1ns;
assert sB_s = "011010100000" 
	report "ADD error at 011010100000" severity error;

wait for waitTime;
sA_s <= "011010100000";
wait for 1ns;
assert sB_s = "011010100001" 
	report "ADD error at 011010100001" severity error;

wait for waitTime;
sA_s <= "011010100001";
wait for 1ns;
assert sB_s = "011010100010" 
	report "ADD error at 011010100010" severity error;

wait for waitTime;
sA_s <= "011010100010";
wait for 1ns;
assert sB_s = "011010100011" 
	report "ADD error at 011010100011" severity error;

wait for waitTime;
sA_s <= "011010100011";
wait for 1ns;
assert sB_s = "011010100100" 
	report "ADD error at 011010100100" severity error;

wait for waitTime;
sA_s <= "011010100100";
wait for 1ns;
assert sB_s = "011010100101" 
	report "ADD error at 011010100101" severity error;

wait for waitTime;
sA_s <= "011010100101";
wait for 1ns;
assert sB_s = "011010100110" 
	report "ADD error at 011010100110" severity error;

wait for waitTime;
sA_s <= "011010100110";
wait for 1ns;
assert sB_s = "011010100111" 
	report "ADD error at 011010100111" severity error;

wait for waitTime;
sA_s <= "011010100111";
wait for 1ns;
assert sB_s = "011010101000" 
	report "ADD error at 011010101000" severity error;

wait for waitTime;
sA_s <= "011010101000";
wait for 1ns;
assert sB_s = "011010101001" 
	report "ADD error at 011010101001" severity error;

wait for waitTime;
sA_s <= "011010101001";
wait for 1ns;
assert sB_s = "011010101010" 
	report "ADD error at 011010101010" severity error;

wait for waitTime;
sA_s <= "011010101010";
wait for 1ns;
assert sB_s = "011010101011" 
	report "ADD error at 011010101011" severity error;

wait for waitTime;
sA_s <= "011010101011";
wait for 1ns;
assert sB_s = "011010101100" 
	report "ADD error at 011010101100" severity error;

wait for waitTime;
sA_s <= "011010101100";
wait for 1ns;
assert sB_s = "011010101101" 
	report "ADD error at 011010101101" severity error;

wait for waitTime;
sA_s <= "011010101101";
wait for 1ns;
assert sB_s = "011010101110" 
	report "ADD error at 011010101110" severity error;

wait for waitTime;
sA_s <= "011010101110";
wait for 1ns;
assert sB_s = "011010101111" 
	report "ADD error at 011010101111" severity error;

wait for waitTime;
sA_s <= "011010101111";
wait for 1ns;
assert sB_s = "011010110000" 
	report "ADD error at 011010110000" severity error;

wait for waitTime;
sA_s <= "011010110000";
wait for 1ns;
assert sB_s = "011010110001" 
	report "ADD error at 011010110001" severity error;

wait for waitTime;
sA_s <= "011010110001";
wait for 1ns;
assert sB_s = "011010110010" 
	report "ADD error at 011010110010" severity error;

wait for waitTime;
sA_s <= "011010110010";
wait for 1ns;
assert sB_s = "011010110011" 
	report "ADD error at 011010110011" severity error;

wait for waitTime;
sA_s <= "011010110011";
wait for 1ns;
assert sB_s = "011010110100" 
	report "ADD error at 011010110100" severity error;

wait for waitTime;
sA_s <= "011010110100";
wait for 1ns;
assert sB_s = "011010110101" 
	report "ADD error at 011010110101" severity error;

wait for waitTime;
sA_s <= "011010110101";
wait for 1ns;
assert sB_s = "011010110110" 
	report "ADD error at 011010110110" severity error;

wait for waitTime;
sA_s <= "011010110110";
wait for 1ns;
assert sB_s = "011010110111" 
	report "ADD error at 011010110111" severity error;

wait for waitTime;
sA_s <= "011010110111";
wait for 1ns;
assert sB_s = "011010111000" 
	report "ADD error at 011010111000" severity error;

wait for waitTime;
sA_s <= "011010111000";
wait for 1ns;
assert sB_s = "011010111001" 
	report "ADD error at 011010111001" severity error;

wait for waitTime;
sA_s <= "011010111001";
wait for 1ns;
assert sB_s = "011010111010" 
	report "ADD error at 011010111010" severity error;

wait for waitTime;
sA_s <= "011010111010";
wait for 1ns;
assert sB_s = "011010111011" 
	report "ADD error at 011010111011" severity error;

wait for waitTime;
sA_s <= "011010111011";
wait for 1ns;
assert sB_s = "011010111100" 
	report "ADD error at 011010111100" severity error;

wait for waitTime;
sA_s <= "011010111100";
wait for 1ns;
assert sB_s = "011010111101" 
	report "ADD error at 011010111101" severity error;

wait for waitTime;
sA_s <= "011010111101";
wait for 1ns;
assert sB_s = "011010111110" 
	report "ADD error at 011010111110" severity error;

wait for waitTime;
sA_s <= "011010111110";
wait for 1ns;
assert sB_s = "011010111111" 
	report "ADD error at 011010111111" severity error;

wait for waitTime;
sA_s <= "011010111111";
wait for 1ns;
assert sB_s = "011011000000" 
	report "ADD error at 011011000000" severity error;

wait for waitTime;
sA_s <= "011011000000";
wait for 1ns;
assert sB_s = "011011000001" 
	report "ADD error at 011011000001" severity error;

wait for waitTime;
sA_s <= "011011000001";
wait for 1ns;
assert sB_s = "011011000010" 
	report "ADD error at 011011000010" severity error;

wait for waitTime;
sA_s <= "011011000010";
wait for 1ns;
assert sB_s = "011011000011" 
	report "ADD error at 011011000011" severity error;

wait for waitTime;
sA_s <= "011011000011";
wait for 1ns;
assert sB_s = "011011000100" 
	report "ADD error at 011011000100" severity error;

wait for waitTime;
sA_s <= "011011000100";
wait for 1ns;
assert sB_s = "011011000101" 
	report "ADD error at 011011000101" severity error;

wait for waitTime;
sA_s <= "011011000101";
wait for 1ns;
assert sB_s = "011011000110" 
	report "ADD error at 011011000110" severity error;

wait for waitTime;
sA_s <= "011011000110";
wait for 1ns;
assert sB_s = "011011000111" 
	report "ADD error at 011011000111" severity error;

wait for waitTime;
sA_s <= "011011000111";
wait for 1ns;
assert sB_s = "011011001000" 
	report "ADD error at 011011001000" severity error;

wait for waitTime;
sA_s <= "011011001000";
wait for 1ns;
assert sB_s = "011011001001" 
	report "ADD error at 011011001001" severity error;

wait for waitTime;
sA_s <= "011011001001";
wait for 1ns;
assert sB_s = "011011001010" 
	report "ADD error at 011011001010" severity error;

wait for waitTime;
sA_s <= "011011001010";
wait for 1ns;
assert sB_s = "011011001011" 
	report "ADD error at 011011001011" severity error;

wait for waitTime;
sA_s <= "011011001011";
wait for 1ns;
assert sB_s = "011011001100" 
	report "ADD error at 011011001100" severity error;

wait for waitTime;
sA_s <= "011011001100";
wait for 1ns;
assert sB_s = "011011001101" 
	report "ADD error at 011011001101" severity error;

wait for waitTime;
sA_s <= "011011001101";
wait for 1ns;
assert sB_s = "011011001110" 
	report "ADD error at 011011001110" severity error;

wait for waitTime;
sA_s <= "011011001110";
wait for 1ns;
assert sB_s = "011011001111" 
	report "ADD error at 011011001111" severity error;

wait for waitTime;
sA_s <= "011011001111";
wait for 1ns;
assert sB_s = "011011010000" 
	report "ADD error at 011011010000" severity error;

wait for waitTime;
sA_s <= "011011010000";
wait for 1ns;
assert sB_s = "011011010001" 
	report "ADD error at 011011010001" severity error;

wait for waitTime;
sA_s <= "011011010001";
wait for 1ns;
assert sB_s = "011011010010" 
	report "ADD error at 011011010010" severity error;

wait for waitTime;
sA_s <= "011011010010";
wait for 1ns;
assert sB_s = "011011010011" 
	report "ADD error at 011011010011" severity error;

wait for waitTime;
sA_s <= "011011010011";
wait for 1ns;
assert sB_s = "011011010100" 
	report "ADD error at 011011010100" severity error;

wait for waitTime;
sA_s <= "011011010100";
wait for 1ns;
assert sB_s = "011011010101" 
	report "ADD error at 011011010101" severity error;

wait for waitTime;
sA_s <= "011011010101";
wait for 1ns;
assert sB_s = "011011010110" 
	report "ADD error at 011011010110" severity error;

wait for waitTime;
sA_s <= "011011010110";
wait for 1ns;
assert sB_s = "011011010111" 
	report "ADD error at 011011010111" severity error;

wait for waitTime;
sA_s <= "011011010111";
wait for 1ns;
assert sB_s = "011011011000" 
	report "ADD error at 011011011000" severity error;

wait for waitTime;
sA_s <= "011011011000";
wait for 1ns;
assert sB_s = "011011011001" 
	report "ADD error at 011011011001" severity error;

wait for waitTime;
sA_s <= "011011011001";
wait for 1ns;
assert sB_s = "011011011010" 
	report "ADD error at 011011011010" severity error;

wait for waitTime;
sA_s <= "011011011010";
wait for 1ns;
assert sB_s = "011011011011" 
	report "ADD error at 011011011011" severity error;

wait for waitTime;
sA_s <= "011011011011";
wait for 1ns;
assert sB_s = "011011011100" 
	report "ADD error at 011011011100" severity error;

wait for waitTime;
sA_s <= "011011011100";
wait for 1ns;
assert sB_s = "011011011101" 
	report "ADD error at 011011011101" severity error;

wait for waitTime;
sA_s <= "011011011101";
wait for 1ns;
assert sB_s = "011011011110" 
	report "ADD error at 011011011110" severity error;

wait for waitTime;
sA_s <= "011011011110";
wait for 1ns;
assert sB_s = "011011011111" 
	report "ADD error at 011011011111" severity error;

wait for waitTime;
sA_s <= "011011011111";
wait for 1ns;
assert sB_s = "011011100000" 
	report "ADD error at 011011100000" severity error;

wait for waitTime;
sA_s <= "011011100000";
wait for 1ns;
assert sB_s = "011011100001" 
	report "ADD error at 011011100001" severity error;

wait for waitTime;
sA_s <= "011011100001";
wait for 1ns;
assert sB_s = "011011100010" 
	report "ADD error at 011011100010" severity error;

wait for waitTime;
sA_s <= "011011100010";
wait for 1ns;
assert sB_s = "011011100011" 
	report "ADD error at 011011100011" severity error;

wait for waitTime;
sA_s <= "011011100011";
wait for 1ns;
assert sB_s = "011011100100" 
	report "ADD error at 011011100100" severity error;

wait for waitTime;
sA_s <= "011011100100";
wait for 1ns;
assert sB_s = "011011100101" 
	report "ADD error at 011011100101" severity error;

wait for waitTime;
sA_s <= "011011100101";
wait for 1ns;
assert sB_s = "011011100110" 
	report "ADD error at 011011100110" severity error;

wait for waitTime;
sA_s <= "011011100110";
wait for 1ns;
assert sB_s = "011011100111" 
	report "ADD error at 011011100111" severity error;

wait for waitTime;
sA_s <= "011011100111";
wait for 1ns;
assert sB_s = "011011101000" 
	report "ADD error at 011011101000" severity error;

wait for waitTime;
sA_s <= "011011101000";
wait for 1ns;
assert sB_s = "011011101001" 
	report "ADD error at 011011101001" severity error;

wait for waitTime;
sA_s <= "011011101001";
wait for 1ns;
assert sB_s = "011011101010" 
	report "ADD error at 011011101010" severity error;

wait for waitTime;
sA_s <= "011011101010";
wait for 1ns;
assert sB_s = "011011101011" 
	report "ADD error at 011011101011" severity error;

wait for waitTime;
sA_s <= "011011101011";
wait for 1ns;
assert sB_s = "011011101100" 
	report "ADD error at 011011101100" severity error;

wait for waitTime;
sA_s <= "011011101100";
wait for 1ns;
assert sB_s = "011011101101" 
	report "ADD error at 011011101101" severity error;

wait for waitTime;
sA_s <= "011011101101";
wait for 1ns;
assert sB_s = "011011101110" 
	report "ADD error at 011011101110" severity error;

wait for waitTime;
sA_s <= "011011101110";
wait for 1ns;
assert sB_s = "011011101111" 
	report "ADD error at 011011101111" severity error;

wait for waitTime;
sA_s <= "011011101111";
wait for 1ns;
assert sB_s = "011011110000" 
	report "ADD error at 011011110000" severity error;

wait for waitTime;
sA_s <= "011011110000";
wait for 1ns;
assert sB_s = "011011110001" 
	report "ADD error at 011011110001" severity error;

wait for waitTime;
sA_s <= "011011110001";
wait for 1ns;
assert sB_s = "011011110010" 
	report "ADD error at 011011110010" severity error;

wait for waitTime;
sA_s <= "011011110010";
wait for 1ns;
assert sB_s = "011011110011" 
	report "ADD error at 011011110011" severity error;

wait for waitTime;
sA_s <= "011011110011";
wait for 1ns;
assert sB_s = "011011110100" 
	report "ADD error at 011011110100" severity error;

wait for waitTime;
sA_s <= "011011110100";
wait for 1ns;
assert sB_s = "011011110101" 
	report "ADD error at 011011110101" severity error;

wait for waitTime;
sA_s <= "011011110101";
wait for 1ns;
assert sB_s = "011011110110" 
	report "ADD error at 011011110110" severity error;

wait for waitTime;
sA_s <= "011011110110";
wait for 1ns;
assert sB_s = "011011110111" 
	report "ADD error at 011011110111" severity error;

wait for waitTime;
sA_s <= "011011110111";
wait for 1ns;
assert sB_s = "011011111000" 
	report "ADD error at 011011111000" severity error;

wait for waitTime;
sA_s <= "011011111000";
wait for 1ns;
assert sB_s = "011011111001" 
	report "ADD error at 011011111001" severity error;

wait for waitTime;
sA_s <= "011011111001";
wait for 1ns;
assert sB_s = "011011111010" 
	report "ADD error at 011011111010" severity error;

wait for waitTime;
sA_s <= "011011111010";
wait for 1ns;
assert sB_s = "011011111011" 
	report "ADD error at 011011111011" severity error;

wait for waitTime;
sA_s <= "011011111011";
wait for 1ns;
assert sB_s = "011011111100" 
	report "ADD error at 011011111100" severity error;

wait for waitTime;
sA_s <= "011011111100";
wait for 1ns;
assert sB_s = "011011111101" 
	report "ADD error at 011011111101" severity error;

wait for waitTime;
sA_s <= "011011111101";
wait for 1ns;
assert sB_s = "011011111110" 
	report "ADD error at 011011111110" severity error;

wait for waitTime;
sA_s <= "011011111110";
wait for 1ns;
assert sB_s = "011011111111" 
	report "ADD error at 011011111111" severity error;

wait for waitTime;
sA_s <= "011011111111";
wait for 1ns;
assert sB_s = "011100000000" 
	report "ADD error at 011100000000" severity error;

wait for waitTime;
sA_s <= "011100000000";
wait for 1ns;
assert sB_s = "011100000001" 
	report "ADD error at 011100000001" severity error;

wait for waitTime;
sA_s <= "011100000001";
wait for 1ns;
assert sB_s = "011100000010" 
	report "ADD error at 011100000010" severity error;

wait for waitTime;
sA_s <= "011100000010";
wait for 1ns;
assert sB_s = "011100000011" 
	report "ADD error at 011100000011" severity error;

wait for waitTime;
sA_s <= "011100000011";
wait for 1ns;
assert sB_s = "011100000100" 
	report "ADD error at 011100000100" severity error;

wait for waitTime;
sA_s <= "011100000100";
wait for 1ns;
assert sB_s = "011100000101" 
	report "ADD error at 011100000101" severity error;

wait for waitTime;
sA_s <= "011100000101";
wait for 1ns;
assert sB_s = "011100000110" 
	report "ADD error at 011100000110" severity error;

wait for waitTime;
sA_s <= "011100000110";
wait for 1ns;
assert sB_s = "011100000111" 
	report "ADD error at 011100000111" severity error;

wait for waitTime;
sA_s <= "011100000111";
wait for 1ns;
assert sB_s = "011100001000" 
	report "ADD error at 011100001000" severity error;

wait for waitTime;
sA_s <= "011100001000";
wait for 1ns;
assert sB_s = "011100001001" 
	report "ADD error at 011100001001" severity error;

wait for waitTime;
sA_s <= "011100001001";
wait for 1ns;
assert sB_s = "011100001010" 
	report "ADD error at 011100001010" severity error;

wait for waitTime;
sA_s <= "011100001010";
wait for 1ns;
assert sB_s = "011100001011" 
	report "ADD error at 011100001011" severity error;

wait for waitTime;
sA_s <= "011100001011";
wait for 1ns;
assert sB_s = "011100001100" 
	report "ADD error at 011100001100" severity error;

wait for waitTime;
sA_s <= "011100001100";
wait for 1ns;
assert sB_s = "011100001101" 
	report "ADD error at 011100001101" severity error;

wait for waitTime;
sA_s <= "011100001101";
wait for 1ns;
assert sB_s = "011100001110" 
	report "ADD error at 011100001110" severity error;

wait for waitTime;
sA_s <= "011100001110";
wait for 1ns;
assert sB_s = "011100001111" 
	report "ADD error at 011100001111" severity error;

wait for waitTime;
sA_s <= "011100001111";
wait for 1ns;
assert sB_s = "011100010000" 
	report "ADD error at 011100010000" severity error;

wait for waitTime;
sA_s <= "011100010000";
wait for 1ns;
assert sB_s = "011100010001" 
	report "ADD error at 011100010001" severity error;

wait for waitTime;
sA_s <= "011100010001";
wait for 1ns;
assert sB_s = "011100010010" 
	report "ADD error at 011100010010" severity error;

wait for waitTime;
sA_s <= "011100010010";
wait for 1ns;
assert sB_s = "011100010011" 
	report "ADD error at 011100010011" severity error;

wait for waitTime;
sA_s <= "011100010011";
wait for 1ns;
assert sB_s = "011100010100" 
	report "ADD error at 011100010100" severity error;

wait for waitTime;
sA_s <= "011100010100";
wait for 1ns;
assert sB_s = "011100010101" 
	report "ADD error at 011100010101" severity error;

wait for waitTime;
sA_s <= "011100010101";
wait for 1ns;
assert sB_s = "011100010110" 
	report "ADD error at 011100010110" severity error;

wait for waitTime;
sA_s <= "011100010110";
wait for 1ns;
assert sB_s = "011100010111" 
	report "ADD error at 011100010111" severity error;

wait for waitTime;
sA_s <= "011100010111";
wait for 1ns;
assert sB_s = "011100011000" 
	report "ADD error at 011100011000" severity error;

wait for waitTime;
sA_s <= "011100011000";
wait for 1ns;
assert sB_s = "011100011001" 
	report "ADD error at 011100011001" severity error;

wait for waitTime;
sA_s <= "011100011001";
wait for 1ns;
assert sB_s = "011100011010" 
	report "ADD error at 011100011010" severity error;

wait for waitTime;
sA_s <= "011100011010";
wait for 1ns;
assert sB_s = "011100011011" 
	report "ADD error at 011100011011" severity error;

wait for waitTime;
sA_s <= "011100011011";
wait for 1ns;
assert sB_s = "011100011100" 
	report "ADD error at 011100011100" severity error;

wait for waitTime;
sA_s <= "011100011100";
wait for 1ns;
assert sB_s = "011100011101" 
	report "ADD error at 011100011101" severity error;

wait for waitTime;
sA_s <= "011100011101";
wait for 1ns;
assert sB_s = "011100011110" 
	report "ADD error at 011100011110" severity error;

wait for waitTime;
sA_s <= "011100011110";
wait for 1ns;
assert sB_s = "011100011111" 
	report "ADD error at 011100011111" severity error;

wait for waitTime;
sA_s <= "011100011111";
wait for 1ns;
assert sB_s = "011100100000" 
	report "ADD error at 011100100000" severity error;

wait for waitTime;
sA_s <= "011100100000";
wait for 1ns;
assert sB_s = "011100100001" 
	report "ADD error at 011100100001" severity error;

wait for waitTime;
sA_s <= "011100100001";
wait for 1ns;
assert sB_s = "011100100010" 
	report "ADD error at 011100100010" severity error;

wait for waitTime;
sA_s <= "011100100010";
wait for 1ns;
assert sB_s = "011100100011" 
	report "ADD error at 011100100011" severity error;

wait for waitTime;
sA_s <= "011100100011";
wait for 1ns;
assert sB_s = "011100100100" 
	report "ADD error at 011100100100" severity error;

wait for waitTime;
sA_s <= "011100100100";
wait for 1ns;
assert sB_s = "011100100101" 
	report "ADD error at 011100100101" severity error;

wait for waitTime;
sA_s <= "011100100101";
wait for 1ns;
assert sB_s = "011100100110" 
	report "ADD error at 011100100110" severity error;

wait for waitTime;
sA_s <= "011100100110";
wait for 1ns;
assert sB_s = "011100100111" 
	report "ADD error at 011100100111" severity error;

wait for waitTime;
sA_s <= "011100100111";
wait for 1ns;
assert sB_s = "011100101000" 
	report "ADD error at 011100101000" severity error;

wait for waitTime;
sA_s <= "011100101000";
wait for 1ns;
assert sB_s = "011100101001" 
	report "ADD error at 011100101001" severity error;

wait for waitTime;
sA_s <= "011100101001";
wait for 1ns;
assert sB_s = "011100101010" 
	report "ADD error at 011100101010" severity error;

wait for waitTime;
sA_s <= "011100101010";
wait for 1ns;
assert sB_s = "011100101011" 
	report "ADD error at 011100101011" severity error;

wait for waitTime;
sA_s <= "011100101011";
wait for 1ns;
assert sB_s = "011100101100" 
	report "ADD error at 011100101100" severity error;

wait for waitTime;
sA_s <= "011100101100";
wait for 1ns;
assert sB_s = "011100101101" 
	report "ADD error at 011100101101" severity error;

wait for waitTime;
sA_s <= "011100101101";
wait for 1ns;
assert sB_s = "011100101110" 
	report "ADD error at 011100101110" severity error;

wait for waitTime;
sA_s <= "011100101110";
wait for 1ns;
assert sB_s = "011100101111" 
	report "ADD error at 011100101111" severity error;

wait for waitTime;
sA_s <= "011100101111";
wait for 1ns;
assert sB_s = "011100110000" 
	report "ADD error at 011100110000" severity error;

wait for waitTime;
sA_s <= "011100110000";
wait for 1ns;
assert sB_s = "011100110001" 
	report "ADD error at 011100110001" severity error;

wait for waitTime;
sA_s <= "011100110001";
wait for 1ns;
assert sB_s = "011100110010" 
	report "ADD error at 011100110010" severity error;

wait for waitTime;
sA_s <= "011100110010";
wait for 1ns;
assert sB_s = "011100110011" 
	report "ADD error at 011100110011" severity error;

wait for waitTime;
sA_s <= "011100110011";
wait for 1ns;
assert sB_s = "011100110100" 
	report "ADD error at 011100110100" severity error;

wait for waitTime;
sA_s <= "011100110100";
wait for 1ns;
assert sB_s = "011100110101" 
	report "ADD error at 011100110101" severity error;

wait for waitTime;
sA_s <= "011100110101";
wait for 1ns;
assert sB_s = "011100110110" 
	report "ADD error at 011100110110" severity error;

wait for waitTime;
sA_s <= "011100110110";
wait for 1ns;
assert sB_s = "011100110111" 
	report "ADD error at 011100110111" severity error;

wait for waitTime;
sA_s <= "011100110111";
wait for 1ns;
assert sB_s = "011100111000" 
	report "ADD error at 011100111000" severity error;

wait for waitTime;
sA_s <= "011100111000";
wait for 1ns;
assert sB_s = "011100111001" 
	report "ADD error at 011100111001" severity error;

wait for waitTime;
sA_s <= "011100111001";
wait for 1ns;
assert sB_s = "011100111010" 
	report "ADD error at 011100111010" severity error;

wait for waitTime;
sA_s <= "011100111010";
wait for 1ns;
assert sB_s = "011100111011" 
	report "ADD error at 011100111011" severity error;

wait for waitTime;
sA_s <= "011100111011";
wait for 1ns;
assert sB_s = "011100111100" 
	report "ADD error at 011100111100" severity error;

wait for waitTime;
sA_s <= "011100111100";
wait for 1ns;
assert sB_s = "011100111101" 
	report "ADD error at 011100111101" severity error;

wait for waitTime;
sA_s <= "011100111101";
wait for 1ns;
assert sB_s = "011100111110" 
	report "ADD error at 011100111110" severity error;

wait for waitTime;
sA_s <= "011100111110";
wait for 1ns;
assert sB_s = "011100111111" 
	report "ADD error at 011100111111" severity error;

wait for waitTime;
sA_s <= "011100111111";
wait for 1ns;
assert sB_s = "011101000000" 
	report "ADD error at 011101000000" severity error;

wait for waitTime;
sA_s <= "011101000000";
wait for 1ns;
assert sB_s = "011101000001" 
	report "ADD error at 011101000001" severity error;

wait for waitTime;
sA_s <= "011101000001";
wait for 1ns;
assert sB_s = "011101000010" 
	report "ADD error at 011101000010" severity error;

wait for waitTime;
sA_s <= "011101000010";
wait for 1ns;
assert sB_s = "011101000011" 
	report "ADD error at 011101000011" severity error;

wait for waitTime;
sA_s <= "011101000011";
wait for 1ns;
assert sB_s = "011101000100" 
	report "ADD error at 011101000100" severity error;

wait for waitTime;
sA_s <= "011101000100";
wait for 1ns;
assert sB_s = "011101000101" 
	report "ADD error at 011101000101" severity error;

wait for waitTime;
sA_s <= "011101000101";
wait for 1ns;
assert sB_s = "011101000110" 
	report "ADD error at 011101000110" severity error;

wait for waitTime;
sA_s <= "011101000110";
wait for 1ns;
assert sB_s = "011101000111" 
	report "ADD error at 011101000111" severity error;

wait for waitTime;
sA_s <= "011101000111";
wait for 1ns;
assert sB_s = "011101001000" 
	report "ADD error at 011101001000" severity error;

wait for waitTime;
sA_s <= "011101001000";
wait for 1ns;
assert sB_s = "011101001001" 
	report "ADD error at 011101001001" severity error;

wait for waitTime;
sA_s <= "011101001001";
wait for 1ns;
assert sB_s = "011101001010" 
	report "ADD error at 011101001010" severity error;

wait for waitTime;
sA_s <= "011101001010";
wait for 1ns;
assert sB_s = "011101001011" 
	report "ADD error at 011101001011" severity error;

wait for waitTime;
sA_s <= "011101001011";
wait for 1ns;
assert sB_s = "011101001100" 
	report "ADD error at 011101001100" severity error;

wait for waitTime;
sA_s <= "011101001100";
wait for 1ns;
assert sB_s = "011101001101" 
	report "ADD error at 011101001101" severity error;

wait for waitTime;
sA_s <= "011101001101";
wait for 1ns;
assert sB_s = "011101001110" 
	report "ADD error at 011101001110" severity error;

wait for waitTime;
sA_s <= "011101001110";
wait for 1ns;
assert sB_s = "011101001111" 
	report "ADD error at 011101001111" severity error;

wait for waitTime;
sA_s <= "011101001111";
wait for 1ns;
assert sB_s = "011101010000" 
	report "ADD error at 011101010000" severity error;

wait for waitTime;
sA_s <= "011101010000";
wait for 1ns;
assert sB_s = "011101010001" 
	report "ADD error at 011101010001" severity error;

wait for waitTime;
sA_s <= "011101010001";
wait for 1ns;
assert sB_s = "011101010010" 
	report "ADD error at 011101010010" severity error;

wait for waitTime;
sA_s <= "011101010010";
wait for 1ns;
assert sB_s = "011101010011" 
	report "ADD error at 011101010011" severity error;

wait for waitTime;
sA_s <= "011101010011";
wait for 1ns;
assert sB_s = "011101010100" 
	report "ADD error at 011101010100" severity error;

wait for waitTime;
sA_s <= "011101010100";
wait for 1ns;
assert sB_s = "011101010101" 
	report "ADD error at 011101010101" severity error;

wait for waitTime;
sA_s <= "011101010101";
wait for 1ns;
assert sB_s = "011101010110" 
	report "ADD error at 011101010110" severity error;

wait for waitTime;
sA_s <= "011101010110";
wait for 1ns;
assert sB_s = "011101010111" 
	report "ADD error at 011101010111" severity error;

wait for waitTime;
sA_s <= "011101010111";
wait for 1ns;
assert sB_s = "011101011000" 
	report "ADD error at 011101011000" severity error;

wait for waitTime;
sA_s <= "011101011000";
wait for 1ns;
assert sB_s = "011101011001" 
	report "ADD error at 011101011001" severity error;

wait for waitTime;
sA_s <= "011101011001";
wait for 1ns;
assert sB_s = "011101011010" 
	report "ADD error at 011101011010" severity error;

wait for waitTime;
sA_s <= "011101011010";
wait for 1ns;
assert sB_s = "011101011011" 
	report "ADD error at 011101011011" severity error;

wait for waitTime;
sA_s <= "011101011011";
wait for 1ns;
assert sB_s = "011101011100" 
	report "ADD error at 011101011100" severity error;

wait for waitTime;
sA_s <= "011101011100";
wait for 1ns;
assert sB_s = "011101011101" 
	report "ADD error at 011101011101" severity error;

wait for waitTime;
sA_s <= "011101011101";
wait for 1ns;
assert sB_s = "011101011110" 
	report "ADD error at 011101011110" severity error;

wait for waitTime;
sA_s <= "011101011110";
wait for 1ns;
assert sB_s = "011101011111" 
	report "ADD error at 011101011111" severity error;

wait for waitTime;
sA_s <= "011101011111";
wait for 1ns;
assert sB_s = "011101100000" 
	report "ADD error at 011101100000" severity error;

wait for waitTime;
sA_s <= "011101100000";
wait for 1ns;
assert sB_s = "011101100001" 
	report "ADD error at 011101100001" severity error;

wait for waitTime;
sA_s <= "011101100001";
wait for 1ns;
assert sB_s = "011101100010" 
	report "ADD error at 011101100010" severity error;

wait for waitTime;
sA_s <= "011101100010";
wait for 1ns;
assert sB_s = "011101100011" 
	report "ADD error at 011101100011" severity error;

wait for waitTime;
sA_s <= "011101100011";
wait for 1ns;
assert sB_s = "011101100100" 
	report "ADD error at 011101100100" severity error;

wait for waitTime;
sA_s <= "011101100100";
wait for 1ns;
assert sB_s = "011101100101" 
	report "ADD error at 011101100101" severity error;

wait for waitTime;
sA_s <= "011101100101";
wait for 1ns;
assert sB_s = "011101100110" 
	report "ADD error at 011101100110" severity error;

wait for waitTime;
sA_s <= "011101100110";
wait for 1ns;
assert sB_s = "011101100111" 
	report "ADD error at 011101100111" severity error;

wait for waitTime;
sA_s <= "011101100111";
wait for 1ns;
assert sB_s = "011101101000" 
	report "ADD error at 011101101000" severity error;

wait for waitTime;
sA_s <= "011101101000";
wait for 1ns;
assert sB_s = "011101101001" 
	report "ADD error at 011101101001" severity error;

wait for waitTime;
sA_s <= "011101101001";
wait for 1ns;
assert sB_s = "011101101010" 
	report "ADD error at 011101101010" severity error;

wait for waitTime;
sA_s <= "011101101010";
wait for 1ns;
assert sB_s = "011101101011" 
	report "ADD error at 011101101011" severity error;

wait for waitTime;
sA_s <= "011101101011";
wait for 1ns;
assert sB_s = "011101101100" 
	report "ADD error at 011101101100" severity error;

wait for waitTime;
sA_s <= "011101101100";
wait for 1ns;
assert sB_s = "011101101101" 
	report "ADD error at 011101101101" severity error;

wait for waitTime;
sA_s <= "011101101101";
wait for 1ns;
assert sB_s = "011101101110" 
	report "ADD error at 011101101110" severity error;

wait for waitTime;
sA_s <= "011101101110";
wait for 1ns;
assert sB_s = "011101101111" 
	report "ADD error at 011101101111" severity error;

wait for waitTime;
sA_s <= "011101101111";
wait for 1ns;
assert sB_s = "011101110000" 
	report "ADD error at 011101110000" severity error;

wait for waitTime;
sA_s <= "011101110000";
wait for 1ns;
assert sB_s = "011101110001" 
	report "ADD error at 011101110001" severity error;

wait for waitTime;
sA_s <= "011101110001";
wait for 1ns;
assert sB_s = "011101110010" 
	report "ADD error at 011101110010" severity error;

wait for waitTime;
sA_s <= "011101110010";
wait for 1ns;
assert sB_s = "011101110011" 
	report "ADD error at 011101110011" severity error;

wait for waitTime;
sA_s <= "011101110011";
wait for 1ns;
assert sB_s = "011101110100" 
	report "ADD error at 011101110100" severity error;

wait for waitTime;
sA_s <= "011101110100";
wait for 1ns;
assert sB_s = "011101110101" 
	report "ADD error at 011101110101" severity error;

wait for waitTime;
sA_s <= "011101110101";
wait for 1ns;
assert sB_s = "011101110110" 
	report "ADD error at 011101110110" severity error;

wait for waitTime;
sA_s <= "011101110110";
wait for 1ns;
assert sB_s = "011101110111" 
	report "ADD error at 011101110111" severity error;

wait for waitTime;
sA_s <= "011101110111";
wait for 1ns;
assert sB_s = "011101111000" 
	report "ADD error at 011101111000" severity error;

wait for waitTime;
sA_s <= "011101111000";
wait for 1ns;
assert sB_s = "011101111001" 
	report "ADD error at 011101111001" severity error;

wait for waitTime;
sA_s <= "011101111001";
wait for 1ns;
assert sB_s = "011101111010" 
	report "ADD error at 011101111010" severity error;

wait for waitTime;
sA_s <= "011101111010";
wait for 1ns;
assert sB_s = "011101111011" 
	report "ADD error at 011101111011" severity error;

wait for waitTime;
sA_s <= "011101111011";
wait for 1ns;
assert sB_s = "011101111100" 
	report "ADD error at 011101111100" severity error;

wait for waitTime;
sA_s <= "011101111100";
wait for 1ns;
assert sB_s = "011101111101" 
	report "ADD error at 011101111101" severity error;

wait for waitTime;
sA_s <= "011101111101";
wait for 1ns;
assert sB_s = "011101111110" 
	report "ADD error at 011101111110" severity error;

wait for waitTime;
sA_s <= "011101111110";
wait for 1ns;
assert sB_s = "011101111111" 
	report "ADD error at 011101111111" severity error;

wait for waitTime;
sA_s <= "011101111111";
wait for 1ns;
assert sB_s = "011110000000" 
	report "ADD error at 011110000000" severity error;

wait for waitTime;
sA_s <= "011110000000";
wait for 1ns;
assert sB_s = "011110000001" 
	report "ADD error at 011110000001" severity error;

wait for waitTime;
sA_s <= "011110000001";
wait for 1ns;
assert sB_s = "011110000010" 
	report "ADD error at 011110000010" severity error;

wait for waitTime;
sA_s <= "011110000010";
wait for 1ns;
assert sB_s = "011110000011" 
	report "ADD error at 011110000011" severity error;

wait for waitTime;
sA_s <= "011110000011";
wait for 1ns;
assert sB_s = "011110000100" 
	report "ADD error at 011110000100" severity error;

wait for waitTime;
sA_s <= "011110000100";
wait for 1ns;
assert sB_s = "011110000101" 
	report "ADD error at 011110000101" severity error;

wait for waitTime;
sA_s <= "011110000101";
wait for 1ns;
assert sB_s = "011110000110" 
	report "ADD error at 011110000110" severity error;

wait for waitTime;
sA_s <= "011110000110";
wait for 1ns;
assert sB_s = "011110000111" 
	report "ADD error at 011110000111" severity error;

wait for waitTime;
sA_s <= "011110000111";
wait for 1ns;
assert sB_s = "011110001000" 
	report "ADD error at 011110001000" severity error;

wait for waitTime;
sA_s <= "011110001000";
wait for 1ns;
assert sB_s = "011110001001" 
	report "ADD error at 011110001001" severity error;

wait for waitTime;
sA_s <= "011110001001";
wait for 1ns;
assert sB_s = "011110001010" 
	report "ADD error at 011110001010" severity error;

wait for waitTime;
sA_s <= "011110001010";
wait for 1ns;
assert sB_s = "011110001011" 
	report "ADD error at 011110001011" severity error;

wait for waitTime;
sA_s <= "011110001011";
wait for 1ns;
assert sB_s = "011110001100" 
	report "ADD error at 011110001100" severity error;

wait for waitTime;
sA_s <= "011110001100";
wait for 1ns;
assert sB_s = "011110001101" 
	report "ADD error at 011110001101" severity error;

wait for waitTime;
sA_s <= "011110001101";
wait for 1ns;
assert sB_s = "011110001110" 
	report "ADD error at 011110001110" severity error;

wait for waitTime;
sA_s <= "011110001110";
wait for 1ns;
assert sB_s = "011110001111" 
	report "ADD error at 011110001111" severity error;

wait for waitTime;
sA_s <= "011110001111";
wait for 1ns;
assert sB_s = "011110010000" 
	report "ADD error at 011110010000" severity error;

wait for waitTime;
sA_s <= "011110010000";
wait for 1ns;
assert sB_s = "011110010001" 
	report "ADD error at 011110010001" severity error;

wait for waitTime;
sA_s <= "011110010001";
wait for 1ns;
assert sB_s = "011110010010" 
	report "ADD error at 011110010010" severity error;

wait for waitTime;
sA_s <= "011110010010";
wait for 1ns;
assert sB_s = "011110010011" 
	report "ADD error at 011110010011" severity error;

wait for waitTime;
sA_s <= "011110010011";
wait for 1ns;
assert sB_s = "011110010100" 
	report "ADD error at 011110010100" severity error;

wait for waitTime;
sA_s <= "011110010100";
wait for 1ns;
assert sB_s = "011110010101" 
	report "ADD error at 011110010101" severity error;

wait for waitTime;
sA_s <= "011110010101";
wait for 1ns;
assert sB_s = "011110010110" 
	report "ADD error at 011110010110" severity error;

wait for waitTime;
sA_s <= "011110010110";
wait for 1ns;
assert sB_s = "011110010111" 
	report "ADD error at 011110010111" severity error;

wait for waitTime;
sA_s <= "011110010111";
wait for 1ns;
assert sB_s = "011110011000" 
	report "ADD error at 011110011000" severity error;

wait for waitTime;
sA_s <= "011110011000";
wait for 1ns;
assert sB_s = "011110011001" 
	report "ADD error at 011110011001" severity error;

wait for waitTime;
sA_s <= "011110011001";
wait for 1ns;
assert sB_s = "011110011010" 
	report "ADD error at 011110011010" severity error;

wait for waitTime;
sA_s <= "011110011010";
wait for 1ns;
assert sB_s = "011110011011" 
	report "ADD error at 011110011011" severity error;

wait for waitTime;
sA_s <= "011110011011";
wait for 1ns;
assert sB_s = "011110011100" 
	report "ADD error at 011110011100" severity error;

wait for waitTime;
sA_s <= "011110011100";
wait for 1ns;
assert sB_s = "011110011101" 
	report "ADD error at 011110011101" severity error;

wait for waitTime;
sA_s <= "011110011101";
wait for 1ns;
assert sB_s = "011110011110" 
	report "ADD error at 011110011110" severity error;

wait for waitTime;
sA_s <= "011110011110";
wait for 1ns;
assert sB_s = "011110011111" 
	report "ADD error at 011110011111" severity error;

wait for waitTime;
sA_s <= "011110011111";
wait for 1ns;
assert sB_s = "011110100000" 
	report "ADD error at 011110100000" severity error;

wait for waitTime;
sA_s <= "011110100000";
wait for 1ns;
assert sB_s = "011110100001" 
	report "ADD error at 011110100001" severity error;

wait for waitTime;
sA_s <= "011110100001";
wait for 1ns;
assert sB_s = "011110100010" 
	report "ADD error at 011110100010" severity error;

wait for waitTime;
sA_s <= "011110100010";
wait for 1ns;
assert sB_s = "011110100011" 
	report "ADD error at 011110100011" severity error;

wait for waitTime;
sA_s <= "011110100011";
wait for 1ns;
assert sB_s = "011110100100" 
	report "ADD error at 011110100100" severity error;

wait for waitTime;
sA_s <= "011110100100";
wait for 1ns;
assert sB_s = "011110100101" 
	report "ADD error at 011110100101" severity error;

wait for waitTime;
sA_s <= "011110100101";
wait for 1ns;
assert sB_s = "011110100110" 
	report "ADD error at 011110100110" severity error;

wait for waitTime;
sA_s <= "011110100110";
wait for 1ns;
assert sB_s = "011110100111" 
	report "ADD error at 011110100111" severity error;

wait for waitTime;
sA_s <= "011110100111";
wait for 1ns;
assert sB_s = "011110101000" 
	report "ADD error at 011110101000" severity error;

wait for waitTime;
sA_s <= "011110101000";
wait for 1ns;
assert sB_s = "011110101001" 
	report "ADD error at 011110101001" severity error;

wait for waitTime;
sA_s <= "011110101001";
wait for 1ns;
assert sB_s = "011110101010" 
	report "ADD error at 011110101010" severity error;

wait for waitTime;
sA_s <= "011110101010";
wait for 1ns;
assert sB_s = "011110101011" 
	report "ADD error at 011110101011" severity error;

wait for waitTime;
sA_s <= "011110101011";
wait for 1ns;
assert sB_s = "011110101100" 
	report "ADD error at 011110101100" severity error;

wait for waitTime;
sA_s <= "011110101100";
wait for 1ns;
assert sB_s = "011110101101" 
	report "ADD error at 011110101101" severity error;

wait for waitTime;
sA_s <= "011110101101";
wait for 1ns;
assert sB_s = "011110101110" 
	report "ADD error at 011110101110" severity error;

wait for waitTime;
sA_s <= "011110101110";
wait for 1ns;
assert sB_s = "011110101111" 
	report "ADD error at 011110101111" severity error;

wait for waitTime;
sA_s <= "011110101111";
wait for 1ns;
assert sB_s = "011110110000" 
	report "ADD error at 011110110000" severity error;

wait for waitTime;
sA_s <= "011110110000";
wait for 1ns;
assert sB_s = "011110110001" 
	report "ADD error at 011110110001" severity error;

wait for waitTime;
sA_s <= "011110110001";
wait for 1ns;
assert sB_s = "011110110010" 
	report "ADD error at 011110110010" severity error;

wait for waitTime;
sA_s <= "011110110010";
wait for 1ns;
assert sB_s = "011110110011" 
	report "ADD error at 011110110011" severity error;

wait for waitTime;
sA_s <= "011110110011";
wait for 1ns;
assert sB_s = "011110110100" 
	report "ADD error at 011110110100" severity error;

wait for waitTime;
sA_s <= "011110110100";
wait for 1ns;
assert sB_s = "011110110101" 
	report "ADD error at 011110110101" severity error;

wait for waitTime;
sA_s <= "011110110101";
wait for 1ns;
assert sB_s = "011110110110" 
	report "ADD error at 011110110110" severity error;

wait for waitTime;
sA_s <= "011110110110";
wait for 1ns;
assert sB_s = "011110110111" 
	report "ADD error at 011110110111" severity error;

wait for waitTime;
sA_s <= "011110110111";
wait for 1ns;
assert sB_s = "011110111000" 
	report "ADD error at 011110111000" severity error;

wait for waitTime;
sA_s <= "011110111000";
wait for 1ns;
assert sB_s = "011110111001" 
	report "ADD error at 011110111001" severity error;

wait for waitTime;
sA_s <= "011110111001";
wait for 1ns;
assert sB_s = "011110111010" 
	report "ADD error at 011110111010" severity error;

wait for waitTime;
sA_s <= "011110111010";
wait for 1ns;
assert sB_s = "011110111011" 
	report "ADD error at 011110111011" severity error;

wait for waitTime;
sA_s <= "011110111011";
wait for 1ns;
assert sB_s = "011110111100" 
	report "ADD error at 011110111100" severity error;

wait for waitTime;
sA_s <= "011110111100";
wait for 1ns;
assert sB_s = "011110111101" 
	report "ADD error at 011110111101" severity error;

wait for waitTime;
sA_s <= "011110111101";
wait for 1ns;
assert sB_s = "011110111110" 
	report "ADD error at 011110111110" severity error;

wait for waitTime;
sA_s <= "011110111110";
wait for 1ns;
assert sB_s = "011110111111" 
	report "ADD error at 011110111111" severity error;

wait for waitTime;
sA_s <= "011110111111";
wait for 1ns;
assert sB_s = "011111000000" 
	report "ADD error at 011111000000" severity error;

wait for waitTime;
sA_s <= "011111000000";
wait for 1ns;
assert sB_s = "011111000001" 
	report "ADD error at 011111000001" severity error;

wait for waitTime;
sA_s <= "011111000001";
wait for 1ns;
assert sB_s = "011111000010" 
	report "ADD error at 011111000010" severity error;

wait for waitTime;
sA_s <= "011111000010";
wait for 1ns;
assert sB_s = "011111000011" 
	report "ADD error at 011111000011" severity error;

wait for waitTime;
sA_s <= "011111000011";
wait for 1ns;
assert sB_s = "011111000100" 
	report "ADD error at 011111000100" severity error;

wait for waitTime;
sA_s <= "011111000100";
wait for 1ns;
assert sB_s = "011111000101" 
	report "ADD error at 011111000101" severity error;

wait for waitTime;
sA_s <= "011111000101";
wait for 1ns;
assert sB_s = "011111000110" 
	report "ADD error at 011111000110" severity error;

wait for waitTime;
sA_s <= "011111000110";
wait for 1ns;
assert sB_s = "011111000111" 
	report "ADD error at 011111000111" severity error;

wait for waitTime;
sA_s <= "011111000111";
wait for 1ns;
assert sB_s = "011111001000" 
	report "ADD error at 011111001000" severity error;

wait for waitTime;
sA_s <= "011111001000";
wait for 1ns;
assert sB_s = "011111001001" 
	report "ADD error at 011111001001" severity error;

wait for waitTime;
sA_s <= "011111001001";
wait for 1ns;
assert sB_s = "011111001010" 
	report "ADD error at 011111001010" severity error;

wait for waitTime;
sA_s <= "011111001010";
wait for 1ns;
assert sB_s = "011111001011" 
	report "ADD error at 011111001011" severity error;

wait for waitTime;
sA_s <= "011111001011";
wait for 1ns;
assert sB_s = "011111001100" 
	report "ADD error at 011111001100" severity error;

wait for waitTime;
sA_s <= "011111001100";
wait for 1ns;
assert sB_s = "011111001101" 
	report "ADD error at 011111001101" severity error;

wait for waitTime;
sA_s <= "011111001101";
wait for 1ns;
assert sB_s = "011111001110" 
	report "ADD error at 011111001110" severity error;

wait for waitTime;
sA_s <= "011111001110";
wait for 1ns;
assert sB_s = "011111001111" 
	report "ADD error at 011111001111" severity error;

wait for waitTime;
sA_s <= "011111001111";
wait for 1ns;
assert sB_s = "011111010000" 
	report "ADD error at 011111010000" severity error;

wait for waitTime;
sA_s <= "011111010000";
wait for 1ns;
assert sB_s = "011111010001" 
	report "ADD error at 011111010001" severity error;

wait for waitTime;
sA_s <= "011111010001";
wait for 1ns;
assert sB_s = "011111010010" 
	report "ADD error at 011111010010" severity error;

wait for waitTime;
sA_s <= "011111010010";
wait for 1ns;
assert sB_s = "011111010011" 
	report "ADD error at 011111010011" severity error;

wait for waitTime;
sA_s <= "011111010011";
wait for 1ns;
assert sB_s = "011111010100" 
	report "ADD error at 011111010100" severity error;

wait for waitTime;
sA_s <= "011111010100";
wait for 1ns;
assert sB_s = "011111010101" 
	report "ADD error at 011111010101" severity error;

wait for waitTime;
sA_s <= "011111010101";
wait for 1ns;
assert sB_s = "011111010110" 
	report "ADD error at 011111010110" severity error;

wait for waitTime;
sA_s <= "011111010110";
wait for 1ns;
assert sB_s = "011111010111" 
	report "ADD error at 011111010111" severity error;

wait for waitTime;
sA_s <= "011111010111";
wait for 1ns;
assert sB_s = "011111011000" 
	report "ADD error at 011111011000" severity error;

wait for waitTime;
sA_s <= "011111011000";
wait for 1ns;
assert sB_s = "011111011001" 
	report "ADD error at 011111011001" severity error;

wait for waitTime;
sA_s <= "011111011001";
wait for 1ns;
assert sB_s = "011111011010" 
	report "ADD error at 011111011010" severity error;

wait for waitTime;
sA_s <= "011111011010";
wait for 1ns;
assert sB_s = "011111011011" 
	report "ADD error at 011111011011" severity error;

wait for waitTime;
sA_s <= "011111011011";
wait for 1ns;
assert sB_s = "011111011100" 
	report "ADD error at 011111011100" severity error;

wait for waitTime;
sA_s <= "011111011100";
wait for 1ns;
assert sB_s = "011111011101" 
	report "ADD error at 011111011101" severity error;

wait for waitTime;
sA_s <= "011111011101";
wait for 1ns;
assert sB_s = "011111011110" 
	report "ADD error at 011111011110" severity error;

wait for waitTime;
sA_s <= "011111011110";
wait for 1ns;
assert sB_s = "011111011111" 
	report "ADD error at 011111011111" severity error;

wait for waitTime;
sA_s <= "011111011111";
wait for 1ns;
assert sB_s = "011111100000" 
	report "ADD error at 011111100000" severity error;

wait for waitTime;
sA_s <= "011111100000";
wait for 1ns;
assert sB_s = "011111100001" 
	report "ADD error at 011111100001" severity error;

wait for waitTime;
sA_s <= "011111100001";
wait for 1ns;
assert sB_s = "011111100010" 
	report "ADD error at 011111100010" severity error;

wait for waitTime;
sA_s <= "011111100010";
wait for 1ns;
assert sB_s = "011111100011" 
	report "ADD error at 011111100011" severity error;

wait for waitTime;
sA_s <= "011111100011";
wait for 1ns;
assert sB_s = "011111100100" 
	report "ADD error at 011111100100" severity error;

wait for waitTime;
sA_s <= "011111100100";
wait for 1ns;
assert sB_s = "011111100101" 
	report "ADD error at 011111100101" severity error;

wait for waitTime;
sA_s <= "011111100101";
wait for 1ns;
assert sB_s = "011111100110" 
	report "ADD error at 011111100110" severity error;

wait for waitTime;
sA_s <= "011111100110";
wait for 1ns;
assert sB_s = "011111100111" 
	report "ADD error at 011111100111" severity error;

wait for waitTime;
sA_s <= "011111100111";
wait for 1ns;
assert sB_s = "011111101000" 
	report "ADD error at 011111101000" severity error;

wait for waitTime;
sA_s <= "011111101000";
wait for 1ns;
assert sB_s = "011111101001" 
	report "ADD error at 011111101001" severity error;

wait for waitTime;
sA_s <= "011111101001";
wait for 1ns;
assert sB_s = "011111101010" 
	report "ADD error at 011111101010" severity error;

wait for waitTime;
sA_s <= "011111101010";
wait for 1ns;
assert sB_s = "011111101011" 
	report "ADD error at 011111101011" severity error;

wait for waitTime;
sA_s <= "011111101011";
wait for 1ns;
assert sB_s = "011111101100" 
	report "ADD error at 011111101100" severity error;

wait for waitTime;
sA_s <= "011111101100";
wait for 1ns;
assert sB_s = "011111101101" 
	report "ADD error at 011111101101" severity error;

wait for waitTime;
sA_s <= "011111101101";
wait for 1ns;
assert sB_s = "011111101110" 
	report "ADD error at 011111101110" severity error;

wait for waitTime;
sA_s <= "011111101110";
wait for 1ns;
assert sB_s = "011111101111" 
	report "ADD error at 011111101111" severity error;

wait for waitTime;
sA_s <= "011111101111";
wait for 1ns;
assert sB_s = "011111110000" 
	report "ADD error at 011111110000" severity error;

wait for waitTime;
sA_s <= "011111110000";
wait for 1ns;
assert sB_s = "011111110001" 
	report "ADD error at 011111110001" severity error;

wait for waitTime;
sA_s <= "011111110001";
wait for 1ns;
assert sB_s = "011111110010" 
	report "ADD error at 011111110010" severity error;

wait for waitTime;
sA_s <= "011111110010";
wait for 1ns;
assert sB_s = "011111110011" 
	report "ADD error at 011111110011" severity error;

wait for waitTime;
sA_s <= "011111110011";
wait for 1ns;
assert sB_s = "011111110100" 
	report "ADD error at 011111110100" severity error;

wait for waitTime;
sA_s <= "011111110100";
wait for 1ns;
assert sB_s = "011111110101" 
	report "ADD error at 011111110101" severity error;

wait for waitTime;
sA_s <= "011111110101";
wait for 1ns;
assert sB_s = "011111110110" 
	report "ADD error at 011111110110" severity error;

wait for waitTime;
sA_s <= "011111110110";
wait for 1ns;
assert sB_s = "011111110111" 
	report "ADD error at 011111110111" severity error;

wait for waitTime;
sA_s <= "011111110111";
wait for 1ns;
assert sB_s = "011111111000" 
	report "ADD error at 011111111000" severity error;

wait for waitTime;
sA_s <= "011111111000";
wait for 1ns;
assert sB_s = "011111111001" 
	report "ADD error at 011111111001" severity error;

wait for waitTime;
sA_s <= "011111111001";
wait for 1ns;
assert sB_s = "011111111010" 
	report "ADD error at 011111111010" severity error;

wait for waitTime;
sA_s <= "011111111010";
wait for 1ns;
assert sB_s = "011111111011" 
	report "ADD error at 011111111011" severity error;

wait for waitTime;
sA_s <= "011111111011";
wait for 1ns;
assert sB_s = "011111111100" 
	report "ADD error at 011111111100" severity error;

wait for waitTime;
sA_s <= "011111111100";
wait for 1ns;
assert sB_s = "011111111101" 
	report "ADD error at 011111111101" severity error;

wait for waitTime;
sA_s <= "011111111101";
wait for 1ns;
assert sB_s = "011111111110" 
	report "ADD error at 011111111110" severity error;

wait for waitTime;
sA_s <= "011111111110";
wait for 1ns;
assert sB_s = "011111111111" 
	report "ADD error at 011111111111" severity error;

wait for waitTime;
sA_s <= "011111111111";
wait for 1ns;
assert sB_s = "100000000000" 
	report "ADD error at 100000000000" severity error;

wait for waitTime;
sA_s <= "100000000000";
wait for 1ns;
assert sB_s = "100000000001" 
	report "ADD error at 100000000001" severity error;

wait for waitTime;
sA_s <= "100000000001";
wait for 1ns;
assert sB_s = "100000000010" 
	report "ADD error at 100000000010" severity error;

wait for waitTime;
sA_s <= "100000000010";
wait for 1ns;
assert sB_s = "100000000011" 
	report "ADD error at 100000000011" severity error;

wait for waitTime;
sA_s <= "100000000011";
wait for 1ns;
assert sB_s = "100000000100" 
	report "ADD error at 100000000100" severity error;

wait for waitTime;
sA_s <= "100000000100";
wait for 1ns;
assert sB_s = "100000000101" 
	report "ADD error at 100000000101" severity error;

wait for waitTime;
sA_s <= "100000000101";
wait for 1ns;
assert sB_s = "100000000110" 
	report "ADD error at 100000000110" severity error;

wait for waitTime;
sA_s <= "100000000110";
wait for 1ns;
assert sB_s = "100000000111" 
	report "ADD error at 100000000111" severity error;

wait for waitTime;
sA_s <= "100000000111";
wait for 1ns;
assert sB_s = "100000001000" 
	report "ADD error at 100000001000" severity error;

wait for waitTime;
sA_s <= "100000001000";
wait for 1ns;
assert sB_s = "100000001001" 
	report "ADD error at 100000001001" severity error;

wait for waitTime;
sA_s <= "100000001001";
wait for 1ns;
assert sB_s = "100000001010" 
	report "ADD error at 100000001010" severity error;

wait for waitTime;
sA_s <= "100000001010";
wait for 1ns;
assert sB_s = "100000001011" 
	report "ADD error at 100000001011" severity error;

wait for waitTime;
sA_s <= "100000001011";
wait for 1ns;
assert sB_s = "100000001100" 
	report "ADD error at 100000001100" severity error;

wait for waitTime;
sA_s <= "100000001100";
wait for 1ns;
assert sB_s = "100000001101" 
	report "ADD error at 100000001101" severity error;

wait for waitTime;
sA_s <= "100000001101";
wait for 1ns;
assert sB_s = "100000001110" 
	report "ADD error at 100000001110" severity error;

wait for waitTime;
sA_s <= "100000001110";
wait for 1ns;
assert sB_s = "100000001111" 
	report "ADD error at 100000001111" severity error;

wait for waitTime;
sA_s <= "100000001111";
wait for 1ns;
assert sB_s = "100000010000" 
	report "ADD error at 100000010000" severity error;

wait for waitTime;
sA_s <= "100000010000";
wait for 1ns;
assert sB_s = "100000010001" 
	report "ADD error at 100000010001" severity error;

wait for waitTime;
sA_s <= "100000010001";
wait for 1ns;
assert sB_s = "100000010010" 
	report "ADD error at 100000010010" severity error;

wait for waitTime;
sA_s <= "100000010010";
wait for 1ns;
assert sB_s = "100000010011" 
	report "ADD error at 100000010011" severity error;

wait for waitTime;
sA_s <= "100000010011";
wait for 1ns;
assert sB_s = "100000010100" 
	report "ADD error at 100000010100" severity error;

wait for waitTime;
sA_s <= "100000010100";
wait for 1ns;
assert sB_s = "100000010101" 
	report "ADD error at 100000010101" severity error;

wait for waitTime;
sA_s <= "100000010101";
wait for 1ns;
assert sB_s = "100000010110" 
	report "ADD error at 100000010110" severity error;

wait for waitTime;
sA_s <= "100000010110";
wait for 1ns;
assert sB_s = "100000010111" 
	report "ADD error at 100000010111" severity error;

wait for waitTime;
sA_s <= "100000010111";
wait for 1ns;
assert sB_s = "100000011000" 
	report "ADD error at 100000011000" severity error;

wait for waitTime;
sA_s <= "100000011000";
wait for 1ns;
assert sB_s = "100000011001" 
	report "ADD error at 100000011001" severity error;

wait for waitTime;
sA_s <= "100000011001";
wait for 1ns;
assert sB_s = "100000011010" 
	report "ADD error at 100000011010" severity error;

wait for waitTime;
sA_s <= "100000011010";
wait for 1ns;
assert sB_s = "100000011011" 
	report "ADD error at 100000011011" severity error;

wait for waitTime;
sA_s <= "100000011011";
wait for 1ns;
assert sB_s = "100000011100" 
	report "ADD error at 100000011100" severity error;

wait for waitTime;
sA_s <= "100000011100";
wait for 1ns;
assert sB_s = "100000011101" 
	report "ADD error at 100000011101" severity error;

wait for waitTime;
sA_s <= "100000011101";
wait for 1ns;
assert sB_s = "100000011110" 
	report "ADD error at 100000011110" severity error;

wait for waitTime;
sA_s <= "100000011110";
wait for 1ns;
assert sB_s = "100000011111" 
	report "ADD error at 100000011111" severity error;

wait for waitTime;
sA_s <= "100000011111";
wait for 1ns;
assert sB_s = "100000100000" 
	report "ADD error at 100000100000" severity error;

wait for waitTime;
sA_s <= "100000100000";
wait for 1ns;
assert sB_s = "100000100001" 
	report "ADD error at 100000100001" severity error;

wait for waitTime;
sA_s <= "100000100001";
wait for 1ns;
assert sB_s = "100000100010" 
	report "ADD error at 100000100010" severity error;

wait for waitTime;
sA_s <= "100000100010";
wait for 1ns;
assert sB_s = "100000100011" 
	report "ADD error at 100000100011" severity error;

wait for waitTime;
sA_s <= "100000100011";
wait for 1ns;
assert sB_s = "100000100100" 
	report "ADD error at 100000100100" severity error;

wait for waitTime;
sA_s <= "100000100100";
wait for 1ns;
assert sB_s = "100000100101" 
	report "ADD error at 100000100101" severity error;

wait for waitTime;
sA_s <= "100000100101";
wait for 1ns;
assert sB_s = "100000100110" 
	report "ADD error at 100000100110" severity error;

wait for waitTime;
sA_s <= "100000100110";
wait for 1ns;
assert sB_s = "100000100111" 
	report "ADD error at 100000100111" severity error;

wait for waitTime;
sA_s <= "100000100111";
wait for 1ns;
assert sB_s = "100000101000" 
	report "ADD error at 100000101000" severity error;

wait for waitTime;
sA_s <= "100000101000";
wait for 1ns;
assert sB_s = "100000101001" 
	report "ADD error at 100000101001" severity error;

wait for waitTime;
sA_s <= "100000101001";
wait for 1ns;
assert sB_s = "100000101010" 
	report "ADD error at 100000101010" severity error;

wait for waitTime;
sA_s <= "100000101010";
wait for 1ns;
assert sB_s = "100000101011" 
	report "ADD error at 100000101011" severity error;

wait for waitTime;
sA_s <= "100000101011";
wait for 1ns;
assert sB_s = "100000101100" 
	report "ADD error at 100000101100" severity error;

wait for waitTime;
sA_s <= "100000101100";
wait for 1ns;
assert sB_s = "100000101101" 
	report "ADD error at 100000101101" severity error;

wait for waitTime;
sA_s <= "100000101101";
wait for 1ns;
assert sB_s = "100000101110" 
	report "ADD error at 100000101110" severity error;

wait for waitTime;
sA_s <= "100000101110";
wait for 1ns;
assert sB_s = "100000101111" 
	report "ADD error at 100000101111" severity error;

wait for waitTime;
sA_s <= "100000101111";
wait for 1ns;
assert sB_s = "100000110000" 
	report "ADD error at 100000110000" severity error;

wait for waitTime;
sA_s <= "100000110000";
wait for 1ns;
assert sB_s = "100000110001" 
	report "ADD error at 100000110001" severity error;

wait for waitTime;
sA_s <= "100000110001";
wait for 1ns;
assert sB_s = "100000110010" 
	report "ADD error at 100000110010" severity error;

wait for waitTime;
sA_s <= "100000110010";
wait for 1ns;
assert sB_s = "100000110011" 
	report "ADD error at 100000110011" severity error;

wait for waitTime;
sA_s <= "100000110011";
wait for 1ns;
assert sB_s = "100000110100" 
	report "ADD error at 100000110100" severity error;

wait for waitTime;
sA_s <= "100000110100";
wait for 1ns;
assert sB_s = "100000110101" 
	report "ADD error at 100000110101" severity error;

wait for waitTime;
sA_s <= "100000110101";
wait for 1ns;
assert sB_s = "100000110110" 
	report "ADD error at 100000110110" severity error;

wait for waitTime;
sA_s <= "100000110110";
wait for 1ns;
assert sB_s = "100000110111" 
	report "ADD error at 100000110111" severity error;

wait for waitTime;
sA_s <= "100000110111";
wait for 1ns;
assert sB_s = "100000111000" 
	report "ADD error at 100000111000" severity error;

wait for waitTime;
sA_s <= "100000111000";
wait for 1ns;
assert sB_s = "100000111001" 
	report "ADD error at 100000111001" severity error;

wait for waitTime;
sA_s <= "100000111001";
wait for 1ns;
assert sB_s = "100000111010" 
	report "ADD error at 100000111010" severity error;

wait for waitTime;
sA_s <= "100000111010";
wait for 1ns;
assert sB_s = "100000111011" 
	report "ADD error at 100000111011" severity error;

wait for waitTime;
sA_s <= "100000111011";
wait for 1ns;
assert sB_s = "100000111100" 
	report "ADD error at 100000111100" severity error;

wait for waitTime;
sA_s <= "100000111100";
wait for 1ns;
assert sB_s = "100000111101" 
	report "ADD error at 100000111101" severity error;

wait for waitTime;
sA_s <= "100000111101";
wait for 1ns;
assert sB_s = "100000111110" 
	report "ADD error at 100000111110" severity error;

wait for waitTime;
sA_s <= "100000111110";
wait for 1ns;
assert sB_s = "100000111111" 
	report "ADD error at 100000111111" severity error;

wait for waitTime;
sA_s <= "100000111111";
wait for 1ns;
assert sB_s = "100001000000" 
	report "ADD error at 100001000000" severity error;

wait for waitTime;
sA_s <= "100001000000";
wait for 1ns;
assert sB_s = "100001000001" 
	report "ADD error at 100001000001" severity error;

wait for waitTime;
sA_s <= "100001000001";
wait for 1ns;
assert sB_s = "100001000010" 
	report "ADD error at 100001000010" severity error;

wait for waitTime;
sA_s <= "100001000010";
wait for 1ns;
assert sB_s = "100001000011" 
	report "ADD error at 100001000011" severity error;

wait for waitTime;
sA_s <= "100001000011";
wait for 1ns;
assert sB_s = "100001000100" 
	report "ADD error at 100001000100" severity error;

wait for waitTime;
sA_s <= "100001000100";
wait for 1ns;
assert sB_s = "100001000101" 
	report "ADD error at 100001000101" severity error;

wait for waitTime;
sA_s <= "100001000101";
wait for 1ns;
assert sB_s = "100001000110" 
	report "ADD error at 100001000110" severity error;

wait for waitTime;
sA_s <= "100001000110";
wait for 1ns;
assert sB_s = "100001000111" 
	report "ADD error at 100001000111" severity error;

wait for waitTime;
sA_s <= "100001000111";
wait for 1ns;
assert sB_s = "100001001000" 
	report "ADD error at 100001001000" severity error;

wait for waitTime;
sA_s <= "100001001000";
wait for 1ns;
assert sB_s = "100001001001" 
	report "ADD error at 100001001001" severity error;

wait for waitTime;
sA_s <= "100001001001";
wait for 1ns;
assert sB_s = "100001001010" 
	report "ADD error at 100001001010" severity error;

wait for waitTime;
sA_s <= "100001001010";
wait for 1ns;
assert sB_s = "100001001011" 
	report "ADD error at 100001001011" severity error;

wait for waitTime;
sA_s <= "100001001011";
wait for 1ns;
assert sB_s = "100001001100" 
	report "ADD error at 100001001100" severity error;

wait for waitTime;
sA_s <= "100001001100";
wait for 1ns;
assert sB_s = "100001001101" 
	report "ADD error at 100001001101" severity error;

wait for waitTime;
sA_s <= "100001001101";
wait for 1ns;
assert sB_s = "100001001110" 
	report "ADD error at 100001001110" severity error;

wait for waitTime;
sA_s <= "100001001110";
wait for 1ns;
assert sB_s = "100001001111" 
	report "ADD error at 100001001111" severity error;

wait for waitTime;
sA_s <= "100001001111";
wait for 1ns;
assert sB_s = "100001010000" 
	report "ADD error at 100001010000" severity error;

wait for waitTime;
sA_s <= "100001010000";
wait for 1ns;
assert sB_s = "100001010001" 
	report "ADD error at 100001010001" severity error;

wait for waitTime;
sA_s <= "100001010001";
wait for 1ns;
assert sB_s = "100001010010" 
	report "ADD error at 100001010010" severity error;

wait for waitTime;
sA_s <= "100001010010";
wait for 1ns;
assert sB_s = "100001010011" 
	report "ADD error at 100001010011" severity error;

wait for waitTime;
sA_s <= "100001010011";
wait for 1ns;
assert sB_s = "100001010100" 
	report "ADD error at 100001010100" severity error;

wait for waitTime;
sA_s <= "100001010100";
wait for 1ns;
assert sB_s = "100001010101" 
	report "ADD error at 100001010101" severity error;

wait for waitTime;
sA_s <= "100001010101";
wait for 1ns;
assert sB_s = "100001010110" 
	report "ADD error at 100001010110" severity error;

wait for waitTime;
sA_s <= "100001010110";
wait for 1ns;
assert sB_s = "100001010111" 
	report "ADD error at 100001010111" severity error;

wait for waitTime;
sA_s <= "100001010111";
wait for 1ns;
assert sB_s = "100001011000" 
	report "ADD error at 100001011000" severity error;

wait for waitTime;
sA_s <= "100001011000";
wait for 1ns;
assert sB_s = "100001011001" 
	report "ADD error at 100001011001" severity error;

wait for waitTime;
sA_s <= "100001011001";
wait for 1ns;
assert sB_s = "100001011010" 
	report "ADD error at 100001011010" severity error;

wait for waitTime;
sA_s <= "100001011010";
wait for 1ns;
assert sB_s = "100001011011" 
	report "ADD error at 100001011011" severity error;

wait for waitTime;
sA_s <= "100001011011";
wait for 1ns;
assert sB_s = "100001011100" 
	report "ADD error at 100001011100" severity error;

wait for waitTime;
sA_s <= "100001011100";
wait for 1ns;
assert sB_s = "100001011101" 
	report "ADD error at 100001011101" severity error;

wait for waitTime;
sA_s <= "100001011101";
wait for 1ns;
assert sB_s = "100001011110" 
	report "ADD error at 100001011110" severity error;

wait for waitTime;
sA_s <= "100001011110";
wait for 1ns;
assert sB_s = "100001011111" 
	report "ADD error at 100001011111" severity error;

wait for waitTime;
sA_s <= "100001011111";
wait for 1ns;
assert sB_s = "100001100000" 
	report "ADD error at 100001100000" severity error;

wait for waitTime;
sA_s <= "100001100000";
wait for 1ns;
assert sB_s = "100001100001" 
	report "ADD error at 100001100001" severity error;

wait for waitTime;
sA_s <= "100001100001";
wait for 1ns;
assert sB_s = "100001100010" 
	report "ADD error at 100001100010" severity error;

wait for waitTime;
sA_s <= "100001100010";
wait for 1ns;
assert sB_s = "100001100011" 
	report "ADD error at 100001100011" severity error;

wait for waitTime;
sA_s <= "100001100011";
wait for 1ns;
assert sB_s = "100001100100" 
	report "ADD error at 100001100100" severity error;

wait for waitTime;
sA_s <= "100001100100";
wait for 1ns;
assert sB_s = "100001100101" 
	report "ADD error at 100001100101" severity error;

wait for waitTime;
sA_s <= "100001100101";
wait for 1ns;
assert sB_s = "100001100110" 
	report "ADD error at 100001100110" severity error;

wait for waitTime;
sA_s <= "100001100110";
wait for 1ns;
assert sB_s = "100001100111" 
	report "ADD error at 100001100111" severity error;

wait for waitTime;
sA_s <= "100001100111";
wait for 1ns;
assert sB_s = "100001101000" 
	report "ADD error at 100001101000" severity error;

wait for waitTime;
sA_s <= "100001101000";
wait for 1ns;
assert sB_s = "100001101001" 
	report "ADD error at 100001101001" severity error;

wait for waitTime;
sA_s <= "100001101001";
wait for 1ns;
assert sB_s = "100001101010" 
	report "ADD error at 100001101010" severity error;

wait for waitTime;
sA_s <= "100001101010";
wait for 1ns;
assert sB_s = "100001101011" 
	report "ADD error at 100001101011" severity error;

wait for waitTime;
sA_s <= "100001101011";
wait for 1ns;
assert sB_s = "100001101100" 
	report "ADD error at 100001101100" severity error;

wait for waitTime;
sA_s <= "100001101100";
wait for 1ns;
assert sB_s = "100001101101" 
	report "ADD error at 100001101101" severity error;

wait for waitTime;
sA_s <= "100001101101";
wait for 1ns;
assert sB_s = "100001101110" 
	report "ADD error at 100001101110" severity error;

wait for waitTime;
sA_s <= "100001101110";
wait for 1ns;
assert sB_s = "100001101111" 
	report "ADD error at 100001101111" severity error;

wait for waitTime;
sA_s <= "100001101111";
wait for 1ns;
assert sB_s = "100001110000" 
	report "ADD error at 100001110000" severity error;

wait for waitTime;
sA_s <= "100001110000";
wait for 1ns;
assert sB_s = "100001110001" 
	report "ADD error at 100001110001" severity error;

wait for waitTime;
sA_s <= "100001110001";
wait for 1ns;
assert sB_s = "100001110010" 
	report "ADD error at 100001110010" severity error;

wait for waitTime;
sA_s <= "100001110010";
wait for 1ns;
assert sB_s = "100001110011" 
	report "ADD error at 100001110011" severity error;

wait for waitTime;
sA_s <= "100001110011";
wait for 1ns;
assert sB_s = "100001110100" 
	report "ADD error at 100001110100" severity error;

wait for waitTime;
sA_s <= "100001110100";
wait for 1ns;
assert sB_s = "100001110101" 
	report "ADD error at 100001110101" severity error;

wait for waitTime;
sA_s <= "100001110101";
wait for 1ns;
assert sB_s = "100001110110" 
	report "ADD error at 100001110110" severity error;

wait for waitTime;
sA_s <= "100001110110";
wait for 1ns;
assert sB_s = "100001110111" 
	report "ADD error at 100001110111" severity error;

wait for waitTime;
sA_s <= "100001110111";
wait for 1ns;
assert sB_s = "100001111000" 
	report "ADD error at 100001111000" severity error;

wait for waitTime;
sA_s <= "100001111000";
wait for 1ns;
assert sB_s = "100001111001" 
	report "ADD error at 100001111001" severity error;

wait for waitTime;
sA_s <= "100001111001";
wait for 1ns;
assert sB_s = "100001111010" 
	report "ADD error at 100001111010" severity error;

wait for waitTime;
sA_s <= "100001111010";
wait for 1ns;
assert sB_s = "100001111011" 
	report "ADD error at 100001111011" severity error;

wait for waitTime;
sA_s <= "100001111011";
wait for 1ns;
assert sB_s = "100001111100" 
	report "ADD error at 100001111100" severity error;

wait for waitTime;
sA_s <= "100001111100";
wait for 1ns;
assert sB_s = "100001111101" 
	report "ADD error at 100001111101" severity error;

wait for waitTime;
sA_s <= "100001111101";
wait for 1ns;
assert sB_s = "100001111110" 
	report "ADD error at 100001111110" severity error;

wait for waitTime;
sA_s <= "100001111110";
wait for 1ns;
assert sB_s = "100001111111" 
	report "ADD error at 100001111111" severity error;

wait for waitTime;
sA_s <= "100001111111";
wait for 1ns;
assert sB_s = "100010000000" 
	report "ADD error at 100010000000" severity error;

wait for waitTime;
sA_s <= "100010000000";
wait for 1ns;
assert sB_s = "100010000001" 
	report "ADD error at 100010000001" severity error;

wait for waitTime;
sA_s <= "100010000001";
wait for 1ns;
assert sB_s = "100010000010" 
	report "ADD error at 100010000010" severity error;

wait for waitTime;
sA_s <= "100010000010";
wait for 1ns;
assert sB_s = "100010000011" 
	report "ADD error at 100010000011" severity error;

wait for waitTime;
sA_s <= "100010000011";
wait for 1ns;
assert sB_s = "100010000100" 
	report "ADD error at 100010000100" severity error;

wait for waitTime;
sA_s <= "100010000100";
wait for 1ns;
assert sB_s = "100010000101" 
	report "ADD error at 100010000101" severity error;

wait for waitTime;
sA_s <= "100010000101";
wait for 1ns;
assert sB_s = "100010000110" 
	report "ADD error at 100010000110" severity error;

wait for waitTime;
sA_s <= "100010000110";
wait for 1ns;
assert sB_s = "100010000111" 
	report "ADD error at 100010000111" severity error;

wait for waitTime;
sA_s <= "100010000111";
wait for 1ns;
assert sB_s = "100010001000" 
	report "ADD error at 100010001000" severity error;

wait for waitTime;
sA_s <= "100010001000";
wait for 1ns;
assert sB_s = "100010001001" 
	report "ADD error at 100010001001" severity error;

wait for waitTime;
sA_s <= "100010001001";
wait for 1ns;
assert sB_s = "100010001010" 
	report "ADD error at 100010001010" severity error;

wait for waitTime;
sA_s <= "100010001010";
wait for 1ns;
assert sB_s = "100010001011" 
	report "ADD error at 100010001011" severity error;

wait for waitTime;
sA_s <= "100010001011";
wait for 1ns;
assert sB_s = "100010001100" 
	report "ADD error at 100010001100" severity error;

wait for waitTime;
sA_s <= "100010001100";
wait for 1ns;
assert sB_s = "100010001101" 
	report "ADD error at 100010001101" severity error;

wait for waitTime;
sA_s <= "100010001101";
wait for 1ns;
assert sB_s = "100010001110" 
	report "ADD error at 100010001110" severity error;

wait for waitTime;
sA_s <= "100010001110";
wait for 1ns;
assert sB_s = "100010001111" 
	report "ADD error at 100010001111" severity error;

wait for waitTime;
sA_s <= "100010001111";
wait for 1ns;
assert sB_s = "100010010000" 
	report "ADD error at 100010010000" severity error;

wait for waitTime;
sA_s <= "100010010000";
wait for 1ns;
assert sB_s = "100010010001" 
	report "ADD error at 100010010001" severity error;

wait for waitTime;
sA_s <= "100010010001";
wait for 1ns;
assert sB_s = "100010010010" 
	report "ADD error at 100010010010" severity error;

wait for waitTime;
sA_s <= "100010010010";
wait for 1ns;
assert sB_s = "100010010011" 
	report "ADD error at 100010010011" severity error;

wait for waitTime;
sA_s <= "100010010011";
wait for 1ns;
assert sB_s = "100010010100" 
	report "ADD error at 100010010100" severity error;

wait for waitTime;
sA_s <= "100010010100";
wait for 1ns;
assert sB_s = "100010010101" 
	report "ADD error at 100010010101" severity error;

wait for waitTime;
sA_s <= "100010010101";
wait for 1ns;
assert sB_s = "100010010110" 
	report "ADD error at 100010010110" severity error;

wait for waitTime;
sA_s <= "100010010110";
wait for 1ns;
assert sB_s = "100010010111" 
	report "ADD error at 100010010111" severity error;

wait for waitTime;
sA_s <= "100010010111";
wait for 1ns;
assert sB_s = "100010011000" 
	report "ADD error at 100010011000" severity error;

wait for waitTime;
sA_s <= "100010011000";
wait for 1ns;
assert sB_s = "100010011001" 
	report "ADD error at 100010011001" severity error;

wait for waitTime;
sA_s <= "100010011001";
wait for 1ns;
assert sB_s = "100010011010" 
	report "ADD error at 100010011010" severity error;

wait for waitTime;
sA_s <= "100010011010";
wait for 1ns;
assert sB_s = "100010011011" 
	report "ADD error at 100010011011" severity error;

wait for waitTime;
sA_s <= "100010011011";
wait for 1ns;
assert sB_s = "100010011100" 
	report "ADD error at 100010011100" severity error;

wait for waitTime;
sA_s <= "100010011100";
wait for 1ns;
assert sB_s = "100010011101" 
	report "ADD error at 100010011101" severity error;

wait for waitTime;
sA_s <= "100010011101";
wait for 1ns;
assert sB_s = "100010011110" 
	report "ADD error at 100010011110" severity error;

wait for waitTime;
sA_s <= "100010011110";
wait for 1ns;
assert sB_s = "100010011111" 
	report "ADD error at 100010011111" severity error;

wait for waitTime;
sA_s <= "100010011111";
wait for 1ns;
assert sB_s = "100010100000" 
	report "ADD error at 100010100000" severity error;

wait for waitTime;
sA_s <= "100010100000";
wait for 1ns;
assert sB_s = "100010100001" 
	report "ADD error at 100010100001" severity error;

wait for waitTime;
sA_s <= "100010100001";
wait for 1ns;
assert sB_s = "100010100010" 
	report "ADD error at 100010100010" severity error;

wait for waitTime;
sA_s <= "100010100010";
wait for 1ns;
assert sB_s = "100010100011" 
	report "ADD error at 100010100011" severity error;

wait for waitTime;
sA_s <= "100010100011";
wait for 1ns;
assert sB_s = "100010100100" 
	report "ADD error at 100010100100" severity error;

wait for waitTime;
sA_s <= "100010100100";
wait for 1ns;
assert sB_s = "100010100101" 
	report "ADD error at 100010100101" severity error;

wait for waitTime;
sA_s <= "100010100101";
wait for 1ns;
assert sB_s = "100010100110" 
	report "ADD error at 100010100110" severity error;

wait for waitTime;
sA_s <= "100010100110";
wait for 1ns;
assert sB_s = "100010100111" 
	report "ADD error at 100010100111" severity error;

wait for waitTime;
sA_s <= "100010100111";
wait for 1ns;
assert sB_s = "100010101000" 
	report "ADD error at 100010101000" severity error;

wait for waitTime;
sA_s <= "100010101000";
wait for 1ns;
assert sB_s = "100010101001" 
	report "ADD error at 100010101001" severity error;

wait for waitTime;
sA_s <= "100010101001";
wait for 1ns;
assert sB_s = "100010101010" 
	report "ADD error at 100010101010" severity error;

wait for waitTime;
sA_s <= "100010101010";
wait for 1ns;
assert sB_s = "100010101011" 
	report "ADD error at 100010101011" severity error;

wait for waitTime;
sA_s <= "100010101011";
wait for 1ns;
assert sB_s = "100010101100" 
	report "ADD error at 100010101100" severity error;

wait for waitTime;
sA_s <= "100010101100";
wait for 1ns;
assert sB_s = "100010101101" 
	report "ADD error at 100010101101" severity error;

wait for waitTime;
sA_s <= "100010101101";
wait for 1ns;
assert sB_s = "100010101110" 
	report "ADD error at 100010101110" severity error;

wait for waitTime;
sA_s <= "100010101110";
wait for 1ns;
assert sB_s = "100010101111" 
	report "ADD error at 100010101111" severity error;

wait for waitTime;
sA_s <= "100010101111";
wait for 1ns;
assert sB_s = "100010110000" 
	report "ADD error at 100010110000" severity error;

wait for waitTime;
sA_s <= "100010110000";
wait for 1ns;
assert sB_s = "100010110001" 
	report "ADD error at 100010110001" severity error;

wait for waitTime;
sA_s <= "100010110001";
wait for 1ns;
assert sB_s = "100010110010" 
	report "ADD error at 100010110010" severity error;

wait for waitTime;
sA_s <= "100010110010";
wait for 1ns;
assert sB_s = "100010110011" 
	report "ADD error at 100010110011" severity error;

wait for waitTime;
sA_s <= "100010110011";
wait for 1ns;
assert sB_s = "100010110100" 
	report "ADD error at 100010110100" severity error;

wait for waitTime;
sA_s <= "100010110100";
wait for 1ns;
assert sB_s = "100010110101" 
	report "ADD error at 100010110101" severity error;

wait for waitTime;
sA_s <= "100010110101";
wait for 1ns;
assert sB_s = "100010110110" 
	report "ADD error at 100010110110" severity error;

wait for waitTime;
sA_s <= "100010110110";
wait for 1ns;
assert sB_s = "100010110111" 
	report "ADD error at 100010110111" severity error;

wait for waitTime;
sA_s <= "100010110111";
wait for 1ns;
assert sB_s = "100010111000" 
	report "ADD error at 100010111000" severity error;

wait for waitTime;
sA_s <= "100010111000";
wait for 1ns;
assert sB_s = "100010111001" 
	report "ADD error at 100010111001" severity error;

wait for waitTime;
sA_s <= "100010111001";
wait for 1ns;
assert sB_s = "100010111010" 
	report "ADD error at 100010111010" severity error;

wait for waitTime;
sA_s <= "100010111010";
wait for 1ns;
assert sB_s = "100010111011" 
	report "ADD error at 100010111011" severity error;

wait for waitTime;
sA_s <= "100010111011";
wait for 1ns;
assert sB_s = "100010111100" 
	report "ADD error at 100010111100" severity error;

wait for waitTime;
sA_s <= "100010111100";
wait for 1ns;
assert sB_s = "100010111101" 
	report "ADD error at 100010111101" severity error;

wait for waitTime;
sA_s <= "100010111101";
wait for 1ns;
assert sB_s = "100010111110" 
	report "ADD error at 100010111110" severity error;

wait for waitTime;
sA_s <= "100010111110";
wait for 1ns;
assert sB_s = "100010111111" 
	report "ADD error at 100010111111" severity error;

wait for waitTime;
sA_s <= "100010111111";
wait for 1ns;
assert sB_s = "100011000000" 
	report "ADD error at 100011000000" severity error;

wait for waitTime;
sA_s <= "100011000000";
wait for 1ns;
assert sB_s = "100011000001" 
	report "ADD error at 100011000001" severity error;

wait for waitTime;
sA_s <= "100011000001";
wait for 1ns;
assert sB_s = "100011000010" 
	report "ADD error at 100011000010" severity error;

wait for waitTime;
sA_s <= "100011000010";
wait for 1ns;
assert sB_s = "100011000011" 
	report "ADD error at 100011000011" severity error;

wait for waitTime;
sA_s <= "100011000011";
wait for 1ns;
assert sB_s = "100011000100" 
	report "ADD error at 100011000100" severity error;

wait for waitTime;
sA_s <= "100011000100";
wait for 1ns;
assert sB_s = "100011000101" 
	report "ADD error at 100011000101" severity error;

wait for waitTime;
sA_s <= "100011000101";
wait for 1ns;
assert sB_s = "100011000110" 
	report "ADD error at 100011000110" severity error;

wait for waitTime;
sA_s <= "100011000110";
wait for 1ns;
assert sB_s = "100011000111" 
	report "ADD error at 100011000111" severity error;

wait for waitTime;
sA_s <= "100011000111";
wait for 1ns;
assert sB_s = "100011001000" 
	report "ADD error at 100011001000" severity error;

wait for waitTime;
sA_s <= "100011001000";
wait for 1ns;
assert sB_s = "100011001001" 
	report "ADD error at 100011001001" severity error;

wait for waitTime;
sA_s <= "100011001001";
wait for 1ns;
assert sB_s = "100011001010" 
	report "ADD error at 100011001010" severity error;

wait for waitTime;
sA_s <= "100011001010";
wait for 1ns;
assert sB_s = "100011001011" 
	report "ADD error at 100011001011" severity error;

wait for waitTime;
sA_s <= "100011001011";
wait for 1ns;
assert sB_s = "100011001100" 
	report "ADD error at 100011001100" severity error;

wait for waitTime;
sA_s <= "100011001100";
wait for 1ns;
assert sB_s = "100011001101" 
	report "ADD error at 100011001101" severity error;

wait for waitTime;
sA_s <= "100011001101";
wait for 1ns;
assert sB_s = "100011001110" 
	report "ADD error at 100011001110" severity error;

wait for waitTime;
sA_s <= "100011001110";
wait for 1ns;
assert sB_s = "100011001111" 
	report "ADD error at 100011001111" severity error;

wait for waitTime;
sA_s <= "100011001111";
wait for 1ns;
assert sB_s = "100011010000" 
	report "ADD error at 100011010000" severity error;

wait for waitTime;
sA_s <= "100011010000";
wait for 1ns;
assert sB_s = "100011010001" 
	report "ADD error at 100011010001" severity error;

wait for waitTime;
sA_s <= "100011010001";
wait for 1ns;
assert sB_s = "100011010010" 
	report "ADD error at 100011010010" severity error;

wait for waitTime;
sA_s <= "100011010010";
wait for 1ns;
assert sB_s = "100011010011" 
	report "ADD error at 100011010011" severity error;

wait for waitTime;
sA_s <= "100011010011";
wait for 1ns;
assert sB_s = "100011010100" 
	report "ADD error at 100011010100" severity error;

wait for waitTime;
sA_s <= "100011010100";
wait for 1ns;
assert sB_s = "100011010101" 
	report "ADD error at 100011010101" severity error;

wait for waitTime;
sA_s <= "100011010101";
wait for 1ns;
assert sB_s = "100011010110" 
	report "ADD error at 100011010110" severity error;

wait for waitTime;
sA_s <= "100011010110";
wait for 1ns;
assert sB_s = "100011010111" 
	report "ADD error at 100011010111" severity error;

wait for waitTime;
sA_s <= "100011010111";
wait for 1ns;
assert sB_s = "100011011000" 
	report "ADD error at 100011011000" severity error;

wait for waitTime;
sA_s <= "100011011000";
wait for 1ns;
assert sB_s = "100011011001" 
	report "ADD error at 100011011001" severity error;

wait for waitTime;
sA_s <= "100011011001";
wait for 1ns;
assert sB_s = "100011011010" 
	report "ADD error at 100011011010" severity error;

wait for waitTime;
sA_s <= "100011011010";
wait for 1ns;
assert sB_s = "100011011011" 
	report "ADD error at 100011011011" severity error;

wait for waitTime;
sA_s <= "100011011011";
wait for 1ns;
assert sB_s = "100011011100" 
	report "ADD error at 100011011100" severity error;

wait for waitTime;
sA_s <= "100011011100";
wait for 1ns;
assert sB_s = "100011011101" 
	report "ADD error at 100011011101" severity error;

wait for waitTime;
sA_s <= "100011011101";
wait for 1ns;
assert sB_s = "100011011110" 
	report "ADD error at 100011011110" severity error;

wait for waitTime;
sA_s <= "100011011110";
wait for 1ns;
assert sB_s = "100011011111" 
	report "ADD error at 100011011111" severity error;

wait for waitTime;
sA_s <= "100011011111";
wait for 1ns;
assert sB_s = "100011100000" 
	report "ADD error at 100011100000" severity error;

wait for waitTime;
sA_s <= "100011100000";
wait for 1ns;
assert sB_s = "100011100001" 
	report "ADD error at 100011100001" severity error;

wait for waitTime;
sA_s <= "100011100001";
wait for 1ns;
assert sB_s = "100011100010" 
	report "ADD error at 100011100010" severity error;

wait for waitTime;
sA_s <= "100011100010";
wait for 1ns;
assert sB_s = "100011100011" 
	report "ADD error at 100011100011" severity error;

wait for waitTime;
sA_s <= "100011100011";
wait for 1ns;
assert sB_s = "100011100100" 
	report "ADD error at 100011100100" severity error;

wait for waitTime;
sA_s <= "100011100100";
wait for 1ns;
assert sB_s = "100011100101" 
	report "ADD error at 100011100101" severity error;

wait for waitTime;
sA_s <= "100011100101";
wait for 1ns;
assert sB_s = "100011100110" 
	report "ADD error at 100011100110" severity error;

wait for waitTime;
sA_s <= "100011100110";
wait for 1ns;
assert sB_s = "100011100111" 
	report "ADD error at 100011100111" severity error;

wait for waitTime;
sA_s <= "100011100111";
wait for 1ns;
assert sB_s = "100011101000" 
	report "ADD error at 100011101000" severity error;

wait for waitTime;
sA_s <= "100011101000";
wait for 1ns;
assert sB_s = "100011101001" 
	report "ADD error at 100011101001" severity error;

wait for waitTime;
sA_s <= "100011101001";
wait for 1ns;
assert sB_s = "100011101010" 
	report "ADD error at 100011101010" severity error;

wait for waitTime;
sA_s <= "100011101010";
wait for 1ns;
assert sB_s = "100011101011" 
	report "ADD error at 100011101011" severity error;

wait for waitTime;
sA_s <= "100011101011";
wait for 1ns;
assert sB_s = "100011101100" 
	report "ADD error at 100011101100" severity error;

wait for waitTime;
sA_s <= "100011101100";
wait for 1ns;
assert sB_s = "100011101101" 
	report "ADD error at 100011101101" severity error;

wait for waitTime;
sA_s <= "100011101101";
wait for 1ns;
assert sB_s = "100011101110" 
	report "ADD error at 100011101110" severity error;

wait for waitTime;
sA_s <= "100011101110";
wait for 1ns;
assert sB_s = "100011101111" 
	report "ADD error at 100011101111" severity error;

wait for waitTime;
sA_s <= "100011101111";
wait for 1ns;
assert sB_s = "100011110000" 
	report "ADD error at 100011110000" severity error;

wait for waitTime;
sA_s <= "100011110000";
wait for 1ns;
assert sB_s = "100011110001" 
	report "ADD error at 100011110001" severity error;

wait for waitTime;
sA_s <= "100011110001";
wait for 1ns;
assert sB_s = "100011110010" 
	report "ADD error at 100011110010" severity error;

wait for waitTime;
sA_s <= "100011110010";
wait for 1ns;
assert sB_s = "100011110011" 
	report "ADD error at 100011110011" severity error;

wait for waitTime;
sA_s <= "100011110011";
wait for 1ns;
assert sB_s = "100011110100" 
	report "ADD error at 100011110100" severity error;

wait for waitTime;
sA_s <= "100011110100";
wait for 1ns;
assert sB_s = "100011110101" 
	report "ADD error at 100011110101" severity error;

wait for waitTime;
sA_s <= "100011110101";
wait for 1ns;
assert sB_s = "100011110110" 
	report "ADD error at 100011110110" severity error;

wait for waitTime;
sA_s <= "100011110110";
wait for 1ns;
assert sB_s = "100011110111" 
	report "ADD error at 100011110111" severity error;

wait for waitTime;
sA_s <= "100011110111";
wait for 1ns;
assert sB_s = "100011111000" 
	report "ADD error at 100011111000" severity error;

wait for waitTime;
sA_s <= "100011111000";
wait for 1ns;
assert sB_s = "100011111001" 
	report "ADD error at 100011111001" severity error;

wait for waitTime;
sA_s <= "100011111001";
wait for 1ns;
assert sB_s = "100011111010" 
	report "ADD error at 100011111010" severity error;

wait for waitTime;
sA_s <= "100011111010";
wait for 1ns;
assert sB_s = "100011111011" 
	report "ADD error at 100011111011" severity error;

wait for waitTime;
sA_s <= "100011111011";
wait for 1ns;
assert sB_s = "100011111100" 
	report "ADD error at 100011111100" severity error;

wait for waitTime;
sA_s <= "100011111100";
wait for 1ns;
assert sB_s = "100011111101" 
	report "ADD error at 100011111101" severity error;

wait for waitTime;
sA_s <= "100011111101";
wait for 1ns;
assert sB_s = "100011111110" 
	report "ADD error at 100011111110" severity error;

wait for waitTime;
sA_s <= "100011111110";
wait for 1ns;
assert sB_s = "100011111111" 
	report "ADD error at 100011111111" severity error;

wait for waitTime;
sA_s <= "100011111111";
wait for 1ns;
assert sB_s = "100100000000" 
	report "ADD error at 100100000000" severity error;

wait for waitTime;
sA_s <= "100100000000";
wait for 1ns;
assert sB_s = "100100000001" 
	report "ADD error at 100100000001" severity error;

wait for waitTime;
sA_s <= "100100000001";
wait for 1ns;
assert sB_s = "100100000010" 
	report "ADD error at 100100000010" severity error;

wait for waitTime;
sA_s <= "100100000010";
wait for 1ns;
assert sB_s = "100100000011" 
	report "ADD error at 100100000011" severity error;

wait for waitTime;
sA_s <= "100100000011";
wait for 1ns;
assert sB_s = "100100000100" 
	report "ADD error at 100100000100" severity error;

wait for waitTime;
sA_s <= "100100000100";
wait for 1ns;
assert sB_s = "100100000101" 
	report "ADD error at 100100000101" severity error;

wait for waitTime;
sA_s <= "100100000101";
wait for 1ns;
assert sB_s = "100100000110" 
	report "ADD error at 100100000110" severity error;

wait for waitTime;
sA_s <= "100100000110";
wait for 1ns;
assert sB_s = "100100000111" 
	report "ADD error at 100100000111" severity error;

wait for waitTime;
sA_s <= "100100000111";
wait for 1ns;
assert sB_s = "100100001000" 
	report "ADD error at 100100001000" severity error;

wait for waitTime;
sA_s <= "100100001000";
wait for 1ns;
assert sB_s = "100100001001" 
	report "ADD error at 100100001001" severity error;

wait for waitTime;
sA_s <= "100100001001";
wait for 1ns;
assert sB_s = "100100001010" 
	report "ADD error at 100100001010" severity error;

wait for waitTime;
sA_s <= "100100001010";
wait for 1ns;
assert sB_s = "100100001011" 
	report "ADD error at 100100001011" severity error;

wait for waitTime;
sA_s <= "100100001011";
wait for 1ns;
assert sB_s = "100100001100" 
	report "ADD error at 100100001100" severity error;

wait for waitTime;
sA_s <= "100100001100";
wait for 1ns;
assert sB_s = "100100001101" 
	report "ADD error at 100100001101" severity error;

wait for waitTime;
sA_s <= "100100001101";
wait for 1ns;
assert sB_s = "100100001110" 
	report "ADD error at 100100001110" severity error;

wait for waitTime;
sA_s <= "100100001110";
wait for 1ns;
assert sB_s = "100100001111" 
	report "ADD error at 100100001111" severity error;

wait for waitTime;
sA_s <= "100100001111";
wait for 1ns;
assert sB_s = "100100010000" 
	report "ADD error at 100100010000" severity error;

wait for waitTime;
sA_s <= "100100010000";
wait for 1ns;
assert sB_s = "100100010001" 
	report "ADD error at 100100010001" severity error;

wait for waitTime;
sA_s <= "100100010001";
wait for 1ns;
assert sB_s = "100100010010" 
	report "ADD error at 100100010010" severity error;

wait for waitTime;
sA_s <= "100100010010";
wait for 1ns;
assert sB_s = "100100010011" 
	report "ADD error at 100100010011" severity error;

wait for waitTime;
sA_s <= "100100010011";
wait for 1ns;
assert sB_s = "100100010100" 
	report "ADD error at 100100010100" severity error;

wait for waitTime;
sA_s <= "100100010100";
wait for 1ns;
assert sB_s = "100100010101" 
	report "ADD error at 100100010101" severity error;

wait for waitTime;
sA_s <= "100100010101";
wait for 1ns;
assert sB_s = "100100010110" 
	report "ADD error at 100100010110" severity error;

wait for waitTime;
sA_s <= "100100010110";
wait for 1ns;
assert sB_s = "100100010111" 
	report "ADD error at 100100010111" severity error;

wait for waitTime;
sA_s <= "100100010111";
wait for 1ns;
assert sB_s = "100100011000" 
	report "ADD error at 100100011000" severity error;

wait for waitTime;
sA_s <= "100100011000";
wait for 1ns;
assert sB_s = "100100011001" 
	report "ADD error at 100100011001" severity error;

wait for waitTime;
sA_s <= "100100011001";
wait for 1ns;
assert sB_s = "100100011010" 
	report "ADD error at 100100011010" severity error;

wait for waitTime;
sA_s <= "100100011010";
wait for 1ns;
assert sB_s = "100100011011" 
	report "ADD error at 100100011011" severity error;

wait for waitTime;
sA_s <= "100100011011";
wait for 1ns;
assert sB_s = "100100011100" 
	report "ADD error at 100100011100" severity error;

wait for waitTime;
sA_s <= "100100011100";
wait for 1ns;
assert sB_s = "100100011101" 
	report "ADD error at 100100011101" severity error;

wait for waitTime;
sA_s <= "100100011101";
wait for 1ns;
assert sB_s = "100100011110" 
	report "ADD error at 100100011110" severity error;

wait for waitTime;
sA_s <= "100100011110";
wait for 1ns;
assert sB_s = "100100011111" 
	report "ADD error at 100100011111" severity error;

wait for waitTime;
sA_s <= "100100011111";
wait for 1ns;
assert sB_s = "100100100000" 
	report "ADD error at 100100100000" severity error;

wait for waitTime;
sA_s <= "100100100000";
wait for 1ns;
assert sB_s = "100100100001" 
	report "ADD error at 100100100001" severity error;

wait for waitTime;
sA_s <= "100100100001";
wait for 1ns;
assert sB_s = "100100100010" 
	report "ADD error at 100100100010" severity error;

wait for waitTime;
sA_s <= "100100100010";
wait for 1ns;
assert sB_s = "100100100011" 
	report "ADD error at 100100100011" severity error;

wait for waitTime;
sA_s <= "100100100011";
wait for 1ns;
assert sB_s = "100100100100" 
	report "ADD error at 100100100100" severity error;

wait for waitTime;
sA_s <= "100100100100";
wait for 1ns;
assert sB_s = "100100100101" 
	report "ADD error at 100100100101" severity error;

wait for waitTime;
sA_s <= "100100100101";
wait for 1ns;
assert sB_s = "100100100110" 
	report "ADD error at 100100100110" severity error;

wait for waitTime;
sA_s <= "100100100110";
wait for 1ns;
assert sB_s = "100100100111" 
	report "ADD error at 100100100111" severity error;

wait for waitTime;
sA_s <= "100100100111";
wait for 1ns;
assert sB_s = "100100101000" 
	report "ADD error at 100100101000" severity error;

wait for waitTime;
sA_s <= "100100101000";
wait for 1ns;
assert sB_s = "100100101001" 
	report "ADD error at 100100101001" severity error;

wait for waitTime;
sA_s <= "100100101001";
wait for 1ns;
assert sB_s = "100100101010" 
	report "ADD error at 100100101010" severity error;

wait for waitTime;
sA_s <= "100100101010";
wait for 1ns;
assert sB_s = "100100101011" 
	report "ADD error at 100100101011" severity error;

wait for waitTime;
sA_s <= "100100101011";
wait for 1ns;
assert sB_s = "100100101100" 
	report "ADD error at 100100101100" severity error;

wait for waitTime;
sA_s <= "100100101100";
wait for 1ns;
assert sB_s = "100100101101" 
	report "ADD error at 100100101101" severity error;

wait for waitTime;
sA_s <= "100100101101";
wait for 1ns;
assert sB_s = "100100101110" 
	report "ADD error at 100100101110" severity error;

wait for waitTime;
sA_s <= "100100101110";
wait for 1ns;
assert sB_s = "100100101111" 
	report "ADD error at 100100101111" severity error;

wait for waitTime;
sA_s <= "100100101111";
wait for 1ns;
assert sB_s = "100100110000" 
	report "ADD error at 100100110000" severity error;

wait for waitTime;
sA_s <= "100100110000";
wait for 1ns;
assert sB_s = "100100110001" 
	report "ADD error at 100100110001" severity error;

wait for waitTime;
sA_s <= "100100110001";
wait for 1ns;
assert sB_s = "100100110010" 
	report "ADD error at 100100110010" severity error;

wait for waitTime;
sA_s <= "100100110010";
wait for 1ns;
assert sB_s = "100100110011" 
	report "ADD error at 100100110011" severity error;

wait for waitTime;
sA_s <= "100100110011";
wait for 1ns;
assert sB_s = "100100110100" 
	report "ADD error at 100100110100" severity error;

wait for waitTime;
sA_s <= "100100110100";
wait for 1ns;
assert sB_s = "100100110101" 
	report "ADD error at 100100110101" severity error;

wait for waitTime;
sA_s <= "100100110101";
wait for 1ns;
assert sB_s = "100100110110" 
	report "ADD error at 100100110110" severity error;

wait for waitTime;
sA_s <= "100100110110";
wait for 1ns;
assert sB_s = "100100110111" 
	report "ADD error at 100100110111" severity error;

wait for waitTime;
sA_s <= "100100110111";
wait for 1ns;
assert sB_s = "100100111000" 
	report "ADD error at 100100111000" severity error;

wait for waitTime;
sA_s <= "100100111000";
wait for 1ns;
assert sB_s = "100100111001" 
	report "ADD error at 100100111001" severity error;

wait for waitTime;
sA_s <= "100100111001";
wait for 1ns;
assert sB_s = "100100111010" 
	report "ADD error at 100100111010" severity error;

wait for waitTime;
sA_s <= "100100111010";
wait for 1ns;
assert sB_s = "100100111011" 
	report "ADD error at 100100111011" severity error;

wait for waitTime;
sA_s <= "100100111011";
wait for 1ns;
assert sB_s = "100100111100" 
	report "ADD error at 100100111100" severity error;

wait for waitTime;
sA_s <= "100100111100";
wait for 1ns;
assert sB_s = "100100111101" 
	report "ADD error at 100100111101" severity error;

wait for waitTime;
sA_s <= "100100111101";
wait for 1ns;
assert sB_s = "100100111110" 
	report "ADD error at 100100111110" severity error;

wait for waitTime;
sA_s <= "100100111110";
wait for 1ns;
assert sB_s = "100100111111" 
	report "ADD error at 100100111111" severity error;

wait for waitTime;
sA_s <= "100100111111";
wait for 1ns;
assert sB_s = "100101000000" 
	report "ADD error at 100101000000" severity error;

wait for waitTime;
sA_s <= "100101000000";
wait for 1ns;
assert sB_s = "100101000001" 
	report "ADD error at 100101000001" severity error;

wait for waitTime;
sA_s <= "100101000001";
wait for 1ns;
assert sB_s = "100101000010" 
	report "ADD error at 100101000010" severity error;

wait for waitTime;
sA_s <= "100101000010";
wait for 1ns;
assert sB_s = "100101000011" 
	report "ADD error at 100101000011" severity error;

wait for waitTime;
sA_s <= "100101000011";
wait for 1ns;
assert sB_s = "100101000100" 
	report "ADD error at 100101000100" severity error;

wait for waitTime;
sA_s <= "100101000100";
wait for 1ns;
assert sB_s = "100101000101" 
	report "ADD error at 100101000101" severity error;

wait for waitTime;
sA_s <= "100101000101";
wait for 1ns;
assert sB_s = "100101000110" 
	report "ADD error at 100101000110" severity error;

wait for waitTime;
sA_s <= "100101000110";
wait for 1ns;
assert sB_s = "100101000111" 
	report "ADD error at 100101000111" severity error;

wait for waitTime;
sA_s <= "100101000111";
wait for 1ns;
assert sB_s = "100101001000" 
	report "ADD error at 100101001000" severity error;

wait for waitTime;
sA_s <= "100101001000";
wait for 1ns;
assert sB_s = "100101001001" 
	report "ADD error at 100101001001" severity error;

wait for waitTime;
sA_s <= "100101001001";
wait for 1ns;
assert sB_s = "100101001010" 
	report "ADD error at 100101001010" severity error;

wait for waitTime;
sA_s <= "100101001010";
wait for 1ns;
assert sB_s = "100101001011" 
	report "ADD error at 100101001011" severity error;

wait for waitTime;
sA_s <= "100101001011";
wait for 1ns;
assert sB_s = "100101001100" 
	report "ADD error at 100101001100" severity error;

wait for waitTime;
sA_s <= "100101001100";
wait for 1ns;
assert sB_s = "100101001101" 
	report "ADD error at 100101001101" severity error;

wait for waitTime;
sA_s <= "100101001101";
wait for 1ns;
assert sB_s = "100101001110" 
	report "ADD error at 100101001110" severity error;

wait for waitTime;
sA_s <= "100101001110";
wait for 1ns;
assert sB_s = "100101001111" 
	report "ADD error at 100101001111" severity error;

wait for waitTime;
sA_s <= "100101001111";
wait for 1ns;
assert sB_s = "100101010000" 
	report "ADD error at 100101010000" severity error;

wait for waitTime;
sA_s <= "100101010000";
wait for 1ns;
assert sB_s = "100101010001" 
	report "ADD error at 100101010001" severity error;

wait for waitTime;
sA_s <= "100101010001";
wait for 1ns;
assert sB_s = "100101010010" 
	report "ADD error at 100101010010" severity error;

wait for waitTime;
sA_s <= "100101010010";
wait for 1ns;
assert sB_s = "100101010011" 
	report "ADD error at 100101010011" severity error;

wait for waitTime;
sA_s <= "100101010011";
wait for 1ns;
assert sB_s = "100101010100" 
	report "ADD error at 100101010100" severity error;

wait for waitTime;
sA_s <= "100101010100";
wait for 1ns;
assert sB_s = "100101010101" 
	report "ADD error at 100101010101" severity error;

wait for waitTime;
sA_s <= "100101010101";
wait for 1ns;
assert sB_s = "100101010110" 
	report "ADD error at 100101010110" severity error;

wait for waitTime;
sA_s <= "100101010110";
wait for 1ns;
assert sB_s = "100101010111" 
	report "ADD error at 100101010111" severity error;

wait for waitTime;
sA_s <= "100101010111";
wait for 1ns;
assert sB_s = "100101011000" 
	report "ADD error at 100101011000" severity error;

wait for waitTime;
sA_s <= "100101011000";
wait for 1ns;
assert sB_s = "100101011001" 
	report "ADD error at 100101011001" severity error;

wait for waitTime;
sA_s <= "100101011001";
wait for 1ns;
assert sB_s = "100101011010" 
	report "ADD error at 100101011010" severity error;

wait for waitTime;
sA_s <= "100101011010";
wait for 1ns;
assert sB_s = "100101011011" 
	report "ADD error at 100101011011" severity error;

wait for waitTime;
sA_s <= "100101011011";
wait for 1ns;
assert sB_s = "100101011100" 
	report "ADD error at 100101011100" severity error;

wait for waitTime;
sA_s <= "100101011100";
wait for 1ns;
assert sB_s = "100101011101" 
	report "ADD error at 100101011101" severity error;

wait for waitTime;
sA_s <= "100101011101";
wait for 1ns;
assert sB_s = "100101011110" 
	report "ADD error at 100101011110" severity error;

wait for waitTime;
sA_s <= "100101011110";
wait for 1ns;
assert sB_s = "100101011111" 
	report "ADD error at 100101011111" severity error;

wait for waitTime;
sA_s <= "100101011111";
wait for 1ns;
assert sB_s = "100101100000" 
	report "ADD error at 100101100000" severity error;

wait for waitTime;
sA_s <= "100101100000";
wait for 1ns;
assert sB_s = "100101100001" 
	report "ADD error at 100101100001" severity error;

wait for waitTime;
sA_s <= "100101100001";
wait for 1ns;
assert sB_s = "100101100010" 
	report "ADD error at 100101100010" severity error;

wait for waitTime;
sA_s <= "100101100010";
wait for 1ns;
assert sB_s = "100101100011" 
	report "ADD error at 100101100011" severity error;

wait for waitTime;
sA_s <= "100101100011";
wait for 1ns;
assert sB_s = "100101100100" 
	report "ADD error at 100101100100" severity error;

wait for waitTime;
sA_s <= "100101100100";
wait for 1ns;
assert sB_s = "100101100101" 
	report "ADD error at 100101100101" severity error;

wait for waitTime;
sA_s <= "100101100101";
wait for 1ns;
assert sB_s = "100101100110" 
	report "ADD error at 100101100110" severity error;

wait for waitTime;
sA_s <= "100101100110";
wait for 1ns;
assert sB_s = "100101100111" 
	report "ADD error at 100101100111" severity error;

wait for waitTime;
sA_s <= "100101100111";
wait for 1ns;
assert sB_s = "100101101000" 
	report "ADD error at 100101101000" severity error;

wait for waitTime;
sA_s <= "100101101000";
wait for 1ns;
assert sB_s = "100101101001" 
	report "ADD error at 100101101001" severity error;

wait for waitTime;
sA_s <= "100101101001";
wait for 1ns;
assert sB_s = "100101101010" 
	report "ADD error at 100101101010" severity error;

wait for waitTime;
sA_s <= "100101101010";
wait for 1ns;
assert sB_s = "100101101011" 
	report "ADD error at 100101101011" severity error;

wait for waitTime;
sA_s <= "100101101011";
wait for 1ns;
assert sB_s = "100101101100" 
	report "ADD error at 100101101100" severity error;

wait for waitTime;
sA_s <= "100101101100";
wait for 1ns;
assert sB_s = "100101101101" 
	report "ADD error at 100101101101" severity error;

wait for waitTime;
sA_s <= "100101101101";
wait for 1ns;
assert sB_s = "100101101110" 
	report "ADD error at 100101101110" severity error;

wait for waitTime;
sA_s <= "100101101110";
wait for 1ns;
assert sB_s = "100101101111" 
	report "ADD error at 100101101111" severity error;

wait for waitTime;
sA_s <= "100101101111";
wait for 1ns;
assert sB_s = "100101110000" 
	report "ADD error at 100101110000" severity error;

wait for waitTime;
sA_s <= "100101110000";
wait for 1ns;
assert sB_s = "100101110001" 
	report "ADD error at 100101110001" severity error;

wait for waitTime;
sA_s <= "100101110001";
wait for 1ns;
assert sB_s = "100101110010" 
	report "ADD error at 100101110010" severity error;

wait for waitTime;
sA_s <= "100101110010";
wait for 1ns;
assert sB_s = "100101110011" 
	report "ADD error at 100101110011" severity error;

wait for waitTime;
sA_s <= "100101110011";
wait for 1ns;
assert sB_s = "100101110100" 
	report "ADD error at 100101110100" severity error;

wait for waitTime;
sA_s <= "100101110100";
wait for 1ns;
assert sB_s = "100101110101" 
	report "ADD error at 100101110101" severity error;

wait for waitTime;
sA_s <= "100101110101";
wait for 1ns;
assert sB_s = "100101110110" 
	report "ADD error at 100101110110" severity error;

wait for waitTime;
sA_s <= "100101110110";
wait for 1ns;
assert sB_s = "100101110111" 
	report "ADD error at 100101110111" severity error;

wait for waitTime;
sA_s <= "100101110111";
wait for 1ns;
assert sB_s = "100101111000" 
	report "ADD error at 100101111000" severity error;

wait for waitTime;
sA_s <= "100101111000";
wait for 1ns;
assert sB_s = "100101111001" 
	report "ADD error at 100101111001" severity error;

wait for waitTime;
sA_s <= "100101111001";
wait for 1ns;
assert sB_s = "100101111010" 
	report "ADD error at 100101111010" severity error;

wait for waitTime;
sA_s <= "100101111010";
wait for 1ns;
assert sB_s = "100101111011" 
	report "ADD error at 100101111011" severity error;

wait for waitTime;
sA_s <= "100101111011";
wait for 1ns;
assert sB_s = "100101111100" 
	report "ADD error at 100101111100" severity error;

wait for waitTime;
sA_s <= "100101111100";
wait for 1ns;
assert sB_s = "100101111101" 
	report "ADD error at 100101111101" severity error;

wait for waitTime;
sA_s <= "100101111101";
wait for 1ns;
assert sB_s = "100101111110" 
	report "ADD error at 100101111110" severity error;

wait for waitTime;
sA_s <= "100101111110";
wait for 1ns;
assert sB_s = "100101111111" 
	report "ADD error at 100101111111" severity error;

wait for waitTime;
sA_s <= "100101111111";
wait for 1ns;
assert sB_s = "100110000000" 
	report "ADD error at 100110000000" severity error;

wait for waitTime;
sA_s <= "100110000000";
wait for 1ns;
assert sB_s = "100110000001" 
	report "ADD error at 100110000001" severity error;

wait for waitTime;
sA_s <= "100110000001";
wait for 1ns;
assert sB_s = "100110000010" 
	report "ADD error at 100110000010" severity error;

wait for waitTime;
sA_s <= "100110000010";
wait for 1ns;
assert sB_s = "100110000011" 
	report "ADD error at 100110000011" severity error;

wait for waitTime;
sA_s <= "100110000011";
wait for 1ns;
assert sB_s = "100110000100" 
	report "ADD error at 100110000100" severity error;

wait for waitTime;
sA_s <= "100110000100";
wait for 1ns;
assert sB_s = "100110000101" 
	report "ADD error at 100110000101" severity error;

wait for waitTime;
sA_s <= "100110000101";
wait for 1ns;
assert sB_s = "100110000110" 
	report "ADD error at 100110000110" severity error;

wait for waitTime;
sA_s <= "100110000110";
wait for 1ns;
assert sB_s = "100110000111" 
	report "ADD error at 100110000111" severity error;

wait for waitTime;
sA_s <= "100110000111";
wait for 1ns;
assert sB_s = "100110001000" 
	report "ADD error at 100110001000" severity error;

wait for waitTime;
sA_s <= "100110001000";
wait for 1ns;
assert sB_s = "100110001001" 
	report "ADD error at 100110001001" severity error;

wait for waitTime;
sA_s <= "100110001001";
wait for 1ns;
assert sB_s = "100110001010" 
	report "ADD error at 100110001010" severity error;

wait for waitTime;
sA_s <= "100110001010";
wait for 1ns;
assert sB_s = "100110001011" 
	report "ADD error at 100110001011" severity error;

wait for waitTime;
sA_s <= "100110001011";
wait for 1ns;
assert sB_s = "100110001100" 
	report "ADD error at 100110001100" severity error;

wait for waitTime;
sA_s <= "100110001100";
wait for 1ns;
assert sB_s = "100110001101" 
	report "ADD error at 100110001101" severity error;

wait for waitTime;
sA_s <= "100110001101";
wait for 1ns;
assert sB_s = "100110001110" 
	report "ADD error at 100110001110" severity error;

wait for waitTime;
sA_s <= "100110001110";
wait for 1ns;
assert sB_s = "100110001111" 
	report "ADD error at 100110001111" severity error;

wait for waitTime;
sA_s <= "100110001111";
wait for 1ns;
assert sB_s = "100110010000" 
	report "ADD error at 100110010000" severity error;

wait for waitTime;
sA_s <= "100110010000";
wait for 1ns;
assert sB_s = "100110010001" 
	report "ADD error at 100110010001" severity error;

wait for waitTime;
sA_s <= "100110010001";
wait for 1ns;
assert sB_s = "100110010010" 
	report "ADD error at 100110010010" severity error;

wait for waitTime;
sA_s <= "100110010010";
wait for 1ns;
assert sB_s = "100110010011" 
	report "ADD error at 100110010011" severity error;

wait for waitTime;
sA_s <= "100110010011";
wait for 1ns;
assert sB_s = "100110010100" 
	report "ADD error at 100110010100" severity error;

wait for waitTime;
sA_s <= "100110010100";
wait for 1ns;
assert sB_s = "100110010101" 
	report "ADD error at 100110010101" severity error;

wait for waitTime;
sA_s <= "100110010101";
wait for 1ns;
assert sB_s = "100110010110" 
	report "ADD error at 100110010110" severity error;

wait for waitTime;
sA_s <= "100110010110";
wait for 1ns;
assert sB_s = "100110010111" 
	report "ADD error at 100110010111" severity error;

wait for waitTime;
sA_s <= "100110010111";
wait for 1ns;
assert sB_s = "100110011000" 
	report "ADD error at 100110011000" severity error;

wait for waitTime;
sA_s <= "100110011000";
wait for 1ns;
assert sB_s = "100110011001" 
	report "ADD error at 100110011001" severity error;

wait for waitTime;
sA_s <= "100110011001";
wait for 1ns;
assert sB_s = "100110011010" 
	report "ADD error at 100110011010" severity error;

wait for waitTime;
sA_s <= "100110011010";
wait for 1ns;
assert sB_s = "100110011011" 
	report "ADD error at 100110011011" severity error;

wait for waitTime;
sA_s <= "100110011011";
wait for 1ns;
assert sB_s = "100110011100" 
	report "ADD error at 100110011100" severity error;

wait for waitTime;
sA_s <= "100110011100";
wait for 1ns;
assert sB_s = "100110011101" 
	report "ADD error at 100110011101" severity error;

wait for waitTime;
sA_s <= "100110011101";
wait for 1ns;
assert sB_s = "100110011110" 
	report "ADD error at 100110011110" severity error;

wait for waitTime;
sA_s <= "100110011110";
wait for 1ns;
assert sB_s = "100110011111" 
	report "ADD error at 100110011111" severity error;

wait for waitTime;
sA_s <= "100110011111";
wait for 1ns;
assert sB_s = "100110100000" 
	report "ADD error at 100110100000" severity error;

wait for waitTime;
sA_s <= "100110100000";
wait for 1ns;
assert sB_s = "100110100001" 
	report "ADD error at 100110100001" severity error;

wait for waitTime;
sA_s <= "100110100001";
wait for 1ns;
assert sB_s = "100110100010" 
	report "ADD error at 100110100010" severity error;

wait for waitTime;
sA_s <= "100110100010";
wait for 1ns;
assert sB_s = "100110100011" 
	report "ADD error at 100110100011" severity error;

wait for waitTime;
sA_s <= "100110100011";
wait for 1ns;
assert sB_s = "100110100100" 
	report "ADD error at 100110100100" severity error;

wait for waitTime;
sA_s <= "100110100100";
wait for 1ns;
assert sB_s = "100110100101" 
	report "ADD error at 100110100101" severity error;

wait for waitTime;
sA_s <= "100110100101";
wait for 1ns;
assert sB_s = "100110100110" 
	report "ADD error at 100110100110" severity error;

wait for waitTime;
sA_s <= "100110100110";
wait for 1ns;
assert sB_s = "100110100111" 
	report "ADD error at 100110100111" severity error;

wait for waitTime;
sA_s <= "100110100111";
wait for 1ns;
assert sB_s = "100110101000" 
	report "ADD error at 100110101000" severity error;

wait for waitTime;
sA_s <= "100110101000";
wait for 1ns;
assert sB_s = "100110101001" 
	report "ADD error at 100110101001" severity error;

wait for waitTime;
sA_s <= "100110101001";
wait for 1ns;
assert sB_s = "100110101010" 
	report "ADD error at 100110101010" severity error;

wait for waitTime;
sA_s <= "100110101010";
wait for 1ns;
assert sB_s = "100110101011" 
	report "ADD error at 100110101011" severity error;

wait for waitTime;
sA_s <= "100110101011";
wait for 1ns;
assert sB_s = "100110101100" 
	report "ADD error at 100110101100" severity error;

wait for waitTime;
sA_s <= "100110101100";
wait for 1ns;
assert sB_s = "100110101101" 
	report "ADD error at 100110101101" severity error;

wait for waitTime;
sA_s <= "100110101101";
wait for 1ns;
assert sB_s = "100110101110" 
	report "ADD error at 100110101110" severity error;

wait for waitTime;
sA_s <= "100110101110";
wait for 1ns;
assert sB_s = "100110101111" 
	report "ADD error at 100110101111" severity error;

wait for waitTime;
sA_s <= "100110101111";
wait for 1ns;
assert sB_s = "100110110000" 
	report "ADD error at 100110110000" severity error;

wait for waitTime;
sA_s <= "100110110000";
wait for 1ns;
assert sB_s = "100110110001" 
	report "ADD error at 100110110001" severity error;

wait for waitTime;
sA_s <= "100110110001";
wait for 1ns;
assert sB_s = "100110110010" 
	report "ADD error at 100110110010" severity error;

wait for waitTime;
sA_s <= "100110110010";
wait for 1ns;
assert sB_s = "100110110011" 
	report "ADD error at 100110110011" severity error;

wait for waitTime;
sA_s <= "100110110011";
wait for 1ns;
assert sB_s = "100110110100" 
	report "ADD error at 100110110100" severity error;

wait for waitTime;
sA_s <= "100110110100";
wait for 1ns;
assert sB_s = "100110110101" 
	report "ADD error at 100110110101" severity error;

wait for waitTime;
sA_s <= "100110110101";
wait for 1ns;
assert sB_s = "100110110110" 
	report "ADD error at 100110110110" severity error;

wait for waitTime;
sA_s <= "100110110110";
wait for 1ns;
assert sB_s = "100110110111" 
	report "ADD error at 100110110111" severity error;

wait for waitTime;
sA_s <= "100110110111";
wait for 1ns;
assert sB_s = "100110111000" 
	report "ADD error at 100110111000" severity error;

wait for waitTime;
sA_s <= "100110111000";
wait for 1ns;
assert sB_s = "100110111001" 
	report "ADD error at 100110111001" severity error;

wait for waitTime;
sA_s <= "100110111001";
wait for 1ns;
assert sB_s = "100110111010" 
	report "ADD error at 100110111010" severity error;

wait for waitTime;
sA_s <= "100110111010";
wait for 1ns;
assert sB_s = "100110111011" 
	report "ADD error at 100110111011" severity error;

wait for waitTime;
sA_s <= "100110111011";
wait for 1ns;
assert sB_s = "100110111100" 
	report "ADD error at 100110111100" severity error;

wait for waitTime;
sA_s <= "100110111100";
wait for 1ns;
assert sB_s = "100110111101" 
	report "ADD error at 100110111101" severity error;

wait for waitTime;
sA_s <= "100110111101";
wait for 1ns;
assert sB_s = "100110111110" 
	report "ADD error at 100110111110" severity error;

wait for waitTime;
sA_s <= "100110111110";
wait for 1ns;
assert sB_s = "100110111111" 
	report "ADD error at 100110111111" severity error;

wait for waitTime;
sA_s <= "100110111111";
wait for 1ns;
assert sB_s = "100111000000" 
	report "ADD error at 100111000000" severity error;

wait for waitTime;
sA_s <= "100111000000";
wait for 1ns;
assert sB_s = "100111000001" 
	report "ADD error at 100111000001" severity error;

wait for waitTime;
sA_s <= "100111000001";
wait for 1ns;
assert sB_s = "100111000010" 
	report "ADD error at 100111000010" severity error;

wait for waitTime;
sA_s <= "100111000010";
wait for 1ns;
assert sB_s = "100111000011" 
	report "ADD error at 100111000011" severity error;

wait for waitTime;
sA_s <= "100111000011";
wait for 1ns;
assert sB_s = "100111000100" 
	report "ADD error at 100111000100" severity error;

wait for waitTime;
sA_s <= "100111000100";
wait for 1ns;
assert sB_s = "100111000101" 
	report "ADD error at 100111000101" severity error;

wait for waitTime;
sA_s <= "100111000101";
wait for 1ns;
assert sB_s = "100111000110" 
	report "ADD error at 100111000110" severity error;

wait for waitTime;
sA_s <= "100111000110";
wait for 1ns;
assert sB_s = "100111000111" 
	report "ADD error at 100111000111" severity error;

wait for waitTime;
sA_s <= "100111000111";
wait for 1ns;
assert sB_s = "100111001000" 
	report "ADD error at 100111001000" severity error;

wait for waitTime;
sA_s <= "100111001000";
wait for 1ns;
assert sB_s = "100111001001" 
	report "ADD error at 100111001001" severity error;

wait for waitTime;
sA_s <= "100111001001";
wait for 1ns;
assert sB_s = "100111001010" 
	report "ADD error at 100111001010" severity error;

wait for waitTime;
sA_s <= "100111001010";
wait for 1ns;
assert sB_s = "100111001011" 
	report "ADD error at 100111001011" severity error;

wait for waitTime;
sA_s <= "100111001011";
wait for 1ns;
assert sB_s = "100111001100" 
	report "ADD error at 100111001100" severity error;

wait for waitTime;
sA_s <= "100111001100";
wait for 1ns;
assert sB_s = "100111001101" 
	report "ADD error at 100111001101" severity error;

wait for waitTime;
sA_s <= "100111001101";
wait for 1ns;
assert sB_s = "100111001110" 
	report "ADD error at 100111001110" severity error;

wait for waitTime;
sA_s <= "100111001110";
wait for 1ns;
assert sB_s = "100111001111" 
	report "ADD error at 100111001111" severity error;

wait for waitTime;
sA_s <= "100111001111";
wait for 1ns;
assert sB_s = "100111010000" 
	report "ADD error at 100111010000" severity error;

wait for waitTime;
sA_s <= "100111010000";
wait for 1ns;
assert sB_s = "100111010001" 
	report "ADD error at 100111010001" severity error;

wait for waitTime;
sA_s <= "100111010001";
wait for 1ns;
assert sB_s = "100111010010" 
	report "ADD error at 100111010010" severity error;

wait for waitTime;
sA_s <= "100111010010";
wait for 1ns;
assert sB_s = "100111010011" 
	report "ADD error at 100111010011" severity error;

wait for waitTime;
sA_s <= "100111010011";
wait for 1ns;
assert sB_s = "100111010100" 
	report "ADD error at 100111010100" severity error;

wait for waitTime;
sA_s <= "100111010100";
wait for 1ns;
assert sB_s = "100111010101" 
	report "ADD error at 100111010101" severity error;

wait for waitTime;
sA_s <= "100111010101";
wait for 1ns;
assert sB_s = "100111010110" 
	report "ADD error at 100111010110" severity error;

wait for waitTime;
sA_s <= "100111010110";
wait for 1ns;
assert sB_s = "100111010111" 
	report "ADD error at 100111010111" severity error;

wait for waitTime;
sA_s <= "100111010111";
wait for 1ns;
assert sB_s = "100111011000" 
	report "ADD error at 100111011000" severity error;

wait for waitTime;
sA_s <= "100111011000";
wait for 1ns;
assert sB_s = "100111011001" 
	report "ADD error at 100111011001" severity error;

wait for waitTime;
sA_s <= "100111011001";
wait for 1ns;
assert sB_s = "100111011010" 
	report "ADD error at 100111011010" severity error;

wait for waitTime;
sA_s <= "100111011010";
wait for 1ns;
assert sB_s = "100111011011" 
	report "ADD error at 100111011011" severity error;

wait for waitTime;
sA_s <= "100111011011";
wait for 1ns;
assert sB_s = "100111011100" 
	report "ADD error at 100111011100" severity error;

wait for waitTime;
sA_s <= "100111011100";
wait for 1ns;
assert sB_s = "100111011101" 
	report "ADD error at 100111011101" severity error;

wait for waitTime;
sA_s <= "100111011101";
wait for 1ns;
assert sB_s = "100111011110" 
	report "ADD error at 100111011110" severity error;

wait for waitTime;
sA_s <= "100111011110";
wait for 1ns;
assert sB_s = "100111011111" 
	report "ADD error at 100111011111" severity error;

wait for waitTime;
sA_s <= "100111011111";
wait for 1ns;
assert sB_s = "100111100000" 
	report "ADD error at 100111100000" severity error;

wait for waitTime;
sA_s <= "100111100000";
wait for 1ns;
assert sB_s = "100111100001" 
	report "ADD error at 100111100001" severity error;

wait for waitTime;
sA_s <= "100111100001";
wait for 1ns;
assert sB_s = "100111100010" 
	report "ADD error at 100111100010" severity error;

wait for waitTime;
sA_s <= "100111100010";
wait for 1ns;
assert sB_s = "100111100011" 
	report "ADD error at 100111100011" severity error;

wait for waitTime;
sA_s <= "100111100011";
wait for 1ns;
assert sB_s = "100111100100" 
	report "ADD error at 100111100100" severity error;

wait for waitTime;
sA_s <= "100111100100";
wait for 1ns;
assert sB_s = "100111100101" 
	report "ADD error at 100111100101" severity error;

wait for waitTime;
sA_s <= "100111100101";
wait for 1ns;
assert sB_s = "100111100110" 
	report "ADD error at 100111100110" severity error;

wait for waitTime;
sA_s <= "100111100110";
wait for 1ns;
assert sB_s = "100111100111" 
	report "ADD error at 100111100111" severity error;

wait for waitTime;
sA_s <= "100111100111";
wait for 1ns;
assert sB_s = "100111101000" 
	report "ADD error at 100111101000" severity error;

wait for waitTime;
sA_s <= "100111101000";
wait for 1ns;
assert sB_s = "100111101001" 
	report "ADD error at 100111101001" severity error;

wait for waitTime;
sA_s <= "100111101001";
wait for 1ns;
assert sB_s = "100111101010" 
	report "ADD error at 100111101010" severity error;

wait for waitTime;
sA_s <= "100111101010";
wait for 1ns;
assert sB_s = "100111101011" 
	report "ADD error at 100111101011" severity error;

wait for waitTime;
sA_s <= "100111101011";
wait for 1ns;
assert sB_s = "100111101100" 
	report "ADD error at 100111101100" severity error;

wait for waitTime;
sA_s <= "100111101100";
wait for 1ns;
assert sB_s = "100111101101" 
	report "ADD error at 100111101101" severity error;

wait for waitTime;
sA_s <= "100111101101";
wait for 1ns;
assert sB_s = "100111101110" 
	report "ADD error at 100111101110" severity error;

wait for waitTime;
sA_s <= "100111101110";
wait for 1ns;
assert sB_s = "100111101111" 
	report "ADD error at 100111101111" severity error;

wait for waitTime;
sA_s <= "100111101111";
wait for 1ns;
assert sB_s = "100111110000" 
	report "ADD error at 100111110000" severity error;

wait for waitTime;
sA_s <= "100111110000";
wait for 1ns;
assert sB_s = "100111110001" 
	report "ADD error at 100111110001" severity error;

wait for waitTime;
sA_s <= "100111110001";
wait for 1ns;
assert sB_s = "100111110010" 
	report "ADD error at 100111110010" severity error;

wait for waitTime;
sA_s <= "100111110010";
wait for 1ns;
assert sB_s = "100111110011" 
	report "ADD error at 100111110011" severity error;

wait for waitTime;
sA_s <= "100111110011";
wait for 1ns;
assert sB_s = "100111110100" 
	report "ADD error at 100111110100" severity error;

wait for waitTime;
sA_s <= "100111110100";
wait for 1ns;
assert sB_s = "100111110101" 
	report "ADD error at 100111110101" severity error;

wait for waitTime;
sA_s <= "100111110101";
wait for 1ns;
assert sB_s = "100111110110" 
	report "ADD error at 100111110110" severity error;

wait for waitTime;
sA_s <= "100111110110";
wait for 1ns;
assert sB_s = "100111110111" 
	report "ADD error at 100111110111" severity error;

wait for waitTime;
sA_s <= "100111110111";
wait for 1ns;
assert sB_s = "100111111000" 
	report "ADD error at 100111111000" severity error;

wait for waitTime;
sA_s <= "100111111000";
wait for 1ns;
assert sB_s = "100111111001" 
	report "ADD error at 100111111001" severity error;

wait for waitTime;
sA_s <= "100111111001";
wait for 1ns;
assert sB_s = "100111111010" 
	report "ADD error at 100111111010" severity error;

wait for waitTime;
sA_s <= "100111111010";
wait for 1ns;
assert sB_s = "100111111011" 
	report "ADD error at 100111111011" severity error;

wait for waitTime;
sA_s <= "100111111011";
wait for 1ns;
assert sB_s = "100111111100" 
	report "ADD error at 100111111100" severity error;

wait for waitTime;
sA_s <= "100111111100";
wait for 1ns;
assert sB_s = "100111111101" 
	report "ADD error at 100111111101" severity error;

wait for waitTime;
sA_s <= "100111111101";
wait for 1ns;
assert sB_s = "100111111110" 
	report "ADD error at 100111111110" severity error;

wait for waitTime;
sA_s <= "100111111110";
wait for 1ns;
assert sB_s = "100111111111" 
	report "ADD error at 100111111111" severity error;

wait for waitTime;
sA_s <= "100111111111";
wait for 1ns;
assert sB_s = "101000000000" 
	report "ADD error at 101000000000" severity error;

wait for waitTime;
sA_s <= "101000000000";
wait for 1ns;
assert sB_s = "101000000001" 
	report "ADD error at 101000000001" severity error;

wait for waitTime;
sA_s <= "101000000001";
wait for 1ns;
assert sB_s = "101000000010" 
	report "ADD error at 101000000010" severity error;

wait for waitTime;
sA_s <= "101000000010";
wait for 1ns;
assert sB_s = "101000000011" 
	report "ADD error at 101000000011" severity error;

wait for waitTime;
sA_s <= "101000000011";
wait for 1ns;
assert sB_s = "101000000100" 
	report "ADD error at 101000000100" severity error;

wait for waitTime;
sA_s <= "101000000100";
wait for 1ns;
assert sB_s = "101000000101" 
	report "ADD error at 101000000101" severity error;

wait for waitTime;
sA_s <= "101000000101";
wait for 1ns;
assert sB_s = "101000000110" 
	report "ADD error at 101000000110" severity error;

wait for waitTime;
sA_s <= "101000000110";
wait for 1ns;
assert sB_s = "101000000111" 
	report "ADD error at 101000000111" severity error;

wait for waitTime;
sA_s <= "101000000111";
wait for 1ns;
assert sB_s = "101000001000" 
	report "ADD error at 101000001000" severity error;

wait for waitTime;
sA_s <= "101000001000";
wait for 1ns;
assert sB_s = "101000001001" 
	report "ADD error at 101000001001" severity error;

wait for waitTime;
sA_s <= "101000001001";
wait for 1ns;
assert sB_s = "101000001010" 
	report "ADD error at 101000001010" severity error;

wait for waitTime;
sA_s <= "101000001010";
wait for 1ns;
assert sB_s = "101000001011" 
	report "ADD error at 101000001011" severity error;

wait for waitTime;
sA_s <= "101000001011";
wait for 1ns;
assert sB_s = "101000001100" 
	report "ADD error at 101000001100" severity error;

wait for waitTime;
sA_s <= "101000001100";
wait for 1ns;
assert sB_s = "101000001101" 
	report "ADD error at 101000001101" severity error;

wait for waitTime;
sA_s <= "101000001101";
wait for 1ns;
assert sB_s = "101000001110" 
	report "ADD error at 101000001110" severity error;

wait for waitTime;
sA_s <= "101000001110";
wait for 1ns;
assert sB_s = "101000001111" 
	report "ADD error at 101000001111" severity error;

wait for waitTime;
sA_s <= "101000001111";
wait for 1ns;
assert sB_s = "101000010000" 
	report "ADD error at 101000010000" severity error;

wait for waitTime;
sA_s <= "101000010000";
wait for 1ns;
assert sB_s = "101000010001" 
	report "ADD error at 101000010001" severity error;

wait for waitTime;
sA_s <= "101000010001";
wait for 1ns;
assert sB_s = "101000010010" 
	report "ADD error at 101000010010" severity error;

wait for waitTime;
sA_s <= "101000010010";
wait for 1ns;
assert sB_s = "101000010011" 
	report "ADD error at 101000010011" severity error;

wait for waitTime;
sA_s <= "101000010011";
wait for 1ns;
assert sB_s = "101000010100" 
	report "ADD error at 101000010100" severity error;

wait for waitTime;
sA_s <= "101000010100";
wait for 1ns;
assert sB_s = "101000010101" 
	report "ADD error at 101000010101" severity error;

wait for waitTime;
sA_s <= "101000010101";
wait for 1ns;
assert sB_s = "101000010110" 
	report "ADD error at 101000010110" severity error;

wait for waitTime;
sA_s <= "101000010110";
wait for 1ns;
assert sB_s = "101000010111" 
	report "ADD error at 101000010111" severity error;

wait for waitTime;
sA_s <= "101000010111";
wait for 1ns;
assert sB_s = "101000011000" 
	report "ADD error at 101000011000" severity error;

wait for waitTime;
sA_s <= "101000011000";
wait for 1ns;
assert sB_s = "101000011001" 
	report "ADD error at 101000011001" severity error;

wait for waitTime;
sA_s <= "101000011001";
wait for 1ns;
assert sB_s = "101000011010" 
	report "ADD error at 101000011010" severity error;

wait for waitTime;
sA_s <= "101000011010";
wait for 1ns;
assert sB_s = "101000011011" 
	report "ADD error at 101000011011" severity error;

wait for waitTime;
sA_s <= "101000011011";
wait for 1ns;
assert sB_s = "101000011100" 
	report "ADD error at 101000011100" severity error;

wait for waitTime;
sA_s <= "101000011100";
wait for 1ns;
assert sB_s = "101000011101" 
	report "ADD error at 101000011101" severity error;

wait for waitTime;
sA_s <= "101000011101";
wait for 1ns;
assert sB_s = "101000011110" 
	report "ADD error at 101000011110" severity error;

wait for waitTime;
sA_s <= "101000011110";
wait for 1ns;
assert sB_s = "101000011111" 
	report "ADD error at 101000011111" severity error;

wait for waitTime;
sA_s <= "101000011111";
wait for 1ns;
assert sB_s = "101000100000" 
	report "ADD error at 101000100000" severity error;

wait for waitTime;
sA_s <= "101000100000";
wait for 1ns;
assert sB_s = "101000100001" 
	report "ADD error at 101000100001" severity error;

wait for waitTime;
sA_s <= "101000100001";
wait for 1ns;
assert sB_s = "101000100010" 
	report "ADD error at 101000100010" severity error;

wait for waitTime;
sA_s <= "101000100010";
wait for 1ns;
assert sB_s = "101000100011" 
	report "ADD error at 101000100011" severity error;

wait for waitTime;
sA_s <= "101000100011";
wait for 1ns;
assert sB_s = "101000100100" 
	report "ADD error at 101000100100" severity error;

wait for waitTime;
sA_s <= "101000100100";
wait for 1ns;
assert sB_s = "101000100101" 
	report "ADD error at 101000100101" severity error;

wait for waitTime;
sA_s <= "101000100101";
wait for 1ns;
assert sB_s = "101000100110" 
	report "ADD error at 101000100110" severity error;

wait for waitTime;
sA_s <= "101000100110";
wait for 1ns;
assert sB_s = "101000100111" 
	report "ADD error at 101000100111" severity error;

wait for waitTime;
sA_s <= "101000100111";
wait for 1ns;
assert sB_s = "101000101000" 
	report "ADD error at 101000101000" severity error;

wait for waitTime;
sA_s <= "101000101000";
wait for 1ns;
assert sB_s = "101000101001" 
	report "ADD error at 101000101001" severity error;

wait for waitTime;
sA_s <= "101000101001";
wait for 1ns;
assert sB_s = "101000101010" 
	report "ADD error at 101000101010" severity error;

wait for waitTime;
sA_s <= "101000101010";
wait for 1ns;
assert sB_s = "101000101011" 
	report "ADD error at 101000101011" severity error;

wait for waitTime;
sA_s <= "101000101011";
wait for 1ns;
assert sB_s = "101000101100" 
	report "ADD error at 101000101100" severity error;

wait for waitTime;
sA_s <= "101000101100";
wait for 1ns;
assert sB_s = "101000101101" 
	report "ADD error at 101000101101" severity error;

wait for waitTime;
sA_s <= "101000101101";
wait for 1ns;
assert sB_s = "101000101110" 
	report "ADD error at 101000101110" severity error;

wait for waitTime;
sA_s <= "101000101110";
wait for 1ns;
assert sB_s = "101000101111" 
	report "ADD error at 101000101111" severity error;

wait for waitTime;
sA_s <= "101000101111";
wait for 1ns;
assert sB_s = "101000110000" 
	report "ADD error at 101000110000" severity error;

wait for waitTime;
sA_s <= "101000110000";
wait for 1ns;
assert sB_s = "101000110001" 
	report "ADD error at 101000110001" severity error;

wait for waitTime;
sA_s <= "101000110001";
wait for 1ns;
assert sB_s = "101000110010" 
	report "ADD error at 101000110010" severity error;

wait for waitTime;
sA_s <= "101000110010";
wait for 1ns;
assert sB_s = "101000110011" 
	report "ADD error at 101000110011" severity error;

wait for waitTime;
sA_s <= "101000110011";
wait for 1ns;
assert sB_s = "101000110100" 
	report "ADD error at 101000110100" severity error;

wait for waitTime;
sA_s <= "101000110100";
wait for 1ns;
assert sB_s = "101000110101" 
	report "ADD error at 101000110101" severity error;

wait for waitTime;
sA_s <= "101000110101";
wait for 1ns;
assert sB_s = "101000110110" 
	report "ADD error at 101000110110" severity error;

wait for waitTime;
sA_s <= "101000110110";
wait for 1ns;
assert sB_s = "101000110111" 
	report "ADD error at 101000110111" severity error;

wait for waitTime;
sA_s <= "101000110111";
wait for 1ns;
assert sB_s = "101000111000" 
	report "ADD error at 101000111000" severity error;

wait for waitTime;
sA_s <= "101000111000";
wait for 1ns;
assert sB_s = "101000111001" 
	report "ADD error at 101000111001" severity error;

wait for waitTime;
sA_s <= "101000111001";
wait for 1ns;
assert sB_s = "101000111010" 
	report "ADD error at 101000111010" severity error;

wait for waitTime;
sA_s <= "101000111010";
wait for 1ns;
assert sB_s = "101000111011" 
	report "ADD error at 101000111011" severity error;

wait for waitTime;
sA_s <= "101000111011";
wait for 1ns;
assert sB_s = "101000111100" 
	report "ADD error at 101000111100" severity error;

wait for waitTime;
sA_s <= "101000111100";
wait for 1ns;
assert sB_s = "101000111101" 
	report "ADD error at 101000111101" severity error;

wait for waitTime;
sA_s <= "101000111101";
wait for 1ns;
assert sB_s = "101000111110" 
	report "ADD error at 101000111110" severity error;

wait for waitTime;
sA_s <= "101000111110";
wait for 1ns;
assert sB_s = "101000111111" 
	report "ADD error at 101000111111" severity error;

wait for waitTime;
sA_s <= "101000111111";
wait for 1ns;
assert sB_s = "101001000000" 
	report "ADD error at 101001000000" severity error;

wait for waitTime;
sA_s <= "101001000000";
wait for 1ns;
assert sB_s = "101001000001" 
	report "ADD error at 101001000001" severity error;

wait for waitTime;
sA_s <= "101001000001";
wait for 1ns;
assert sB_s = "101001000010" 
	report "ADD error at 101001000010" severity error;

wait for waitTime;
sA_s <= "101001000010";
wait for 1ns;
assert sB_s = "101001000011" 
	report "ADD error at 101001000011" severity error;

wait for waitTime;
sA_s <= "101001000011";
wait for 1ns;
assert sB_s = "101001000100" 
	report "ADD error at 101001000100" severity error;

wait for waitTime;
sA_s <= "101001000100";
wait for 1ns;
assert sB_s = "101001000101" 
	report "ADD error at 101001000101" severity error;

wait for waitTime;
sA_s <= "101001000101";
wait for 1ns;
assert sB_s = "101001000110" 
	report "ADD error at 101001000110" severity error;

wait for waitTime;
sA_s <= "101001000110";
wait for 1ns;
assert sB_s = "101001000111" 
	report "ADD error at 101001000111" severity error;

wait for waitTime;
sA_s <= "101001000111";
wait for 1ns;
assert sB_s = "101001001000" 
	report "ADD error at 101001001000" severity error;

wait for waitTime;
sA_s <= "101001001000";
wait for 1ns;
assert sB_s = "101001001001" 
	report "ADD error at 101001001001" severity error;

wait for waitTime;
sA_s <= "101001001001";
wait for 1ns;
assert sB_s = "101001001010" 
	report "ADD error at 101001001010" severity error;

wait for waitTime;
sA_s <= "101001001010";
wait for 1ns;
assert sB_s = "101001001011" 
	report "ADD error at 101001001011" severity error;

wait for waitTime;
sA_s <= "101001001011";
wait for 1ns;
assert sB_s = "101001001100" 
	report "ADD error at 101001001100" severity error;

wait for waitTime;
sA_s <= "101001001100";
wait for 1ns;
assert sB_s = "101001001101" 
	report "ADD error at 101001001101" severity error;

wait for waitTime;
sA_s <= "101001001101";
wait for 1ns;
assert sB_s = "101001001110" 
	report "ADD error at 101001001110" severity error;

wait for waitTime;
sA_s <= "101001001110";
wait for 1ns;
assert sB_s = "101001001111" 
	report "ADD error at 101001001111" severity error;

wait for waitTime;
sA_s <= "101001001111";
wait for 1ns;
assert sB_s = "101001010000" 
	report "ADD error at 101001010000" severity error;

wait for waitTime;
sA_s <= "101001010000";
wait for 1ns;
assert sB_s = "101001010001" 
	report "ADD error at 101001010001" severity error;

wait for waitTime;
sA_s <= "101001010001";
wait for 1ns;
assert sB_s = "101001010010" 
	report "ADD error at 101001010010" severity error;

wait for waitTime;
sA_s <= "101001010010";
wait for 1ns;
assert sB_s = "101001010011" 
	report "ADD error at 101001010011" severity error;

wait for waitTime;
sA_s <= "101001010011";
wait for 1ns;
assert sB_s = "101001010100" 
	report "ADD error at 101001010100" severity error;

wait for waitTime;
sA_s <= "101001010100";
wait for 1ns;
assert sB_s = "101001010101" 
	report "ADD error at 101001010101" severity error;

wait for waitTime;
sA_s <= "101001010101";
wait for 1ns;
assert sB_s = "101001010110" 
	report "ADD error at 101001010110" severity error;

wait for waitTime;
sA_s <= "101001010110";
wait for 1ns;
assert sB_s = "101001010111" 
	report "ADD error at 101001010111" severity error;

wait for waitTime;
sA_s <= "101001010111";
wait for 1ns;
assert sB_s = "101001011000" 
	report "ADD error at 101001011000" severity error;

wait for waitTime;
sA_s <= "101001011000";
wait for 1ns;
assert sB_s = "101001011001" 
	report "ADD error at 101001011001" severity error;

wait for waitTime;
sA_s <= "101001011001";
wait for 1ns;
assert sB_s = "101001011010" 
	report "ADD error at 101001011010" severity error;

wait for waitTime;
sA_s <= "101001011010";
wait for 1ns;
assert sB_s = "101001011011" 
	report "ADD error at 101001011011" severity error;

wait for waitTime;
sA_s <= "101001011011";
wait for 1ns;
assert sB_s = "101001011100" 
	report "ADD error at 101001011100" severity error;

wait for waitTime;
sA_s <= "101001011100";
wait for 1ns;
assert sB_s = "101001011101" 
	report "ADD error at 101001011101" severity error;

wait for waitTime;
sA_s <= "101001011101";
wait for 1ns;
assert sB_s = "101001011110" 
	report "ADD error at 101001011110" severity error;

wait for waitTime;
sA_s <= "101001011110";
wait for 1ns;
assert sB_s = "101001011111" 
	report "ADD error at 101001011111" severity error;

wait for waitTime;
sA_s <= "101001011111";
wait for 1ns;
assert sB_s = "101001100000" 
	report "ADD error at 101001100000" severity error;

wait for waitTime;
sA_s <= "101001100000";
wait for 1ns;
assert sB_s = "101001100001" 
	report "ADD error at 101001100001" severity error;

wait for waitTime;
sA_s <= "101001100001";
wait for 1ns;
assert sB_s = "101001100010" 
	report "ADD error at 101001100010" severity error;

wait for waitTime;
sA_s <= "101001100010";
wait for 1ns;
assert sB_s = "101001100011" 
	report "ADD error at 101001100011" severity error;

wait for waitTime;
sA_s <= "101001100011";
wait for 1ns;
assert sB_s = "101001100100" 
	report "ADD error at 101001100100" severity error;

wait for waitTime;
sA_s <= "101001100100";
wait for 1ns;
assert sB_s = "101001100101" 
	report "ADD error at 101001100101" severity error;

wait for waitTime;
sA_s <= "101001100101";
wait for 1ns;
assert sB_s = "101001100110" 
	report "ADD error at 101001100110" severity error;

wait for waitTime;
sA_s <= "101001100110";
wait for 1ns;
assert sB_s = "101001100111" 
	report "ADD error at 101001100111" severity error;

wait for waitTime;
sA_s <= "101001100111";
wait for 1ns;
assert sB_s = "101001101000" 
	report "ADD error at 101001101000" severity error;

wait for waitTime;
sA_s <= "101001101000";
wait for 1ns;
assert sB_s = "101001101001" 
	report "ADD error at 101001101001" severity error;

wait for waitTime;
sA_s <= "101001101001";
wait for 1ns;
assert sB_s = "101001101010" 
	report "ADD error at 101001101010" severity error;

wait for waitTime;
sA_s <= "101001101010";
wait for 1ns;
assert sB_s = "101001101011" 
	report "ADD error at 101001101011" severity error;

wait for waitTime;
sA_s <= "101001101011";
wait for 1ns;
assert sB_s = "101001101100" 
	report "ADD error at 101001101100" severity error;

wait for waitTime;
sA_s <= "101001101100";
wait for 1ns;
assert sB_s = "101001101101" 
	report "ADD error at 101001101101" severity error;

wait for waitTime;
sA_s <= "101001101101";
wait for 1ns;
assert sB_s = "101001101110" 
	report "ADD error at 101001101110" severity error;

wait for waitTime;
sA_s <= "101001101110";
wait for 1ns;
assert sB_s = "101001101111" 
	report "ADD error at 101001101111" severity error;

wait for waitTime;
sA_s <= "101001101111";
wait for 1ns;
assert sB_s = "101001110000" 
	report "ADD error at 101001110000" severity error;

wait for waitTime;
sA_s <= "101001110000";
wait for 1ns;
assert sB_s = "101001110001" 
	report "ADD error at 101001110001" severity error;

wait for waitTime;
sA_s <= "101001110001";
wait for 1ns;
assert sB_s = "101001110010" 
	report "ADD error at 101001110010" severity error;

wait for waitTime;
sA_s <= "101001110010";
wait for 1ns;
assert sB_s = "101001110011" 
	report "ADD error at 101001110011" severity error;

wait for waitTime;
sA_s <= "101001110011";
wait for 1ns;
assert sB_s = "101001110100" 
	report "ADD error at 101001110100" severity error;

wait for waitTime;
sA_s <= "101001110100";
wait for 1ns;
assert sB_s = "101001110101" 
	report "ADD error at 101001110101" severity error;

wait for waitTime;
sA_s <= "101001110101";
wait for 1ns;
assert sB_s = "101001110110" 
	report "ADD error at 101001110110" severity error;

wait for waitTime;
sA_s <= "101001110110";
wait for 1ns;
assert sB_s = "101001110111" 
	report "ADD error at 101001110111" severity error;

wait for waitTime;
sA_s <= "101001110111";
wait for 1ns;
assert sB_s = "101001111000" 
	report "ADD error at 101001111000" severity error;

wait for waitTime;
sA_s <= "101001111000";
wait for 1ns;
assert sB_s = "101001111001" 
	report "ADD error at 101001111001" severity error;

wait for waitTime;
sA_s <= "101001111001";
wait for 1ns;
assert sB_s = "101001111010" 
	report "ADD error at 101001111010" severity error;

wait for waitTime;
sA_s <= "101001111010";
wait for 1ns;
assert sB_s = "101001111011" 
	report "ADD error at 101001111011" severity error;

wait for waitTime;
sA_s <= "101001111011";
wait for 1ns;
assert sB_s = "101001111100" 
	report "ADD error at 101001111100" severity error;

wait for waitTime;
sA_s <= "101001111100";
wait for 1ns;
assert sB_s = "101001111101" 
	report "ADD error at 101001111101" severity error;

wait for waitTime;
sA_s <= "101001111101";
wait for 1ns;
assert sB_s = "101001111110" 
	report "ADD error at 101001111110" severity error;

wait for waitTime;
sA_s <= "101001111110";
wait for 1ns;
assert sB_s = "101001111111" 
	report "ADD error at 101001111111" severity error;

wait for waitTime;
sA_s <= "101001111111";
wait for 1ns;
assert sB_s = "101010000000" 
	report "ADD error at 101010000000" severity error;

wait for waitTime;
sA_s <= "101010000000";
wait for 1ns;
assert sB_s = "101010000001" 
	report "ADD error at 101010000001" severity error;

wait for waitTime;
sA_s <= "101010000001";
wait for 1ns;
assert sB_s = "101010000010" 
	report "ADD error at 101010000010" severity error;

wait for waitTime;
sA_s <= "101010000010";
wait for 1ns;
assert sB_s = "101010000011" 
	report "ADD error at 101010000011" severity error;

wait for waitTime;
sA_s <= "101010000011";
wait for 1ns;
assert sB_s = "101010000100" 
	report "ADD error at 101010000100" severity error;

wait for waitTime;
sA_s <= "101010000100";
wait for 1ns;
assert sB_s = "101010000101" 
	report "ADD error at 101010000101" severity error;

wait for waitTime;
sA_s <= "101010000101";
wait for 1ns;
assert sB_s = "101010000110" 
	report "ADD error at 101010000110" severity error;

wait for waitTime;
sA_s <= "101010000110";
wait for 1ns;
assert sB_s = "101010000111" 
	report "ADD error at 101010000111" severity error;

wait for waitTime;
sA_s <= "101010000111";
wait for 1ns;
assert sB_s = "101010001000" 
	report "ADD error at 101010001000" severity error;

wait for waitTime;
sA_s <= "101010001000";
wait for 1ns;
assert sB_s = "101010001001" 
	report "ADD error at 101010001001" severity error;

wait for waitTime;
sA_s <= "101010001001";
wait for 1ns;
assert sB_s = "101010001010" 
	report "ADD error at 101010001010" severity error;

wait for waitTime;
sA_s <= "101010001010";
wait for 1ns;
assert sB_s = "101010001011" 
	report "ADD error at 101010001011" severity error;

wait for waitTime;
sA_s <= "101010001011";
wait for 1ns;
assert sB_s = "101010001100" 
	report "ADD error at 101010001100" severity error;

wait for waitTime;
sA_s <= "101010001100";
wait for 1ns;
assert sB_s = "101010001101" 
	report "ADD error at 101010001101" severity error;

wait for waitTime;
sA_s <= "101010001101";
wait for 1ns;
assert sB_s = "101010001110" 
	report "ADD error at 101010001110" severity error;

wait for waitTime;
sA_s <= "101010001110";
wait for 1ns;
assert sB_s = "101010001111" 
	report "ADD error at 101010001111" severity error;

wait for waitTime;
sA_s <= "101010001111";
wait for 1ns;
assert sB_s = "101010010000" 
	report "ADD error at 101010010000" severity error;

wait for waitTime;
sA_s <= "101010010000";
wait for 1ns;
assert sB_s = "101010010001" 
	report "ADD error at 101010010001" severity error;

wait for waitTime;
sA_s <= "101010010001";
wait for 1ns;
assert sB_s = "101010010010" 
	report "ADD error at 101010010010" severity error;

wait for waitTime;
sA_s <= "101010010010";
wait for 1ns;
assert sB_s = "101010010011" 
	report "ADD error at 101010010011" severity error;

wait for waitTime;
sA_s <= "101010010011";
wait for 1ns;
assert sB_s = "101010010100" 
	report "ADD error at 101010010100" severity error;

wait for waitTime;
sA_s <= "101010010100";
wait for 1ns;
assert sB_s = "101010010101" 
	report "ADD error at 101010010101" severity error;

wait for waitTime;
sA_s <= "101010010101";
wait for 1ns;
assert sB_s = "101010010110" 
	report "ADD error at 101010010110" severity error;

wait for waitTime;
sA_s <= "101010010110";
wait for 1ns;
assert sB_s = "101010010111" 
	report "ADD error at 101010010111" severity error;

wait for waitTime;
sA_s <= "101010010111";
wait for 1ns;
assert sB_s = "101010011000" 
	report "ADD error at 101010011000" severity error;

wait for waitTime;
sA_s <= "101010011000";
wait for 1ns;
assert sB_s = "101010011001" 
	report "ADD error at 101010011001" severity error;

wait for waitTime;
sA_s <= "101010011001";
wait for 1ns;
assert sB_s = "101010011010" 
	report "ADD error at 101010011010" severity error;

wait for waitTime;
sA_s <= "101010011010";
wait for 1ns;
assert sB_s = "101010011011" 
	report "ADD error at 101010011011" severity error;

wait for waitTime;
sA_s <= "101010011011";
wait for 1ns;
assert sB_s = "101010011100" 
	report "ADD error at 101010011100" severity error;

wait for waitTime;
sA_s <= "101010011100";
wait for 1ns;
assert sB_s = "101010011101" 
	report "ADD error at 101010011101" severity error;

wait for waitTime;
sA_s <= "101010011101";
wait for 1ns;
assert sB_s = "101010011110" 
	report "ADD error at 101010011110" severity error;

wait for waitTime;
sA_s <= "101010011110";
wait for 1ns;
assert sB_s = "101010011111" 
	report "ADD error at 101010011111" severity error;

wait for waitTime;
sA_s <= "101010011111";
wait for 1ns;
assert sB_s = "101010100000" 
	report "ADD error at 101010100000" severity error;

wait for waitTime;
sA_s <= "101010100000";
wait for 1ns;
assert sB_s = "101010100001" 
	report "ADD error at 101010100001" severity error;

wait for waitTime;
sA_s <= "101010100001";
wait for 1ns;
assert sB_s = "101010100010" 
	report "ADD error at 101010100010" severity error;

wait for waitTime;
sA_s <= "101010100010";
wait for 1ns;
assert sB_s = "101010100011" 
	report "ADD error at 101010100011" severity error;

wait for waitTime;
sA_s <= "101010100011";
wait for 1ns;
assert sB_s = "101010100100" 
	report "ADD error at 101010100100" severity error;

wait for waitTime;
sA_s <= "101010100100";
wait for 1ns;
assert sB_s = "101010100101" 
	report "ADD error at 101010100101" severity error;

wait for waitTime;
sA_s <= "101010100101";
wait for 1ns;
assert sB_s = "101010100110" 
	report "ADD error at 101010100110" severity error;

wait for waitTime;
sA_s <= "101010100110";
wait for 1ns;
assert sB_s = "101010100111" 
	report "ADD error at 101010100111" severity error;

wait for waitTime;
sA_s <= "101010100111";
wait for 1ns;
assert sB_s = "101010101000" 
	report "ADD error at 101010101000" severity error;

wait for waitTime;
sA_s <= "101010101000";
wait for 1ns;
assert sB_s = "101010101001" 
	report "ADD error at 101010101001" severity error;

wait for waitTime;
sA_s <= "101010101001";
wait for 1ns;
assert sB_s = "101010101010" 
	report "ADD error at 101010101010" severity error;

wait for waitTime;
sA_s <= "101010101010";
wait for 1ns;
assert sB_s = "101010101011" 
	report "ADD error at 101010101011" severity error;

wait for waitTime;
sA_s <= "101010101011";
wait for 1ns;
assert sB_s = "101010101100" 
	report "ADD error at 101010101100" severity error;

wait for waitTime;
sA_s <= "101010101100";
wait for 1ns;
assert sB_s = "101010101101" 
	report "ADD error at 101010101101" severity error;

wait for waitTime;
sA_s <= "101010101101";
wait for 1ns;
assert sB_s = "101010101110" 
	report "ADD error at 101010101110" severity error;

wait for waitTime;
sA_s <= "101010101110";
wait for 1ns;
assert sB_s = "101010101111" 
	report "ADD error at 101010101111" severity error;

wait for waitTime;
sA_s <= "101010101111";
wait for 1ns;
assert sB_s = "101010110000" 
	report "ADD error at 101010110000" severity error;

wait for waitTime;
sA_s <= "101010110000";
wait for 1ns;
assert sB_s = "101010110001" 
	report "ADD error at 101010110001" severity error;

wait for waitTime;
sA_s <= "101010110001";
wait for 1ns;
assert sB_s = "101010110010" 
	report "ADD error at 101010110010" severity error;

wait for waitTime;
sA_s <= "101010110010";
wait for 1ns;
assert sB_s = "101010110011" 
	report "ADD error at 101010110011" severity error;

wait for waitTime;
sA_s <= "101010110011";
wait for 1ns;
assert sB_s = "101010110100" 
	report "ADD error at 101010110100" severity error;

wait for waitTime;
sA_s <= "101010110100";
wait for 1ns;
assert sB_s = "101010110101" 
	report "ADD error at 101010110101" severity error;

wait for waitTime;
sA_s <= "101010110101";
wait for 1ns;
assert sB_s = "101010110110" 
	report "ADD error at 101010110110" severity error;

wait for waitTime;
sA_s <= "101010110110";
wait for 1ns;
assert sB_s = "101010110111" 
	report "ADD error at 101010110111" severity error;

wait for waitTime;
sA_s <= "101010110111";
wait for 1ns;
assert sB_s = "101010111000" 
	report "ADD error at 101010111000" severity error;

wait for waitTime;
sA_s <= "101010111000";
wait for 1ns;
assert sB_s = "101010111001" 
	report "ADD error at 101010111001" severity error;

wait for waitTime;
sA_s <= "101010111001";
wait for 1ns;
assert sB_s = "101010111010" 
	report "ADD error at 101010111010" severity error;

wait for waitTime;
sA_s <= "101010111010";
wait for 1ns;
assert sB_s = "101010111011" 
	report "ADD error at 101010111011" severity error;

wait for waitTime;
sA_s <= "101010111011";
wait for 1ns;
assert sB_s = "101010111100" 
	report "ADD error at 101010111100" severity error;

wait for waitTime;
sA_s <= "101010111100";
wait for 1ns;
assert sB_s = "101010111101" 
	report "ADD error at 101010111101" severity error;

wait for waitTime;
sA_s <= "101010111101";
wait for 1ns;
assert sB_s = "101010111110" 
	report "ADD error at 101010111110" severity error;

wait for waitTime;
sA_s <= "101010111110";
wait for 1ns;
assert sB_s = "101010111111" 
	report "ADD error at 101010111111" severity error;

wait for waitTime;
sA_s <= "101010111111";
wait for 1ns;
assert sB_s = "101011000000" 
	report "ADD error at 101011000000" severity error;

wait for waitTime;
sA_s <= "101011000000";
wait for 1ns;
assert sB_s = "101011000001" 
	report "ADD error at 101011000001" severity error;

wait for waitTime;
sA_s <= "101011000001";
wait for 1ns;
assert sB_s = "101011000010" 
	report "ADD error at 101011000010" severity error;

wait for waitTime;
sA_s <= "101011000010";
wait for 1ns;
assert sB_s = "101011000011" 
	report "ADD error at 101011000011" severity error;

wait for waitTime;
sA_s <= "101011000011";
wait for 1ns;
assert sB_s = "101011000100" 
	report "ADD error at 101011000100" severity error;

wait for waitTime;
sA_s <= "101011000100";
wait for 1ns;
assert sB_s = "101011000101" 
	report "ADD error at 101011000101" severity error;

wait for waitTime;
sA_s <= "101011000101";
wait for 1ns;
assert sB_s = "101011000110" 
	report "ADD error at 101011000110" severity error;

wait for waitTime;
sA_s <= "101011000110";
wait for 1ns;
assert sB_s = "101011000111" 
	report "ADD error at 101011000111" severity error;

wait for waitTime;
sA_s <= "101011000111";
wait for 1ns;
assert sB_s = "101011001000" 
	report "ADD error at 101011001000" severity error;

wait for waitTime;
sA_s <= "101011001000";
wait for 1ns;
assert sB_s = "101011001001" 
	report "ADD error at 101011001001" severity error;

wait for waitTime;
sA_s <= "101011001001";
wait for 1ns;
assert sB_s = "101011001010" 
	report "ADD error at 101011001010" severity error;

wait for waitTime;
sA_s <= "101011001010";
wait for 1ns;
assert sB_s = "101011001011" 
	report "ADD error at 101011001011" severity error;

wait for waitTime;
sA_s <= "101011001011";
wait for 1ns;
assert sB_s = "101011001100" 
	report "ADD error at 101011001100" severity error;

wait for waitTime;
sA_s <= "101011001100";
wait for 1ns;
assert sB_s = "101011001101" 
	report "ADD error at 101011001101" severity error;

wait for waitTime;
sA_s <= "101011001101";
wait for 1ns;
assert sB_s = "101011001110" 
	report "ADD error at 101011001110" severity error;

wait for waitTime;
sA_s <= "101011001110";
wait for 1ns;
assert sB_s = "101011001111" 
	report "ADD error at 101011001111" severity error;

wait for waitTime;
sA_s <= "101011001111";
wait for 1ns;
assert sB_s = "101011010000" 
	report "ADD error at 101011010000" severity error;

wait for waitTime;
sA_s <= "101011010000";
wait for 1ns;
assert sB_s = "101011010001" 
	report "ADD error at 101011010001" severity error;

wait for waitTime;
sA_s <= "101011010001";
wait for 1ns;
assert sB_s = "101011010010" 
	report "ADD error at 101011010010" severity error;

wait for waitTime;
sA_s <= "101011010010";
wait for 1ns;
assert sB_s = "101011010011" 
	report "ADD error at 101011010011" severity error;

wait for waitTime;
sA_s <= "101011010011";
wait for 1ns;
assert sB_s = "101011010100" 
	report "ADD error at 101011010100" severity error;

wait for waitTime;
sA_s <= "101011010100";
wait for 1ns;
assert sB_s = "101011010101" 
	report "ADD error at 101011010101" severity error;

wait for waitTime;
sA_s <= "101011010101";
wait for 1ns;
assert sB_s = "101011010110" 
	report "ADD error at 101011010110" severity error;

wait for waitTime;
sA_s <= "101011010110";
wait for 1ns;
assert sB_s = "101011010111" 
	report "ADD error at 101011010111" severity error;

wait for waitTime;
sA_s <= "101011010111";
wait for 1ns;
assert sB_s = "101011011000" 
	report "ADD error at 101011011000" severity error;

wait for waitTime;
sA_s <= "101011011000";
wait for 1ns;
assert sB_s = "101011011001" 
	report "ADD error at 101011011001" severity error;

wait for waitTime;
sA_s <= "101011011001";
wait for 1ns;
assert sB_s = "101011011010" 
	report "ADD error at 101011011010" severity error;

wait for waitTime;
sA_s <= "101011011010";
wait for 1ns;
assert sB_s = "101011011011" 
	report "ADD error at 101011011011" severity error;

wait for waitTime;
sA_s <= "101011011011";
wait for 1ns;
assert sB_s = "101011011100" 
	report "ADD error at 101011011100" severity error;

wait for waitTime;
sA_s <= "101011011100";
wait for 1ns;
assert sB_s = "101011011101" 
	report "ADD error at 101011011101" severity error;

wait for waitTime;
sA_s <= "101011011101";
wait for 1ns;
assert sB_s = "101011011110" 
	report "ADD error at 101011011110" severity error;

wait for waitTime;
sA_s <= "101011011110";
wait for 1ns;
assert sB_s = "101011011111" 
	report "ADD error at 101011011111" severity error;

wait for waitTime;
sA_s <= "101011011111";
wait for 1ns;
assert sB_s = "101011100000" 
	report "ADD error at 101011100000" severity error;

wait for waitTime;
sA_s <= "101011100000";
wait for 1ns;
assert sB_s = "101011100001" 
	report "ADD error at 101011100001" severity error;

wait for waitTime;
sA_s <= "101011100001";
wait for 1ns;
assert sB_s = "101011100010" 
	report "ADD error at 101011100010" severity error;

wait for waitTime;
sA_s <= "101011100010";
wait for 1ns;
assert sB_s = "101011100011" 
	report "ADD error at 101011100011" severity error;

wait for waitTime;
sA_s <= "101011100011";
wait for 1ns;
assert sB_s = "101011100100" 
	report "ADD error at 101011100100" severity error;

wait for waitTime;
sA_s <= "101011100100";
wait for 1ns;
assert sB_s = "101011100101" 
	report "ADD error at 101011100101" severity error;

wait for waitTime;
sA_s <= "101011100101";
wait for 1ns;
assert sB_s = "101011100110" 
	report "ADD error at 101011100110" severity error;

wait for waitTime;
sA_s <= "101011100110";
wait for 1ns;
assert sB_s = "101011100111" 
	report "ADD error at 101011100111" severity error;

wait for waitTime;
sA_s <= "101011100111";
wait for 1ns;
assert sB_s = "101011101000" 
	report "ADD error at 101011101000" severity error;

wait for waitTime;
sA_s <= "101011101000";
wait for 1ns;
assert sB_s = "101011101001" 
	report "ADD error at 101011101001" severity error;

wait for waitTime;
sA_s <= "101011101001";
wait for 1ns;
assert sB_s = "101011101010" 
	report "ADD error at 101011101010" severity error;

wait for waitTime;
sA_s <= "101011101010";
wait for 1ns;
assert sB_s = "101011101011" 
	report "ADD error at 101011101011" severity error;

wait for waitTime;
sA_s <= "101011101011";
wait for 1ns;
assert sB_s = "101011101100" 
	report "ADD error at 101011101100" severity error;

wait for waitTime;
sA_s <= "101011101100";
wait for 1ns;
assert sB_s = "101011101101" 
	report "ADD error at 101011101101" severity error;

wait for waitTime;
sA_s <= "101011101101";
wait for 1ns;
assert sB_s = "101011101110" 
	report "ADD error at 101011101110" severity error;

wait for waitTime;
sA_s <= "101011101110";
wait for 1ns;
assert sB_s = "101011101111" 
	report "ADD error at 101011101111" severity error;

wait for waitTime;
sA_s <= "101011101111";
wait for 1ns;
assert sB_s = "101011110000" 
	report "ADD error at 101011110000" severity error;

wait for waitTime;
sA_s <= "101011110000";
wait for 1ns;
assert sB_s = "101011110001" 
	report "ADD error at 101011110001" severity error;

wait for waitTime;
sA_s <= "101011110001";
wait for 1ns;
assert sB_s = "101011110010" 
	report "ADD error at 101011110010" severity error;

wait for waitTime;
sA_s <= "101011110010";
wait for 1ns;
assert sB_s = "101011110011" 
	report "ADD error at 101011110011" severity error;

wait for waitTime;
sA_s <= "101011110011";
wait for 1ns;
assert sB_s = "101011110100" 
	report "ADD error at 101011110100" severity error;

wait for waitTime;
sA_s <= "101011110100";
wait for 1ns;
assert sB_s = "101011110101" 
	report "ADD error at 101011110101" severity error;

wait for waitTime;
sA_s <= "101011110101";
wait for 1ns;
assert sB_s = "101011110110" 
	report "ADD error at 101011110110" severity error;

wait for waitTime;
sA_s <= "101011110110";
wait for 1ns;
assert sB_s = "101011110111" 
	report "ADD error at 101011110111" severity error;

wait for waitTime;
sA_s <= "101011110111";
wait for 1ns;
assert sB_s = "101011111000" 
	report "ADD error at 101011111000" severity error;

wait for waitTime;
sA_s <= "101011111000";
wait for 1ns;
assert sB_s = "101011111001" 
	report "ADD error at 101011111001" severity error;

wait for waitTime;
sA_s <= "101011111001";
wait for 1ns;
assert sB_s = "101011111010" 
	report "ADD error at 101011111010" severity error;

wait for waitTime;
sA_s <= "101011111010";
wait for 1ns;
assert sB_s = "101011111011" 
	report "ADD error at 101011111011" severity error;

wait for waitTime;
sA_s <= "101011111011";
wait for 1ns;
assert sB_s = "101011111100" 
	report "ADD error at 101011111100" severity error;

wait for waitTime;
sA_s <= "101011111100";
wait for 1ns;
assert sB_s = "101011111101" 
	report "ADD error at 101011111101" severity error;

wait for waitTime;
sA_s <= "101011111101";
wait for 1ns;
assert sB_s = "101011111110" 
	report "ADD error at 101011111110" severity error;

wait for waitTime;
sA_s <= "101011111110";
wait for 1ns;
assert sB_s = "101011111111" 
	report "ADD error at 101011111111" severity error;

wait for waitTime;
sA_s <= "101011111111";
wait for 1ns;
assert sB_s = "101100000000" 
	report "ADD error at 101100000000" severity error;

wait for waitTime;
sA_s <= "101100000000";
wait for 1ns;
assert sB_s = "101100000001" 
	report "ADD error at 101100000001" severity error;

wait for waitTime;
sA_s <= "101100000001";
wait for 1ns;
assert sB_s = "101100000010" 
	report "ADD error at 101100000010" severity error;

wait for waitTime;
sA_s <= "101100000010";
wait for 1ns;
assert sB_s = "101100000011" 
	report "ADD error at 101100000011" severity error;

wait for waitTime;
sA_s <= "101100000011";
wait for 1ns;
assert sB_s = "101100000100" 
	report "ADD error at 101100000100" severity error;

wait for waitTime;
sA_s <= "101100000100";
wait for 1ns;
assert sB_s = "101100000101" 
	report "ADD error at 101100000101" severity error;

wait for waitTime;
sA_s <= "101100000101";
wait for 1ns;
assert sB_s = "101100000110" 
	report "ADD error at 101100000110" severity error;

wait for waitTime;
sA_s <= "101100000110";
wait for 1ns;
assert sB_s = "101100000111" 
	report "ADD error at 101100000111" severity error;

wait for waitTime;
sA_s <= "101100000111";
wait for 1ns;
assert sB_s = "101100001000" 
	report "ADD error at 101100001000" severity error;

wait for waitTime;
sA_s <= "101100001000";
wait for 1ns;
assert sB_s = "101100001001" 
	report "ADD error at 101100001001" severity error;

wait for waitTime;
sA_s <= "101100001001";
wait for 1ns;
assert sB_s = "101100001010" 
	report "ADD error at 101100001010" severity error;

wait for waitTime;
sA_s <= "101100001010";
wait for 1ns;
assert sB_s = "101100001011" 
	report "ADD error at 101100001011" severity error;

wait for waitTime;
sA_s <= "101100001011";
wait for 1ns;
assert sB_s = "101100001100" 
	report "ADD error at 101100001100" severity error;

wait for waitTime;
sA_s <= "101100001100";
wait for 1ns;
assert sB_s = "101100001101" 
	report "ADD error at 101100001101" severity error;

wait for waitTime;
sA_s <= "101100001101";
wait for 1ns;
assert sB_s = "101100001110" 
	report "ADD error at 101100001110" severity error;

wait for waitTime;
sA_s <= "101100001110";
wait for 1ns;
assert sB_s = "101100001111" 
	report "ADD error at 101100001111" severity error;

wait for waitTime;
sA_s <= "101100001111";
wait for 1ns;
assert sB_s = "101100010000" 
	report "ADD error at 101100010000" severity error;

wait for waitTime;
sA_s <= "101100010000";
wait for 1ns;
assert sB_s = "101100010001" 
	report "ADD error at 101100010001" severity error;

wait for waitTime;
sA_s <= "101100010001";
wait for 1ns;
assert sB_s = "101100010010" 
	report "ADD error at 101100010010" severity error;

wait for waitTime;
sA_s <= "101100010010";
wait for 1ns;
assert sB_s = "101100010011" 
	report "ADD error at 101100010011" severity error;

wait for waitTime;
sA_s <= "101100010011";
wait for 1ns;
assert sB_s = "101100010100" 
	report "ADD error at 101100010100" severity error;

wait for waitTime;
sA_s <= "101100010100";
wait for 1ns;
assert sB_s = "101100010101" 
	report "ADD error at 101100010101" severity error;

wait for waitTime;
sA_s <= "101100010101";
wait for 1ns;
assert sB_s = "101100010110" 
	report "ADD error at 101100010110" severity error;

wait for waitTime;
sA_s <= "101100010110";
wait for 1ns;
assert sB_s = "101100010111" 
	report "ADD error at 101100010111" severity error;

wait for waitTime;
sA_s <= "101100010111";
wait for 1ns;
assert sB_s = "101100011000" 
	report "ADD error at 101100011000" severity error;

wait for waitTime;
sA_s <= "101100011000";
wait for 1ns;
assert sB_s = "101100011001" 
	report "ADD error at 101100011001" severity error;

wait for waitTime;
sA_s <= "101100011001";
wait for 1ns;
assert sB_s = "101100011010" 
	report "ADD error at 101100011010" severity error;

wait for waitTime;
sA_s <= "101100011010";
wait for 1ns;
assert sB_s = "101100011011" 
	report "ADD error at 101100011011" severity error;

wait for waitTime;
sA_s <= "101100011011";
wait for 1ns;
assert sB_s = "101100011100" 
	report "ADD error at 101100011100" severity error;

wait for waitTime;
sA_s <= "101100011100";
wait for 1ns;
assert sB_s = "101100011101" 
	report "ADD error at 101100011101" severity error;

wait for waitTime;
sA_s <= "101100011101";
wait for 1ns;
assert sB_s = "101100011110" 
	report "ADD error at 101100011110" severity error;

wait for waitTime;
sA_s <= "101100011110";
wait for 1ns;
assert sB_s = "101100011111" 
	report "ADD error at 101100011111" severity error;

wait for waitTime;
sA_s <= "101100011111";
wait for 1ns;
assert sB_s = "101100100000" 
	report "ADD error at 101100100000" severity error;

wait for waitTime;
sA_s <= "101100100000";
wait for 1ns;
assert sB_s = "101100100001" 
	report "ADD error at 101100100001" severity error;

wait for waitTime;
sA_s <= "101100100001";
wait for 1ns;
assert sB_s = "101100100010" 
	report "ADD error at 101100100010" severity error;

wait for waitTime;
sA_s <= "101100100010";
wait for 1ns;
assert sB_s = "101100100011" 
	report "ADD error at 101100100011" severity error;

wait for waitTime;
sA_s <= "101100100011";
wait for 1ns;
assert sB_s = "101100100100" 
	report "ADD error at 101100100100" severity error;

wait for waitTime;
sA_s <= "101100100100";
wait for 1ns;
assert sB_s = "101100100101" 
	report "ADD error at 101100100101" severity error;

wait for waitTime;
sA_s <= "101100100101";
wait for 1ns;
assert sB_s = "101100100110" 
	report "ADD error at 101100100110" severity error;

wait for waitTime;
sA_s <= "101100100110";
wait for 1ns;
assert sB_s = "101100100111" 
	report "ADD error at 101100100111" severity error;

wait for waitTime;
sA_s <= "101100100111";
wait for 1ns;
assert sB_s = "101100101000" 
	report "ADD error at 101100101000" severity error;

wait for waitTime;
sA_s <= "101100101000";
wait for 1ns;
assert sB_s = "101100101001" 
	report "ADD error at 101100101001" severity error;

wait for waitTime;
sA_s <= "101100101001";
wait for 1ns;
assert sB_s = "101100101010" 
	report "ADD error at 101100101010" severity error;

wait for waitTime;
sA_s <= "101100101010";
wait for 1ns;
assert sB_s = "101100101011" 
	report "ADD error at 101100101011" severity error;

wait for waitTime;
sA_s <= "101100101011";
wait for 1ns;
assert sB_s = "101100101100" 
	report "ADD error at 101100101100" severity error;

wait for waitTime;
sA_s <= "101100101100";
wait for 1ns;
assert sB_s = "101100101101" 
	report "ADD error at 101100101101" severity error;

wait for waitTime;
sA_s <= "101100101101";
wait for 1ns;
assert sB_s = "101100101110" 
	report "ADD error at 101100101110" severity error;

wait for waitTime;
sA_s <= "101100101110";
wait for 1ns;
assert sB_s = "101100101111" 
	report "ADD error at 101100101111" severity error;

wait for waitTime;
sA_s <= "101100101111";
wait for 1ns;
assert sB_s = "101100110000" 
	report "ADD error at 101100110000" severity error;

wait for waitTime;
sA_s <= "101100110000";
wait for 1ns;
assert sB_s = "101100110001" 
	report "ADD error at 101100110001" severity error;

wait for waitTime;
sA_s <= "101100110001";
wait for 1ns;
assert sB_s = "101100110010" 
	report "ADD error at 101100110010" severity error;

wait for waitTime;
sA_s <= "101100110010";
wait for 1ns;
assert sB_s = "101100110011" 
	report "ADD error at 101100110011" severity error;

wait for waitTime;
sA_s <= "101100110011";
wait for 1ns;
assert sB_s = "101100110100" 
	report "ADD error at 101100110100" severity error;

wait for waitTime;
sA_s <= "101100110100";
wait for 1ns;
assert sB_s = "101100110101" 
	report "ADD error at 101100110101" severity error;

wait for waitTime;
sA_s <= "101100110101";
wait for 1ns;
assert sB_s = "101100110110" 
	report "ADD error at 101100110110" severity error;

wait for waitTime;
sA_s <= "101100110110";
wait for 1ns;
assert sB_s = "101100110111" 
	report "ADD error at 101100110111" severity error;

wait for waitTime;
sA_s <= "101100110111";
wait for 1ns;
assert sB_s = "101100111000" 
	report "ADD error at 101100111000" severity error;

wait for waitTime;
sA_s <= "101100111000";
wait for 1ns;
assert sB_s = "101100111001" 
	report "ADD error at 101100111001" severity error;

wait for waitTime;
sA_s <= "101100111001";
wait for 1ns;
assert sB_s = "101100111010" 
	report "ADD error at 101100111010" severity error;

wait for waitTime;
sA_s <= "101100111010";
wait for 1ns;
assert sB_s = "101100111011" 
	report "ADD error at 101100111011" severity error;

wait for waitTime;
sA_s <= "101100111011";
wait for 1ns;
assert sB_s = "101100111100" 
	report "ADD error at 101100111100" severity error;

wait for waitTime;
sA_s <= "101100111100";
wait for 1ns;
assert sB_s = "101100111101" 
	report "ADD error at 101100111101" severity error;

wait for waitTime;
sA_s <= "101100111101";
wait for 1ns;
assert sB_s = "101100111110" 
	report "ADD error at 101100111110" severity error;

wait for waitTime;
sA_s <= "101100111110";
wait for 1ns;
assert sB_s = "101100111111" 
	report "ADD error at 101100111111" severity error;

wait for waitTime;
sA_s <= "101100111111";
wait for 1ns;
assert sB_s = "101101000000" 
	report "ADD error at 101101000000" severity error;

wait for waitTime;
sA_s <= "101101000000";
wait for 1ns;
assert sB_s = "101101000001" 
	report "ADD error at 101101000001" severity error;

wait for waitTime;
sA_s <= "101101000001";
wait for 1ns;
assert sB_s = "101101000010" 
	report "ADD error at 101101000010" severity error;

wait for waitTime;
sA_s <= "101101000010";
wait for 1ns;
assert sB_s = "101101000011" 
	report "ADD error at 101101000011" severity error;

wait for waitTime;
sA_s <= "101101000011";
wait for 1ns;
assert sB_s = "101101000100" 
	report "ADD error at 101101000100" severity error;

wait for waitTime;
sA_s <= "101101000100";
wait for 1ns;
assert sB_s = "101101000101" 
	report "ADD error at 101101000101" severity error;

wait for waitTime;
sA_s <= "101101000101";
wait for 1ns;
assert sB_s = "101101000110" 
	report "ADD error at 101101000110" severity error;

wait for waitTime;
sA_s <= "101101000110";
wait for 1ns;
assert sB_s = "101101000111" 
	report "ADD error at 101101000111" severity error;

wait for waitTime;
sA_s <= "101101000111";
wait for 1ns;
assert sB_s = "101101001000" 
	report "ADD error at 101101001000" severity error;

wait for waitTime;
sA_s <= "101101001000";
wait for 1ns;
assert sB_s = "101101001001" 
	report "ADD error at 101101001001" severity error;

wait for waitTime;
sA_s <= "101101001001";
wait for 1ns;
assert sB_s = "101101001010" 
	report "ADD error at 101101001010" severity error;

wait for waitTime;
sA_s <= "101101001010";
wait for 1ns;
assert sB_s = "101101001011" 
	report "ADD error at 101101001011" severity error;

wait for waitTime;
sA_s <= "101101001011";
wait for 1ns;
assert sB_s = "101101001100" 
	report "ADD error at 101101001100" severity error;

wait for waitTime;
sA_s <= "101101001100";
wait for 1ns;
assert sB_s = "101101001101" 
	report "ADD error at 101101001101" severity error;

wait for waitTime;
sA_s <= "101101001101";
wait for 1ns;
assert sB_s = "101101001110" 
	report "ADD error at 101101001110" severity error;

wait for waitTime;
sA_s <= "101101001110";
wait for 1ns;
assert sB_s = "101101001111" 
	report "ADD error at 101101001111" severity error;

wait for waitTime;
sA_s <= "101101001111";
wait for 1ns;
assert sB_s = "101101010000" 
	report "ADD error at 101101010000" severity error;

wait for waitTime;
sA_s <= "101101010000";
wait for 1ns;
assert sB_s = "101101010001" 
	report "ADD error at 101101010001" severity error;

wait for waitTime;
sA_s <= "101101010001";
wait for 1ns;
assert sB_s = "101101010010" 
	report "ADD error at 101101010010" severity error;

wait for waitTime;
sA_s <= "101101010010";
wait for 1ns;
assert sB_s = "101101010011" 
	report "ADD error at 101101010011" severity error;

wait for waitTime;
sA_s <= "101101010011";
wait for 1ns;
assert sB_s = "101101010100" 
	report "ADD error at 101101010100" severity error;

wait for waitTime;
sA_s <= "101101010100";
wait for 1ns;
assert sB_s = "101101010101" 
	report "ADD error at 101101010101" severity error;

wait for waitTime;
sA_s <= "101101010101";
wait for 1ns;
assert sB_s = "101101010110" 
	report "ADD error at 101101010110" severity error;

wait for waitTime;
sA_s <= "101101010110";
wait for 1ns;
assert sB_s = "101101010111" 
	report "ADD error at 101101010111" severity error;

wait for waitTime;
sA_s <= "101101010111";
wait for 1ns;
assert sB_s = "101101011000" 
	report "ADD error at 101101011000" severity error;

wait for waitTime;
sA_s <= "101101011000";
wait for 1ns;
assert sB_s = "101101011001" 
	report "ADD error at 101101011001" severity error;

wait for waitTime;
sA_s <= "101101011001";
wait for 1ns;
assert sB_s = "101101011010" 
	report "ADD error at 101101011010" severity error;

wait for waitTime;
sA_s <= "101101011010";
wait for 1ns;
assert sB_s = "101101011011" 
	report "ADD error at 101101011011" severity error;

wait for waitTime;
sA_s <= "101101011011";
wait for 1ns;
assert sB_s = "101101011100" 
	report "ADD error at 101101011100" severity error;

wait for waitTime;
sA_s <= "101101011100";
wait for 1ns;
assert sB_s = "101101011101" 
	report "ADD error at 101101011101" severity error;

wait for waitTime;
sA_s <= "101101011101";
wait for 1ns;
assert sB_s = "101101011110" 
	report "ADD error at 101101011110" severity error;

wait for waitTime;
sA_s <= "101101011110";
wait for 1ns;
assert sB_s = "101101011111" 
	report "ADD error at 101101011111" severity error;

wait for waitTime;
sA_s <= "101101011111";
wait for 1ns;
assert sB_s = "101101100000" 
	report "ADD error at 101101100000" severity error;

wait for waitTime;
sA_s <= "101101100000";
wait for 1ns;
assert sB_s = "101101100001" 
	report "ADD error at 101101100001" severity error;

wait for waitTime;
sA_s <= "101101100001";
wait for 1ns;
assert sB_s = "101101100010" 
	report "ADD error at 101101100010" severity error;

wait for waitTime;
sA_s <= "101101100010";
wait for 1ns;
assert sB_s = "101101100011" 
	report "ADD error at 101101100011" severity error;

wait for waitTime;
sA_s <= "101101100011";
wait for 1ns;
assert sB_s = "101101100100" 
	report "ADD error at 101101100100" severity error;

wait for waitTime;
sA_s <= "101101100100";
wait for 1ns;
assert sB_s = "101101100101" 
	report "ADD error at 101101100101" severity error;

wait for waitTime;
sA_s <= "101101100101";
wait for 1ns;
assert sB_s = "101101100110" 
	report "ADD error at 101101100110" severity error;

wait for waitTime;
sA_s <= "101101100110";
wait for 1ns;
assert sB_s = "101101100111" 
	report "ADD error at 101101100111" severity error;

wait for waitTime;
sA_s <= "101101100111";
wait for 1ns;
assert sB_s = "101101101000" 
	report "ADD error at 101101101000" severity error;

wait for waitTime;
sA_s <= "101101101000";
wait for 1ns;
assert sB_s = "101101101001" 
	report "ADD error at 101101101001" severity error;

wait for waitTime;
sA_s <= "101101101001";
wait for 1ns;
assert sB_s = "101101101010" 
	report "ADD error at 101101101010" severity error;

wait for waitTime;
sA_s <= "101101101010";
wait for 1ns;
assert sB_s = "101101101011" 
	report "ADD error at 101101101011" severity error;

wait for waitTime;
sA_s <= "101101101011";
wait for 1ns;
assert sB_s = "101101101100" 
	report "ADD error at 101101101100" severity error;

wait for waitTime;
sA_s <= "101101101100";
wait for 1ns;
assert sB_s = "101101101101" 
	report "ADD error at 101101101101" severity error;

wait for waitTime;
sA_s <= "101101101101";
wait for 1ns;
assert sB_s = "101101101110" 
	report "ADD error at 101101101110" severity error;

wait for waitTime;
sA_s <= "101101101110";
wait for 1ns;
assert sB_s = "101101101111" 
	report "ADD error at 101101101111" severity error;

wait for waitTime;
sA_s <= "101101101111";
wait for 1ns;
assert sB_s = "101101110000" 
	report "ADD error at 101101110000" severity error;

wait for waitTime;
sA_s <= "101101110000";
wait for 1ns;
assert sB_s = "101101110001" 
	report "ADD error at 101101110001" severity error;

wait for waitTime;
sA_s <= "101101110001";
wait for 1ns;
assert sB_s = "101101110010" 
	report "ADD error at 101101110010" severity error;

wait for waitTime;
sA_s <= "101101110010";
wait for 1ns;
assert sB_s = "101101110011" 
	report "ADD error at 101101110011" severity error;

wait for waitTime;
sA_s <= "101101110011";
wait for 1ns;
assert sB_s = "101101110100" 
	report "ADD error at 101101110100" severity error;

wait for waitTime;
sA_s <= "101101110100";
wait for 1ns;
assert sB_s = "101101110101" 
	report "ADD error at 101101110101" severity error;

wait for waitTime;
sA_s <= "101101110101";
wait for 1ns;
assert sB_s = "101101110110" 
	report "ADD error at 101101110110" severity error;

wait for waitTime;
sA_s <= "101101110110";
wait for 1ns;
assert sB_s = "101101110111" 
	report "ADD error at 101101110111" severity error;

wait for waitTime;
sA_s <= "101101110111";
wait for 1ns;
assert sB_s = "101101111000" 
	report "ADD error at 101101111000" severity error;

wait for waitTime;
sA_s <= "101101111000";
wait for 1ns;
assert sB_s = "101101111001" 
	report "ADD error at 101101111001" severity error;

wait for waitTime;
sA_s <= "101101111001";
wait for 1ns;
assert sB_s = "101101111010" 
	report "ADD error at 101101111010" severity error;

wait for waitTime;
sA_s <= "101101111010";
wait for 1ns;
assert sB_s = "101101111011" 
	report "ADD error at 101101111011" severity error;

wait for waitTime;
sA_s <= "101101111011";
wait for 1ns;
assert sB_s = "101101111100" 
	report "ADD error at 101101111100" severity error;

wait for waitTime;
sA_s <= "101101111100";
wait for 1ns;
assert sB_s = "101101111101" 
	report "ADD error at 101101111101" severity error;

wait for waitTime;
sA_s <= "101101111101";
wait for 1ns;
assert sB_s = "101101111110" 
	report "ADD error at 101101111110" severity error;

wait for waitTime;
sA_s <= "101101111110";
wait for 1ns;
assert sB_s = "101101111111" 
	report "ADD error at 101101111111" severity error;

wait for waitTime;
sA_s <= "101101111111";
wait for 1ns;
assert sB_s = "101110000000" 
	report "ADD error at 101110000000" severity error;

wait for waitTime;
sA_s <= "101110000000";
wait for 1ns;
assert sB_s = "101110000001" 
	report "ADD error at 101110000001" severity error;

wait for waitTime;
sA_s <= "101110000001";
wait for 1ns;
assert sB_s = "101110000010" 
	report "ADD error at 101110000010" severity error;

wait for waitTime;
sA_s <= "101110000010";
wait for 1ns;
assert sB_s = "101110000011" 
	report "ADD error at 101110000011" severity error;

wait for waitTime;
sA_s <= "101110000011";
wait for 1ns;
assert sB_s = "101110000100" 
	report "ADD error at 101110000100" severity error;

wait for waitTime;
sA_s <= "101110000100";
wait for 1ns;
assert sB_s = "101110000101" 
	report "ADD error at 101110000101" severity error;

wait for waitTime;
sA_s <= "101110000101";
wait for 1ns;
assert sB_s = "101110000110" 
	report "ADD error at 101110000110" severity error;

wait for waitTime;
sA_s <= "101110000110";
wait for 1ns;
assert sB_s = "101110000111" 
	report "ADD error at 101110000111" severity error;

wait for waitTime;
sA_s <= "101110000111";
wait for 1ns;
assert sB_s = "101110001000" 
	report "ADD error at 101110001000" severity error;

wait for waitTime;
sA_s <= "101110001000";
wait for 1ns;
assert sB_s = "101110001001" 
	report "ADD error at 101110001001" severity error;

wait for waitTime;
sA_s <= "101110001001";
wait for 1ns;
assert sB_s = "101110001010" 
	report "ADD error at 101110001010" severity error;

wait for waitTime;
sA_s <= "101110001010";
wait for 1ns;
assert sB_s = "101110001011" 
	report "ADD error at 101110001011" severity error;

wait for waitTime;
sA_s <= "101110001011";
wait for 1ns;
assert sB_s = "101110001100" 
	report "ADD error at 101110001100" severity error;

wait for waitTime;
sA_s <= "101110001100";
wait for 1ns;
assert sB_s = "101110001101" 
	report "ADD error at 101110001101" severity error;

wait for waitTime;
sA_s <= "101110001101";
wait for 1ns;
assert sB_s = "101110001110" 
	report "ADD error at 101110001110" severity error;

wait for waitTime;
sA_s <= "101110001110";
wait for 1ns;
assert sB_s = "101110001111" 
	report "ADD error at 101110001111" severity error;

wait for waitTime;
sA_s <= "101110001111";
wait for 1ns;
assert sB_s = "101110010000" 
	report "ADD error at 101110010000" severity error;

wait for waitTime;
sA_s <= "101110010000";
wait for 1ns;
assert sB_s = "101110010001" 
	report "ADD error at 101110010001" severity error;

wait for waitTime;
sA_s <= "101110010001";
wait for 1ns;
assert sB_s = "101110010010" 
	report "ADD error at 101110010010" severity error;

wait for waitTime;
sA_s <= "101110010010";
wait for 1ns;
assert sB_s = "101110010011" 
	report "ADD error at 101110010011" severity error;

wait for waitTime;
sA_s <= "101110010011";
wait for 1ns;
assert sB_s = "101110010100" 
	report "ADD error at 101110010100" severity error;

wait for waitTime;
sA_s <= "101110010100";
wait for 1ns;
assert sB_s = "101110010101" 
	report "ADD error at 101110010101" severity error;

wait for waitTime;
sA_s <= "101110010101";
wait for 1ns;
assert sB_s = "101110010110" 
	report "ADD error at 101110010110" severity error;

wait for waitTime;
sA_s <= "101110010110";
wait for 1ns;
assert sB_s = "101110010111" 
	report "ADD error at 101110010111" severity error;

wait for waitTime;
sA_s <= "101110010111";
wait for 1ns;
assert sB_s = "101110011000" 
	report "ADD error at 101110011000" severity error;

wait for waitTime;
sA_s <= "101110011000";
wait for 1ns;
assert sB_s = "101110011001" 
	report "ADD error at 101110011001" severity error;

wait for waitTime;
sA_s <= "101110011001";
wait for 1ns;
assert sB_s = "101110011010" 
	report "ADD error at 101110011010" severity error;

wait for waitTime;
sA_s <= "101110011010";
wait for 1ns;
assert sB_s = "101110011011" 
	report "ADD error at 101110011011" severity error;

wait for waitTime;
sA_s <= "101110011011";
wait for 1ns;
assert sB_s = "101110011100" 
	report "ADD error at 101110011100" severity error;

wait for waitTime;
sA_s <= "101110011100";
wait for 1ns;
assert sB_s = "101110011101" 
	report "ADD error at 101110011101" severity error;

wait for waitTime;
sA_s <= "101110011101";
wait for 1ns;
assert sB_s = "101110011110" 
	report "ADD error at 101110011110" severity error;

wait for waitTime;
sA_s <= "101110011110";
wait for 1ns;
assert sB_s = "101110011111" 
	report "ADD error at 101110011111" severity error;

wait for waitTime;
sA_s <= "101110011111";
wait for 1ns;
assert sB_s = "101110100000" 
	report "ADD error at 101110100000" severity error;

wait for waitTime;
sA_s <= "101110100000";
wait for 1ns;
assert sB_s = "101110100001" 
	report "ADD error at 101110100001" severity error;

wait for waitTime;
sA_s <= "101110100001";
wait for 1ns;
assert sB_s = "101110100010" 
	report "ADD error at 101110100010" severity error;

wait for waitTime;
sA_s <= "101110100010";
wait for 1ns;
assert sB_s = "101110100011" 
	report "ADD error at 101110100011" severity error;

wait for waitTime;
sA_s <= "101110100011";
wait for 1ns;
assert sB_s = "101110100100" 
	report "ADD error at 101110100100" severity error;

wait for waitTime;
sA_s <= "101110100100";
wait for 1ns;
assert sB_s = "101110100101" 
	report "ADD error at 101110100101" severity error;

wait for waitTime;
sA_s <= "101110100101";
wait for 1ns;
assert sB_s = "101110100110" 
	report "ADD error at 101110100110" severity error;

wait for waitTime;
sA_s <= "101110100110";
wait for 1ns;
assert sB_s = "101110100111" 
	report "ADD error at 101110100111" severity error;

wait for waitTime;
sA_s <= "101110100111";
wait for 1ns;
assert sB_s = "101110101000" 
	report "ADD error at 101110101000" severity error;

wait for waitTime;
sA_s <= "101110101000";
wait for 1ns;
assert sB_s = "101110101001" 
	report "ADD error at 101110101001" severity error;

wait for waitTime;
sA_s <= "101110101001";
wait for 1ns;
assert sB_s = "101110101010" 
	report "ADD error at 101110101010" severity error;

wait for waitTime;
sA_s <= "101110101010";
wait for 1ns;
assert sB_s = "101110101011" 
	report "ADD error at 101110101011" severity error;

wait for waitTime;
sA_s <= "101110101011";
wait for 1ns;
assert sB_s = "101110101100" 
	report "ADD error at 101110101100" severity error;

wait for waitTime;
sA_s <= "101110101100";
wait for 1ns;
assert sB_s = "101110101101" 
	report "ADD error at 101110101101" severity error;

wait for waitTime;
sA_s <= "101110101101";
wait for 1ns;
assert sB_s = "101110101110" 
	report "ADD error at 101110101110" severity error;

wait for waitTime;
sA_s <= "101110101110";
wait for 1ns;
assert sB_s = "101110101111" 
	report "ADD error at 101110101111" severity error;

wait for waitTime;
sA_s <= "101110101111";
wait for 1ns;
assert sB_s = "101110110000" 
	report "ADD error at 101110110000" severity error;

wait for waitTime;
sA_s <= "101110110000";
wait for 1ns;
assert sB_s = "101110110001" 
	report "ADD error at 101110110001" severity error;

wait for waitTime;
sA_s <= "101110110001";
wait for 1ns;
assert sB_s = "101110110010" 
	report "ADD error at 101110110010" severity error;

wait for waitTime;
sA_s <= "101110110010";
wait for 1ns;
assert sB_s = "101110110011" 
	report "ADD error at 101110110011" severity error;

wait for waitTime;
sA_s <= "101110110011";
wait for 1ns;
assert sB_s = "101110110100" 
	report "ADD error at 101110110100" severity error;

wait for waitTime;
sA_s <= "101110110100";
wait for 1ns;
assert sB_s = "101110110101" 
	report "ADD error at 101110110101" severity error;

wait for waitTime;
sA_s <= "101110110101";
wait for 1ns;
assert sB_s = "101110110110" 
	report "ADD error at 101110110110" severity error;

wait for waitTime;
sA_s <= "101110110110";
wait for 1ns;
assert sB_s = "101110110111" 
	report "ADD error at 101110110111" severity error;

wait for waitTime;
sA_s <= "101110110111";
wait for 1ns;
assert sB_s = "101110111000" 
	report "ADD error at 101110111000" severity error;

wait for waitTime;
sA_s <= "101110111000";
wait for 1ns;
assert sB_s = "101110111001" 
	report "ADD error at 101110111001" severity error;

wait for waitTime;
sA_s <= "101110111001";
wait for 1ns;
assert sB_s = "101110111010" 
	report "ADD error at 101110111010" severity error;

wait for waitTime;
sA_s <= "101110111010";
wait for 1ns;
assert sB_s = "101110111011" 
	report "ADD error at 101110111011" severity error;

wait for waitTime;
sA_s <= "101110111011";
wait for 1ns;
assert sB_s = "101110111100" 
	report "ADD error at 101110111100" severity error;

wait for waitTime;
sA_s <= "101110111100";
wait for 1ns;
assert sB_s = "101110111101" 
	report "ADD error at 101110111101" severity error;

wait for waitTime;
sA_s <= "101110111101";
wait for 1ns;
assert sB_s = "101110111110" 
	report "ADD error at 101110111110" severity error;

wait for waitTime;
sA_s <= "101110111110";
wait for 1ns;
assert sB_s = "101110111111" 
	report "ADD error at 101110111111" severity error;

wait for waitTime;
sA_s <= "101110111111";
wait for 1ns;
assert sB_s = "101111000000" 
	report "ADD error at 101111000000" severity error;

wait for waitTime;
sA_s <= "101111000000";
wait for 1ns;
assert sB_s = "101111000001" 
	report "ADD error at 101111000001" severity error;

wait for waitTime;
sA_s <= "101111000001";
wait for 1ns;
assert sB_s = "101111000010" 
	report "ADD error at 101111000010" severity error;

wait for waitTime;
sA_s <= "101111000010";
wait for 1ns;
assert sB_s = "101111000011" 
	report "ADD error at 101111000011" severity error;

wait for waitTime;
sA_s <= "101111000011";
wait for 1ns;
assert sB_s = "101111000100" 
	report "ADD error at 101111000100" severity error;

wait for waitTime;
sA_s <= "101111000100";
wait for 1ns;
assert sB_s = "101111000101" 
	report "ADD error at 101111000101" severity error;

wait for waitTime;
sA_s <= "101111000101";
wait for 1ns;
assert sB_s = "101111000110" 
	report "ADD error at 101111000110" severity error;

wait for waitTime;
sA_s <= "101111000110";
wait for 1ns;
assert sB_s = "101111000111" 
	report "ADD error at 101111000111" severity error;

wait for waitTime;
sA_s <= "101111000111";
wait for 1ns;
assert sB_s = "101111001000" 
	report "ADD error at 101111001000" severity error;

wait for waitTime;
sA_s <= "101111001000";
wait for 1ns;
assert sB_s = "101111001001" 
	report "ADD error at 101111001001" severity error;

wait for waitTime;
sA_s <= "101111001001";
wait for 1ns;
assert sB_s = "101111001010" 
	report "ADD error at 101111001010" severity error;

wait for waitTime;
sA_s <= "101111001010";
wait for 1ns;
assert sB_s = "101111001011" 
	report "ADD error at 101111001011" severity error;

wait for waitTime;
sA_s <= "101111001011";
wait for 1ns;
assert sB_s = "101111001100" 
	report "ADD error at 101111001100" severity error;

wait for waitTime;
sA_s <= "101111001100";
wait for 1ns;
assert sB_s = "101111001101" 
	report "ADD error at 101111001101" severity error;

wait for waitTime;
sA_s <= "101111001101";
wait for 1ns;
assert sB_s = "101111001110" 
	report "ADD error at 101111001110" severity error;

wait for waitTime;
sA_s <= "101111001110";
wait for 1ns;
assert sB_s = "101111001111" 
	report "ADD error at 101111001111" severity error;

wait for waitTime;
sA_s <= "101111001111";
wait for 1ns;
assert sB_s = "101111010000" 
	report "ADD error at 101111010000" severity error;

wait for waitTime;
sA_s <= "101111010000";
wait for 1ns;
assert sB_s = "101111010001" 
	report "ADD error at 101111010001" severity error;

wait for waitTime;
sA_s <= "101111010001";
wait for 1ns;
assert sB_s = "101111010010" 
	report "ADD error at 101111010010" severity error;

wait for waitTime;
sA_s <= "101111010010";
wait for 1ns;
assert sB_s = "101111010011" 
	report "ADD error at 101111010011" severity error;

wait for waitTime;
sA_s <= "101111010011";
wait for 1ns;
assert sB_s = "101111010100" 
	report "ADD error at 101111010100" severity error;

wait for waitTime;
sA_s <= "101111010100";
wait for 1ns;
assert sB_s = "101111010101" 
	report "ADD error at 101111010101" severity error;

wait for waitTime;
sA_s <= "101111010101";
wait for 1ns;
assert sB_s = "101111010110" 
	report "ADD error at 101111010110" severity error;

wait for waitTime;
sA_s <= "101111010110";
wait for 1ns;
assert sB_s = "101111010111" 
	report "ADD error at 101111010111" severity error;

wait for waitTime;
sA_s <= "101111010111";
wait for 1ns;
assert sB_s = "101111011000" 
	report "ADD error at 101111011000" severity error;

wait for waitTime;
sA_s <= "101111011000";
wait for 1ns;
assert sB_s = "101111011001" 
	report "ADD error at 101111011001" severity error;

wait for waitTime;
sA_s <= "101111011001";
wait for 1ns;
assert sB_s = "101111011010" 
	report "ADD error at 101111011010" severity error;

wait for waitTime;
sA_s <= "101111011010";
wait for 1ns;
assert sB_s = "101111011011" 
	report "ADD error at 101111011011" severity error;

wait for waitTime;
sA_s <= "101111011011";
wait for 1ns;
assert sB_s = "101111011100" 
	report "ADD error at 101111011100" severity error;

wait for waitTime;
sA_s <= "101111011100";
wait for 1ns;
assert sB_s = "101111011101" 
	report "ADD error at 101111011101" severity error;

wait for waitTime;
sA_s <= "101111011101";
wait for 1ns;
assert sB_s = "101111011110" 
	report "ADD error at 101111011110" severity error;

wait for waitTime;
sA_s <= "101111011110";
wait for 1ns;
assert sB_s = "101111011111" 
	report "ADD error at 101111011111" severity error;

wait for waitTime;
sA_s <= "101111011111";
wait for 1ns;
assert sB_s = "101111100000" 
	report "ADD error at 101111100000" severity error;

wait for waitTime;
sA_s <= "101111100000";
wait for 1ns;
assert sB_s = "101111100001" 
	report "ADD error at 101111100001" severity error;

wait for waitTime;
sA_s <= "101111100001";
wait for 1ns;
assert sB_s = "101111100010" 
	report "ADD error at 101111100010" severity error;

wait for waitTime;
sA_s <= "101111100010";
wait for 1ns;
assert sB_s = "101111100011" 
	report "ADD error at 101111100011" severity error;

wait for waitTime;
sA_s <= "101111100011";
wait for 1ns;
assert sB_s = "101111100100" 
	report "ADD error at 101111100100" severity error;

wait for waitTime;
sA_s <= "101111100100";
wait for 1ns;
assert sB_s = "101111100101" 
	report "ADD error at 101111100101" severity error;

wait for waitTime;
sA_s <= "101111100101";
wait for 1ns;
assert sB_s = "101111100110" 
	report "ADD error at 101111100110" severity error;

wait for waitTime;
sA_s <= "101111100110";
wait for 1ns;
assert sB_s = "101111100111" 
	report "ADD error at 101111100111" severity error;

wait for waitTime;
sA_s <= "101111100111";
wait for 1ns;
assert sB_s = "101111101000" 
	report "ADD error at 101111101000" severity error;

wait for waitTime;
sA_s <= "101111101000";
wait for 1ns;
assert sB_s = "101111101001" 
	report "ADD error at 101111101001" severity error;

wait for waitTime;
sA_s <= "101111101001";
wait for 1ns;
assert sB_s = "101111101010" 
	report "ADD error at 101111101010" severity error;

wait for waitTime;
sA_s <= "101111101010";
wait for 1ns;
assert sB_s = "101111101011" 
	report "ADD error at 101111101011" severity error;

wait for waitTime;
sA_s <= "101111101011";
wait for 1ns;
assert sB_s = "101111101100" 
	report "ADD error at 101111101100" severity error;

wait for waitTime;
sA_s <= "101111101100";
wait for 1ns;
assert sB_s = "101111101101" 
	report "ADD error at 101111101101" severity error;

wait for waitTime;
sA_s <= "101111101101";
wait for 1ns;
assert sB_s = "101111101110" 
	report "ADD error at 101111101110" severity error;

wait for waitTime;
sA_s <= "101111101110";
wait for 1ns;
assert sB_s = "101111101111" 
	report "ADD error at 101111101111" severity error;

wait for waitTime;
sA_s <= "101111101111";
wait for 1ns;
assert sB_s = "101111110000" 
	report "ADD error at 101111110000" severity error;

wait for waitTime;
sA_s <= "101111110000";
wait for 1ns;
assert sB_s = "101111110001" 
	report "ADD error at 101111110001" severity error;

wait for waitTime;
sA_s <= "101111110001";
wait for 1ns;
assert sB_s = "101111110010" 
	report "ADD error at 101111110010" severity error;

wait for waitTime;
sA_s <= "101111110010";
wait for 1ns;
assert sB_s = "101111110011" 
	report "ADD error at 101111110011" severity error;

wait for waitTime;
sA_s <= "101111110011";
wait for 1ns;
assert sB_s = "101111110100" 
	report "ADD error at 101111110100" severity error;

wait for waitTime;
sA_s <= "101111110100";
wait for 1ns;
assert sB_s = "101111110101" 
	report "ADD error at 101111110101" severity error;

wait for waitTime;
sA_s <= "101111110101";
wait for 1ns;
assert sB_s = "101111110110" 
	report "ADD error at 101111110110" severity error;

wait for waitTime;
sA_s <= "101111110110";
wait for 1ns;
assert sB_s = "101111110111" 
	report "ADD error at 101111110111" severity error;

wait for waitTime;
sA_s <= "101111110111";
wait for 1ns;
assert sB_s = "101111111000" 
	report "ADD error at 101111111000" severity error;

wait for waitTime;
sA_s <= "101111111000";
wait for 1ns;
assert sB_s = "101111111001" 
	report "ADD error at 101111111001" severity error;

wait for waitTime;
sA_s <= "101111111001";
wait for 1ns;
assert sB_s = "101111111010" 
	report "ADD error at 101111111010" severity error;

wait for waitTime;
sA_s <= "101111111010";
wait for 1ns;
assert sB_s = "101111111011" 
	report "ADD error at 101111111011" severity error;

wait for waitTime;
sA_s <= "101111111011";
wait for 1ns;
assert sB_s = "101111111100" 
	report "ADD error at 101111111100" severity error;

wait for waitTime;
sA_s <= "101111111100";
wait for 1ns;
assert sB_s = "101111111101" 
	report "ADD error at 101111111101" severity error;

wait for waitTime;
sA_s <= "101111111101";
wait for 1ns;
assert sB_s = "101111111110" 
	report "ADD error at 101111111110" severity error;

wait for waitTime;
sA_s <= "101111111110";
wait for 1ns;
assert sB_s = "101111111111" 
	report "ADD error at 101111111111" severity error;

wait for waitTime;
sA_s <= "101111111111";
wait for 1ns;
assert sB_s = "110000000000" 
	report "ADD error at 110000000000" severity error;

wait for waitTime;
sA_s <= "110000000000";
wait for 1ns;
assert sB_s = "110000000001" 
	report "ADD error at 110000000001" severity error;

wait for waitTime;
sA_s <= "110000000001";
wait for 1ns;
assert sB_s = "110000000010" 
	report "ADD error at 110000000010" severity error;

wait for waitTime;
sA_s <= "110000000010";
wait for 1ns;
assert sB_s = "110000000011" 
	report "ADD error at 110000000011" severity error;

wait for waitTime;
sA_s <= "110000000011";
wait for 1ns;
assert sB_s = "110000000100" 
	report "ADD error at 110000000100" severity error;

wait for waitTime;
sA_s <= "110000000100";
wait for 1ns;
assert sB_s = "110000000101" 
	report "ADD error at 110000000101" severity error;

wait for waitTime;
sA_s <= "110000000101";
wait for 1ns;
assert sB_s = "110000000110" 
	report "ADD error at 110000000110" severity error;

wait for waitTime;
sA_s <= "110000000110";
wait for 1ns;
assert sB_s = "110000000111" 
	report "ADD error at 110000000111" severity error;

wait for waitTime;
sA_s <= "110000000111";
wait for 1ns;
assert sB_s = "110000001000" 
	report "ADD error at 110000001000" severity error;

wait for waitTime;
sA_s <= "110000001000";
wait for 1ns;
assert sB_s = "110000001001" 
	report "ADD error at 110000001001" severity error;

wait for waitTime;
sA_s <= "110000001001";
wait for 1ns;
assert sB_s = "110000001010" 
	report "ADD error at 110000001010" severity error;

wait for waitTime;
sA_s <= "110000001010";
wait for 1ns;
assert sB_s = "110000001011" 
	report "ADD error at 110000001011" severity error;

wait for waitTime;
sA_s <= "110000001011";
wait for 1ns;
assert sB_s = "110000001100" 
	report "ADD error at 110000001100" severity error;

wait for waitTime;
sA_s <= "110000001100";
wait for 1ns;
assert sB_s = "110000001101" 
	report "ADD error at 110000001101" severity error;

wait for waitTime;
sA_s <= "110000001101";
wait for 1ns;
assert sB_s = "110000001110" 
	report "ADD error at 110000001110" severity error;

wait for waitTime;
sA_s <= "110000001110";
wait for 1ns;
assert sB_s = "110000001111" 
	report "ADD error at 110000001111" severity error;

wait for waitTime;
sA_s <= "110000001111";
wait for 1ns;
assert sB_s = "110000010000" 
	report "ADD error at 110000010000" severity error;

wait for waitTime;
sA_s <= "110000010000";
wait for 1ns;
assert sB_s = "110000010001" 
	report "ADD error at 110000010001" severity error;

wait for waitTime;
sA_s <= "110000010001";
wait for 1ns;
assert sB_s = "110000010010" 
	report "ADD error at 110000010010" severity error;

wait for waitTime;
sA_s <= "110000010010";
wait for 1ns;
assert sB_s = "110000010011" 
	report "ADD error at 110000010011" severity error;

wait for waitTime;
sA_s <= "110000010011";
wait for 1ns;
assert sB_s = "110000010100" 
	report "ADD error at 110000010100" severity error;

wait for waitTime;
sA_s <= "110000010100";
wait for 1ns;
assert sB_s = "110000010101" 
	report "ADD error at 110000010101" severity error;

wait for waitTime;
sA_s <= "110000010101";
wait for 1ns;
assert sB_s = "110000010110" 
	report "ADD error at 110000010110" severity error;

wait for waitTime;
sA_s <= "110000010110";
wait for 1ns;
assert sB_s = "110000010111" 
	report "ADD error at 110000010111" severity error;

wait for waitTime;
sA_s <= "110000010111";
wait for 1ns;
assert sB_s = "110000011000" 
	report "ADD error at 110000011000" severity error;

wait for waitTime;
sA_s <= "110000011000";
wait for 1ns;
assert sB_s = "110000011001" 
	report "ADD error at 110000011001" severity error;

wait for waitTime;
sA_s <= "110000011001";
wait for 1ns;
assert sB_s = "110000011010" 
	report "ADD error at 110000011010" severity error;

wait for waitTime;
sA_s <= "110000011010";
wait for 1ns;
assert sB_s = "110000011011" 
	report "ADD error at 110000011011" severity error;

wait for waitTime;
sA_s <= "110000011011";
wait for 1ns;
assert sB_s = "110000011100" 
	report "ADD error at 110000011100" severity error;

wait for waitTime;
sA_s <= "110000011100";
wait for 1ns;
assert sB_s = "110000011101" 
	report "ADD error at 110000011101" severity error;

wait for waitTime;
sA_s <= "110000011101";
wait for 1ns;
assert sB_s = "110000011110" 
	report "ADD error at 110000011110" severity error;

wait for waitTime;
sA_s <= "110000011110";
wait for 1ns;
assert sB_s = "110000011111" 
	report "ADD error at 110000011111" severity error;

wait for waitTime;
sA_s <= "110000011111";
wait for 1ns;
assert sB_s = "110000100000" 
	report "ADD error at 110000100000" severity error;

wait for waitTime;
sA_s <= "110000100000";
wait for 1ns;
assert sB_s = "110000100001" 
	report "ADD error at 110000100001" severity error;

wait for waitTime;
sA_s <= "110000100001";
wait for 1ns;
assert sB_s = "110000100010" 
	report "ADD error at 110000100010" severity error;

wait for waitTime;
sA_s <= "110000100010";
wait for 1ns;
assert sB_s = "110000100011" 
	report "ADD error at 110000100011" severity error;

wait for waitTime;
sA_s <= "110000100011";
wait for 1ns;
assert sB_s = "110000100100" 
	report "ADD error at 110000100100" severity error;

wait for waitTime;
sA_s <= "110000100100";
wait for 1ns;
assert sB_s = "110000100101" 
	report "ADD error at 110000100101" severity error;

wait for waitTime;
sA_s <= "110000100101";
wait for 1ns;
assert sB_s = "110000100110" 
	report "ADD error at 110000100110" severity error;

wait for waitTime;
sA_s <= "110000100110";
wait for 1ns;
assert sB_s = "110000100111" 
	report "ADD error at 110000100111" severity error;

wait for waitTime;
sA_s <= "110000100111";
wait for 1ns;
assert sB_s = "110000101000" 
	report "ADD error at 110000101000" severity error;

wait for waitTime;
sA_s <= "110000101000";
wait for 1ns;
assert sB_s = "110000101001" 
	report "ADD error at 110000101001" severity error;

wait for waitTime;
sA_s <= "110000101001";
wait for 1ns;
assert sB_s = "110000101010" 
	report "ADD error at 110000101010" severity error;

wait for waitTime;
sA_s <= "110000101010";
wait for 1ns;
assert sB_s = "110000101011" 
	report "ADD error at 110000101011" severity error;

wait for waitTime;
sA_s <= "110000101011";
wait for 1ns;
assert sB_s = "110000101100" 
	report "ADD error at 110000101100" severity error;

wait for waitTime;
sA_s <= "110000101100";
wait for 1ns;
assert sB_s = "110000101101" 
	report "ADD error at 110000101101" severity error;

wait for waitTime;
sA_s <= "110000101101";
wait for 1ns;
assert sB_s = "110000101110" 
	report "ADD error at 110000101110" severity error;

wait for waitTime;
sA_s <= "110000101110";
wait for 1ns;
assert sB_s = "110000101111" 
	report "ADD error at 110000101111" severity error;

wait for waitTime;
sA_s <= "110000101111";
wait for 1ns;
assert sB_s = "110000110000" 
	report "ADD error at 110000110000" severity error;

wait for waitTime;
sA_s <= "110000110000";
wait for 1ns;
assert sB_s = "110000110001" 
	report "ADD error at 110000110001" severity error;

wait for waitTime;
sA_s <= "110000110001";
wait for 1ns;
assert sB_s = "110000110010" 
	report "ADD error at 110000110010" severity error;

wait for waitTime;
sA_s <= "110000110010";
wait for 1ns;
assert sB_s = "110000110011" 
	report "ADD error at 110000110011" severity error;

wait for waitTime;
sA_s <= "110000110011";
wait for 1ns;
assert sB_s = "110000110100" 
	report "ADD error at 110000110100" severity error;

wait for waitTime;
sA_s <= "110000110100";
wait for 1ns;
assert sB_s = "110000110101" 
	report "ADD error at 110000110101" severity error;

wait for waitTime;
sA_s <= "110000110101";
wait for 1ns;
assert sB_s = "110000110110" 
	report "ADD error at 110000110110" severity error;

wait for waitTime;
sA_s <= "110000110110";
wait for 1ns;
assert sB_s = "110000110111" 
	report "ADD error at 110000110111" severity error;

wait for waitTime;
sA_s <= "110000110111";
wait for 1ns;
assert sB_s = "110000111000" 
	report "ADD error at 110000111000" severity error;

wait for waitTime;
sA_s <= "110000111000";
wait for 1ns;
assert sB_s = "110000111001" 
	report "ADD error at 110000111001" severity error;

wait for waitTime;
sA_s <= "110000111001";
wait for 1ns;
assert sB_s = "110000111010" 
	report "ADD error at 110000111010" severity error;

wait for waitTime;
sA_s <= "110000111010";
wait for 1ns;
assert sB_s = "110000111011" 
	report "ADD error at 110000111011" severity error;

wait for waitTime;
sA_s <= "110000111011";
wait for 1ns;
assert sB_s = "110000111100" 
	report "ADD error at 110000111100" severity error;

wait for waitTime;
sA_s <= "110000111100";
wait for 1ns;
assert sB_s = "110000111101" 
	report "ADD error at 110000111101" severity error;

wait for waitTime;
sA_s <= "110000111101";
wait for 1ns;
assert sB_s = "110000111110" 
	report "ADD error at 110000111110" severity error;

wait for waitTime;
sA_s <= "110000111110";
wait for 1ns;
assert sB_s = "110000111111" 
	report "ADD error at 110000111111" severity error;

wait for waitTime;
sA_s <= "110000111111";
wait for 1ns;
assert sB_s = "110001000000" 
	report "ADD error at 110001000000" severity error;

wait for waitTime;
sA_s <= "110001000000";
wait for 1ns;
assert sB_s = "110001000001" 
	report "ADD error at 110001000001" severity error;

wait for waitTime;
sA_s <= "110001000001";
wait for 1ns;
assert sB_s = "110001000010" 
	report "ADD error at 110001000010" severity error;

wait for waitTime;
sA_s <= "110001000010";
wait for 1ns;
assert sB_s = "110001000011" 
	report "ADD error at 110001000011" severity error;

wait for waitTime;
sA_s <= "110001000011";
wait for 1ns;
assert sB_s = "110001000100" 
	report "ADD error at 110001000100" severity error;

wait for waitTime;
sA_s <= "110001000100";
wait for 1ns;
assert sB_s = "110001000101" 
	report "ADD error at 110001000101" severity error;

wait for waitTime;
sA_s <= "110001000101";
wait for 1ns;
assert sB_s = "110001000110" 
	report "ADD error at 110001000110" severity error;

wait for waitTime;
sA_s <= "110001000110";
wait for 1ns;
assert sB_s = "110001000111" 
	report "ADD error at 110001000111" severity error;

wait for waitTime;
sA_s <= "110001000111";
wait for 1ns;
assert sB_s = "110001001000" 
	report "ADD error at 110001001000" severity error;

wait for waitTime;
sA_s <= "110001001000";
wait for 1ns;
assert sB_s = "110001001001" 
	report "ADD error at 110001001001" severity error;

wait for waitTime;
sA_s <= "110001001001";
wait for 1ns;
assert sB_s = "110001001010" 
	report "ADD error at 110001001010" severity error;

wait for waitTime;
sA_s <= "110001001010";
wait for 1ns;
assert sB_s = "110001001011" 
	report "ADD error at 110001001011" severity error;

wait for waitTime;
sA_s <= "110001001011";
wait for 1ns;
assert sB_s = "110001001100" 
	report "ADD error at 110001001100" severity error;

wait for waitTime;
sA_s <= "110001001100";
wait for 1ns;
assert sB_s = "110001001101" 
	report "ADD error at 110001001101" severity error;

wait for waitTime;
sA_s <= "110001001101";
wait for 1ns;
assert sB_s = "110001001110" 
	report "ADD error at 110001001110" severity error;

wait for waitTime;
sA_s <= "110001001110";
wait for 1ns;
assert sB_s = "110001001111" 
	report "ADD error at 110001001111" severity error;

wait for waitTime;
sA_s <= "110001001111";
wait for 1ns;
assert sB_s = "110001010000" 
	report "ADD error at 110001010000" severity error;

wait for waitTime;
sA_s <= "110001010000";
wait for 1ns;
assert sB_s = "110001010001" 
	report "ADD error at 110001010001" severity error;

wait for waitTime;
sA_s <= "110001010001";
wait for 1ns;
assert sB_s = "110001010010" 
	report "ADD error at 110001010010" severity error;

wait for waitTime;
sA_s <= "110001010010";
wait for 1ns;
assert sB_s = "110001010011" 
	report "ADD error at 110001010011" severity error;

wait for waitTime;
sA_s <= "110001010011";
wait for 1ns;
assert sB_s = "110001010100" 
	report "ADD error at 110001010100" severity error;

wait for waitTime;
sA_s <= "110001010100";
wait for 1ns;
assert sB_s = "110001010101" 
	report "ADD error at 110001010101" severity error;

wait for waitTime;
sA_s <= "110001010101";
wait for 1ns;
assert sB_s = "110001010110" 
	report "ADD error at 110001010110" severity error;

wait for waitTime;
sA_s <= "110001010110";
wait for 1ns;
assert sB_s = "110001010111" 
	report "ADD error at 110001010111" severity error;

wait for waitTime;
sA_s <= "110001010111";
wait for 1ns;
assert sB_s = "110001011000" 
	report "ADD error at 110001011000" severity error;

wait for waitTime;
sA_s <= "110001011000";
wait for 1ns;
assert sB_s = "110001011001" 
	report "ADD error at 110001011001" severity error;

wait for waitTime;
sA_s <= "110001011001";
wait for 1ns;
assert sB_s = "110001011010" 
	report "ADD error at 110001011010" severity error;

wait for waitTime;
sA_s <= "110001011010";
wait for 1ns;
assert sB_s = "110001011011" 
	report "ADD error at 110001011011" severity error;

wait for waitTime;
sA_s <= "110001011011";
wait for 1ns;
assert sB_s = "110001011100" 
	report "ADD error at 110001011100" severity error;

wait for waitTime;
sA_s <= "110001011100";
wait for 1ns;
assert sB_s = "110001011101" 
	report "ADD error at 110001011101" severity error;

wait for waitTime;
sA_s <= "110001011101";
wait for 1ns;
assert sB_s = "110001011110" 
	report "ADD error at 110001011110" severity error;

wait for waitTime;
sA_s <= "110001011110";
wait for 1ns;
assert sB_s = "110001011111" 
	report "ADD error at 110001011111" severity error;

wait for waitTime;
sA_s <= "110001011111";
wait for 1ns;
assert sB_s = "110001100000" 
	report "ADD error at 110001100000" severity error;

wait for waitTime;
sA_s <= "110001100000";
wait for 1ns;
assert sB_s = "110001100001" 
	report "ADD error at 110001100001" severity error;

wait for waitTime;
sA_s <= "110001100001";
wait for 1ns;
assert sB_s = "110001100010" 
	report "ADD error at 110001100010" severity error;

wait for waitTime;
sA_s <= "110001100010";
wait for 1ns;
assert sB_s = "110001100011" 
	report "ADD error at 110001100011" severity error;

wait for waitTime;
sA_s <= "110001100011";
wait for 1ns;
assert sB_s = "110001100100" 
	report "ADD error at 110001100100" severity error;

wait for waitTime;
sA_s <= "110001100100";
wait for 1ns;
assert sB_s = "110001100101" 
	report "ADD error at 110001100101" severity error;

wait for waitTime;
sA_s <= "110001100101";
wait for 1ns;
assert sB_s = "110001100110" 
	report "ADD error at 110001100110" severity error;

wait for waitTime;
sA_s <= "110001100110";
wait for 1ns;
assert sB_s = "110001100111" 
	report "ADD error at 110001100111" severity error;

wait for waitTime;
sA_s <= "110001100111";
wait for 1ns;
assert sB_s = "110001101000" 
	report "ADD error at 110001101000" severity error;

wait for waitTime;
sA_s <= "110001101000";
wait for 1ns;
assert sB_s = "110001101001" 
	report "ADD error at 110001101001" severity error;

wait for waitTime;
sA_s <= "110001101001";
wait for 1ns;
assert sB_s = "110001101010" 
	report "ADD error at 110001101010" severity error;

wait for waitTime;
sA_s <= "110001101010";
wait for 1ns;
assert sB_s = "110001101011" 
	report "ADD error at 110001101011" severity error;

wait for waitTime;
sA_s <= "110001101011";
wait for 1ns;
assert sB_s = "110001101100" 
	report "ADD error at 110001101100" severity error;

wait for waitTime;
sA_s <= "110001101100";
wait for 1ns;
assert sB_s = "110001101101" 
	report "ADD error at 110001101101" severity error;

wait for waitTime;
sA_s <= "110001101101";
wait for 1ns;
assert sB_s = "110001101110" 
	report "ADD error at 110001101110" severity error;

wait for waitTime;
sA_s <= "110001101110";
wait for 1ns;
assert sB_s = "110001101111" 
	report "ADD error at 110001101111" severity error;

wait for waitTime;
sA_s <= "110001101111";
wait for 1ns;
assert sB_s = "110001110000" 
	report "ADD error at 110001110000" severity error;

wait for waitTime;
sA_s <= "110001110000";
wait for 1ns;
assert sB_s = "110001110001" 
	report "ADD error at 110001110001" severity error;

wait for waitTime;
sA_s <= "110001110001";
wait for 1ns;
assert sB_s = "110001110010" 
	report "ADD error at 110001110010" severity error;

wait for waitTime;
sA_s <= "110001110010";
wait for 1ns;
assert sB_s = "110001110011" 
	report "ADD error at 110001110011" severity error;

wait for waitTime;
sA_s <= "110001110011";
wait for 1ns;
assert sB_s = "110001110100" 
	report "ADD error at 110001110100" severity error;

wait for waitTime;
sA_s <= "110001110100";
wait for 1ns;
assert sB_s = "110001110101" 
	report "ADD error at 110001110101" severity error;

wait for waitTime;
sA_s <= "110001110101";
wait for 1ns;
assert sB_s = "110001110110" 
	report "ADD error at 110001110110" severity error;

wait for waitTime;
sA_s <= "110001110110";
wait for 1ns;
assert sB_s = "110001110111" 
	report "ADD error at 110001110111" severity error;

wait for waitTime;
sA_s <= "110001110111";
wait for 1ns;
assert sB_s = "110001111000" 
	report "ADD error at 110001111000" severity error;

wait for waitTime;
sA_s <= "110001111000";
wait for 1ns;
assert sB_s = "110001111001" 
	report "ADD error at 110001111001" severity error;

wait for waitTime;
sA_s <= "110001111001";
wait for 1ns;
assert sB_s = "110001111010" 
	report "ADD error at 110001111010" severity error;

wait for waitTime;
sA_s <= "110001111010";
wait for 1ns;
assert sB_s = "110001111011" 
	report "ADD error at 110001111011" severity error;

wait for waitTime;
sA_s <= "110001111011";
wait for 1ns;
assert sB_s = "110001111100" 
	report "ADD error at 110001111100" severity error;

wait for waitTime;
sA_s <= "110001111100";
wait for 1ns;
assert sB_s = "110001111101" 
	report "ADD error at 110001111101" severity error;

wait for waitTime;
sA_s <= "110001111101";
wait for 1ns;
assert sB_s = "110001111110" 
	report "ADD error at 110001111110" severity error;

wait for waitTime;
sA_s <= "110001111110";
wait for 1ns;
assert sB_s = "110001111111" 
	report "ADD error at 110001111111" severity error;

wait for waitTime;
sA_s <= "110001111111";
wait for 1ns;
assert sB_s = "110010000000" 
	report "ADD error at 110010000000" severity error;

wait for waitTime;
sA_s <= "110010000000";
wait for 1ns;
assert sB_s = "110010000001" 
	report "ADD error at 110010000001" severity error;

wait for waitTime;
sA_s <= "110010000001";
wait for 1ns;
assert sB_s = "110010000010" 
	report "ADD error at 110010000010" severity error;

wait for waitTime;
sA_s <= "110010000010";
wait for 1ns;
assert sB_s = "110010000011" 
	report "ADD error at 110010000011" severity error;

wait for waitTime;
sA_s <= "110010000011";
wait for 1ns;
assert sB_s = "110010000100" 
	report "ADD error at 110010000100" severity error;

wait for waitTime;
sA_s <= "110010000100";
wait for 1ns;
assert sB_s = "110010000101" 
	report "ADD error at 110010000101" severity error;

wait for waitTime;
sA_s <= "110010000101";
wait for 1ns;
assert sB_s = "110010000110" 
	report "ADD error at 110010000110" severity error;

wait for waitTime;
sA_s <= "110010000110";
wait for 1ns;
assert sB_s = "110010000111" 
	report "ADD error at 110010000111" severity error;

wait for waitTime;
sA_s <= "110010000111";
wait for 1ns;
assert sB_s = "110010001000" 
	report "ADD error at 110010001000" severity error;

wait for waitTime;
sA_s <= "110010001000";
wait for 1ns;
assert sB_s = "110010001001" 
	report "ADD error at 110010001001" severity error;

wait for waitTime;
sA_s <= "110010001001";
wait for 1ns;
assert sB_s = "110010001010" 
	report "ADD error at 110010001010" severity error;

wait for waitTime;
sA_s <= "110010001010";
wait for 1ns;
assert sB_s = "110010001011" 
	report "ADD error at 110010001011" severity error;

wait for waitTime;
sA_s <= "110010001011";
wait for 1ns;
assert sB_s = "110010001100" 
	report "ADD error at 110010001100" severity error;

wait for waitTime;
sA_s <= "110010001100";
wait for 1ns;
assert sB_s = "110010001101" 
	report "ADD error at 110010001101" severity error;

wait for waitTime;
sA_s <= "110010001101";
wait for 1ns;
assert sB_s = "110010001110" 
	report "ADD error at 110010001110" severity error;

wait for waitTime;
sA_s <= "110010001110";
wait for 1ns;
assert sB_s = "110010001111" 
	report "ADD error at 110010001111" severity error;

wait for waitTime;
sA_s <= "110010001111";
wait for 1ns;
assert sB_s = "110010010000" 
	report "ADD error at 110010010000" severity error;

wait for waitTime;
sA_s <= "110010010000";
wait for 1ns;
assert sB_s = "110010010001" 
	report "ADD error at 110010010001" severity error;

wait for waitTime;
sA_s <= "110010010001";
wait for 1ns;
assert sB_s = "110010010010" 
	report "ADD error at 110010010010" severity error;

wait for waitTime;
sA_s <= "110010010010";
wait for 1ns;
assert sB_s = "110010010011" 
	report "ADD error at 110010010011" severity error;

wait for waitTime;
sA_s <= "110010010011";
wait for 1ns;
assert sB_s = "110010010100" 
	report "ADD error at 110010010100" severity error;

wait for waitTime;
sA_s <= "110010010100";
wait for 1ns;
assert sB_s = "110010010101" 
	report "ADD error at 110010010101" severity error;

wait for waitTime;
sA_s <= "110010010101";
wait for 1ns;
assert sB_s = "110010010110" 
	report "ADD error at 110010010110" severity error;

wait for waitTime;
sA_s <= "110010010110";
wait for 1ns;
assert sB_s = "110010010111" 
	report "ADD error at 110010010111" severity error;

wait for waitTime;
sA_s <= "110010010111";
wait for 1ns;
assert sB_s = "110010011000" 
	report "ADD error at 110010011000" severity error;

wait for waitTime;
sA_s <= "110010011000";
wait for 1ns;
assert sB_s = "110010011001" 
	report "ADD error at 110010011001" severity error;

wait for waitTime;
sA_s <= "110010011001";
wait for 1ns;
assert sB_s = "110010011010" 
	report "ADD error at 110010011010" severity error;

wait for waitTime;
sA_s <= "110010011010";
wait for 1ns;
assert sB_s = "110010011011" 
	report "ADD error at 110010011011" severity error;

wait for waitTime;
sA_s <= "110010011011";
wait for 1ns;
assert sB_s = "110010011100" 
	report "ADD error at 110010011100" severity error;

wait for waitTime;
sA_s <= "110010011100";
wait for 1ns;
assert sB_s = "110010011101" 
	report "ADD error at 110010011101" severity error;

wait for waitTime;
sA_s <= "110010011101";
wait for 1ns;
assert sB_s = "110010011110" 
	report "ADD error at 110010011110" severity error;

wait for waitTime;
sA_s <= "110010011110";
wait for 1ns;
assert sB_s = "110010011111" 
	report "ADD error at 110010011111" severity error;

wait for waitTime;
sA_s <= "110010011111";
wait for 1ns;
assert sB_s = "110010100000" 
	report "ADD error at 110010100000" severity error;

wait for waitTime;
sA_s <= "110010100000";
wait for 1ns;
assert sB_s = "110010100001" 
	report "ADD error at 110010100001" severity error;

wait for waitTime;
sA_s <= "110010100001";
wait for 1ns;
assert sB_s = "110010100010" 
	report "ADD error at 110010100010" severity error;

wait for waitTime;
sA_s <= "110010100010";
wait for 1ns;
assert sB_s = "110010100011" 
	report "ADD error at 110010100011" severity error;

wait for waitTime;
sA_s <= "110010100011";
wait for 1ns;
assert sB_s = "110010100100" 
	report "ADD error at 110010100100" severity error;

wait for waitTime;
sA_s <= "110010100100";
wait for 1ns;
assert sB_s = "110010100101" 
	report "ADD error at 110010100101" severity error;

wait for waitTime;
sA_s <= "110010100101";
wait for 1ns;
assert sB_s = "110010100110" 
	report "ADD error at 110010100110" severity error;

wait for waitTime;
sA_s <= "110010100110";
wait for 1ns;
assert sB_s = "110010100111" 
	report "ADD error at 110010100111" severity error;

wait for waitTime;
sA_s <= "110010100111";
wait for 1ns;
assert sB_s = "110010101000" 
	report "ADD error at 110010101000" severity error;

wait for waitTime;
sA_s <= "110010101000";
wait for 1ns;
assert sB_s = "110010101001" 
	report "ADD error at 110010101001" severity error;

wait for waitTime;
sA_s <= "110010101001";
wait for 1ns;
assert sB_s = "110010101010" 
	report "ADD error at 110010101010" severity error;

wait for waitTime;
sA_s <= "110010101010";
wait for 1ns;
assert sB_s = "110010101011" 
	report "ADD error at 110010101011" severity error;

wait for waitTime;
sA_s <= "110010101011";
wait for 1ns;
assert sB_s = "110010101100" 
	report "ADD error at 110010101100" severity error;

wait for waitTime;
sA_s <= "110010101100";
wait for 1ns;
assert sB_s = "110010101101" 
	report "ADD error at 110010101101" severity error;

wait for waitTime;
sA_s <= "110010101101";
wait for 1ns;
assert sB_s = "110010101110" 
	report "ADD error at 110010101110" severity error;

wait for waitTime;
sA_s <= "110010101110";
wait for 1ns;
assert sB_s = "110010101111" 
	report "ADD error at 110010101111" severity error;

wait for waitTime;
sA_s <= "110010101111";
wait for 1ns;
assert sB_s = "110010110000" 
	report "ADD error at 110010110000" severity error;

wait for waitTime;
sA_s <= "110010110000";
wait for 1ns;
assert sB_s = "110010110001" 
	report "ADD error at 110010110001" severity error;

wait for waitTime;
sA_s <= "110010110001";
wait for 1ns;
assert sB_s = "110010110010" 
	report "ADD error at 110010110010" severity error;

wait for waitTime;
sA_s <= "110010110010";
wait for 1ns;
assert sB_s = "110010110011" 
	report "ADD error at 110010110011" severity error;

wait for waitTime;
sA_s <= "110010110011";
wait for 1ns;
assert sB_s = "110010110100" 
	report "ADD error at 110010110100" severity error;

wait for waitTime;
sA_s <= "110010110100";
wait for 1ns;
assert sB_s = "110010110101" 
	report "ADD error at 110010110101" severity error;

wait for waitTime;
sA_s <= "110010110101";
wait for 1ns;
assert sB_s = "110010110110" 
	report "ADD error at 110010110110" severity error;

wait for waitTime;
sA_s <= "110010110110";
wait for 1ns;
assert sB_s = "110010110111" 
	report "ADD error at 110010110111" severity error;

wait for waitTime;
sA_s <= "110010110111";
wait for 1ns;
assert sB_s = "110010111000" 
	report "ADD error at 110010111000" severity error;

wait for waitTime;
sA_s <= "110010111000";
wait for 1ns;
assert sB_s = "110010111001" 
	report "ADD error at 110010111001" severity error;

wait for waitTime;
sA_s <= "110010111001";
wait for 1ns;
assert sB_s = "110010111010" 
	report "ADD error at 110010111010" severity error;

wait for waitTime;
sA_s <= "110010111010";
wait for 1ns;
assert sB_s = "110010111011" 
	report "ADD error at 110010111011" severity error;

wait for waitTime;
sA_s <= "110010111011";
wait for 1ns;
assert sB_s = "110010111100" 
	report "ADD error at 110010111100" severity error;

wait for waitTime;
sA_s <= "110010111100";
wait for 1ns;
assert sB_s = "110010111101" 
	report "ADD error at 110010111101" severity error;

wait for waitTime;
sA_s <= "110010111101";
wait for 1ns;
assert sB_s = "110010111110" 
	report "ADD error at 110010111110" severity error;

wait for waitTime;
sA_s <= "110010111110";
wait for 1ns;
assert sB_s = "110010111111" 
	report "ADD error at 110010111111" severity error;

wait for waitTime;
sA_s <= "110010111111";
wait for 1ns;
assert sB_s = "110011000000" 
	report "ADD error at 110011000000" severity error;

wait for waitTime;
sA_s <= "110011000000";
wait for 1ns;
assert sB_s = "110011000001" 
	report "ADD error at 110011000001" severity error;

wait for waitTime;
sA_s <= "110011000001";
wait for 1ns;
assert sB_s = "110011000010" 
	report "ADD error at 110011000010" severity error;

wait for waitTime;
sA_s <= "110011000010";
wait for 1ns;
assert sB_s = "110011000011" 
	report "ADD error at 110011000011" severity error;

wait for waitTime;
sA_s <= "110011000011";
wait for 1ns;
assert sB_s = "110011000100" 
	report "ADD error at 110011000100" severity error;

wait for waitTime;
sA_s <= "110011000100";
wait for 1ns;
assert sB_s = "110011000101" 
	report "ADD error at 110011000101" severity error;

wait for waitTime;
sA_s <= "110011000101";
wait for 1ns;
assert sB_s = "110011000110" 
	report "ADD error at 110011000110" severity error;

wait for waitTime;
sA_s <= "110011000110";
wait for 1ns;
assert sB_s = "110011000111" 
	report "ADD error at 110011000111" severity error;

wait for waitTime;
sA_s <= "110011000111";
wait for 1ns;
assert sB_s = "110011001000" 
	report "ADD error at 110011001000" severity error;

wait for waitTime;
sA_s <= "110011001000";
wait for 1ns;
assert sB_s = "110011001001" 
	report "ADD error at 110011001001" severity error;

wait for waitTime;
sA_s <= "110011001001";
wait for 1ns;
assert sB_s = "110011001010" 
	report "ADD error at 110011001010" severity error;

wait for waitTime;
sA_s <= "110011001010";
wait for 1ns;
assert sB_s = "110011001011" 
	report "ADD error at 110011001011" severity error;

wait for waitTime;
sA_s <= "110011001011";
wait for 1ns;
assert sB_s = "110011001100" 
	report "ADD error at 110011001100" severity error;

wait for waitTime;
sA_s <= "110011001100";
wait for 1ns;
assert sB_s = "110011001101" 
	report "ADD error at 110011001101" severity error;

wait for waitTime;
sA_s <= "110011001101";
wait for 1ns;
assert sB_s = "110011001110" 
	report "ADD error at 110011001110" severity error;

wait for waitTime;
sA_s <= "110011001110";
wait for 1ns;
assert sB_s = "110011001111" 
	report "ADD error at 110011001111" severity error;

wait for waitTime;
sA_s <= "110011001111";
wait for 1ns;
assert sB_s = "110011010000" 
	report "ADD error at 110011010000" severity error;

wait for waitTime;
sA_s <= "110011010000";
wait for 1ns;
assert sB_s = "110011010001" 
	report "ADD error at 110011010001" severity error;

wait for waitTime;
sA_s <= "110011010001";
wait for 1ns;
assert sB_s = "110011010010" 
	report "ADD error at 110011010010" severity error;

wait for waitTime;
sA_s <= "110011010010";
wait for 1ns;
assert sB_s = "110011010011" 
	report "ADD error at 110011010011" severity error;

wait for waitTime;
sA_s <= "110011010011";
wait for 1ns;
assert sB_s = "110011010100" 
	report "ADD error at 110011010100" severity error;

wait for waitTime;
sA_s <= "110011010100";
wait for 1ns;
assert sB_s = "110011010101" 
	report "ADD error at 110011010101" severity error;

wait for waitTime;
sA_s <= "110011010101";
wait for 1ns;
assert sB_s = "110011010110" 
	report "ADD error at 110011010110" severity error;

wait for waitTime;
sA_s <= "110011010110";
wait for 1ns;
assert sB_s = "110011010111" 
	report "ADD error at 110011010111" severity error;

wait for waitTime;
sA_s <= "110011010111";
wait for 1ns;
assert sB_s = "110011011000" 
	report "ADD error at 110011011000" severity error;

wait for waitTime;
sA_s <= "110011011000";
wait for 1ns;
assert sB_s = "110011011001" 
	report "ADD error at 110011011001" severity error;

wait for waitTime;
sA_s <= "110011011001";
wait for 1ns;
assert sB_s = "110011011010" 
	report "ADD error at 110011011010" severity error;

wait for waitTime;
sA_s <= "110011011010";
wait for 1ns;
assert sB_s = "110011011011" 
	report "ADD error at 110011011011" severity error;

wait for waitTime;
sA_s <= "110011011011";
wait for 1ns;
assert sB_s = "110011011100" 
	report "ADD error at 110011011100" severity error;

wait for waitTime;
sA_s <= "110011011100";
wait for 1ns;
assert sB_s = "110011011101" 
	report "ADD error at 110011011101" severity error;

wait for waitTime;
sA_s <= "110011011101";
wait for 1ns;
assert sB_s = "110011011110" 
	report "ADD error at 110011011110" severity error;

wait for waitTime;
sA_s <= "110011011110";
wait for 1ns;
assert sB_s = "110011011111" 
	report "ADD error at 110011011111" severity error;

wait for waitTime;
sA_s <= "110011011111";
wait for 1ns;
assert sB_s = "110011100000" 
	report "ADD error at 110011100000" severity error;

wait for waitTime;
sA_s <= "110011100000";
wait for 1ns;
assert sB_s = "110011100001" 
	report "ADD error at 110011100001" severity error;

wait for waitTime;
sA_s <= "110011100001";
wait for 1ns;
assert sB_s = "110011100010" 
	report "ADD error at 110011100010" severity error;

wait for waitTime;
sA_s <= "110011100010";
wait for 1ns;
assert sB_s = "110011100011" 
	report "ADD error at 110011100011" severity error;

wait for waitTime;
sA_s <= "110011100011";
wait for 1ns;
assert sB_s = "110011100100" 
	report "ADD error at 110011100100" severity error;

wait for waitTime;
sA_s <= "110011100100";
wait for 1ns;
assert sB_s = "110011100101" 
	report "ADD error at 110011100101" severity error;

wait for waitTime;
sA_s <= "110011100101";
wait for 1ns;
assert sB_s = "110011100110" 
	report "ADD error at 110011100110" severity error;

wait for waitTime;
sA_s <= "110011100110";
wait for 1ns;
assert sB_s = "110011100111" 
	report "ADD error at 110011100111" severity error;

wait for waitTime;
sA_s <= "110011100111";
wait for 1ns;
assert sB_s = "110011101000" 
	report "ADD error at 110011101000" severity error;

wait for waitTime;
sA_s <= "110011101000";
wait for 1ns;
assert sB_s = "110011101001" 
	report "ADD error at 110011101001" severity error;

wait for waitTime;
sA_s <= "110011101001";
wait for 1ns;
assert sB_s = "110011101010" 
	report "ADD error at 110011101010" severity error;

wait for waitTime;
sA_s <= "110011101010";
wait for 1ns;
assert sB_s = "110011101011" 
	report "ADD error at 110011101011" severity error;

wait for waitTime;
sA_s <= "110011101011";
wait for 1ns;
assert sB_s = "110011101100" 
	report "ADD error at 110011101100" severity error;

wait for waitTime;
sA_s <= "110011101100";
wait for 1ns;
assert sB_s = "110011101101" 
	report "ADD error at 110011101101" severity error;

wait for waitTime;
sA_s <= "110011101101";
wait for 1ns;
assert sB_s = "110011101110" 
	report "ADD error at 110011101110" severity error;

wait for waitTime;
sA_s <= "110011101110";
wait for 1ns;
assert sB_s = "110011101111" 
	report "ADD error at 110011101111" severity error;

wait for waitTime;
sA_s <= "110011101111";
wait for 1ns;
assert sB_s = "110011110000" 
	report "ADD error at 110011110000" severity error;

wait for waitTime;
sA_s <= "110011110000";
wait for 1ns;
assert sB_s = "110011110001" 
	report "ADD error at 110011110001" severity error;

wait for waitTime;
sA_s <= "110011110001";
wait for 1ns;
assert sB_s = "110011110010" 
	report "ADD error at 110011110010" severity error;

wait for waitTime;
sA_s <= "110011110010";
wait for 1ns;
assert sB_s = "110011110011" 
	report "ADD error at 110011110011" severity error;

wait for waitTime;
sA_s <= "110011110011";
wait for 1ns;
assert sB_s = "110011110100" 
	report "ADD error at 110011110100" severity error;

wait for waitTime;
sA_s <= "110011110100";
wait for 1ns;
assert sB_s = "110011110101" 
	report "ADD error at 110011110101" severity error;

wait for waitTime;
sA_s <= "110011110101";
wait for 1ns;
assert sB_s = "110011110110" 
	report "ADD error at 110011110110" severity error;

wait for waitTime;
sA_s <= "110011110110";
wait for 1ns;
assert sB_s = "110011110111" 
	report "ADD error at 110011110111" severity error;

wait for waitTime;
sA_s <= "110011110111";
wait for 1ns;
assert sB_s = "110011111000" 
	report "ADD error at 110011111000" severity error;

wait for waitTime;
sA_s <= "110011111000";
wait for 1ns;
assert sB_s = "110011111001" 
	report "ADD error at 110011111001" severity error;

wait for waitTime;
sA_s <= "110011111001";
wait for 1ns;
assert sB_s = "110011111010" 
	report "ADD error at 110011111010" severity error;

wait for waitTime;
sA_s <= "110011111010";
wait for 1ns;
assert sB_s = "110011111011" 
	report "ADD error at 110011111011" severity error;

wait for waitTime;
sA_s <= "110011111011";
wait for 1ns;
assert sB_s = "110011111100" 
	report "ADD error at 110011111100" severity error;

wait for waitTime;
sA_s <= "110011111100";
wait for 1ns;
assert sB_s = "110011111101" 
	report "ADD error at 110011111101" severity error;

wait for waitTime;
sA_s <= "110011111101";
wait for 1ns;
assert sB_s = "110011111110" 
	report "ADD error at 110011111110" severity error;

wait for waitTime;
sA_s <= "110011111110";
wait for 1ns;
assert sB_s = "110011111111" 
	report "ADD error at 110011111111" severity error;

wait for waitTime;
sA_s <= "110011111111";
wait for 1ns;
assert sB_s = "110100000000" 
	report "ADD error at 110100000000" severity error;

wait for waitTime;
sA_s <= "110100000000";
wait for 1ns;
assert sB_s = "110100000001" 
	report "ADD error at 110100000001" severity error;

wait for waitTime;
sA_s <= "110100000001";
wait for 1ns;
assert sB_s = "110100000010" 
	report "ADD error at 110100000010" severity error;

wait for waitTime;
sA_s <= "110100000010";
wait for 1ns;
assert sB_s = "110100000011" 
	report "ADD error at 110100000011" severity error;

wait for waitTime;
sA_s <= "110100000011";
wait for 1ns;
assert sB_s = "110100000100" 
	report "ADD error at 110100000100" severity error;

wait for waitTime;
sA_s <= "110100000100";
wait for 1ns;
assert sB_s = "110100000101" 
	report "ADD error at 110100000101" severity error;

wait for waitTime;
sA_s <= "110100000101";
wait for 1ns;
assert sB_s = "110100000110" 
	report "ADD error at 110100000110" severity error;

wait for waitTime;
sA_s <= "110100000110";
wait for 1ns;
assert sB_s = "110100000111" 
	report "ADD error at 110100000111" severity error;

wait for waitTime;
sA_s <= "110100000111";
wait for 1ns;
assert sB_s = "110100001000" 
	report "ADD error at 110100001000" severity error;

wait for waitTime;
sA_s <= "110100001000";
wait for 1ns;
assert sB_s = "110100001001" 
	report "ADD error at 110100001001" severity error;

wait for waitTime;
sA_s <= "110100001001";
wait for 1ns;
assert sB_s = "110100001010" 
	report "ADD error at 110100001010" severity error;

wait for waitTime;
sA_s <= "110100001010";
wait for 1ns;
assert sB_s = "110100001011" 
	report "ADD error at 110100001011" severity error;

wait for waitTime;
sA_s <= "110100001011";
wait for 1ns;
assert sB_s = "110100001100" 
	report "ADD error at 110100001100" severity error;

wait for waitTime;
sA_s <= "110100001100";
wait for 1ns;
assert sB_s = "110100001101" 
	report "ADD error at 110100001101" severity error;

wait for waitTime;
sA_s <= "110100001101";
wait for 1ns;
assert sB_s = "110100001110" 
	report "ADD error at 110100001110" severity error;

wait for waitTime;
sA_s <= "110100001110";
wait for 1ns;
assert sB_s = "110100001111" 
	report "ADD error at 110100001111" severity error;

wait for waitTime;
sA_s <= "110100001111";
wait for 1ns;
assert sB_s = "110100010000" 
	report "ADD error at 110100010000" severity error;

wait for waitTime;
sA_s <= "110100010000";
wait for 1ns;
assert sB_s = "110100010001" 
	report "ADD error at 110100010001" severity error;

wait for waitTime;
sA_s <= "110100010001";
wait for 1ns;
assert sB_s = "110100010010" 
	report "ADD error at 110100010010" severity error;

wait for waitTime;
sA_s <= "110100010010";
wait for 1ns;
assert sB_s = "110100010011" 
	report "ADD error at 110100010011" severity error;

wait for waitTime;
sA_s <= "110100010011";
wait for 1ns;
assert sB_s = "110100010100" 
	report "ADD error at 110100010100" severity error;

wait for waitTime;
sA_s <= "110100010100";
wait for 1ns;
assert sB_s = "110100010101" 
	report "ADD error at 110100010101" severity error;

wait for waitTime;
sA_s <= "110100010101";
wait for 1ns;
assert sB_s = "110100010110" 
	report "ADD error at 110100010110" severity error;

wait for waitTime;
sA_s <= "110100010110";
wait for 1ns;
assert sB_s = "110100010111" 
	report "ADD error at 110100010111" severity error;

wait for waitTime;
sA_s <= "110100010111";
wait for 1ns;
assert sB_s = "110100011000" 
	report "ADD error at 110100011000" severity error;

wait for waitTime;
sA_s <= "110100011000";
wait for 1ns;
assert sB_s = "110100011001" 
	report "ADD error at 110100011001" severity error;

wait for waitTime;
sA_s <= "110100011001";
wait for 1ns;
assert sB_s = "110100011010" 
	report "ADD error at 110100011010" severity error;

wait for waitTime;
sA_s <= "110100011010";
wait for 1ns;
assert sB_s = "110100011011" 
	report "ADD error at 110100011011" severity error;

wait for waitTime;
sA_s <= "110100011011";
wait for 1ns;
assert sB_s = "110100011100" 
	report "ADD error at 110100011100" severity error;

wait for waitTime;
sA_s <= "110100011100";
wait for 1ns;
assert sB_s = "110100011101" 
	report "ADD error at 110100011101" severity error;

wait for waitTime;
sA_s <= "110100011101";
wait for 1ns;
assert sB_s = "110100011110" 
	report "ADD error at 110100011110" severity error;

wait for waitTime;
sA_s <= "110100011110";
wait for 1ns;
assert sB_s = "110100011111" 
	report "ADD error at 110100011111" severity error;

wait for waitTime;
sA_s <= "110100011111";
wait for 1ns;
assert sB_s = "110100100000" 
	report "ADD error at 110100100000" severity error;

wait for waitTime;
sA_s <= "110100100000";
wait for 1ns;
assert sB_s = "110100100001" 
	report "ADD error at 110100100001" severity error;

wait for waitTime;
sA_s <= "110100100001";
wait for 1ns;
assert sB_s = "110100100010" 
	report "ADD error at 110100100010" severity error;

wait for waitTime;
sA_s <= "110100100010";
wait for 1ns;
assert sB_s = "110100100011" 
	report "ADD error at 110100100011" severity error;

wait for waitTime;
sA_s <= "110100100011";
wait for 1ns;
assert sB_s = "110100100100" 
	report "ADD error at 110100100100" severity error;

wait for waitTime;
sA_s <= "110100100100";
wait for 1ns;
assert sB_s = "110100100101" 
	report "ADD error at 110100100101" severity error;

wait for waitTime;
sA_s <= "110100100101";
wait for 1ns;
assert sB_s = "110100100110" 
	report "ADD error at 110100100110" severity error;

wait for waitTime;
sA_s <= "110100100110";
wait for 1ns;
assert sB_s = "110100100111" 
	report "ADD error at 110100100111" severity error;

wait for waitTime;
sA_s <= "110100100111";
wait for 1ns;
assert sB_s = "110100101000" 
	report "ADD error at 110100101000" severity error;

wait for waitTime;
sA_s <= "110100101000";
wait for 1ns;
assert sB_s = "110100101001" 
	report "ADD error at 110100101001" severity error;

wait for waitTime;
sA_s <= "110100101001";
wait for 1ns;
assert sB_s = "110100101010" 
	report "ADD error at 110100101010" severity error;

wait for waitTime;
sA_s <= "110100101010";
wait for 1ns;
assert sB_s = "110100101011" 
	report "ADD error at 110100101011" severity error;

wait for waitTime;
sA_s <= "110100101011";
wait for 1ns;
assert sB_s = "110100101100" 
	report "ADD error at 110100101100" severity error;

wait for waitTime;
sA_s <= "110100101100";
wait for 1ns;
assert sB_s = "110100101101" 
	report "ADD error at 110100101101" severity error;

wait for waitTime;
sA_s <= "110100101101";
wait for 1ns;
assert sB_s = "110100101110" 
	report "ADD error at 110100101110" severity error;

wait for waitTime;
sA_s <= "110100101110";
wait for 1ns;
assert sB_s = "110100101111" 
	report "ADD error at 110100101111" severity error;

wait for waitTime;
sA_s <= "110100101111";
wait for 1ns;
assert sB_s = "110100110000" 
	report "ADD error at 110100110000" severity error;

wait for waitTime;
sA_s <= "110100110000";
wait for 1ns;
assert sB_s = "110100110001" 
	report "ADD error at 110100110001" severity error;

wait for waitTime;
sA_s <= "110100110001";
wait for 1ns;
assert sB_s = "110100110010" 
	report "ADD error at 110100110010" severity error;

wait for waitTime;
sA_s <= "110100110010";
wait for 1ns;
assert sB_s = "110100110011" 
	report "ADD error at 110100110011" severity error;

wait for waitTime;
sA_s <= "110100110011";
wait for 1ns;
assert sB_s = "110100110100" 
	report "ADD error at 110100110100" severity error;

wait for waitTime;
sA_s <= "110100110100";
wait for 1ns;
assert sB_s = "110100110101" 
	report "ADD error at 110100110101" severity error;

wait for waitTime;
sA_s <= "110100110101";
wait for 1ns;
assert sB_s = "110100110110" 
	report "ADD error at 110100110110" severity error;

wait for waitTime;
sA_s <= "110100110110";
wait for 1ns;
assert sB_s = "110100110111" 
	report "ADD error at 110100110111" severity error;

wait for waitTime;
sA_s <= "110100110111";
wait for 1ns;
assert sB_s = "110100111000" 
	report "ADD error at 110100111000" severity error;

wait for waitTime;
sA_s <= "110100111000";
wait for 1ns;
assert sB_s = "110100111001" 
	report "ADD error at 110100111001" severity error;

wait for waitTime;
sA_s <= "110100111001";
wait for 1ns;
assert sB_s = "110100111010" 
	report "ADD error at 110100111010" severity error;

wait for waitTime;
sA_s <= "110100111010";
wait for 1ns;
assert sB_s = "110100111011" 
	report "ADD error at 110100111011" severity error;

wait for waitTime;
sA_s <= "110100111011";
wait for 1ns;
assert sB_s = "110100111100" 
	report "ADD error at 110100111100" severity error;

wait for waitTime;
sA_s <= "110100111100";
wait for 1ns;
assert sB_s = "110100111101" 
	report "ADD error at 110100111101" severity error;

wait for waitTime;
sA_s <= "110100111101";
wait for 1ns;
assert sB_s = "110100111110" 
	report "ADD error at 110100111110" severity error;

wait for waitTime;
sA_s <= "110100111110";
wait for 1ns;
assert sB_s = "110100111111" 
	report "ADD error at 110100111111" severity error;

wait for waitTime;
sA_s <= "110100111111";
wait for 1ns;
assert sB_s = "110101000000" 
	report "ADD error at 110101000000" severity error;

wait for waitTime;
sA_s <= "110101000000";
wait for 1ns;
assert sB_s = "110101000001" 
	report "ADD error at 110101000001" severity error;

wait for waitTime;
sA_s <= "110101000001";
wait for 1ns;
assert sB_s = "110101000010" 
	report "ADD error at 110101000010" severity error;

wait for waitTime;
sA_s <= "110101000010";
wait for 1ns;
assert sB_s = "110101000011" 
	report "ADD error at 110101000011" severity error;

wait for waitTime;
sA_s <= "110101000011";
wait for 1ns;
assert sB_s = "110101000100" 
	report "ADD error at 110101000100" severity error;

wait for waitTime;
sA_s <= "110101000100";
wait for 1ns;
assert sB_s = "110101000101" 
	report "ADD error at 110101000101" severity error;

wait for waitTime;
sA_s <= "110101000101";
wait for 1ns;
assert sB_s = "110101000110" 
	report "ADD error at 110101000110" severity error;

wait for waitTime;
sA_s <= "110101000110";
wait for 1ns;
assert sB_s = "110101000111" 
	report "ADD error at 110101000111" severity error;

wait for waitTime;
sA_s <= "110101000111";
wait for 1ns;
assert sB_s = "110101001000" 
	report "ADD error at 110101001000" severity error;

wait for waitTime;
sA_s <= "110101001000";
wait for 1ns;
assert sB_s = "110101001001" 
	report "ADD error at 110101001001" severity error;

wait for waitTime;
sA_s <= "110101001001";
wait for 1ns;
assert sB_s = "110101001010" 
	report "ADD error at 110101001010" severity error;

wait for waitTime;
sA_s <= "110101001010";
wait for 1ns;
assert sB_s = "110101001011" 
	report "ADD error at 110101001011" severity error;

wait for waitTime;
sA_s <= "110101001011";
wait for 1ns;
assert sB_s = "110101001100" 
	report "ADD error at 110101001100" severity error;

wait for waitTime;
sA_s <= "110101001100";
wait for 1ns;
assert sB_s = "110101001101" 
	report "ADD error at 110101001101" severity error;

wait for waitTime;
sA_s <= "110101001101";
wait for 1ns;
assert sB_s = "110101001110" 
	report "ADD error at 110101001110" severity error;

wait for waitTime;
sA_s <= "110101001110";
wait for 1ns;
assert sB_s = "110101001111" 
	report "ADD error at 110101001111" severity error;

wait for waitTime;
sA_s <= "110101001111";
wait for 1ns;
assert sB_s = "110101010000" 
	report "ADD error at 110101010000" severity error;

wait for waitTime;
sA_s <= "110101010000";
wait for 1ns;
assert sB_s = "110101010001" 
	report "ADD error at 110101010001" severity error;

wait for waitTime;
sA_s <= "110101010001";
wait for 1ns;
assert sB_s = "110101010010" 
	report "ADD error at 110101010010" severity error;

wait for waitTime;
sA_s <= "110101010010";
wait for 1ns;
assert sB_s = "110101010011" 
	report "ADD error at 110101010011" severity error;

wait for waitTime;
sA_s <= "110101010011";
wait for 1ns;
assert sB_s = "110101010100" 
	report "ADD error at 110101010100" severity error;

wait for waitTime;
sA_s <= "110101010100";
wait for 1ns;
assert sB_s = "110101010101" 
	report "ADD error at 110101010101" severity error;

wait for waitTime;
sA_s <= "110101010101";
wait for 1ns;
assert sB_s = "110101010110" 
	report "ADD error at 110101010110" severity error;

wait for waitTime;
sA_s <= "110101010110";
wait for 1ns;
assert sB_s = "110101010111" 
	report "ADD error at 110101010111" severity error;

wait for waitTime;
sA_s <= "110101010111";
wait for 1ns;
assert sB_s = "110101011000" 
	report "ADD error at 110101011000" severity error;

wait for waitTime;
sA_s <= "110101011000";
wait for 1ns;
assert sB_s = "110101011001" 
	report "ADD error at 110101011001" severity error;

wait for waitTime;
sA_s <= "110101011001";
wait for 1ns;
assert sB_s = "110101011010" 
	report "ADD error at 110101011010" severity error;

wait for waitTime;
sA_s <= "110101011010";
wait for 1ns;
assert sB_s = "110101011011" 
	report "ADD error at 110101011011" severity error;

wait for waitTime;
sA_s <= "110101011011";
wait for 1ns;
assert sB_s = "110101011100" 
	report "ADD error at 110101011100" severity error;

wait for waitTime;
sA_s <= "110101011100";
wait for 1ns;
assert sB_s = "110101011101" 
	report "ADD error at 110101011101" severity error;

wait for waitTime;
sA_s <= "110101011101";
wait for 1ns;
assert sB_s = "110101011110" 
	report "ADD error at 110101011110" severity error;

wait for waitTime;
sA_s <= "110101011110";
wait for 1ns;
assert sB_s = "110101011111" 
	report "ADD error at 110101011111" severity error;

wait for waitTime;
sA_s <= "110101011111";
wait for 1ns;
assert sB_s = "110101100000" 
	report "ADD error at 110101100000" severity error;

wait for waitTime;
sA_s <= "110101100000";
wait for 1ns;
assert sB_s = "110101100001" 
	report "ADD error at 110101100001" severity error;

wait for waitTime;
sA_s <= "110101100001";
wait for 1ns;
assert sB_s = "110101100010" 
	report "ADD error at 110101100010" severity error;

wait for waitTime;
sA_s <= "110101100010";
wait for 1ns;
assert sB_s = "110101100011" 
	report "ADD error at 110101100011" severity error;

wait for waitTime;
sA_s <= "110101100011";
wait for 1ns;
assert sB_s = "110101100100" 
	report "ADD error at 110101100100" severity error;

wait for waitTime;
sA_s <= "110101100100";
wait for 1ns;
assert sB_s = "110101100101" 
	report "ADD error at 110101100101" severity error;

wait for waitTime;
sA_s <= "110101100101";
wait for 1ns;
assert sB_s = "110101100110" 
	report "ADD error at 110101100110" severity error;

wait for waitTime;
sA_s <= "110101100110";
wait for 1ns;
assert sB_s = "110101100111" 
	report "ADD error at 110101100111" severity error;

wait for waitTime;
sA_s <= "110101100111";
wait for 1ns;
assert sB_s = "110101101000" 
	report "ADD error at 110101101000" severity error;

wait for waitTime;
sA_s <= "110101101000";
wait for 1ns;
assert sB_s = "110101101001" 
	report "ADD error at 110101101001" severity error;

wait for waitTime;
sA_s <= "110101101001";
wait for 1ns;
assert sB_s = "110101101010" 
	report "ADD error at 110101101010" severity error;

wait for waitTime;
sA_s <= "110101101010";
wait for 1ns;
assert sB_s = "110101101011" 
	report "ADD error at 110101101011" severity error;

wait for waitTime;
sA_s <= "110101101011";
wait for 1ns;
assert sB_s = "110101101100" 
	report "ADD error at 110101101100" severity error;

wait for waitTime;
sA_s <= "110101101100";
wait for 1ns;
assert sB_s = "110101101101" 
	report "ADD error at 110101101101" severity error;

wait for waitTime;
sA_s <= "110101101101";
wait for 1ns;
assert sB_s = "110101101110" 
	report "ADD error at 110101101110" severity error;

wait for waitTime;
sA_s <= "110101101110";
wait for 1ns;
assert sB_s = "110101101111" 
	report "ADD error at 110101101111" severity error;

wait for waitTime;
sA_s <= "110101101111";
wait for 1ns;
assert sB_s = "110101110000" 
	report "ADD error at 110101110000" severity error;

wait for waitTime;
sA_s <= "110101110000";
wait for 1ns;
assert sB_s = "110101110001" 
	report "ADD error at 110101110001" severity error;

wait for waitTime;
sA_s <= "110101110001";
wait for 1ns;
assert sB_s = "110101110010" 
	report "ADD error at 110101110010" severity error;

wait for waitTime;
sA_s <= "110101110010";
wait for 1ns;
assert sB_s = "110101110011" 
	report "ADD error at 110101110011" severity error;

wait for waitTime;
sA_s <= "110101110011";
wait for 1ns;
assert sB_s = "110101110100" 
	report "ADD error at 110101110100" severity error;

wait for waitTime;
sA_s <= "110101110100";
wait for 1ns;
assert sB_s = "110101110101" 
	report "ADD error at 110101110101" severity error;

wait for waitTime;
sA_s <= "110101110101";
wait for 1ns;
assert sB_s = "110101110110" 
	report "ADD error at 110101110110" severity error;

wait for waitTime;
sA_s <= "110101110110";
wait for 1ns;
assert sB_s = "110101110111" 
	report "ADD error at 110101110111" severity error;

wait for waitTime;
sA_s <= "110101110111";
wait for 1ns;
assert sB_s = "110101111000" 
	report "ADD error at 110101111000" severity error;

wait for waitTime;
sA_s <= "110101111000";
wait for 1ns;
assert sB_s = "110101111001" 
	report "ADD error at 110101111001" severity error;

wait for waitTime;
sA_s <= "110101111001";
wait for 1ns;
assert sB_s = "110101111010" 
	report "ADD error at 110101111010" severity error;

wait for waitTime;
sA_s <= "110101111010";
wait for 1ns;
assert sB_s = "110101111011" 
	report "ADD error at 110101111011" severity error;

wait for waitTime;
sA_s <= "110101111011";
wait for 1ns;
assert sB_s = "110101111100" 
	report "ADD error at 110101111100" severity error;

wait for waitTime;
sA_s <= "110101111100";
wait for 1ns;
assert sB_s = "110101111101" 
	report "ADD error at 110101111101" severity error;

wait for waitTime;
sA_s <= "110101111101";
wait for 1ns;
assert sB_s = "110101111110" 
	report "ADD error at 110101111110" severity error;

wait for waitTime;
sA_s <= "110101111110";
wait for 1ns;
assert sB_s = "110101111111" 
	report "ADD error at 110101111111" severity error;

wait for waitTime;
sA_s <= "110101111111";
wait for 1ns;
assert sB_s = "110110000000" 
	report "ADD error at 110110000000" severity error;

wait for waitTime;
sA_s <= "110110000000";
wait for 1ns;
assert sB_s = "110110000001" 
	report "ADD error at 110110000001" severity error;

wait for waitTime;
sA_s <= "110110000001";
wait for 1ns;
assert sB_s = "110110000010" 
	report "ADD error at 110110000010" severity error;

wait for waitTime;
sA_s <= "110110000010";
wait for 1ns;
assert sB_s = "110110000011" 
	report "ADD error at 110110000011" severity error;

wait for waitTime;
sA_s <= "110110000011";
wait for 1ns;
assert sB_s = "110110000100" 
	report "ADD error at 110110000100" severity error;

wait for waitTime;
sA_s <= "110110000100";
wait for 1ns;
assert sB_s = "110110000101" 
	report "ADD error at 110110000101" severity error;

wait for waitTime;
sA_s <= "110110000101";
wait for 1ns;
assert sB_s = "110110000110" 
	report "ADD error at 110110000110" severity error;

wait for waitTime;
sA_s <= "110110000110";
wait for 1ns;
assert sB_s = "110110000111" 
	report "ADD error at 110110000111" severity error;

wait for waitTime;
sA_s <= "110110000111";
wait for 1ns;
assert sB_s = "110110001000" 
	report "ADD error at 110110001000" severity error;

wait for waitTime;
sA_s <= "110110001000";
wait for 1ns;
assert sB_s = "110110001001" 
	report "ADD error at 110110001001" severity error;

wait for waitTime;
sA_s <= "110110001001";
wait for 1ns;
assert sB_s = "110110001010" 
	report "ADD error at 110110001010" severity error;

wait for waitTime;
sA_s <= "110110001010";
wait for 1ns;
assert sB_s = "110110001011" 
	report "ADD error at 110110001011" severity error;

wait for waitTime;
sA_s <= "110110001011";
wait for 1ns;
assert sB_s = "110110001100" 
	report "ADD error at 110110001100" severity error;

wait for waitTime;
sA_s <= "110110001100";
wait for 1ns;
assert sB_s = "110110001101" 
	report "ADD error at 110110001101" severity error;

wait for waitTime;
sA_s <= "110110001101";
wait for 1ns;
assert sB_s = "110110001110" 
	report "ADD error at 110110001110" severity error;

wait for waitTime;
sA_s <= "110110001110";
wait for 1ns;
assert sB_s = "110110001111" 
	report "ADD error at 110110001111" severity error;

wait for waitTime;
sA_s <= "110110001111";
wait for 1ns;
assert sB_s = "110110010000" 
	report "ADD error at 110110010000" severity error;

wait for waitTime;
sA_s <= "110110010000";
wait for 1ns;
assert sB_s = "110110010001" 
	report "ADD error at 110110010001" severity error;

wait for waitTime;
sA_s <= "110110010001";
wait for 1ns;
assert sB_s = "110110010010" 
	report "ADD error at 110110010010" severity error;

wait for waitTime;
sA_s <= "110110010010";
wait for 1ns;
assert sB_s = "110110010011" 
	report "ADD error at 110110010011" severity error;

wait for waitTime;
sA_s <= "110110010011";
wait for 1ns;
assert sB_s = "110110010100" 
	report "ADD error at 110110010100" severity error;

wait for waitTime;
sA_s <= "110110010100";
wait for 1ns;
assert sB_s = "110110010101" 
	report "ADD error at 110110010101" severity error;

wait for waitTime;
sA_s <= "110110010101";
wait for 1ns;
assert sB_s = "110110010110" 
	report "ADD error at 110110010110" severity error;

wait for waitTime;
sA_s <= "110110010110";
wait for 1ns;
assert sB_s = "110110010111" 
	report "ADD error at 110110010111" severity error;

wait for waitTime;
sA_s <= "110110010111";
wait for 1ns;
assert sB_s = "110110011000" 
	report "ADD error at 110110011000" severity error;

wait for waitTime;
sA_s <= "110110011000";
wait for 1ns;
assert sB_s = "110110011001" 
	report "ADD error at 110110011001" severity error;

wait for waitTime;
sA_s <= "110110011001";
wait for 1ns;
assert sB_s = "110110011010" 
	report "ADD error at 110110011010" severity error;

wait for waitTime;
sA_s <= "110110011010";
wait for 1ns;
assert sB_s = "110110011011" 
	report "ADD error at 110110011011" severity error;

wait for waitTime;
sA_s <= "110110011011";
wait for 1ns;
assert sB_s = "110110011100" 
	report "ADD error at 110110011100" severity error;

wait for waitTime;
sA_s <= "110110011100";
wait for 1ns;
assert sB_s = "110110011101" 
	report "ADD error at 110110011101" severity error;

wait for waitTime;
sA_s <= "110110011101";
wait for 1ns;
assert sB_s = "110110011110" 
	report "ADD error at 110110011110" severity error;

wait for waitTime;
sA_s <= "110110011110";
wait for 1ns;
assert sB_s = "110110011111" 
	report "ADD error at 110110011111" severity error;

wait for waitTime;
sA_s <= "110110011111";
wait for 1ns;
assert sB_s = "110110100000" 
	report "ADD error at 110110100000" severity error;

wait for waitTime;
sA_s <= "110110100000";
wait for 1ns;
assert sB_s = "110110100001" 
	report "ADD error at 110110100001" severity error;

wait for waitTime;
sA_s <= "110110100001";
wait for 1ns;
assert sB_s = "110110100010" 
	report "ADD error at 110110100010" severity error;

wait for waitTime;
sA_s <= "110110100010";
wait for 1ns;
assert sB_s = "110110100011" 
	report "ADD error at 110110100011" severity error;

wait for waitTime;
sA_s <= "110110100011";
wait for 1ns;
assert sB_s = "110110100100" 
	report "ADD error at 110110100100" severity error;

wait for waitTime;
sA_s <= "110110100100";
wait for 1ns;
assert sB_s = "110110100101" 
	report "ADD error at 110110100101" severity error;

wait for waitTime;
sA_s <= "110110100101";
wait for 1ns;
assert sB_s = "110110100110" 
	report "ADD error at 110110100110" severity error;

wait for waitTime;
sA_s <= "110110100110";
wait for 1ns;
assert sB_s = "110110100111" 
	report "ADD error at 110110100111" severity error;

wait for waitTime;
sA_s <= "110110100111";
wait for 1ns;
assert sB_s = "110110101000" 
	report "ADD error at 110110101000" severity error;

wait for waitTime;
sA_s <= "110110101000";
wait for 1ns;
assert sB_s = "110110101001" 
	report "ADD error at 110110101001" severity error;

wait for waitTime;
sA_s <= "110110101001";
wait for 1ns;
assert sB_s = "110110101010" 
	report "ADD error at 110110101010" severity error;

wait for waitTime;
sA_s <= "110110101010";
wait for 1ns;
assert sB_s = "110110101011" 
	report "ADD error at 110110101011" severity error;

wait for waitTime;
sA_s <= "110110101011";
wait for 1ns;
assert sB_s = "110110101100" 
	report "ADD error at 110110101100" severity error;

wait for waitTime;
sA_s <= "110110101100";
wait for 1ns;
assert sB_s = "110110101101" 
	report "ADD error at 110110101101" severity error;

wait for waitTime;
sA_s <= "110110101101";
wait for 1ns;
assert sB_s = "110110101110" 
	report "ADD error at 110110101110" severity error;

wait for waitTime;
sA_s <= "110110101110";
wait for 1ns;
assert sB_s = "110110101111" 
	report "ADD error at 110110101111" severity error;

wait for waitTime;
sA_s <= "110110101111";
wait for 1ns;
assert sB_s = "110110110000" 
	report "ADD error at 110110110000" severity error;

wait for waitTime;
sA_s <= "110110110000";
wait for 1ns;
assert sB_s = "110110110001" 
	report "ADD error at 110110110001" severity error;

wait for waitTime;
sA_s <= "110110110001";
wait for 1ns;
assert sB_s = "110110110010" 
	report "ADD error at 110110110010" severity error;

wait for waitTime;
sA_s <= "110110110010";
wait for 1ns;
assert sB_s = "110110110011" 
	report "ADD error at 110110110011" severity error;

wait for waitTime;
sA_s <= "110110110011";
wait for 1ns;
assert sB_s = "110110110100" 
	report "ADD error at 110110110100" severity error;

wait for waitTime;
sA_s <= "110110110100";
wait for 1ns;
assert sB_s = "110110110101" 
	report "ADD error at 110110110101" severity error;

wait for waitTime;
sA_s <= "110110110101";
wait for 1ns;
assert sB_s = "110110110110" 
	report "ADD error at 110110110110" severity error;

wait for waitTime;
sA_s <= "110110110110";
wait for 1ns;
assert sB_s = "110110110111" 
	report "ADD error at 110110110111" severity error;

wait for waitTime;
sA_s <= "110110110111";
wait for 1ns;
assert sB_s = "110110111000" 
	report "ADD error at 110110111000" severity error;

wait for waitTime;
sA_s <= "110110111000";
wait for 1ns;
assert sB_s = "110110111001" 
	report "ADD error at 110110111001" severity error;

wait for waitTime;
sA_s <= "110110111001";
wait for 1ns;
assert sB_s = "110110111010" 
	report "ADD error at 110110111010" severity error;

wait for waitTime;
sA_s <= "110110111010";
wait for 1ns;
assert sB_s = "110110111011" 
	report "ADD error at 110110111011" severity error;

wait for waitTime;
sA_s <= "110110111011";
wait for 1ns;
assert sB_s = "110110111100" 
	report "ADD error at 110110111100" severity error;

wait for waitTime;
sA_s <= "110110111100";
wait for 1ns;
assert sB_s = "110110111101" 
	report "ADD error at 110110111101" severity error;

wait for waitTime;
sA_s <= "110110111101";
wait for 1ns;
assert sB_s = "110110111110" 
	report "ADD error at 110110111110" severity error;

wait for waitTime;
sA_s <= "110110111110";
wait for 1ns;
assert sB_s = "110110111111" 
	report "ADD error at 110110111111" severity error;

wait for waitTime;
sA_s <= "110110111111";
wait for 1ns;
assert sB_s = "110111000000" 
	report "ADD error at 110111000000" severity error;

wait for waitTime;
sA_s <= "110111000000";
wait for 1ns;
assert sB_s = "110111000001" 
	report "ADD error at 110111000001" severity error;

wait for waitTime;
sA_s <= "110111000001";
wait for 1ns;
assert sB_s = "110111000010" 
	report "ADD error at 110111000010" severity error;

wait for waitTime;
sA_s <= "110111000010";
wait for 1ns;
assert sB_s = "110111000011" 
	report "ADD error at 110111000011" severity error;

wait for waitTime;
sA_s <= "110111000011";
wait for 1ns;
assert sB_s = "110111000100" 
	report "ADD error at 110111000100" severity error;

wait for waitTime;
sA_s <= "110111000100";
wait for 1ns;
assert sB_s = "110111000101" 
	report "ADD error at 110111000101" severity error;

wait for waitTime;
sA_s <= "110111000101";
wait for 1ns;
assert sB_s = "110111000110" 
	report "ADD error at 110111000110" severity error;

wait for waitTime;
sA_s <= "110111000110";
wait for 1ns;
assert sB_s = "110111000111" 
	report "ADD error at 110111000111" severity error;

wait for waitTime;
sA_s <= "110111000111";
wait for 1ns;
assert sB_s = "110111001000" 
	report "ADD error at 110111001000" severity error;

wait for waitTime;
sA_s <= "110111001000";
wait for 1ns;
assert sB_s = "110111001001" 
	report "ADD error at 110111001001" severity error;

wait for waitTime;
sA_s <= "110111001001";
wait for 1ns;
assert sB_s = "110111001010" 
	report "ADD error at 110111001010" severity error;

wait for waitTime;
sA_s <= "110111001010";
wait for 1ns;
assert sB_s = "110111001011" 
	report "ADD error at 110111001011" severity error;

wait for waitTime;
sA_s <= "110111001011";
wait for 1ns;
assert sB_s = "110111001100" 
	report "ADD error at 110111001100" severity error;

wait for waitTime;
sA_s <= "110111001100";
wait for 1ns;
assert sB_s = "110111001101" 
	report "ADD error at 110111001101" severity error;

wait for waitTime;
sA_s <= "110111001101";
wait for 1ns;
assert sB_s = "110111001110" 
	report "ADD error at 110111001110" severity error;

wait for waitTime;
sA_s <= "110111001110";
wait for 1ns;
assert sB_s = "110111001111" 
	report "ADD error at 110111001111" severity error;

wait for waitTime;
sA_s <= "110111001111";
wait for 1ns;
assert sB_s = "110111010000" 
	report "ADD error at 110111010000" severity error;

wait for waitTime;
sA_s <= "110111010000";
wait for 1ns;
assert sB_s = "110111010001" 
	report "ADD error at 110111010001" severity error;

wait for waitTime;
sA_s <= "110111010001";
wait for 1ns;
assert sB_s = "110111010010" 
	report "ADD error at 110111010010" severity error;

wait for waitTime;
sA_s <= "110111010010";
wait for 1ns;
assert sB_s = "110111010011" 
	report "ADD error at 110111010011" severity error;

wait for waitTime;
sA_s <= "110111010011";
wait for 1ns;
assert sB_s = "110111010100" 
	report "ADD error at 110111010100" severity error;

wait for waitTime;
sA_s <= "110111010100";
wait for 1ns;
assert sB_s = "110111010101" 
	report "ADD error at 110111010101" severity error;

wait for waitTime;
sA_s <= "110111010101";
wait for 1ns;
assert sB_s = "110111010110" 
	report "ADD error at 110111010110" severity error;

wait for waitTime;
sA_s <= "110111010110";
wait for 1ns;
assert sB_s = "110111010111" 
	report "ADD error at 110111010111" severity error;

wait for waitTime;
sA_s <= "110111010111";
wait for 1ns;
assert sB_s = "110111011000" 
	report "ADD error at 110111011000" severity error;

wait for waitTime;
sA_s <= "110111011000";
wait for 1ns;
assert sB_s = "110111011001" 
	report "ADD error at 110111011001" severity error;

wait for waitTime;
sA_s <= "110111011001";
wait for 1ns;
assert sB_s = "110111011010" 
	report "ADD error at 110111011010" severity error;

wait for waitTime;
sA_s <= "110111011010";
wait for 1ns;
assert sB_s = "110111011011" 
	report "ADD error at 110111011011" severity error;

wait for waitTime;
sA_s <= "110111011011";
wait for 1ns;
assert sB_s = "110111011100" 
	report "ADD error at 110111011100" severity error;

wait for waitTime;
sA_s <= "110111011100";
wait for 1ns;
assert sB_s = "110111011101" 
	report "ADD error at 110111011101" severity error;

wait for waitTime;
sA_s <= "110111011101";
wait for 1ns;
assert sB_s = "110111011110" 
	report "ADD error at 110111011110" severity error;

wait for waitTime;
sA_s <= "110111011110";
wait for 1ns;
assert sB_s = "110111011111" 
	report "ADD error at 110111011111" severity error;

wait for waitTime;
sA_s <= "110111011111";
wait for 1ns;
assert sB_s = "110111100000" 
	report "ADD error at 110111100000" severity error;

wait for waitTime;
sA_s <= "110111100000";
wait for 1ns;
assert sB_s = "110111100001" 
	report "ADD error at 110111100001" severity error;

wait for waitTime;
sA_s <= "110111100001";
wait for 1ns;
assert sB_s = "110111100010" 
	report "ADD error at 110111100010" severity error;

wait for waitTime;
sA_s <= "110111100010";
wait for 1ns;
assert sB_s = "110111100011" 
	report "ADD error at 110111100011" severity error;

wait for waitTime;
sA_s <= "110111100011";
wait for 1ns;
assert sB_s = "110111100100" 
	report "ADD error at 110111100100" severity error;

wait for waitTime;
sA_s <= "110111100100";
wait for 1ns;
assert sB_s = "110111100101" 
	report "ADD error at 110111100101" severity error;

wait for waitTime;
sA_s <= "110111100101";
wait for 1ns;
assert sB_s = "110111100110" 
	report "ADD error at 110111100110" severity error;

wait for waitTime;
sA_s <= "110111100110";
wait for 1ns;
assert sB_s = "110111100111" 
	report "ADD error at 110111100111" severity error;

wait for waitTime;
sA_s <= "110111100111";
wait for 1ns;
assert sB_s = "110111101000" 
	report "ADD error at 110111101000" severity error;

wait for waitTime;
sA_s <= "110111101000";
wait for 1ns;
assert sB_s = "110111101001" 
	report "ADD error at 110111101001" severity error;

wait for waitTime;
sA_s <= "110111101001";
wait for 1ns;
assert sB_s = "110111101010" 
	report "ADD error at 110111101010" severity error;

wait for waitTime;
sA_s <= "110111101010";
wait for 1ns;
assert sB_s = "110111101011" 
	report "ADD error at 110111101011" severity error;

wait for waitTime;
sA_s <= "110111101011";
wait for 1ns;
assert sB_s = "110111101100" 
	report "ADD error at 110111101100" severity error;

wait for waitTime;
sA_s <= "110111101100";
wait for 1ns;
assert sB_s = "110111101101" 
	report "ADD error at 110111101101" severity error;

wait for waitTime;
sA_s <= "110111101101";
wait for 1ns;
assert sB_s = "110111101110" 
	report "ADD error at 110111101110" severity error;

wait for waitTime;
sA_s <= "110111101110";
wait for 1ns;
assert sB_s = "110111101111" 
	report "ADD error at 110111101111" severity error;

wait for waitTime;
sA_s <= "110111101111";
wait for 1ns;
assert sB_s = "110111110000" 
	report "ADD error at 110111110000" severity error;

wait for waitTime;
sA_s <= "110111110000";
wait for 1ns;
assert sB_s = "110111110001" 
	report "ADD error at 110111110001" severity error;

wait for waitTime;
sA_s <= "110111110001";
wait for 1ns;
assert sB_s = "110111110010" 
	report "ADD error at 110111110010" severity error;

wait for waitTime;
sA_s <= "110111110010";
wait for 1ns;
assert sB_s = "110111110011" 
	report "ADD error at 110111110011" severity error;

wait for waitTime;
sA_s <= "110111110011";
wait for 1ns;
assert sB_s = "110111110100" 
	report "ADD error at 110111110100" severity error;

wait for waitTime;
sA_s <= "110111110100";
wait for 1ns;
assert sB_s = "110111110101" 
	report "ADD error at 110111110101" severity error;

wait for waitTime;
sA_s <= "110111110101";
wait for 1ns;
assert sB_s = "110111110110" 
	report "ADD error at 110111110110" severity error;

wait for waitTime;
sA_s <= "110111110110";
wait for 1ns;
assert sB_s = "110111110111" 
	report "ADD error at 110111110111" severity error;

wait for waitTime;
sA_s <= "110111110111";
wait for 1ns;
assert sB_s = "110111111000" 
	report "ADD error at 110111111000" severity error;

wait for waitTime;
sA_s <= "110111111000";
wait for 1ns;
assert sB_s = "110111111001" 
	report "ADD error at 110111111001" severity error;

wait for waitTime;
sA_s <= "110111111001";
wait for 1ns;
assert sB_s = "110111111010" 
	report "ADD error at 110111111010" severity error;

wait for waitTime;
sA_s <= "110111111010";
wait for 1ns;
assert sB_s = "110111111011" 
	report "ADD error at 110111111011" severity error;

wait for waitTime;
sA_s <= "110111111011";
wait for 1ns;
assert sB_s = "110111111100" 
	report "ADD error at 110111111100" severity error;

wait for waitTime;
sA_s <= "110111111100";
wait for 1ns;
assert sB_s = "110111111101" 
	report "ADD error at 110111111101" severity error;

wait for waitTime;
sA_s <= "110111111101";
wait for 1ns;
assert sB_s = "110111111110" 
	report "ADD error at 110111111110" severity error;

wait for waitTime;
sA_s <= "110111111110";
wait for 1ns;
assert sB_s = "110111111111" 
	report "ADD error at 110111111111" severity error;

wait for waitTime;
sA_s <= "110111111111";
wait for 1ns;
assert sB_s = "111000000000" 
	report "ADD error at 111000000000" severity error;

wait for waitTime;
sA_s <= "111000000000";
wait for 1ns;
assert sB_s = "111000000001" 
	report "ADD error at 111000000001" severity error;

wait for waitTime;
sA_s <= "111000000001";
wait for 1ns;
assert sB_s = "111000000010" 
	report "ADD error at 111000000010" severity error;

wait for waitTime;
sA_s <= "111000000010";
wait for 1ns;
assert sB_s = "111000000011" 
	report "ADD error at 111000000011" severity error;

wait for waitTime;
sA_s <= "111000000011";
wait for 1ns;
assert sB_s = "111000000100" 
	report "ADD error at 111000000100" severity error;

wait for waitTime;
sA_s <= "111000000100";
wait for 1ns;
assert sB_s = "111000000101" 
	report "ADD error at 111000000101" severity error;

wait for waitTime;
sA_s <= "111000000101";
wait for 1ns;
assert sB_s = "111000000110" 
	report "ADD error at 111000000110" severity error;

wait for waitTime;
sA_s <= "111000000110";
wait for 1ns;
assert sB_s = "111000000111" 
	report "ADD error at 111000000111" severity error;

wait for waitTime;
sA_s <= "111000000111";
wait for 1ns;
assert sB_s = "111000001000" 
	report "ADD error at 111000001000" severity error;

wait for waitTime;
sA_s <= "111000001000";
wait for 1ns;
assert sB_s = "111000001001" 
	report "ADD error at 111000001001" severity error;

wait for waitTime;
sA_s <= "111000001001";
wait for 1ns;
assert sB_s = "111000001010" 
	report "ADD error at 111000001010" severity error;

wait for waitTime;
sA_s <= "111000001010";
wait for 1ns;
assert sB_s = "111000001011" 
	report "ADD error at 111000001011" severity error;

wait for waitTime;
sA_s <= "111000001011";
wait for 1ns;
assert sB_s = "111000001100" 
	report "ADD error at 111000001100" severity error;

wait for waitTime;
sA_s <= "111000001100";
wait for 1ns;
assert sB_s = "111000001101" 
	report "ADD error at 111000001101" severity error;

wait for waitTime;
sA_s <= "111000001101";
wait for 1ns;
assert sB_s = "111000001110" 
	report "ADD error at 111000001110" severity error;

wait for waitTime;
sA_s <= "111000001110";
wait for 1ns;
assert sB_s = "111000001111" 
	report "ADD error at 111000001111" severity error;

wait for waitTime;
sA_s <= "111000001111";
wait for 1ns;
assert sB_s = "111000010000" 
	report "ADD error at 111000010000" severity error;

wait for waitTime;
sA_s <= "111000010000";
wait for 1ns;
assert sB_s = "111000010001" 
	report "ADD error at 111000010001" severity error;

wait for waitTime;
sA_s <= "111000010001";
wait for 1ns;
assert sB_s = "111000010010" 
	report "ADD error at 111000010010" severity error;

wait for waitTime;
sA_s <= "111000010010";
wait for 1ns;
assert sB_s = "111000010011" 
	report "ADD error at 111000010011" severity error;

wait for waitTime;
sA_s <= "111000010011";
wait for 1ns;
assert sB_s = "111000010100" 
	report "ADD error at 111000010100" severity error;

wait for waitTime;
sA_s <= "111000010100";
wait for 1ns;
assert sB_s = "111000010101" 
	report "ADD error at 111000010101" severity error;

wait for waitTime;
sA_s <= "111000010101";
wait for 1ns;
assert sB_s = "111000010110" 
	report "ADD error at 111000010110" severity error;

wait for waitTime;
sA_s <= "111000010110";
wait for 1ns;
assert sB_s = "111000010111" 
	report "ADD error at 111000010111" severity error;

wait for waitTime;
sA_s <= "111000010111";
wait for 1ns;
assert sB_s = "111000011000" 
	report "ADD error at 111000011000" severity error;

wait for waitTime;
sA_s <= "111000011000";
wait for 1ns;
assert sB_s = "111000011001" 
	report "ADD error at 111000011001" severity error;

wait for waitTime;
sA_s <= "111000011001";
wait for 1ns;
assert sB_s = "111000011010" 
	report "ADD error at 111000011010" severity error;

wait for waitTime;
sA_s <= "111000011010";
wait for 1ns;
assert sB_s = "111000011011" 
	report "ADD error at 111000011011" severity error;

wait for waitTime;
sA_s <= "111000011011";
wait for 1ns;
assert sB_s = "111000011100" 
	report "ADD error at 111000011100" severity error;

wait for waitTime;
sA_s <= "111000011100";
wait for 1ns;
assert sB_s = "111000011101" 
	report "ADD error at 111000011101" severity error;

wait for waitTime;
sA_s <= "111000011101";
wait for 1ns;
assert sB_s = "111000011110" 
	report "ADD error at 111000011110" severity error;

wait for waitTime;
sA_s <= "111000011110";
wait for 1ns;
assert sB_s = "111000011111" 
	report "ADD error at 111000011111" severity error;

wait for waitTime;
sA_s <= "111000011111";
wait for 1ns;
assert sB_s = "111000100000" 
	report "ADD error at 111000100000" severity error;

wait for waitTime;
sA_s <= "111000100000";
wait for 1ns;
assert sB_s = "111000100001" 
	report "ADD error at 111000100001" severity error;

wait for waitTime;
sA_s <= "111000100001";
wait for 1ns;
assert sB_s = "111000100010" 
	report "ADD error at 111000100010" severity error;

wait for waitTime;
sA_s <= "111000100010";
wait for 1ns;
assert sB_s = "111000100011" 
	report "ADD error at 111000100011" severity error;

wait for waitTime;
sA_s <= "111000100011";
wait for 1ns;
assert sB_s = "111000100100" 
	report "ADD error at 111000100100" severity error;

wait for waitTime;
sA_s <= "111000100100";
wait for 1ns;
assert sB_s = "111000100101" 
	report "ADD error at 111000100101" severity error;

wait for waitTime;
sA_s <= "111000100101";
wait for 1ns;
assert sB_s = "111000100110" 
	report "ADD error at 111000100110" severity error;

wait for waitTime;
sA_s <= "111000100110";
wait for 1ns;
assert sB_s = "111000100111" 
	report "ADD error at 111000100111" severity error;

wait for waitTime;
sA_s <= "111000100111";
wait for 1ns;
assert sB_s = "111000101000" 
	report "ADD error at 111000101000" severity error;

wait for waitTime;
sA_s <= "111000101000";
wait for 1ns;
assert sB_s = "111000101001" 
	report "ADD error at 111000101001" severity error;

wait for waitTime;
sA_s <= "111000101001";
wait for 1ns;
assert sB_s = "111000101010" 
	report "ADD error at 111000101010" severity error;

wait for waitTime;
sA_s <= "111000101010";
wait for 1ns;
assert sB_s = "111000101011" 
	report "ADD error at 111000101011" severity error;

wait for waitTime;
sA_s <= "111000101011";
wait for 1ns;
assert sB_s = "111000101100" 
	report "ADD error at 111000101100" severity error;

wait for waitTime;
sA_s <= "111000101100";
wait for 1ns;
assert sB_s = "111000101101" 
	report "ADD error at 111000101101" severity error;

wait for waitTime;
sA_s <= "111000101101";
wait for 1ns;
assert sB_s = "111000101110" 
	report "ADD error at 111000101110" severity error;

wait for waitTime;
sA_s <= "111000101110";
wait for 1ns;
assert sB_s = "111000101111" 
	report "ADD error at 111000101111" severity error;

wait for waitTime;
sA_s <= "111000101111";
wait for 1ns;
assert sB_s = "111000110000" 
	report "ADD error at 111000110000" severity error;

wait for waitTime;
sA_s <= "111000110000";
wait for 1ns;
assert sB_s = "111000110001" 
	report "ADD error at 111000110001" severity error;

wait for waitTime;
sA_s <= "111000110001";
wait for 1ns;
assert sB_s = "111000110010" 
	report "ADD error at 111000110010" severity error;

wait for waitTime;
sA_s <= "111000110010";
wait for 1ns;
assert sB_s = "111000110011" 
	report "ADD error at 111000110011" severity error;

wait for waitTime;
sA_s <= "111000110011";
wait for 1ns;
assert sB_s = "111000110100" 
	report "ADD error at 111000110100" severity error;

wait for waitTime;
sA_s <= "111000110100";
wait for 1ns;
assert sB_s = "111000110101" 
	report "ADD error at 111000110101" severity error;

wait for waitTime;
sA_s <= "111000110101";
wait for 1ns;
assert sB_s = "111000110110" 
	report "ADD error at 111000110110" severity error;

wait for waitTime;
sA_s <= "111000110110";
wait for 1ns;
assert sB_s = "111000110111" 
	report "ADD error at 111000110111" severity error;

wait for waitTime;
sA_s <= "111000110111";
wait for 1ns;
assert sB_s = "111000111000" 
	report "ADD error at 111000111000" severity error;

wait for waitTime;
sA_s <= "111000111000";
wait for 1ns;
assert sB_s = "111000111001" 
	report "ADD error at 111000111001" severity error;

wait for waitTime;
sA_s <= "111000111001";
wait for 1ns;
assert sB_s = "111000111010" 
	report "ADD error at 111000111010" severity error;

wait for waitTime;
sA_s <= "111000111010";
wait for 1ns;
assert sB_s = "111000111011" 
	report "ADD error at 111000111011" severity error;

wait for waitTime;
sA_s <= "111000111011";
wait for 1ns;
assert sB_s = "111000111100" 
	report "ADD error at 111000111100" severity error;

wait for waitTime;
sA_s <= "111000111100";
wait for 1ns;
assert sB_s = "111000111101" 
	report "ADD error at 111000111101" severity error;

wait for waitTime;
sA_s <= "111000111101";
wait for 1ns;
assert sB_s = "111000111110" 
	report "ADD error at 111000111110" severity error;

wait for waitTime;
sA_s <= "111000111110";
wait for 1ns;
assert sB_s = "111000111111" 
	report "ADD error at 111000111111" severity error;

wait for waitTime;
sA_s <= "111000111111";
wait for 1ns;
assert sB_s = "111001000000" 
	report "ADD error at 111001000000" severity error;

wait for waitTime;
sA_s <= "111001000000";
wait for 1ns;
assert sB_s = "111001000001" 
	report "ADD error at 111001000001" severity error;

wait for waitTime;
sA_s <= "111001000001";
wait for 1ns;
assert sB_s = "111001000010" 
	report "ADD error at 111001000010" severity error;

wait for waitTime;
sA_s <= "111001000010";
wait for 1ns;
assert sB_s = "111001000011" 
	report "ADD error at 111001000011" severity error;

wait for waitTime;
sA_s <= "111001000011";
wait for 1ns;
assert sB_s = "111001000100" 
	report "ADD error at 111001000100" severity error;

wait for waitTime;
sA_s <= "111001000100";
wait for 1ns;
assert sB_s = "111001000101" 
	report "ADD error at 111001000101" severity error;

wait for waitTime;
sA_s <= "111001000101";
wait for 1ns;
assert sB_s = "111001000110" 
	report "ADD error at 111001000110" severity error;

wait for waitTime;
sA_s <= "111001000110";
wait for 1ns;
assert sB_s = "111001000111" 
	report "ADD error at 111001000111" severity error;

wait for waitTime;
sA_s <= "111001000111";
wait for 1ns;
assert sB_s = "111001001000" 
	report "ADD error at 111001001000" severity error;

wait for waitTime;
sA_s <= "111001001000";
wait for 1ns;
assert sB_s = "111001001001" 
	report "ADD error at 111001001001" severity error;

wait for waitTime;
sA_s <= "111001001001";
wait for 1ns;
assert sB_s = "111001001010" 
	report "ADD error at 111001001010" severity error;

wait for waitTime;
sA_s <= "111001001010";
wait for 1ns;
assert sB_s = "111001001011" 
	report "ADD error at 111001001011" severity error;

wait for waitTime;
sA_s <= "111001001011";
wait for 1ns;
assert sB_s = "111001001100" 
	report "ADD error at 111001001100" severity error;

wait for waitTime;
sA_s <= "111001001100";
wait for 1ns;
assert sB_s = "111001001101" 
	report "ADD error at 111001001101" severity error;

wait for waitTime;
sA_s <= "111001001101";
wait for 1ns;
assert sB_s = "111001001110" 
	report "ADD error at 111001001110" severity error;

wait for waitTime;
sA_s <= "111001001110";
wait for 1ns;
assert sB_s = "111001001111" 
	report "ADD error at 111001001111" severity error;

wait for waitTime;
sA_s <= "111001001111";
wait for 1ns;
assert sB_s = "111001010000" 
	report "ADD error at 111001010000" severity error;

wait for waitTime;
sA_s <= "111001010000";
wait for 1ns;
assert sB_s = "111001010001" 
	report "ADD error at 111001010001" severity error;

wait for waitTime;
sA_s <= "111001010001";
wait for 1ns;
assert sB_s = "111001010010" 
	report "ADD error at 111001010010" severity error;

wait for waitTime;
sA_s <= "111001010010";
wait for 1ns;
assert sB_s = "111001010011" 
	report "ADD error at 111001010011" severity error;

wait for waitTime;
sA_s <= "111001010011";
wait for 1ns;
assert sB_s = "111001010100" 
	report "ADD error at 111001010100" severity error;

wait for waitTime;
sA_s <= "111001010100";
wait for 1ns;
assert sB_s = "111001010101" 
	report "ADD error at 111001010101" severity error;

wait for waitTime;
sA_s <= "111001010101";
wait for 1ns;
assert sB_s = "111001010110" 
	report "ADD error at 111001010110" severity error;

wait for waitTime;
sA_s <= "111001010110";
wait for 1ns;
assert sB_s = "111001010111" 
	report "ADD error at 111001010111" severity error;

wait for waitTime;
sA_s <= "111001010111";
wait for 1ns;
assert sB_s = "111001011000" 
	report "ADD error at 111001011000" severity error;

wait for waitTime;
sA_s <= "111001011000";
wait for 1ns;
assert sB_s = "111001011001" 
	report "ADD error at 111001011001" severity error;

wait for waitTime;
sA_s <= "111001011001";
wait for 1ns;
assert sB_s = "111001011010" 
	report "ADD error at 111001011010" severity error;

wait for waitTime;
sA_s <= "111001011010";
wait for 1ns;
assert sB_s = "111001011011" 
	report "ADD error at 111001011011" severity error;

wait for waitTime;
sA_s <= "111001011011";
wait for 1ns;
assert sB_s = "111001011100" 
	report "ADD error at 111001011100" severity error;

wait for waitTime;
sA_s <= "111001011100";
wait for 1ns;
assert sB_s = "111001011101" 
	report "ADD error at 111001011101" severity error;

wait for waitTime;
sA_s <= "111001011101";
wait for 1ns;
assert sB_s = "111001011110" 
	report "ADD error at 111001011110" severity error;

wait for waitTime;
sA_s <= "111001011110";
wait for 1ns;
assert sB_s = "111001011111" 
	report "ADD error at 111001011111" severity error;

wait for waitTime;
sA_s <= "111001011111";
wait for 1ns;
assert sB_s = "111001100000" 
	report "ADD error at 111001100000" severity error;

wait for waitTime;
sA_s <= "111001100000";
wait for 1ns;
assert sB_s = "111001100001" 
	report "ADD error at 111001100001" severity error;

wait for waitTime;
sA_s <= "111001100001";
wait for 1ns;
assert sB_s = "111001100010" 
	report "ADD error at 111001100010" severity error;

wait for waitTime;
sA_s <= "111001100010";
wait for 1ns;
assert sB_s = "111001100011" 
	report "ADD error at 111001100011" severity error;

wait for waitTime;
sA_s <= "111001100011";
wait for 1ns;
assert sB_s = "111001100100" 
	report "ADD error at 111001100100" severity error;

wait for waitTime;
sA_s <= "111001100100";
wait for 1ns;
assert sB_s = "111001100101" 
	report "ADD error at 111001100101" severity error;

wait for waitTime;
sA_s <= "111001100101";
wait for 1ns;
assert sB_s = "111001100110" 
	report "ADD error at 111001100110" severity error;

wait for waitTime;
sA_s <= "111001100110";
wait for 1ns;
assert sB_s = "111001100111" 
	report "ADD error at 111001100111" severity error;

wait for waitTime;
sA_s <= "111001100111";
wait for 1ns;
assert sB_s = "111001101000" 
	report "ADD error at 111001101000" severity error;

wait for waitTime;
sA_s <= "111001101000";
wait for 1ns;
assert sB_s = "111001101001" 
	report "ADD error at 111001101001" severity error;

wait for waitTime;
sA_s <= "111001101001";
wait for 1ns;
assert sB_s = "111001101010" 
	report "ADD error at 111001101010" severity error;

wait for waitTime;
sA_s <= "111001101010";
wait for 1ns;
assert sB_s = "111001101011" 
	report "ADD error at 111001101011" severity error;

wait for waitTime;
sA_s <= "111001101011";
wait for 1ns;
assert sB_s = "111001101100" 
	report "ADD error at 111001101100" severity error;

wait for waitTime;
sA_s <= "111001101100";
wait for 1ns;
assert sB_s = "111001101101" 
	report "ADD error at 111001101101" severity error;

wait for waitTime;
sA_s <= "111001101101";
wait for 1ns;
assert sB_s = "111001101110" 
	report "ADD error at 111001101110" severity error;

wait for waitTime;
sA_s <= "111001101110";
wait for 1ns;
assert sB_s = "111001101111" 
	report "ADD error at 111001101111" severity error;

wait for waitTime;
sA_s <= "111001101111";
wait for 1ns;
assert sB_s = "111001110000" 
	report "ADD error at 111001110000" severity error;

wait for waitTime;
sA_s <= "111001110000";
wait for 1ns;
assert sB_s = "111001110001" 
	report "ADD error at 111001110001" severity error;

wait for waitTime;
sA_s <= "111001110001";
wait for 1ns;
assert sB_s = "111001110010" 
	report "ADD error at 111001110010" severity error;

wait for waitTime;
sA_s <= "111001110010";
wait for 1ns;
assert sB_s = "111001110011" 
	report "ADD error at 111001110011" severity error;

wait for waitTime;
sA_s <= "111001110011";
wait for 1ns;
assert sB_s = "111001110100" 
	report "ADD error at 111001110100" severity error;

wait for waitTime;
sA_s <= "111001110100";
wait for 1ns;
assert sB_s = "111001110101" 
	report "ADD error at 111001110101" severity error;

wait for waitTime;
sA_s <= "111001110101";
wait for 1ns;
assert sB_s = "111001110110" 
	report "ADD error at 111001110110" severity error;

wait for waitTime;
sA_s <= "111001110110";
wait for 1ns;
assert sB_s = "111001110111" 
	report "ADD error at 111001110111" severity error;

wait for waitTime;
sA_s <= "111001110111";
wait for 1ns;
assert sB_s = "111001111000" 
	report "ADD error at 111001111000" severity error;

wait for waitTime;
sA_s <= "111001111000";
wait for 1ns;
assert sB_s = "111001111001" 
	report "ADD error at 111001111001" severity error;

wait for waitTime;
sA_s <= "111001111001";
wait for 1ns;
assert sB_s = "111001111010" 
	report "ADD error at 111001111010" severity error;

wait for waitTime;
sA_s <= "111001111010";
wait for 1ns;
assert sB_s = "111001111011" 
	report "ADD error at 111001111011" severity error;

wait for waitTime;
sA_s <= "111001111011";
wait for 1ns;
assert sB_s = "111001111100" 
	report "ADD error at 111001111100" severity error;

wait for waitTime;
sA_s <= "111001111100";
wait for 1ns;
assert sB_s = "111001111101" 
	report "ADD error at 111001111101" severity error;

wait for waitTime;
sA_s <= "111001111101";
wait for 1ns;
assert sB_s = "111001111110" 
	report "ADD error at 111001111110" severity error;

wait for waitTime;
sA_s <= "111001111110";
wait for 1ns;
assert sB_s = "111001111111" 
	report "ADD error at 111001111111" severity error;

wait for waitTime;
sA_s <= "111001111111";
wait for 1ns;
assert sB_s = "111010000000" 
	report "ADD error at 111010000000" severity error;

wait for waitTime;
sA_s <= "111010000000";
wait for 1ns;
assert sB_s = "111010000001" 
	report "ADD error at 111010000001" severity error;

wait for waitTime;
sA_s <= "111010000001";
wait for 1ns;
assert sB_s = "111010000010" 
	report "ADD error at 111010000010" severity error;

wait for waitTime;
sA_s <= "111010000010";
wait for 1ns;
assert sB_s = "111010000011" 
	report "ADD error at 111010000011" severity error;

wait for waitTime;
sA_s <= "111010000011";
wait for 1ns;
assert sB_s = "111010000100" 
	report "ADD error at 111010000100" severity error;

wait for waitTime;
sA_s <= "111010000100";
wait for 1ns;
assert sB_s = "111010000101" 
	report "ADD error at 111010000101" severity error;

wait for waitTime;
sA_s <= "111010000101";
wait for 1ns;
assert sB_s = "111010000110" 
	report "ADD error at 111010000110" severity error;

wait for waitTime;
sA_s <= "111010000110";
wait for 1ns;
assert sB_s = "111010000111" 
	report "ADD error at 111010000111" severity error;

wait for waitTime;
sA_s <= "111010000111";
wait for 1ns;
assert sB_s = "111010001000" 
	report "ADD error at 111010001000" severity error;

wait for waitTime;
sA_s <= "111010001000";
wait for 1ns;
assert sB_s = "111010001001" 
	report "ADD error at 111010001001" severity error;

wait for waitTime;
sA_s <= "111010001001";
wait for 1ns;
assert sB_s = "111010001010" 
	report "ADD error at 111010001010" severity error;

wait for waitTime;
sA_s <= "111010001010";
wait for 1ns;
assert sB_s = "111010001011" 
	report "ADD error at 111010001011" severity error;

wait for waitTime;
sA_s <= "111010001011";
wait for 1ns;
assert sB_s = "111010001100" 
	report "ADD error at 111010001100" severity error;

wait for waitTime;
sA_s <= "111010001100";
wait for 1ns;
assert sB_s = "111010001101" 
	report "ADD error at 111010001101" severity error;

wait for waitTime;
sA_s <= "111010001101";
wait for 1ns;
assert sB_s = "111010001110" 
	report "ADD error at 111010001110" severity error;

wait for waitTime;
sA_s <= "111010001110";
wait for 1ns;
assert sB_s = "111010001111" 
	report "ADD error at 111010001111" severity error;

wait for waitTime;
sA_s <= "111010001111";
wait for 1ns;
assert sB_s = "111010010000" 
	report "ADD error at 111010010000" severity error;

wait for waitTime;
sA_s <= "111010010000";
wait for 1ns;
assert sB_s = "111010010001" 
	report "ADD error at 111010010001" severity error;

wait for waitTime;
sA_s <= "111010010001";
wait for 1ns;
assert sB_s = "111010010010" 
	report "ADD error at 111010010010" severity error;

wait for waitTime;
sA_s <= "111010010010";
wait for 1ns;
assert sB_s = "111010010011" 
	report "ADD error at 111010010011" severity error;

wait for waitTime;
sA_s <= "111010010011";
wait for 1ns;
assert sB_s = "111010010100" 
	report "ADD error at 111010010100" severity error;

wait for waitTime;
sA_s <= "111010010100";
wait for 1ns;
assert sB_s = "111010010101" 
	report "ADD error at 111010010101" severity error;

wait for waitTime;
sA_s <= "111010010101";
wait for 1ns;
assert sB_s = "111010010110" 
	report "ADD error at 111010010110" severity error;

wait for waitTime;
sA_s <= "111010010110";
wait for 1ns;
assert sB_s = "111010010111" 
	report "ADD error at 111010010111" severity error;

wait for waitTime;
sA_s <= "111010010111";
wait for 1ns;
assert sB_s = "111010011000" 
	report "ADD error at 111010011000" severity error;

wait for waitTime;
sA_s <= "111010011000";
wait for 1ns;
assert sB_s = "111010011001" 
	report "ADD error at 111010011001" severity error;

wait for waitTime;
sA_s <= "111010011001";
wait for 1ns;
assert sB_s = "111010011010" 
	report "ADD error at 111010011010" severity error;

wait for waitTime;
sA_s <= "111010011010";
wait for 1ns;
assert sB_s = "111010011011" 
	report "ADD error at 111010011011" severity error;

wait for waitTime;
sA_s <= "111010011011";
wait for 1ns;
assert sB_s = "111010011100" 
	report "ADD error at 111010011100" severity error;

wait for waitTime;
sA_s <= "111010011100";
wait for 1ns;
assert sB_s = "111010011101" 
	report "ADD error at 111010011101" severity error;

wait for waitTime;
sA_s <= "111010011101";
wait for 1ns;
assert sB_s = "111010011110" 
	report "ADD error at 111010011110" severity error;

wait for waitTime;
sA_s <= "111010011110";
wait for 1ns;
assert sB_s = "111010011111" 
	report "ADD error at 111010011111" severity error;

wait for waitTime;
sA_s <= "111010011111";
wait for 1ns;
assert sB_s = "111010100000" 
	report "ADD error at 111010100000" severity error;

wait for waitTime;
sA_s <= "111010100000";
wait for 1ns;
assert sB_s = "111010100001" 
	report "ADD error at 111010100001" severity error;

wait for waitTime;
sA_s <= "111010100001";
wait for 1ns;
assert sB_s = "111010100010" 
	report "ADD error at 111010100010" severity error;

wait for waitTime;
sA_s <= "111010100010";
wait for 1ns;
assert sB_s = "111010100011" 
	report "ADD error at 111010100011" severity error;

wait for waitTime;
sA_s <= "111010100011";
wait for 1ns;
assert sB_s = "111010100100" 
	report "ADD error at 111010100100" severity error;

wait for waitTime;
sA_s <= "111010100100";
wait for 1ns;
assert sB_s = "111010100101" 
	report "ADD error at 111010100101" severity error;

wait for waitTime;
sA_s <= "111010100101";
wait for 1ns;
assert sB_s = "111010100110" 
	report "ADD error at 111010100110" severity error;

wait for waitTime;
sA_s <= "111010100110";
wait for 1ns;
assert sB_s = "111010100111" 
	report "ADD error at 111010100111" severity error;

wait for waitTime;
sA_s <= "111010100111";
wait for 1ns;
assert sB_s = "111010101000" 
	report "ADD error at 111010101000" severity error;

wait for waitTime;
sA_s <= "111010101000";
wait for 1ns;
assert sB_s = "111010101001" 
	report "ADD error at 111010101001" severity error;

wait for waitTime;
sA_s <= "111010101001";
wait for 1ns;
assert sB_s = "111010101010" 
	report "ADD error at 111010101010" severity error;

wait for waitTime;
sA_s <= "111010101010";
wait for 1ns;
assert sB_s = "111010101011" 
	report "ADD error at 111010101011" severity error;

wait for waitTime;
sA_s <= "111010101011";
wait for 1ns;
assert sB_s = "111010101100" 
	report "ADD error at 111010101100" severity error;

wait for waitTime;
sA_s <= "111010101100";
wait for 1ns;
assert sB_s = "111010101101" 
	report "ADD error at 111010101101" severity error;

wait for waitTime;
sA_s <= "111010101101";
wait for 1ns;
assert sB_s = "111010101110" 
	report "ADD error at 111010101110" severity error;

wait for waitTime;
sA_s <= "111010101110";
wait for 1ns;
assert sB_s = "111010101111" 
	report "ADD error at 111010101111" severity error;

wait for waitTime;
sA_s <= "111010101111";
wait for 1ns;
assert sB_s = "111010110000" 
	report "ADD error at 111010110000" severity error;

wait for waitTime;
sA_s <= "111010110000";
wait for 1ns;
assert sB_s = "111010110001" 
	report "ADD error at 111010110001" severity error;

wait for waitTime;
sA_s <= "111010110001";
wait for 1ns;
assert sB_s = "111010110010" 
	report "ADD error at 111010110010" severity error;

wait for waitTime;
sA_s <= "111010110010";
wait for 1ns;
assert sB_s = "111010110011" 
	report "ADD error at 111010110011" severity error;

wait for waitTime;
sA_s <= "111010110011";
wait for 1ns;
assert sB_s = "111010110100" 
	report "ADD error at 111010110100" severity error;

wait for waitTime;
sA_s <= "111010110100";
wait for 1ns;
assert sB_s = "111010110101" 
	report "ADD error at 111010110101" severity error;

wait for waitTime;
sA_s <= "111010110101";
wait for 1ns;
assert sB_s = "111010110110" 
	report "ADD error at 111010110110" severity error;

wait for waitTime;
sA_s <= "111010110110";
wait for 1ns;
assert sB_s = "111010110111" 
	report "ADD error at 111010110111" severity error;

wait for waitTime;
sA_s <= "111010110111";
wait for 1ns;
assert sB_s = "111010111000" 
	report "ADD error at 111010111000" severity error;

wait for waitTime;
sA_s <= "111010111000";
wait for 1ns;
assert sB_s = "111010111001" 
	report "ADD error at 111010111001" severity error;

wait for waitTime;
sA_s <= "111010111001";
wait for 1ns;
assert sB_s = "111010111010" 
	report "ADD error at 111010111010" severity error;

wait for waitTime;
sA_s <= "111010111010";
wait for 1ns;
assert sB_s = "111010111011" 
	report "ADD error at 111010111011" severity error;

wait for waitTime;
sA_s <= "111010111011";
wait for 1ns;
assert sB_s = "111010111100" 
	report "ADD error at 111010111100" severity error;

wait for waitTime;
sA_s <= "111010111100";
wait for 1ns;
assert sB_s = "111010111101" 
	report "ADD error at 111010111101" severity error;

wait for waitTime;
sA_s <= "111010111101";
wait for 1ns;
assert sB_s = "111010111110" 
	report "ADD error at 111010111110" severity error;

wait for waitTime;
sA_s <= "111010111110";
wait for 1ns;
assert sB_s = "111010111111" 
	report "ADD error at 111010111111" severity error;

wait for waitTime;
sA_s <= "111010111111";
wait for 1ns;
assert sB_s = "111011000000" 
	report "ADD error at 111011000000" severity error;

wait for waitTime;
sA_s <= "111011000000";
wait for 1ns;
assert sB_s = "111011000001" 
	report "ADD error at 111011000001" severity error;

wait for waitTime;
sA_s <= "111011000001";
wait for 1ns;
assert sB_s = "111011000010" 
	report "ADD error at 111011000010" severity error;

wait for waitTime;
sA_s <= "111011000010";
wait for 1ns;
assert sB_s = "111011000011" 
	report "ADD error at 111011000011" severity error;

wait for waitTime;
sA_s <= "111011000011";
wait for 1ns;
assert sB_s = "111011000100" 
	report "ADD error at 111011000100" severity error;

wait for waitTime;
sA_s <= "111011000100";
wait for 1ns;
assert sB_s = "111011000101" 
	report "ADD error at 111011000101" severity error;

wait for waitTime;
sA_s <= "111011000101";
wait for 1ns;
assert sB_s = "111011000110" 
	report "ADD error at 111011000110" severity error;

wait for waitTime;
sA_s <= "111011000110";
wait for 1ns;
assert sB_s = "111011000111" 
	report "ADD error at 111011000111" severity error;

wait for waitTime;
sA_s <= "111011000111";
wait for 1ns;
assert sB_s = "111011001000" 
	report "ADD error at 111011001000" severity error;

wait for waitTime;
sA_s <= "111011001000";
wait for 1ns;
assert sB_s = "111011001001" 
	report "ADD error at 111011001001" severity error;

wait for waitTime;
sA_s <= "111011001001";
wait for 1ns;
assert sB_s = "111011001010" 
	report "ADD error at 111011001010" severity error;

wait for waitTime;
sA_s <= "111011001010";
wait for 1ns;
assert sB_s = "111011001011" 
	report "ADD error at 111011001011" severity error;

wait for waitTime;
sA_s <= "111011001011";
wait for 1ns;
assert sB_s = "111011001100" 
	report "ADD error at 111011001100" severity error;

wait for waitTime;
sA_s <= "111011001100";
wait for 1ns;
assert sB_s = "111011001101" 
	report "ADD error at 111011001101" severity error;

wait for waitTime;
sA_s <= "111011001101";
wait for 1ns;
assert sB_s = "111011001110" 
	report "ADD error at 111011001110" severity error;

wait for waitTime;
sA_s <= "111011001110";
wait for 1ns;
assert sB_s = "111011001111" 
	report "ADD error at 111011001111" severity error;

wait for waitTime;
sA_s <= "111011001111";
wait for 1ns;
assert sB_s = "111011010000" 
	report "ADD error at 111011010000" severity error;

wait for waitTime;
sA_s <= "111011010000";
wait for 1ns;
assert sB_s = "111011010001" 
	report "ADD error at 111011010001" severity error;

wait for waitTime;
sA_s <= "111011010001";
wait for 1ns;
assert sB_s = "111011010010" 
	report "ADD error at 111011010010" severity error;

wait for waitTime;
sA_s <= "111011010010";
wait for 1ns;
assert sB_s = "111011010011" 
	report "ADD error at 111011010011" severity error;

wait for waitTime;
sA_s <= "111011010011";
wait for 1ns;
assert sB_s = "111011010100" 
	report "ADD error at 111011010100" severity error;

wait for waitTime;
sA_s <= "111011010100";
wait for 1ns;
assert sB_s = "111011010101" 
	report "ADD error at 111011010101" severity error;

wait for waitTime;
sA_s <= "111011010101";
wait for 1ns;
assert sB_s = "111011010110" 
	report "ADD error at 111011010110" severity error;

wait for waitTime;
sA_s <= "111011010110";
wait for 1ns;
assert sB_s = "111011010111" 
	report "ADD error at 111011010111" severity error;

wait for waitTime;
sA_s <= "111011010111";
wait for 1ns;
assert sB_s = "111011011000" 
	report "ADD error at 111011011000" severity error;

wait for waitTime;
sA_s <= "111011011000";
wait for 1ns;
assert sB_s = "111011011001" 
	report "ADD error at 111011011001" severity error;

wait for waitTime;
sA_s <= "111011011001";
wait for 1ns;
assert sB_s = "111011011010" 
	report "ADD error at 111011011010" severity error;

wait for waitTime;
sA_s <= "111011011010";
wait for 1ns;
assert sB_s = "111011011011" 
	report "ADD error at 111011011011" severity error;

wait for waitTime;
sA_s <= "111011011011";
wait for 1ns;
assert sB_s = "111011011100" 
	report "ADD error at 111011011100" severity error;

wait for waitTime;
sA_s <= "111011011100";
wait for 1ns;
assert sB_s = "111011011101" 
	report "ADD error at 111011011101" severity error;

wait for waitTime;
sA_s <= "111011011101";
wait for 1ns;
assert sB_s = "111011011110" 
	report "ADD error at 111011011110" severity error;

wait for waitTime;
sA_s <= "111011011110";
wait for 1ns;
assert sB_s = "111011011111" 
	report "ADD error at 111011011111" severity error;

wait for waitTime;
sA_s <= "111011011111";
wait for 1ns;
assert sB_s = "111011100000" 
	report "ADD error at 111011100000" severity error;

wait for waitTime;
sA_s <= "111011100000";
wait for 1ns;
assert sB_s = "111011100001" 
	report "ADD error at 111011100001" severity error;

wait for waitTime;
sA_s <= "111011100001";
wait for 1ns;
assert sB_s = "111011100010" 
	report "ADD error at 111011100010" severity error;

wait for waitTime;
sA_s <= "111011100010";
wait for 1ns;
assert sB_s = "111011100011" 
	report "ADD error at 111011100011" severity error;

wait for waitTime;
sA_s <= "111011100011";
wait for 1ns;
assert sB_s = "111011100100" 
	report "ADD error at 111011100100" severity error;

wait for waitTime;
sA_s <= "111011100100";
wait for 1ns;
assert sB_s = "111011100101" 
	report "ADD error at 111011100101" severity error;

wait for waitTime;
sA_s <= "111011100101";
wait for 1ns;
assert sB_s = "111011100110" 
	report "ADD error at 111011100110" severity error;

wait for waitTime;
sA_s <= "111011100110";
wait for 1ns;
assert sB_s = "111011100111" 
	report "ADD error at 111011100111" severity error;

wait for waitTime;
sA_s <= "111011100111";
wait for 1ns;
assert sB_s = "111011101000" 
	report "ADD error at 111011101000" severity error;

wait for waitTime;
sA_s <= "111011101000";
wait for 1ns;
assert sB_s = "111011101001" 
	report "ADD error at 111011101001" severity error;

wait for waitTime;
sA_s <= "111011101001";
wait for 1ns;
assert sB_s = "111011101010" 
	report "ADD error at 111011101010" severity error;

wait for waitTime;
sA_s <= "111011101010";
wait for 1ns;
assert sB_s = "111011101011" 
	report "ADD error at 111011101011" severity error;

wait for waitTime;
sA_s <= "111011101011";
wait for 1ns;
assert sB_s = "111011101100" 
	report "ADD error at 111011101100" severity error;

wait for waitTime;
sA_s <= "111011101100";
wait for 1ns;
assert sB_s = "111011101101" 
	report "ADD error at 111011101101" severity error;

wait for waitTime;
sA_s <= "111011101101";
wait for 1ns;
assert sB_s = "111011101110" 
	report "ADD error at 111011101110" severity error;

wait for waitTime;
sA_s <= "111011101110";
wait for 1ns;
assert sB_s = "111011101111" 
	report "ADD error at 111011101111" severity error;

wait for waitTime;
sA_s <= "111011101111";
wait for 1ns;
assert sB_s = "111011110000" 
	report "ADD error at 111011110000" severity error;

wait for waitTime;
sA_s <= "111011110000";
wait for 1ns;
assert sB_s = "111011110001" 
	report "ADD error at 111011110001" severity error;

wait for waitTime;
sA_s <= "111011110001";
wait for 1ns;
assert sB_s = "111011110010" 
	report "ADD error at 111011110010" severity error;

wait for waitTime;
sA_s <= "111011110010";
wait for 1ns;
assert sB_s = "111011110011" 
	report "ADD error at 111011110011" severity error;

wait for waitTime;
sA_s <= "111011110011";
wait for 1ns;
assert sB_s = "111011110100" 
	report "ADD error at 111011110100" severity error;

wait for waitTime;
sA_s <= "111011110100";
wait for 1ns;
assert sB_s = "111011110101" 
	report "ADD error at 111011110101" severity error;

wait for waitTime;
sA_s <= "111011110101";
wait for 1ns;
assert sB_s = "111011110110" 
	report "ADD error at 111011110110" severity error;

wait for waitTime;
sA_s <= "111011110110";
wait for 1ns;
assert sB_s = "111011110111" 
	report "ADD error at 111011110111" severity error;

wait for waitTime;
sA_s <= "111011110111";
wait for 1ns;
assert sB_s = "111011111000" 
	report "ADD error at 111011111000" severity error;

wait for waitTime;
sA_s <= "111011111000";
wait for 1ns;
assert sB_s = "111011111001" 
	report "ADD error at 111011111001" severity error;

wait for waitTime;
sA_s <= "111011111001";
wait for 1ns;
assert sB_s = "111011111010" 
	report "ADD error at 111011111010" severity error;

wait for waitTime;
sA_s <= "111011111010";
wait for 1ns;
assert sB_s = "111011111011" 
	report "ADD error at 111011111011" severity error;

wait for waitTime;
sA_s <= "111011111011";
wait for 1ns;
assert sB_s = "111011111100" 
	report "ADD error at 111011111100" severity error;

wait for waitTime;
sA_s <= "111011111100";
wait for 1ns;
assert sB_s = "111011111101" 
	report "ADD error at 111011111101" severity error;

wait for waitTime;
sA_s <= "111011111101";
wait for 1ns;
assert sB_s = "111011111110" 
	report "ADD error at 111011111110" severity error;

wait for waitTime;
sA_s <= "111011111110";
wait for 1ns;
assert sB_s = "111011111111" 
	report "ADD error at 111011111111" severity error;

wait for waitTime;
sA_s <= "111011111111";
wait for 1ns;
assert sB_s = "111100000000" 
	report "ADD error at 111100000000" severity error;

wait for waitTime;
sA_s <= "111100000000";
wait for 1ns;
assert sB_s = "111100000001" 
	report "ADD error at 111100000001" severity error;

wait for waitTime;
sA_s <= "111100000001";
wait for 1ns;
assert sB_s = "111100000010" 
	report "ADD error at 111100000010" severity error;

wait for waitTime;
sA_s <= "111100000010";
wait for 1ns;
assert sB_s = "111100000011" 
	report "ADD error at 111100000011" severity error;

wait for waitTime;
sA_s <= "111100000011";
wait for 1ns;
assert sB_s = "111100000100" 
	report "ADD error at 111100000100" severity error;

wait for waitTime;
sA_s <= "111100000100";
wait for 1ns;
assert sB_s = "111100000101" 
	report "ADD error at 111100000101" severity error;

wait for waitTime;
sA_s <= "111100000101";
wait for 1ns;
assert sB_s = "111100000110" 
	report "ADD error at 111100000110" severity error;

wait for waitTime;
sA_s <= "111100000110";
wait for 1ns;
assert sB_s = "111100000111" 
	report "ADD error at 111100000111" severity error;

wait for waitTime;
sA_s <= "111100000111";
wait for 1ns;
assert sB_s = "111100001000" 
	report "ADD error at 111100001000" severity error;

wait for waitTime;
sA_s <= "111100001000";
wait for 1ns;
assert sB_s = "111100001001" 
	report "ADD error at 111100001001" severity error;

wait for waitTime;
sA_s <= "111100001001";
wait for 1ns;
assert sB_s = "111100001010" 
	report "ADD error at 111100001010" severity error;

wait for waitTime;
sA_s <= "111100001010";
wait for 1ns;
assert sB_s = "111100001011" 
	report "ADD error at 111100001011" severity error;

wait for waitTime;
sA_s <= "111100001011";
wait for 1ns;
assert sB_s = "111100001100" 
	report "ADD error at 111100001100" severity error;

wait for waitTime;
sA_s <= "111100001100";
wait for 1ns;
assert sB_s = "111100001101" 
	report "ADD error at 111100001101" severity error;

wait for waitTime;
sA_s <= "111100001101";
wait for 1ns;
assert sB_s = "111100001110" 
	report "ADD error at 111100001110" severity error;

wait for waitTime;
sA_s <= "111100001110";
wait for 1ns;
assert sB_s = "111100001111" 
	report "ADD error at 111100001111" severity error;

wait for waitTime;
sA_s <= "111100001111";
wait for 1ns;
assert sB_s = "111100010000" 
	report "ADD error at 111100010000" severity error;

wait for waitTime;
sA_s <= "111100010000";
wait for 1ns;
assert sB_s = "111100010001" 
	report "ADD error at 111100010001" severity error;

wait for waitTime;
sA_s <= "111100010001";
wait for 1ns;
assert sB_s = "111100010010" 
	report "ADD error at 111100010010" severity error;

wait for waitTime;
sA_s <= "111100010010";
wait for 1ns;
assert sB_s = "111100010011" 
	report "ADD error at 111100010011" severity error;

wait for waitTime;
sA_s <= "111100010011";
wait for 1ns;
assert sB_s = "111100010100" 
	report "ADD error at 111100010100" severity error;

wait for waitTime;
sA_s <= "111100010100";
wait for 1ns;
assert sB_s = "111100010101" 
	report "ADD error at 111100010101" severity error;

wait for waitTime;
sA_s <= "111100010101";
wait for 1ns;
assert sB_s = "111100010110" 
	report "ADD error at 111100010110" severity error;

wait for waitTime;
sA_s <= "111100010110";
wait for 1ns;
assert sB_s = "111100010111" 
	report "ADD error at 111100010111" severity error;

wait for waitTime;
sA_s <= "111100010111";
wait for 1ns;
assert sB_s = "111100011000" 
	report "ADD error at 111100011000" severity error;

wait for waitTime;
sA_s <= "111100011000";
wait for 1ns;
assert sB_s = "111100011001" 
	report "ADD error at 111100011001" severity error;

wait for waitTime;
sA_s <= "111100011001";
wait for 1ns;
assert sB_s = "111100011010" 
	report "ADD error at 111100011010" severity error;

wait for waitTime;
sA_s <= "111100011010";
wait for 1ns;
assert sB_s = "111100011011" 
	report "ADD error at 111100011011" severity error;

wait for waitTime;
sA_s <= "111100011011";
wait for 1ns;
assert sB_s = "111100011100" 
	report "ADD error at 111100011100" severity error;

wait for waitTime;
sA_s <= "111100011100";
wait for 1ns;
assert sB_s = "111100011101" 
	report "ADD error at 111100011101" severity error;

wait for waitTime;
sA_s <= "111100011101";
wait for 1ns;
assert sB_s = "111100011110" 
	report "ADD error at 111100011110" severity error;

wait for waitTime;
sA_s <= "111100011110";
wait for 1ns;
assert sB_s = "111100011111" 
	report "ADD error at 111100011111" severity error;

wait for waitTime;
sA_s <= "111100011111";
wait for 1ns;
assert sB_s = "111100100000" 
	report "ADD error at 111100100000" severity error;

wait for waitTime;
sA_s <= "111100100000";
wait for 1ns;
assert sB_s = "111100100001" 
	report "ADD error at 111100100001" severity error;

wait for waitTime;
sA_s <= "111100100001";
wait for 1ns;
assert sB_s = "111100100010" 
	report "ADD error at 111100100010" severity error;

wait for waitTime;
sA_s <= "111100100010";
wait for 1ns;
assert sB_s = "111100100011" 
	report "ADD error at 111100100011" severity error;

wait for waitTime;
sA_s <= "111100100011";
wait for 1ns;
assert sB_s = "111100100100" 
	report "ADD error at 111100100100" severity error;

wait for waitTime;
sA_s <= "111100100100";
wait for 1ns;
assert sB_s = "111100100101" 
	report "ADD error at 111100100101" severity error;

wait for waitTime;
sA_s <= "111100100101";
wait for 1ns;
assert sB_s = "111100100110" 
	report "ADD error at 111100100110" severity error;

wait for waitTime;
sA_s <= "111100100110";
wait for 1ns;
assert sB_s = "111100100111" 
	report "ADD error at 111100100111" severity error;

wait for waitTime;
sA_s <= "111100100111";
wait for 1ns;
assert sB_s = "111100101000" 
	report "ADD error at 111100101000" severity error;

wait for waitTime;
sA_s <= "111100101000";
wait for 1ns;
assert sB_s = "111100101001" 
	report "ADD error at 111100101001" severity error;

wait for waitTime;
sA_s <= "111100101001";
wait for 1ns;
assert sB_s = "111100101010" 
	report "ADD error at 111100101010" severity error;

wait for waitTime;
sA_s <= "111100101010";
wait for 1ns;
assert sB_s = "111100101011" 
	report "ADD error at 111100101011" severity error;

wait for waitTime;
sA_s <= "111100101011";
wait for 1ns;
assert sB_s = "111100101100" 
	report "ADD error at 111100101100" severity error;

wait for waitTime;
sA_s <= "111100101100";
wait for 1ns;
assert sB_s = "111100101101" 
	report "ADD error at 111100101101" severity error;

wait for waitTime;
sA_s <= "111100101101";
wait for 1ns;
assert sB_s = "111100101110" 
	report "ADD error at 111100101110" severity error;

wait for waitTime;
sA_s <= "111100101110";
wait for 1ns;
assert sB_s = "111100101111" 
	report "ADD error at 111100101111" severity error;

wait for waitTime;
sA_s <= "111100101111";
wait for 1ns;
assert sB_s = "111100110000" 
	report "ADD error at 111100110000" severity error;

wait for waitTime;
sA_s <= "111100110000";
wait for 1ns;
assert sB_s = "111100110001" 
	report "ADD error at 111100110001" severity error;

wait for waitTime;
sA_s <= "111100110001";
wait for 1ns;
assert sB_s = "111100110010" 
	report "ADD error at 111100110010" severity error;

wait for waitTime;
sA_s <= "111100110010";
wait for 1ns;
assert sB_s = "111100110011" 
	report "ADD error at 111100110011" severity error;

wait for waitTime;
sA_s <= "111100110011";
wait for 1ns;
assert sB_s = "111100110100" 
	report "ADD error at 111100110100" severity error;

wait for waitTime;
sA_s <= "111100110100";
wait for 1ns;
assert sB_s = "111100110101" 
	report "ADD error at 111100110101" severity error;

wait for waitTime;
sA_s <= "111100110101";
wait for 1ns;
assert sB_s = "111100110110" 
	report "ADD error at 111100110110" severity error;

wait for waitTime;
sA_s <= "111100110110";
wait for 1ns;
assert sB_s = "111100110111" 
	report "ADD error at 111100110111" severity error;

wait for waitTime;
sA_s <= "111100110111";
wait for 1ns;
assert sB_s = "111100111000" 
	report "ADD error at 111100111000" severity error;

wait for waitTime;
sA_s <= "111100111000";
wait for 1ns;
assert sB_s = "111100111001" 
	report "ADD error at 111100111001" severity error;

wait for waitTime;
sA_s <= "111100111001";
wait for 1ns;
assert sB_s = "111100111010" 
	report "ADD error at 111100111010" severity error;

wait for waitTime;
sA_s <= "111100111010";
wait for 1ns;
assert sB_s = "111100111011" 
	report "ADD error at 111100111011" severity error;

wait for waitTime;
sA_s <= "111100111011";
wait for 1ns;
assert sB_s = "111100111100" 
	report "ADD error at 111100111100" severity error;

wait for waitTime;
sA_s <= "111100111100";
wait for 1ns;
assert sB_s = "111100111101" 
	report "ADD error at 111100111101" severity error;

wait for waitTime;
sA_s <= "111100111101";
wait for 1ns;
assert sB_s = "111100111110" 
	report "ADD error at 111100111110" severity error;

wait for waitTime;
sA_s <= "111100111110";
wait for 1ns;
assert sB_s = "111100111111" 
	report "ADD error at 111100111111" severity error;

wait for waitTime;
sA_s <= "111100111111";
wait for 1ns;
assert sB_s = "111101000000" 
	report "ADD error at 111101000000" severity error;

wait for waitTime;
sA_s <= "111101000000";
wait for 1ns;
assert sB_s = "111101000001" 
	report "ADD error at 111101000001" severity error;

wait for waitTime;
sA_s <= "111101000001";
wait for 1ns;
assert sB_s = "111101000010" 
	report "ADD error at 111101000010" severity error;

wait for waitTime;
sA_s <= "111101000010";
wait for 1ns;
assert sB_s = "111101000011" 
	report "ADD error at 111101000011" severity error;

wait for waitTime;
sA_s <= "111101000011";
wait for 1ns;
assert sB_s = "111101000100" 
	report "ADD error at 111101000100" severity error;

wait for waitTime;
sA_s <= "111101000100";
wait for 1ns;
assert sB_s = "111101000101" 
	report "ADD error at 111101000101" severity error;

wait for waitTime;
sA_s <= "111101000101";
wait for 1ns;
assert sB_s = "111101000110" 
	report "ADD error at 111101000110" severity error;

wait for waitTime;
sA_s <= "111101000110";
wait for 1ns;
assert sB_s = "111101000111" 
	report "ADD error at 111101000111" severity error;

wait for waitTime;
sA_s <= "111101000111";
wait for 1ns;
assert sB_s = "111101001000" 
	report "ADD error at 111101001000" severity error;

wait for waitTime;
sA_s <= "111101001000";
wait for 1ns;
assert sB_s = "111101001001" 
	report "ADD error at 111101001001" severity error;

wait for waitTime;
sA_s <= "111101001001";
wait for 1ns;
assert sB_s = "111101001010" 
	report "ADD error at 111101001010" severity error;

wait for waitTime;
sA_s <= "111101001010";
wait for 1ns;
assert sB_s = "111101001011" 
	report "ADD error at 111101001011" severity error;

wait for waitTime;
sA_s <= "111101001011";
wait for 1ns;
assert sB_s = "111101001100" 
	report "ADD error at 111101001100" severity error;

wait for waitTime;
sA_s <= "111101001100";
wait for 1ns;
assert sB_s = "111101001101" 
	report "ADD error at 111101001101" severity error;

wait for waitTime;
sA_s <= "111101001101";
wait for 1ns;
assert sB_s = "111101001110" 
	report "ADD error at 111101001110" severity error;

wait for waitTime;
sA_s <= "111101001110";
wait for 1ns;
assert sB_s = "111101001111" 
	report "ADD error at 111101001111" severity error;

wait for waitTime;
sA_s <= "111101001111";
wait for 1ns;
assert sB_s = "111101010000" 
	report "ADD error at 111101010000" severity error;

wait for waitTime;
sA_s <= "111101010000";
wait for 1ns;
assert sB_s = "111101010001" 
	report "ADD error at 111101010001" severity error;

wait for waitTime;
sA_s <= "111101010001";
wait for 1ns;
assert sB_s = "111101010010" 
	report "ADD error at 111101010010" severity error;

wait for waitTime;
sA_s <= "111101010010";
wait for 1ns;
assert sB_s = "111101010011" 
	report "ADD error at 111101010011" severity error;

wait for waitTime;
sA_s <= "111101010011";
wait for 1ns;
assert sB_s = "111101010100" 
	report "ADD error at 111101010100" severity error;

wait for waitTime;
sA_s <= "111101010100";
wait for 1ns;
assert sB_s = "111101010101" 
	report "ADD error at 111101010101" severity error;

wait for waitTime;
sA_s <= "111101010101";
wait for 1ns;
assert sB_s = "111101010110" 
	report "ADD error at 111101010110" severity error;

wait for waitTime;
sA_s <= "111101010110";
wait for 1ns;
assert sB_s = "111101010111" 
	report "ADD error at 111101010111" severity error;

wait for waitTime;
sA_s <= "111101010111";
wait for 1ns;
assert sB_s = "111101011000" 
	report "ADD error at 111101011000" severity error;

wait for waitTime;
sA_s <= "111101011000";
wait for 1ns;
assert sB_s = "111101011001" 
	report "ADD error at 111101011001" severity error;

wait for waitTime;
sA_s <= "111101011001";
wait for 1ns;
assert sB_s = "111101011010" 
	report "ADD error at 111101011010" severity error;

wait for waitTime;
sA_s <= "111101011010";
wait for 1ns;
assert sB_s = "111101011011" 
	report "ADD error at 111101011011" severity error;

wait for waitTime;
sA_s <= "111101011011";
wait for 1ns;
assert sB_s = "111101011100" 
	report "ADD error at 111101011100" severity error;

wait for waitTime;
sA_s <= "111101011100";
wait for 1ns;
assert sB_s = "111101011101" 
	report "ADD error at 111101011101" severity error;

wait for waitTime;
sA_s <= "111101011101";
wait for 1ns;
assert sB_s = "111101011110" 
	report "ADD error at 111101011110" severity error;

wait for waitTime;
sA_s <= "111101011110";
wait for 1ns;
assert sB_s = "111101011111" 
	report "ADD error at 111101011111" severity error;

wait for waitTime;
sA_s <= "111101011111";
wait for 1ns;
assert sB_s = "111101100000" 
	report "ADD error at 111101100000" severity error;

wait for waitTime;
sA_s <= "111101100000";
wait for 1ns;
assert sB_s = "111101100001" 
	report "ADD error at 111101100001" severity error;

wait for waitTime;
sA_s <= "111101100001";
wait for 1ns;
assert sB_s = "111101100010" 
	report "ADD error at 111101100010" severity error;

wait for waitTime;
sA_s <= "111101100010";
wait for 1ns;
assert sB_s = "111101100011" 
	report "ADD error at 111101100011" severity error;

wait for waitTime;
sA_s <= "111101100011";
wait for 1ns;
assert sB_s = "111101100100" 
	report "ADD error at 111101100100" severity error;

wait for waitTime;
sA_s <= "111101100100";
wait for 1ns;
assert sB_s = "111101100101" 
	report "ADD error at 111101100101" severity error;

wait for waitTime;
sA_s <= "111101100101";
wait for 1ns;
assert sB_s = "111101100110" 
	report "ADD error at 111101100110" severity error;

wait for waitTime;
sA_s <= "111101100110";
wait for 1ns;
assert sB_s = "111101100111" 
	report "ADD error at 111101100111" severity error;

wait for waitTime;
sA_s <= "111101100111";
wait for 1ns;
assert sB_s = "111101101000" 
	report "ADD error at 111101101000" severity error;

wait for waitTime;
sA_s <= "111101101000";
wait for 1ns;
assert sB_s = "111101101001" 
	report "ADD error at 111101101001" severity error;

wait for waitTime;
sA_s <= "111101101001";
wait for 1ns;
assert sB_s = "111101101010" 
	report "ADD error at 111101101010" severity error;

wait for waitTime;
sA_s <= "111101101010";
wait for 1ns;
assert sB_s = "111101101011" 
	report "ADD error at 111101101011" severity error;

wait for waitTime;
sA_s <= "111101101011";
wait for 1ns;
assert sB_s = "111101101100" 
	report "ADD error at 111101101100" severity error;

wait for waitTime;
sA_s <= "111101101100";
wait for 1ns;
assert sB_s = "111101101101" 
	report "ADD error at 111101101101" severity error;

wait for waitTime;
sA_s <= "111101101101";
wait for 1ns;
assert sB_s = "111101101110" 
	report "ADD error at 111101101110" severity error;

wait for waitTime;
sA_s <= "111101101110";
wait for 1ns;
assert sB_s = "111101101111" 
	report "ADD error at 111101101111" severity error;

wait for waitTime;
sA_s <= "111101101111";
wait for 1ns;
assert sB_s = "111101110000" 
	report "ADD error at 111101110000" severity error;

wait for waitTime;
sA_s <= "111101110000";
wait for 1ns;
assert sB_s = "111101110001" 
	report "ADD error at 111101110001" severity error;

wait for waitTime;
sA_s <= "111101110001";
wait for 1ns;
assert sB_s = "111101110010" 
	report "ADD error at 111101110010" severity error;

wait for waitTime;
sA_s <= "111101110010";
wait for 1ns;
assert sB_s = "111101110011" 
	report "ADD error at 111101110011" severity error;

wait for waitTime;
sA_s <= "111101110011";
wait for 1ns;
assert sB_s = "111101110100" 
	report "ADD error at 111101110100" severity error;

wait for waitTime;
sA_s <= "111101110100";
wait for 1ns;
assert sB_s = "111101110101" 
	report "ADD error at 111101110101" severity error;

wait for waitTime;
sA_s <= "111101110101";
wait for 1ns;
assert sB_s = "111101110110" 
	report "ADD error at 111101110110" severity error;

wait for waitTime;
sA_s <= "111101110110";
wait for 1ns;
assert sB_s = "111101110111" 
	report "ADD error at 111101110111" severity error;

wait for waitTime;
sA_s <= "111101110111";
wait for 1ns;
assert sB_s = "111101111000" 
	report "ADD error at 111101111000" severity error;

wait for waitTime;
sA_s <= "111101111000";
wait for 1ns;
assert sB_s = "111101111001" 
	report "ADD error at 111101111001" severity error;

wait for waitTime;
sA_s <= "111101111001";
wait for 1ns;
assert sB_s = "111101111010" 
	report "ADD error at 111101111010" severity error;

wait for waitTime;
sA_s <= "111101111010";
wait for 1ns;
assert sB_s = "111101111011" 
	report "ADD error at 111101111011" severity error;

wait for waitTime;
sA_s <= "111101111011";
wait for 1ns;
assert sB_s = "111101111100" 
	report "ADD error at 111101111100" severity error;

wait for waitTime;
sA_s <= "111101111100";
wait for 1ns;
assert sB_s = "111101111101" 
	report "ADD error at 111101111101" severity error;

wait for waitTime;
sA_s <= "111101111101";
wait for 1ns;
assert sB_s = "111101111110" 
	report "ADD error at 111101111110" severity error;

wait for waitTime;
sA_s <= "111101111110";
wait for 1ns;
assert sB_s = "111101111111" 
	report "ADD error at 111101111111" severity error;

wait for waitTime;
sA_s <= "111101111111";
wait for 1ns;
assert sB_s = "111110000000" 
	report "ADD error at 111110000000" severity error;

wait for waitTime;
sA_s <= "111110000000";
wait for 1ns;
assert sB_s = "111110000001" 
	report "ADD error at 111110000001" severity error;

wait for waitTime;
sA_s <= "111110000001";
wait for 1ns;
assert sB_s = "111110000010" 
	report "ADD error at 111110000010" severity error;

wait for waitTime;
sA_s <= "111110000010";
wait for 1ns;
assert sB_s = "111110000011" 
	report "ADD error at 111110000011" severity error;

wait for waitTime;
sA_s <= "111110000011";
wait for 1ns;
assert sB_s = "111110000100" 
	report "ADD error at 111110000100" severity error;

wait for waitTime;
sA_s <= "111110000100";
wait for 1ns;
assert sB_s = "111110000101" 
	report "ADD error at 111110000101" severity error;

wait for waitTime;
sA_s <= "111110000101";
wait for 1ns;
assert sB_s = "111110000110" 
	report "ADD error at 111110000110" severity error;

wait for waitTime;
sA_s <= "111110000110";
wait for 1ns;
assert sB_s = "111110000111" 
	report "ADD error at 111110000111" severity error;

wait for waitTime;
sA_s <= "111110000111";
wait for 1ns;
assert sB_s = "111110001000" 
	report "ADD error at 111110001000" severity error;

wait for waitTime;
sA_s <= "111110001000";
wait for 1ns;
assert sB_s = "111110001001" 
	report "ADD error at 111110001001" severity error;

wait for waitTime;
sA_s <= "111110001001";
wait for 1ns;
assert sB_s = "111110001010" 
	report "ADD error at 111110001010" severity error;

wait for waitTime;
sA_s <= "111110001010";
wait for 1ns;
assert sB_s = "111110001011" 
	report "ADD error at 111110001011" severity error;

wait for waitTime;
sA_s <= "111110001011";
wait for 1ns;
assert sB_s = "111110001100" 
	report "ADD error at 111110001100" severity error;

wait for waitTime;
sA_s <= "111110001100";
wait for 1ns;
assert sB_s = "111110001101" 
	report "ADD error at 111110001101" severity error;

wait for waitTime;
sA_s <= "111110001101";
wait for 1ns;
assert sB_s = "111110001110" 
	report "ADD error at 111110001110" severity error;

wait for waitTime;
sA_s <= "111110001110";
wait for 1ns;
assert sB_s = "111110001111" 
	report "ADD error at 111110001111" severity error;

wait for waitTime;
sA_s <= "111110001111";
wait for 1ns;
assert sB_s = "111110010000" 
	report "ADD error at 111110010000" severity error;

wait for waitTime;
sA_s <= "111110010000";
wait for 1ns;
assert sB_s = "111110010001" 
	report "ADD error at 111110010001" severity error;

wait for waitTime;
sA_s <= "111110010001";
wait for 1ns;
assert sB_s = "111110010010" 
	report "ADD error at 111110010010" severity error;

wait for waitTime;
sA_s <= "111110010010";
wait for 1ns;
assert sB_s = "111110010011" 
	report "ADD error at 111110010011" severity error;

wait for waitTime;
sA_s <= "111110010011";
wait for 1ns;
assert sB_s = "111110010100" 
	report "ADD error at 111110010100" severity error;

wait for waitTime;
sA_s <= "111110010100";
wait for 1ns;
assert sB_s = "111110010101" 
	report "ADD error at 111110010101" severity error;

wait for waitTime;
sA_s <= "111110010101";
wait for 1ns;
assert sB_s = "111110010110" 
	report "ADD error at 111110010110" severity error;

wait for waitTime;
sA_s <= "111110010110";
wait for 1ns;
assert sB_s = "111110010111" 
	report "ADD error at 111110010111" severity error;

wait for waitTime;
sA_s <= "111110010111";
wait for 1ns;
assert sB_s = "111110011000" 
	report "ADD error at 111110011000" severity error;

wait for waitTime;
sA_s <= "111110011000";
wait for 1ns;
assert sB_s = "111110011001" 
	report "ADD error at 111110011001" severity error;

wait for waitTime;
sA_s <= "111110011001";
wait for 1ns;
assert sB_s = "111110011010" 
	report "ADD error at 111110011010" severity error;

wait for waitTime;
sA_s <= "111110011010";
wait for 1ns;
assert sB_s = "111110011011" 
	report "ADD error at 111110011011" severity error;

wait for waitTime;
sA_s <= "111110011011";
wait for 1ns;
assert sB_s = "111110011100" 
	report "ADD error at 111110011100" severity error;

wait for waitTime;
sA_s <= "111110011100";
wait for 1ns;
assert sB_s = "111110011101" 
	report "ADD error at 111110011101" severity error;

wait for waitTime;
sA_s <= "111110011101";
wait for 1ns;
assert sB_s = "111110011110" 
	report "ADD error at 111110011110" severity error;

wait for waitTime;
sA_s <= "111110011110";
wait for 1ns;
assert sB_s = "111110011111" 
	report "ADD error at 111110011111" severity error;

wait for waitTime;
sA_s <= "111110011111";
wait for 1ns;
assert sB_s = "111110100000" 
	report "ADD error at 111110100000" severity error;

wait for waitTime;
sA_s <= "111110100000";
wait for 1ns;
assert sB_s = "111110100001" 
	report "ADD error at 111110100001" severity error;

wait for waitTime;
sA_s <= "111110100001";
wait for 1ns;
assert sB_s = "111110100010" 
	report "ADD error at 111110100010" severity error;

wait for waitTime;
sA_s <= "111110100010";
wait for 1ns;
assert sB_s = "111110100011" 
	report "ADD error at 111110100011" severity error;

wait for waitTime;
sA_s <= "111110100011";
wait for 1ns;
assert sB_s = "111110100100" 
	report "ADD error at 111110100100" severity error;

wait for waitTime;
sA_s <= "111110100100";
wait for 1ns;
assert sB_s = "111110100101" 
	report "ADD error at 111110100101" severity error;

wait for waitTime;
sA_s <= "111110100101";
wait for 1ns;
assert sB_s = "111110100110" 
	report "ADD error at 111110100110" severity error;

wait for waitTime;
sA_s <= "111110100110";
wait for 1ns;
assert sB_s = "111110100111" 
	report "ADD error at 111110100111" severity error;

wait for waitTime;
sA_s <= "111110100111";
wait for 1ns;
assert sB_s = "111110101000" 
	report "ADD error at 111110101000" severity error;

wait for waitTime;
sA_s <= "111110101000";
wait for 1ns;
assert sB_s = "111110101001" 
	report "ADD error at 111110101001" severity error;

wait for waitTime;
sA_s <= "111110101001";
wait for 1ns;
assert sB_s = "111110101010" 
	report "ADD error at 111110101010" severity error;

wait for waitTime;
sA_s <= "111110101010";
wait for 1ns;
assert sB_s = "111110101011" 
	report "ADD error at 111110101011" severity error;

wait for waitTime;
sA_s <= "111110101011";
wait for 1ns;
assert sB_s = "111110101100" 
	report "ADD error at 111110101100" severity error;

wait for waitTime;
sA_s <= "111110101100";
wait for 1ns;
assert sB_s = "111110101101" 
	report "ADD error at 111110101101" severity error;

wait for waitTime;
sA_s <= "111110101101";
wait for 1ns;
assert sB_s = "111110101110" 
	report "ADD error at 111110101110" severity error;

wait for waitTime;
sA_s <= "111110101110";
wait for 1ns;
assert sB_s = "111110101111" 
	report "ADD error at 111110101111" severity error;

wait for waitTime;
sA_s <= "111110101111";
wait for 1ns;
assert sB_s = "111110110000" 
	report "ADD error at 111110110000" severity error;

wait for waitTime;
sA_s <= "111110110000";
wait for 1ns;
assert sB_s = "111110110001" 
	report "ADD error at 111110110001" severity error;

wait for waitTime;
sA_s <= "111110110001";
wait for 1ns;
assert sB_s = "111110110010" 
	report "ADD error at 111110110010" severity error;

wait for waitTime;
sA_s <= "111110110010";
wait for 1ns;
assert sB_s = "111110110011" 
	report "ADD error at 111110110011" severity error;

wait for waitTime;
sA_s <= "111110110011";
wait for 1ns;
assert sB_s = "111110110100" 
	report "ADD error at 111110110100" severity error;

wait for waitTime;
sA_s <= "111110110100";
wait for 1ns;
assert sB_s = "111110110101" 
	report "ADD error at 111110110101" severity error;

wait for waitTime;
sA_s <= "111110110101";
wait for 1ns;
assert sB_s = "111110110110" 
	report "ADD error at 111110110110" severity error;

wait for waitTime;
sA_s <= "111110110110";
wait for 1ns;
assert sB_s = "111110110111" 
	report "ADD error at 111110110111" severity error;

wait for waitTime;
sA_s <= "111110110111";
wait for 1ns;
assert sB_s = "111110111000" 
	report "ADD error at 111110111000" severity error;

wait for waitTime;
sA_s <= "111110111000";
wait for 1ns;
assert sB_s = "111110111001" 
	report "ADD error at 111110111001" severity error;

wait for waitTime;
sA_s <= "111110111001";
wait for 1ns;
assert sB_s = "111110111010" 
	report "ADD error at 111110111010" severity error;

wait for waitTime;
sA_s <= "111110111010";
wait for 1ns;
assert sB_s = "111110111011" 
	report "ADD error at 111110111011" severity error;

wait for waitTime;
sA_s <= "111110111011";
wait for 1ns;
assert sB_s = "111110111100" 
	report "ADD error at 111110111100" severity error;

wait for waitTime;
sA_s <= "111110111100";
wait for 1ns;
assert sB_s = "111110111101" 
	report "ADD error at 111110111101" severity error;

wait for waitTime;
sA_s <= "111110111101";
wait for 1ns;
assert sB_s = "111110111110" 
	report "ADD error at 111110111110" severity error;

wait for waitTime;
sA_s <= "111110111110";
wait for 1ns;
assert sB_s = "111110111111" 
	report "ADD error at 111110111111" severity error;

wait for waitTime;
sA_s <= "111110111111";
wait for 1ns;
assert sB_s = "111111000000" 
	report "ADD error at 111111000000" severity error;

wait for waitTime;
sA_s <= "111111000000";
wait for 1ns;
assert sB_s = "111111000001" 
	report "ADD error at 111111000001" severity error;

wait for waitTime;
sA_s <= "111111000001";
wait for 1ns;
assert sB_s = "111111000010" 
	report "ADD error at 111111000010" severity error;

wait for waitTime;
sA_s <= "111111000010";
wait for 1ns;
assert sB_s = "111111000011" 
	report "ADD error at 111111000011" severity error;

wait for waitTime;
sA_s <= "111111000011";
wait for 1ns;
assert sB_s = "111111000100" 
	report "ADD error at 111111000100" severity error;

wait for waitTime;
sA_s <= "111111000100";
wait for 1ns;
assert sB_s = "111111000101" 
	report "ADD error at 111111000101" severity error;

wait for waitTime;
sA_s <= "111111000101";
wait for 1ns;
assert sB_s = "111111000110" 
	report "ADD error at 111111000110" severity error;

wait for waitTime;
sA_s <= "111111000110";
wait for 1ns;
assert sB_s = "111111000111" 
	report "ADD error at 111111000111" severity error;

wait for waitTime;
sA_s <= "111111000111";
wait for 1ns;
assert sB_s = "111111001000" 
	report "ADD error at 111111001000" severity error;

wait for waitTime;
sA_s <= "111111001000";
wait for 1ns;
assert sB_s = "111111001001" 
	report "ADD error at 111111001001" severity error;

wait for waitTime;
sA_s <= "111111001001";
wait for 1ns;
assert sB_s = "111111001010" 
	report "ADD error at 111111001010" severity error;

wait for waitTime;
sA_s <= "111111001010";
wait for 1ns;
assert sB_s = "111111001011" 
	report "ADD error at 111111001011" severity error;

wait for waitTime;
sA_s <= "111111001011";
wait for 1ns;
assert sB_s = "111111001100" 
	report "ADD error at 111111001100" severity error;

wait for waitTime;
sA_s <= "111111001100";
wait for 1ns;
assert sB_s = "111111001101" 
	report "ADD error at 111111001101" severity error;

wait for waitTime;
sA_s <= "111111001101";
wait for 1ns;
assert sB_s = "111111001110" 
	report "ADD error at 111111001110" severity error;

wait for waitTime;
sA_s <= "111111001110";
wait for 1ns;
assert sB_s = "111111001111" 
	report "ADD error at 111111001111" severity error;

wait for waitTime;
sA_s <= "111111001111";
wait for 1ns;
assert sB_s = "111111010000" 
	report "ADD error at 111111010000" severity error;

wait for waitTime;
sA_s <= "111111010000";
wait for 1ns;
assert sB_s = "111111010001" 
	report "ADD error at 111111010001" severity error;

wait for waitTime;
sA_s <= "111111010001";
wait for 1ns;
assert sB_s = "111111010010" 
	report "ADD error at 111111010010" severity error;

wait for waitTime;
sA_s <= "111111010010";
wait for 1ns;
assert sB_s = "111111010011" 
	report "ADD error at 111111010011" severity error;

wait for waitTime;
sA_s <= "111111010011";
wait for 1ns;
assert sB_s = "111111010100" 
	report "ADD error at 111111010100" severity error;

wait for waitTime;
sA_s <= "111111010100";
wait for 1ns;
assert sB_s = "111111010101" 
	report "ADD error at 111111010101" severity error;

wait for waitTime;
sA_s <= "111111010101";
wait for 1ns;
assert sB_s = "111111010110" 
	report "ADD error at 111111010110" severity error;

wait for waitTime;
sA_s <= "111111010110";
wait for 1ns;
assert sB_s = "111111010111" 
	report "ADD error at 111111010111" severity error;

wait for waitTime;
sA_s <= "111111010111";
wait for 1ns;
assert sB_s = "111111011000" 
	report "ADD error at 111111011000" severity error;

wait for waitTime;
sA_s <= "111111011000";
wait for 1ns;
assert sB_s = "111111011001" 
	report "ADD error at 111111011001" severity error;

wait for waitTime;
sA_s <= "111111011001";
wait for 1ns;
assert sB_s = "111111011010" 
	report "ADD error at 111111011010" severity error;

wait for waitTime;
sA_s <= "111111011010";
wait for 1ns;
assert sB_s = "111111011011" 
	report "ADD error at 111111011011" severity error;

wait for waitTime;
sA_s <= "111111011011";
wait for 1ns;
assert sB_s = "111111011100" 
	report "ADD error at 111111011100" severity error;

wait for waitTime;
sA_s <= "111111011100";
wait for 1ns;
assert sB_s = "111111011101" 
	report "ADD error at 111111011101" severity error;

wait for waitTime;
sA_s <= "111111011101";
wait for 1ns;
assert sB_s = "111111011110" 
	report "ADD error at 111111011110" severity error;

wait for waitTime;
sA_s <= "111111011110";
wait for 1ns;
assert sB_s = "111111011111" 
	report "ADD error at 111111011111" severity error;

wait for waitTime;
sA_s <= "111111011111";
wait for 1ns;
assert sB_s = "111111100000" 
	report "ADD error at 111111100000" severity error;

wait for waitTime;
sA_s <= "111111100000";
wait for 1ns;
assert sB_s = "111111100001" 
	report "ADD error at 111111100001" severity error;

wait for waitTime;
sA_s <= "111111100001";
wait for 1ns;
assert sB_s = "111111100010" 
	report "ADD error at 111111100010" severity error;

wait for waitTime;
sA_s <= "111111100010";
wait for 1ns;
assert sB_s = "111111100011" 
	report "ADD error at 111111100011" severity error;

wait for waitTime;
sA_s <= "111111100011";
wait for 1ns;
assert sB_s = "111111100100" 
	report "ADD error at 111111100100" severity error;

wait for waitTime;
sA_s <= "111111100100";
wait for 1ns;
assert sB_s = "111111100101" 
	report "ADD error at 111111100101" severity error;

wait for waitTime;
sA_s <= "111111100101";
wait for 1ns;
assert sB_s = "111111100110" 
	report "ADD error at 111111100110" severity error;

wait for waitTime;
sA_s <= "111111100110";
wait for 1ns;
assert sB_s = "111111100111" 
	report "ADD error at 111111100111" severity error;

wait for waitTime;
sA_s <= "111111100111";
wait for 1ns;
assert sB_s = "111111101000" 
	report "ADD error at 111111101000" severity error;

wait for waitTime;
sA_s <= "111111101000";
wait for 1ns;
assert sB_s = "111111101001" 
	report "ADD error at 111111101001" severity error;

wait for waitTime;
sA_s <= "111111101001";
wait for 1ns;
assert sB_s = "111111101010" 
	report "ADD error at 111111101010" severity error;

wait for waitTime;
sA_s <= "111111101010";
wait for 1ns;
assert sB_s = "111111101011" 
	report "ADD error at 111111101011" severity error;

wait for waitTime;
sA_s <= "111111101011";
wait for 1ns;
assert sB_s = "111111101100" 
	report "ADD error at 111111101100" severity error;

wait for waitTime;
sA_s <= "111111101100";
wait for 1ns;
assert sB_s = "111111101101" 
	report "ADD error at 111111101101" severity error;

wait for waitTime;
sA_s <= "111111101101";
wait for 1ns;
assert sB_s = "111111101110" 
	report "ADD error at 111111101110" severity error;

wait for waitTime;
sA_s <= "111111101110";
wait for 1ns;
assert sB_s = "111111101111" 
	report "ADD error at 111111101111" severity error;

wait for waitTime;
sA_s <= "111111101111";
wait for 1ns;
assert sB_s = "111111110000" 
	report "ADD error at 111111110000" severity error;

wait for waitTime;
sA_s <= "111111110000";
wait for 1ns;
assert sB_s = "111111110001" 
	report "ADD error at 111111110001" severity error;

wait for waitTime;
sA_s <= "111111110001";
wait for 1ns;
assert sB_s = "111111110010" 
	report "ADD error at 111111110010" severity error;

wait for waitTime;
sA_s <= "111111110010";
wait for 1ns;
assert sB_s = "111111110011" 
	report "ADD error at 111111110011" severity error;

wait for waitTime;
sA_s <= "111111110011";
wait for 1ns;
assert sB_s = "111111110100" 
	report "ADD error at 111111110100" severity error;

wait for waitTime;
sA_s <= "111111110100";
wait for 1ns;
assert sB_s = "111111110101" 
	report "ADD error at 111111110101" severity error;

wait for waitTime;
sA_s <= "111111110101";
wait for 1ns;
assert sB_s = "111111110110" 
	report "ADD error at 111111110110" severity error;

wait for waitTime;
sA_s <= "111111110110";
wait for 1ns;
assert sB_s = "111111110111" 
	report "ADD error at 111111110111" severity error;

wait for waitTime;
sA_s <= "111111110111";
wait for 1ns;
assert sB_s = "111111111000" 
	report "ADD error at 111111111000" severity error;

wait for waitTime;
sA_s <= "111111111000";
wait for 1ns;
assert sB_s = "111111111001" 
	report "ADD error at 111111111001" severity error;

wait for waitTime;
sA_s <= "111111111001";
wait for 1ns;
assert sB_s = "111111111010" 
	report "ADD error at 111111111010" severity error;

wait for waitTime;
sA_s <= "111111111010";
wait for 1ns;
assert sB_s = "111111111011" 
	report "ADD error at 111111111011" severity error;

wait for waitTime;
sA_s <= "111111111011";
wait for 1ns;
assert sB_s = "111111111100" 
	report "ADD error at 111111111100" severity error;

wait for waitTime;
sA_s <= "111111111100";
wait for 1ns;
assert sB_s = "111111111101" 
	report "ADD error at 111111111101" severity error;

wait for waitTime;
sA_s <= "111111111101";
wait for 1ns;
assert sB_s = "111111111110" 
	report "ADD error at 111111111110" severity error;

wait for waitTime;
sA_s <= "111111111110";
wait for 1ns;
assert sB_s = "111111111111" 
	report "ADD error at 111111111111" severity error;

wait for waitTime;
sA_s <= "111111111111";
wait for 1ns;
assert sB_s = "000000000000" 
	report "ADD error at 000000000000" severity error;

wait for waitTime;
report "The Test is finished ";

wait for 10ns;
		finish;
    end process;

end Behavioral;
