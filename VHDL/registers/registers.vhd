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
use IEEE.NUMERIC_STD.ALL;

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
           reset_i : in std_logic;
           clk_i : in std_logic;
           read_X_data_o : out std_ulogic_vector(register_width_g -1 downto 0);
           read_Y_data_o : out std_ulogic_vector(register_width_g -1 downto 0));
end registers;

architecture Behavioral of registers is  

  signal data  : std_ulogic_vector(127 downto 0);
  
begin

process1: process (clk_i, reset_i) is
variable address_X : integer;
variable address_Y : integer;
variable write_address : integer;
begin
    if (reset_i = '1') then               -- asynchronous reset
        data <= (others => '0');
	end if;
	if (clk_i'event and clk_i = '0') then  -- writing with falling clock edge 
		if(write_enable_i = '1') then
			write_address := to_integer(unsigned(write_address_i));
			data((write_address+1)*register_width_g-1 downto write_address*register_width_g) <= write_data_i;
		end if;
	end if;
	if (clk_i'event and clk_i = '1') then -- reading with rising clock edge 
		address_X := to_integer(unsigned(read_X_address_i));
		address_Y := to_integer(unsigned(read_Y_address_i));
		read_X_data_o <= data((address_X+1)*register_width_g-1 downto address_X*register_width_g);
		read_Y_data_o <= data((address_Y+1)*register_width_g-1 downto address_Y*register_width_g);
    end if;
end process process1;

end Behavioral;
