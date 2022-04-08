----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2021 12:00:50
-- Design Name: 
-- Module Name: sim_ALU_shifts1 - Behavioral
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




--Geschrieben von Alexander Bunz


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sim_ALU_shifts1 is
--  Port ( );
end sim_ALU_shifts1;

architecture Behavioral of sim_ALU_shifts1 is
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
        sB <= "00000000";
        
        sA <= "00000001";
        opcode_select <= "110001"; --RR
        wait for 20 ns;
        
        sA <= "10000000";
        opcode_select <= "110000"; --RL
        wait for 20 ns;
        
        sA <= "00000001";
        opcode_select <= "110010"; --SL0
        wait for 20 ns;
        
        sA <= "10010001";
        opcode_select <= "110011"; --SL1
        wait for 20 ns;
        
        sA <= "00000001";
        opcode_select <= "110100"; --SLA
        wait for 20 ns;
        
        sA <= "00000101";
        opcode_select <= "110101"; --SLX
        wait for 20 ns;
        
        sA <= "00000010";
        opcode_select <= "110110"; --SR0
        wait for 20 ns;
        
        sA <= "00000001";
        opcode_select <= "110111"; --SR1
        wait for 20 ns;
        
        sA <= "00000010";
        opcode_select <= "111000"; --SRA
        wait for 20 ns;
        
        sA <= "00000001";
        opcode_select <= "111001"; --SRX
        wait for 20 ns;
        
        wait;
    end process;

end Behavioral;
