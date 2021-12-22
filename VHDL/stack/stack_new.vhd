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

entity stack_new is
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
end stack_new;

architecture Behavioral of stack_new is
    type stack_type is array (stack_depth_g downto 1) of std_ulogic_vector( instruction_address_g -1 downto 0);
    signal stack_s : stack_type := (others => (others => '0'));
    attribute ram_style : string;
    attribute ram_style of stack_s : signal is stack_style_g;
    
    signal stack_pointer_s: integer range 0 to stack_depth_g := 0;
    signal full_s: std_ulogic;
    signal empty_s: std_ulogic;
    
    signal stack_pointer_plusplus_s : integer range 0 to stack_depth_g;

    begin
        stack_process: process(clk_i, reset_i) is
            begin
                if reset_i = '1' then
                    --stack_s <= (others => (others => '0')); -- this could be skipped, actually its enough to reset the stack_pointer, if uncommented it will be synthesized to registers
                    sStack_o <= (others => '0');
                    stack_pointer_s <= 0;
                elsif(rising_edge(clk_i) and enable_i = '1') then
                    if write_or_read_i = '1' then -- Reading
                        if empty_s = '0' then -- does not reset memory cells, but that is not really necessary
                            sStack_o <= stack_s(stack_pointer_s);
                            stack_pointer_s <= stack_pointer_s - 1;
                        end if; -- no else here, if stack is empty nothing would be read
                     else --Writing
                        if full_s = '0' then
                            stack_s(stack_pointer_s + 1) <= sPC_i; -- we need to write at stack_pointer_s +1 because even if we do the assignment first it will not become active until the next clock cylce
                            stack_pointer_s <= stack_pointer_s + 1;
                        end if; -- no else here, if stack is full nothing will be written
                     end if;
                end if;
         end process stack_process;
         
         empty_s <= '1' when stack_pointer_s = 0 else
                    '0';
         
         full_s <= '1' when stack_pointer_s = stack_depth_g else
                   '0';
                       
          full_o <= full_s;
          empty_o <= empty_s;
         
end Behavioral;
