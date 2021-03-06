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
