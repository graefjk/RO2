----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jannik Graef
-- 
-- Create Date: 04.12.2021 12:00:50
-- Design Name: 
-- Module Name: sim_ALU_tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sim_ALU_tb is
--  Port ( );
end sim_ALU_tb;

architecture Behavioral of sim_ALU_tb is
component ALU
 Port (sA_i: in std_ulogic_vector(7 downto 0); --input signals
       sB_i: in std_ulogic_vector(7 downto 0);
       opcode_select_i: in std_ulogic_vector(5 downto 0);
       reset_i: in std_logic;
       clk_i: in std_logic;
       enable_i: in std_logic;
       
       sALU_o: out std_ulogic_vector(7 downto 0); -- output signals
       sCARRY_o: out std_logic;
       sZERO_o: out std_logic);
end component;

signal sA_s: std_ulogic_vector(7 downto 0);
signal sB_s: std_ulogic_vector(7 downto 0);
signal opcode_select_s: std_ulogic_vector(5 downto 0);
signal reset_s: std_logic;
signal clk_s: std_logic;
signal enable_s: std_logic;

signal sALU_s: std_ulogic_vector(7 downto 0);
signal sCARRY_s: std_logic;
signal sZERO_s: std_logic;

constant clk_period: time := 20 ns;
constant waitTime: time := 20 ns;

begin

uut: ALU port map (
			sA_i => sA_s,
			sB_i => sB_s,
			opcode_select_i => opcode_select_s, 
			reset_i => reset_s, 
			clk_i => clk_s, 
			enable_i => enable_s,
			sALU_o => sALU_s, 
			sCARRY_o => sCARRY_s, 
			sZERO_o =>sZERO_s);

    clk_process: process
    begin
        clk_s <= '0';
        wait for clk_period / 2;
        clk_s <= '1';
        wait for clk_period / 2;
    end process;
    

    
    stimuli: process
	variable err_cnt: integer := 0; 
    begin
 enable_s <= '1';
 wait for waitTime;   

--insert_code_here


    end process;

end Behavioral;
