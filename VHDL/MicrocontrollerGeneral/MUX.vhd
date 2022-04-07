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

--Geschrieben von Simon Naß ab hier (21-43):	




library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX is
    generic(    mux_width_g: integer := 8);
	port(	    mux_s0_i: in std_ulogic_vector(mux_width_g - 1 downto 0); -- input signals
			    mux_s1_i: in std_ulogic_vector(mux_width_g - 1 downto 0);
			    mux_select_i: in std_ulogic; -- select signals
		 
			    mux_o : out std_ulogic_vector(mux_width_g - 1 downto 0)); -- output signals
end MUX;

architecture Behavioral of MUX is
begin
mux_o <=   mux_s0_i when mux_select_i = '0' else 
           mux_s1_i; 
end Behavioral;
