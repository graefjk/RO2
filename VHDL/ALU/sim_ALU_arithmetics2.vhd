----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2021 11:51:05
-- Design Name: 
-- Module Name: sim_ALU_arithmetics2 - Behavioral
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
--Geschrieben von Omar Al Kadri

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sim_ALU_arithmetics2 is
--  Port ( );
end sim_ALU_arithmetics2;

architecture Behavioral of sim_ALU_arithmetics2 is

component ALU
    Port (
       sA_i: in std_logic_vector(7 downto 0); --input signals
       sB_i: in std_logic_vector(7 downto 0);
       opcode_select_i: in std_logic_vector(5 downto 0);
       reset_i: in std_logic;
       clk_i: in std_logic;
       
       sALU_o: out std_logic_vector(7 downto 0); -- output signals
       sCARRY_o: out std_logic;
       sZERO_o: out std_logic);
end component;

signal sA: std_logic_vector(7downto 0);
signal sB: std_logic_vector(7downto 0);
signal opcode_select: std_logic_vector(5 downto 0);
signal reset: std_logic;
signal clk: std_logic;

signal sALU: std_logic_vector(7 downto 0);
signal sCARRY: std_logic;
signal sZERO: std_logic;

constant clk_period: time := 20 ns;

begin

uut: ALU port map (sA, sB, opcode_select, reset, clk, sALU, sCARRY, sZERO);

    clk_process: process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;
    
    rst_process: process
    begin
        reset <= '0';
        wait for 275 ns;
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait;
    end process;
    
    stimuli: process
    begin
        sB <= "00000011";
        sA <= "00000101";
        opcode_select <= "000100"; --SUB
        wait for 20 ns;
        sB <= "11000000";
        sA <= "01000100";
        opcode_select <= "000100"; --SUB
        wait for 20 ns;
        sB <= "11111111";
        sA <= "11111111";
        opcode_select <= "000100"; -- SUB
        wait for 20 ns;
        sB <= "00000000";
        sA <= "00000000";
        opcode_select <= "000101"; --SUB constant
        wait for 20 ns;
        sB <= "11111111";
        sA <= "00000001";
        opcode_select <= "000101"; --SUB constant
        wait for 20 ns;
        sB <= "00000000";
        sA <= "00000101";
        opcode_select <= "000101"; --SUB constant
        wait for 20 ns;
        sB <= "11000000";
        sA <= "10100010";
        opcode_select <= "000101"; --SUB constant
        wait for 20 ns;
        
        sB <= "00000000";
        sA <= "00000001";
        opcode_select <= "000110"; --SUBCY
        wait for 20 ns;
        
        sB <= "01000000";
        sA <= "00000010";
        opcode_select <= "000110"; --SUBCY
        wait for 20 ns;
        
        sB <= "00000001";
        sA <= "11111111";
        opcode_select <= "000110"; --SUBCY
        wait for 20 ns;
        
        sB <= "00000000";
        sA <= "00000001";
        opcode_select <= "000111"; --SUBCY constant
        wait for 20 ns;
        
        sB <= "10000000";
        sA <= "00000010";
        opcode_select <= "000111"; --SUBCY constant
        wait for 20 ns;
        
        sB <= "00000001";
        sA <= "11111111";
        opcode_select <= "000111"; --SUBCY constant
        wait for 20 ns;
        
        wait;
    end process;


end Behavioral;
