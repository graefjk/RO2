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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IO is
    Port ( port_id_i : in STD_LOGIC;
           value_i : in STD_LOGIC;
           in_out_i : in STD_LOGIC;
           enable_i : in STD_LOGIC;
           value_o : out STD_LOGIC;
           clk_i : in STD_LOGIC;
           port_b : inout STD_LOGIC_VECTOR (256 downto 0));
end IO;

architecture Behavioral of IO is

begin


end Behavioral;
