----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2021 04:06:17 PM
-- Design Name: 
-- Module Name: IP - Behavioral
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
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IP is
    Port ( pc_i : in std_ulogic_vector(11 downto 0);
           clk_i : in std_ulogic;
           instruction_o : out std_ulogic_vector(17 downto 0));
end IP;

architecture Behavioral of IP is
    type rom_type is array (4096 downto 0) of std_ulogic_vector(17 downto 0);
    impure function InitRamFromFile (RamFileName : in string) return rom_type is 
        FILE RamFile : text is in RamFileName;
        variable RamFileLine : line;
        variable ROM : rom_type;
    begin
        for I in rom_type'range loop
            readline (RamFile,RamFileLine);
            read (RamFileLine, ROM(I));
        end loop;
        return ROM; 
    end function;    
    signal ROM : rom_type := InitRamFromFile("Test.data");
    attribute rom_style : string;
    attribute rom_style of ROM : signal is "block";
 
    signal old_pc: std_ulogic_vector(11 downto 0) := (others => '1');
    
begin
    -- returns the new instruction synchronous
    process(clk_i)
    begin
        if (clk_i'event and clk_i = '1') then
            if (pc_i /= old_pc) then
                instruction_o <= ROM(to_integer(unsigned(pc_i)));
                old_pc <= pc_i;
            end if;
        end if;
    end process;
end Behavioral;
