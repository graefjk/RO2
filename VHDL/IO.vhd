----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2021 04:06:17 PM
-- Design Name: 
-- Module Name: IO - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IO is
    Port ( port_id_i : in std_ulogic_vector(7 downto 0);
           value_i : in std_ulogic_vector(7 downto 0);
           in_out_i : in std_ulogic_vector(7 downto 0);
           enable_i : in std_ulogic;
           value_o : out std_ulogic_vector(7 downto 0);
           clk_i : in std_ulogic;
           port_b : inout std_ulogic_vector (256 downto 0));
end IO;

architecture Behavioral of IO is
begin
    process(clk_i)
    begin
        if rising_edge(clk_i) and enable_i = '1' then
           if in_out_i = "0" then
            for i in 0 to 7 loop 
                value_o(i) <= port_b(to_integer(unsigned(port_id_i)) + i);
            end loop;
           else 
            for i in 0 to 7 loop 
                port_b(i) <= value_i(to_integer(unsigned(port_id_i)) + i);
            end loop;
           end if;
        elsif rising_edge(clk_i) and enable_i = '0' then
            for i in 0 to 256 loop 
                port_b(i) <= '0';
            end loop;
        end if;        
    end process;
end Behavioral;
