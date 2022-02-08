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
    generic(File_Name : String := "Test.data");
    Port ( pc_i : in std_ulogic_vector(11 downto 0);
           clk_i : in std_ulogic;
           instruction_o : out std_ulogic_vector(17 downto 0));
end IP;

architecture Behavioral of IP is
    type rom_type is array (0 to 4095) of std_ulogic_vector(17 downto 0);
    --initializes the rom from the given file
    impure function InitRomFromFile (RomFileName : in string) return rom_type is 
        --The file to be read
       FILE RomFile : text open read_mode is RomFileName;
        --A Line of the File(Also one instruction)
        variable RomFileLine : line;
        --The ROM
        variable ROM : rom_type := (others => "000001000000000000");
    begin
        --Iterating over the size of the ROM
        for I in rom_type'range loop
            --Escaping on the EOF
            if endfile(RomFile) = true then
                exit;
            end if;
            --Reading from the file 1 line at a time
            readline (RomFile,RomFileLine);
            --Writing the read line into the ROM
            read (RomFileLine, ROM(I));
        end loop;
        --Returning the filled ROM
        return ROM; 
    end function;    
    --The ROM
    signal ROM : rom_type := InitRomFromFile(File_name);
    --Using BlockRAM for the ROM
    attribute rom_style : string; --change rom_style to ram_style if using ram in the future
    attribute rom_style of ROM : signal is "block";
    --The old PC value for detection of changes
    signal old_pc: std_ulogic_vector(11 downto 0) := (others => '1');
    
begin
    -- returns the new instruction synchronous
    process(clk_i)
    begin
        --Checking for a rising edge
        if (clk_i'event and clk_i = '1') then
            --Checking for a change in the PC
            if (pc_i /= old_pc) then
                --Retriving the instruction from the ROM
                instruction_o <= ROM(to_integer(unsigned(pc_i)));
                --Storing the new PC as old
                old_pc <= pc_i;
            end if;
        end if;
    end process;
end Behavioral;
