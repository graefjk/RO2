----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2021 11:51:37
-- Design Name: 
-- Module Name: ram - Behavioral
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


entity ram is
    generic(    ram_width_g: integer := 8; 
                ram_select_size_g: integer := 8);
    Port ( write_data_i : in std_ulogic_vector(ram_width_g -1 downto 0);
           address_i : in std_ulogic_vector(ram_select_size_g -1 downto 0);
           write_or_read_i : in std_ulogic;
           enable_i : in std_ulogic;
           reset_i : in std_ulogic;
           clk_i : in std_ulogic;
           read_data_o : out std_ulogic_vector(ram_width_g -1 downto 0)
           );
             
end ram;

architecture Behavioral of ram is  

  signal data  : std_ulogic_vector(2047 downto 0);
  
begin

process1: process (clk_i, reset_i, enable_i) is
variable address : integer;
begin
    if (reset_i = '1') then               -- asynchronous reset
        data <= (others => '0');
	end if;
	if (clk_i'event and clk_i = '1' and  enable_i = '1') then  -- writing with falling clock edge 
		address := to_integer(unsigned(address_i));
		if(write_or_read_i = '0') then
			read_data_o <= data((address+1)*ram_width_g-1 downto address*ram_width_g);
		else
			data((address+1)*ram_width_g-1 downto address*ram_width_g) <= write_data_i;
		end if;
    end if;
end process process1;

end Behavioral;
