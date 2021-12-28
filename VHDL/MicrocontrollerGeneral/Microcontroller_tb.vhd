----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.12.2021 12:00:50
-- Design Name: 
-- Module Name: Microcontroller_tb - Behavioral
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

entity Microcontroller_tb is
--  Port ( );
end Microcontroller_tb;

architecture Behavioral of Microcontroller_tb is
component Microcontroller
    port(   clk_i: in std_ulogic;
            reset_i: in std_ulogic); --TODO: define IO ports here
end component;

signal reset_s: std_logic;
signal clk_s: std_logic;

constant clk_period: time := 20 ns;
constant waitTime: time := 0 ns;

begin

uut: Microcontroller port map (
			reset_i => reset_s, 
			clk_i => clk_s);

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
		wait for 120 ns;

    end process;

end Behavioral;
