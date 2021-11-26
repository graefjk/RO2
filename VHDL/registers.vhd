----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2021 11:51:37
-- Design Name: 
-- Module Name: registers - Behavioral
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

entity registers is
    generic(    register_width_g: integer := 8; 
                register_select_size_g: integer := 4);
    Port ( write_data_i : in std_ulogic_vector(register_width_g -1 downto 0);
           write_address_i : in std_ulogic_vector(register_select_size_g -1 downto 0);
           write_enable_i : in std_ulogic;
           read_X_address_i : in std_ulogic_vector(register_select_size_g -1 downto 0);
           read_Y_address_i : in std_ulogic_vector(register_select_size_g -1 downto 0);
           reset_i : in std_ulogic;
           clk_i : in std_ulogic;
           read_X_data_o : out std_ulogic_vector(register_width_g -1 downto 0);
           read_Y_data_o : out std_ulogic_vector(register_width_g -1 downto 0));
end registers;

architecture Behavioral of registers is

begin


end Behavioral;
