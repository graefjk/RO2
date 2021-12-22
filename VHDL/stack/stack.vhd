----------------------------------------------------------------------------------
-- Company: Group 2 
-- Engineer: Tobias Weinschenk
-- 
-- Create Date: 12.12.2021 22:37:06
-- Design Name: Stack
-- Module Name: stack - Behavioral
-- Project Name: microcontroller
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

library work;
use work.microcontroller_package.all;

entity stack is
    generic(    instruction_address_g: integer := instruction_address_c;
                stack_depth_g: integer := stack_depth_c;
                stack_style_g: string := stack_style_c); -- "registers", "distributed" or "block" can be used here
    port(   sPC_i : in std_ulogic_vector( instruction_address_g -1 downto 0);
            write_or_read_i: in std_ulogic; -- 0 for write, 1 for read
            enable_i: in std_ulogic;
            reset_i: in std_ulogic;
            clk_i: in std_ulogic;
            
            full_o: out std_ulogic;
            empty_o: out std_ulogic;
            
            sStack_o: out std_ulogic_vector( instruction_address_g -1 downto 0)); 
end stack;

architecture Behavioral of stack is
    type stack_type is array (stack_depth_g downto 1) of std_ulogic_vector( instruction_address_g -1 downto 0);
    signal stack_s : stack_type := (others => (others => '0'));
    attribute ram_style : string;
    attribute ram_style of stack_s : signal is stack_style_g;

    begin
        stack_process: process(clk_i, reset_i) is
            variable stack_pointer: integer range 0 to stack_depth_g := 0;
            variable full: std_ulogic := '0';
            variable empty: std_ulogic := '1';
        
            begin
                if reset_i = '1' then
                    --stack_s <= (others => (others => '0')); -- this could be skipped, actually its enough to reset the stack_pointer, if uncommented it will be synthesized to registers
                    sStack_o <= (others => '0');
                    empty := '1';
                    full := '0';
                    stack_pointer := 0;
                elsif(rising_edge(clk_i) and enable_i = '1') then
                    if write_or_read_i = '1' then -- Reading
                        if empty = '0' then -- does not reset memory cells, but that is not really necessary
                            sStack_o <= stack_s(stack_pointer);
                            stack_pointer := stack_pointer - 1;
                        end if; -- no else here, if stack is empty nothing would be read
                     else --Writing
                        if full = '0' then
                            stack_pointer := stack_pointer + 1;
                            stack_s(stack_pointer) <= sPC_i;
                        end if; -- no else here, if stack is full nothing will be written
                     end if;
                end if;
                 
                if stack_pointer = 0 then
					empty := '1';
                else
					empty := '0'; 
                end if;
                 
                if stack_pointer = stack_depth_g then
                    full := '1';
                else
                    full := '0';
                end if;
                
                full_o <= full;
                empty_o <= empty;
                  
         end process stack_process;
end Behavioral;
