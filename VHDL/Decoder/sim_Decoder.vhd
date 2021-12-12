----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2021 12:00:50
-- Design Name: 
-- Module Name: sim_ALU_logik1 - Behavioral
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

entity sim_Decoder is
--  Port ( );
end sim_Decoder;

architecture Behavioral of sim_Decoder is
component Decoder
    Port (
         instruction_i: in std_logic_vector(17 downto 0); -- input signals
         clk_i: in std_logic;
         reset_i: in std_logic;
         
         carry_i: in std_logic;--carry/zero
         zero_i: in std_logic;
         
         constant_kk_o: out std_logic_vector(7 downto 0); -- output signals -- Constant
         constant_aaa_o: out std_logic_vector(11 downto 0);
         
         mux_i_o_select_o: out std_logic; -- i/o signals
		 sIO_write_or_read_o: out std_logic;
		 sIO_enable_o: out std_logic;
         
         mux_register_select_o: out std_logic_vector(1 downto 0); --register signals
	     sRegister_X_adresse_o: out std_logic_vector(3 downto 0); 
         sRegister_Y_adresse_o: out std_logic_vector(3 downto 0);
	     sRegister_write_enable_o: out std_logic;
         
         mux_ALU_select_o: out std_logic; --ALU signals
         sALU_select_o: out std_logic_vector(5 downto 0);
         sALU_enable_o: out std_logic;
         
         
         mux_stack_select_o: out std_logic; --stack signals
		 sStack_write_or_read_o: out std_logic;
         sStack_enable_o: out std_logic;
         
         mux_PC_select_o: out std_logic;-- PC signal
         sPC_enable_o: out std_logic;
         
         sRAM_write_or_read_o: out std_logic; -- RAM signals
         sRAM_enable_o: out std_logic);
end component;

signal instruction: std_logic_vector(17 downto 0);
signal clk: std_logic;
signal reset: std_logic;
signal carry: std_logic;
signal zero: std_logic;
signal constant_kk: std_logic_vector(7 downto 0);
signal constant_aaa: std_logic_vector(11 downto 0);   
signal mux_i_o_select: std_logic;
signal sIO_write_or_read: std_logic;
signal sIO_enable: std_logic;       
signal mux_register_select: std_logic_vector(1 downto 0);
signal sRegister_X_adresse: std_logic_vector(3 downto 0); 
signal sRegister_Y_adresse: std_logic_vector(3 downto 0);
signal sRegister_write_enable: std_logic;      
signal mux_ALU_select: std_logic;
signal sALU_select: std_logic_vector(5 downto 0);  
signal sALU_enable: std_logic;            
signal mux_stack_select: std_logic;
signal sStack_write_or_read: std_logic;
signal sStack_enable: std_logic;       
signal mux_PC_select: std_logic; 
signal sPC_enable: std_logic;      
signal sRAM_write_or_read: std_logic;
signal sRAM_enable: std_logic;

constant clk_period: time := 20 ns;

begin

uut: Decoder port map (instruction, clk, reset, carry, zero, constant_kk, constant_aaa, mux_i_o_select, sIO_write_or_read,
sIO_enable, mux_register_select, sRegister_X_adresse, sRegister_Y_adresse, sRegister_write_enable, mux_ALU_select, sALU_select, sALU_enable, mux_stack_select,
sStack_write_or_read, sStack_enable, mux_PC_select, sPC_enable, sRAM_write_or_read, sRAM_enable);

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
        wait for 10 ns;
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait;
    end process;
    
    stimuli: process
    begin
        carry <= '0';
        zero <= '0';

        instruction <= "000001000000000010";
        wait for 120ns;
        instruction <= "000000000100000000";
        wait for 120ns;
        instruction <= "000011000000000010";
        wait for 120ns;
        instruction <= "000010000100000000";
        wait for 120ns;
        instruction <= "001001000000000010";
        wait for 120ns;
        instruction <= "001000000000010000";
        wait for 120ns;
        instruction <= "100001000000001000";
        wait for 120ns;
        instruction <= "100010000000001000";
        wait for 120ns;
        instruction <= "100011000000001000";
        wait for 120ns;
        instruction <= "100101000000001000";
        wait for 120ns;
        instruction <= "100100000000001000";
        wait for 120ns;
        instruction <= "011011000000000010";
        wait for 120ns;
        instruction <= "011010000000010000";
        wait for 120ns;
        instruction <= "010010000000010000";
        wait for 120ns;
        instruction <= "010011000000000010";
        wait for 120ns;
        instruction <= "010110000000010000";
        wait for 120ns;
        instruction <= "010111000000000010";
        wait for 120ns;
        instruction <= "100110000000000100";
        wait for 120ns;
        instruction <= "100111000000000100";
        wait for 120ns;
        instruction <= "101000000000000100";
        wait for 120ns;
        instruction <= "101010000000000100";
        wait for 120ns;
        instruction <= "101001000000000100";
        wait for 120ns;
        instruction <= "001110000000010000";
        wait for 120ns;
        instruction <= "001111000000000010";
        wait for 120ns;
        instruction <= "001010000000010000";
        wait for 120ns;
        instruction <= "001011000000000010";
        wait for 120ns;
        instruction <= "010100000000010000";
        wait for 120ns;
        instruction <= "010101000000000010";
        wait for 120ns;
        instruction <= "101011000000000000";
        wait for 120ns;
        instruction <= "101100000000000000";
        wait for 120ns;
        instruction <= "101101000000000000";
        wait for 120ns;
        instruction <= "101110000000000000";
        wait for 120ns;
        instruction <= "101111000000000000";
        wait for 120ns;
        instruction <= "110000000000000000";
        wait for 120ns;
        instruction <= "110001000000000000";
        wait for 120ns;
        instruction <= "110010000000000000";
        wait for 120ns;
        instruction <= "110011000000000000";
        wait for 120ns;
        instruction <= "110100000000000000";
        wait for 120ns;
        instruction <= "110101000000000000";
        wait for 120ns;
        instruction <= "110110000000000000";
        wait for 120ns;
        instruction <= "110111000000000000";
        wait for 120ns;
        instruction <= "111000000000000000";
        wait for 120ns;
        instruction <= "111001000000000000";
        wait for 120ns;
        instruction <= "010000000000010000";
        wait for 120ns;
        instruction <= "010001000000000010";
        wait for 120ns;
        instruction <= "000100000000010000";
        wait for 120ns;
        instruction <= "000101000000000010";
        wait for 120ns;
        instruction <= "000110000000010000";
        wait for 120ns;
        instruction <= "000111000000000010";
        wait for 120ns;
        instruction <= "011000000000010000";
        wait for 120ns;
        instruction <= "011001000000000010";
        wait for 120ns;
        instruction <= "001100000000010000";
        wait for 120ns;
        instruction <= "001101000000000010";
        wait;
    end process;

end Behavioral;