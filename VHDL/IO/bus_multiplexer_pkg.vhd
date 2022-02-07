----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2021 04:06:17 PM
-- Design Name: 
-- Module Name: bus_multiplexer_pkg
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
-- From https://stackoverflow.com/questions/28468334/using-array-of-std-logic-vector-as-a-port-type-with-both-ranges-using-a-generic
package bus_multiplexer_pkg is
        type bus_array is array(natural range <>, natural range <>) of std_ulogic;

        procedure set_row(signal slm : out bus_array; constant row : natural; slv : in std_ulogic_vector(7 downto 0));
        function get_row(signal slm : in bus_array; constant row : natural) return std_ulogic_vector ;
end package;

package body bus_multiplexer_pkg is
        procedure set_row(signal slm : out bus_array; constant row : natural; slv : in std_ulogic_vector(7 downto 0)) is
        begin
                for i in 7 downto 0 loop
                        slm(row, i) <= slv(i);
                end loop;
        end procedure;

        function get_row(signal slm : in bus_array; constant row : natural) return std_ulogic_vector is
            variable slv: std_ulogic_vector(7 downto 0);
        begin
                for i in 7 downto 0 loop
                        slv(i) := slm(row, i);
                end loop;
                return slv;
        end function;
end package body;