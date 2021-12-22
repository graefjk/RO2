----------------------------------------------------------------------------------
-- Company: Group 2
-- Engineer: 
-- 
-- Create Date: 26.11.2021 11:51:37
-- Design Name: ram
-- Module Name: ram - Behavioral
-- Project Name: microcontroller
-- Target Devices: 
-- Tool Versions: 
-- Description: scratchpad ram for the microcontroller
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
use IEEE.NUMERIC_STD.ALL;

library work;
use work.microcontroller_package.all;


entity ram is
    generic(    ram_width_g: integer := architecture_width_c;
                ram_select_size_g: integer := ram_select_size_c;
                ram_style_g: string := ram_style_c);
    port(       write_data_i : in std_ulogic_vector(ram_width_g -1 downto 0);
                address_i : in std_ulogic_vector(ram_select_size_g -1 downto 0);
                write_or_read_i : in std_ulogic;
                enable_i : in std_ulogic;
                clk_i : in std_ulogic;
                read_data_o : out std_ulogic_vector(ram_width_g -1 downto 0));
end ram;

architecture Behavioral of ram is  
    type ram_type is array (2 ** ram_select_size_g -1 downto 0) of std_ulogic_vector(ram_width_g -1 downto 0);
    signal ram_s : ram_type := (others => (others => '0'));
    attribute ram_style : string;
    attribute ram_style of ram_s : signal is ram_style_g;

    begin
    io_process: process (clk_i) is
        begin
            if (rising_edge(clk_i) and  enable_i = '1') then
                if(write_or_read_i = '0') then
                    read_data_o <= ram_s(to_integer(unsigned(address_i)));
                else
                    ram_s(to_integer(unsigned(address_i))) <= write_data_i;
                end if;
            end if;
    end process io_process;

end Behavioral;
