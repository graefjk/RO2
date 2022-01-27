----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.01.2021
-- Design Name: 
-- Module Name: sim_PC_tb - Behavioral
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

entity sim_PC_tb is
--  Port ( );
end sim_PC_tb;

architecture Behavioral of sim_PC_tb is
component PC
    port (	pc_i : in std_ulogic_vector(11 downto 0);
			enable_i : in std_logic;
			reset_i : in std_logic;
			clk_i : in std_logic;
			pc_o : out std_ulogic_vector(11 downto 0));
end component;

signal pc_in_s: std_ulogic_vector(11 downto 0);
signal reset_s: std_logic;
signal clk_s: std_logic;
signal enable_s: std_logic;

signal pc_out_s: std_ulogic_vector(11 downto 0);

constant clk_period: time := 20 ns;
constant waitTime: time := 5 ns;

begin

uut: PC port map (
			pc_i => pc_in_s, 
			reset_i => reset_s, 
			clk_i => clk_s, 
			enable_i => enable_s,
			pc_o => pc_out_s);

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
