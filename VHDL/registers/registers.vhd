----------------------------------------------------------------------------------
-- Company: Group 2
-- Engineer: Tobias Weinschenk
-- 
-- Create Date: 26.11.2021 11:51:37
-- Design Name: register
-- Module Name: registers - Behavioral
-- Project Name: microcontroller
-- Target Devices: 
-- Tool Versions: 
-- Description: register file for the microcontroller
-- 
-- Dependencies: library IEEE;
-- 
-- Revision:
-- Revision 1.0 - tested registers
-- Additional Comments: register file with asynchronous reset
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.microcontroller_package.all;


entity registers is
    generic(    register_width_g: integer := architecture_width_c; 
                register_select_size_g: integer := register_select_size_c);
    Port(   write_data_i : in std_ulogic_vector(register_width_g -1 downto 0);
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
    type register_type is array (2 ** register_select_size_g -1 downto 0) of std_ulogic_vector(register_width_g -1 downto 0);
    signal register_s : register_type;  
    attribute ram_style : string;
    attribute ram_style of register_s : signal is "registers";
  
    begin
        data_io_process: process (clk_i, reset_i) is
            begin
                -- async reset overrides the registers and the output
                if (reset_i = '1') then
                    register_s <= (others => (others => '0'));
                    read_X_data_o <= (others => '0');
                    read_Y_data_o <= (others => '0');
                elsif (rising_edge(clk_i)) then
                    read_X_data_o <= register_s(to_integer(unsigned(read_X_address_i)));
                    read_Y_data_o <= register_s(to_integer(unsigned(read_Y_address_i)));
                    if(write_enable_i = '1') then
                        register_s(to_integer(unsigned(write_address_i))) <= write_data_i;
                    end if;
                end if;
        end process data_io_process;
end Behavioral;
