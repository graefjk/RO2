----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.11.2021 13:29:48
-- Design Name: 
-- Module Name: rams_sp_wf - Behavioral
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rams_sp_wf is
    generic(
        ram_width_g: integer := 8; 
        ram_select_size_g: integer := 8
    );
    port(
        clk_i : in std_ulogic;
        write_or_read_i : in std_ulogic;
        enable_i : in std_ulogic;
        address_i : in std_ulogic_vector(ram_select_size_g -1 downto 0);
        write_data_i   : in  std_ulogic_vector(ram_width_g -1 downto 0);
        read_data_o : out std_ulogic_vector(ram_width_g -1 downto 0);
        reset_i : in std_ulogic
    );
end rams_sp_wf;

architecture syn of rams_sp_wf is
    type ram_type is array (2 ** ram_select_size_g -1 downto 0) of std_ulogic_vector(ram_width_g -1 downto 0);
    signal RAM : ram_type;
    begin
        process(clk_i) --reset_i 
            begin
                --if enabled it gets not synthesized as a block ram
                --if reset_i = '1' then
                --    for i in 0 to (2 ** ram_select_size_g -1) loop
                --        RAM(i) <= (others => '0');
                --    end loop;
                --end if;
                if clk_i'event and clk_i = '1' then
                    if enable_i = '1' then
                        if write_or_read_i = '1' then
                            RAM(to_integer(unsigned(address_i))) <= write_data_i;
                            read_data_o <= write_data_i;
                        else
                            read_data_o <= RAM(to_integer(unsigned(address_i)));
                        end if;
                    end if;
                end if;
    end process;
end syn;
