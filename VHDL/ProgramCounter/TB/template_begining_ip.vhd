----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.01.2021
-- Design Name: 
-- Module Name: sim_IP_tb - Behavioral
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

entity sim_IP_tb is
--  Port ( );
end sim_IP_tb;

architecture Behavioral of sim_IP_tb is
component IP
	generic(File_Name: string := "Fibonacci.data");
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
