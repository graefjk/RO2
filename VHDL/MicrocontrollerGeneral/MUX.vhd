----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2021 15:37:19
-- Design Name: 
-- Module Name: MUX - Behavioral
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

entity MUX is
	generic(mux_width_g: integer := 8);
	Port (	mux_s0_i: in std_logic_vector(mux_width_g - 1 downto 0); -- input signals
			mux_s1_i: in std_logic_vector(mux_width_g - 1 downto 0);
			mux_select_i: in std_logic;
		 
			mux_o : in std_logic_vector(mux_width_g - 1 downto 0); -- output signals
end MUX;

architecture Behavioral of MUX is
begin
mux_o <= mux_s0_i when mux_select_i = '0' 
else mux_s1_i when mux_select_i = '1'; 

end Behavioral;
