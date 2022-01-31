----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.01.2021
-- Design Name: 
-- Module Name: sim_ADD_tb - Behavioral
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

entity sim_ADD_tb is
--  Port ( );
end sim_ADD_tb;

architecture Behavioral of sim_ADD_tb is
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
