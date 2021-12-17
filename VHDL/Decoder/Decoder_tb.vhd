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

entity Decoder_tb is
--  Port ( );
end Decoder_tb;

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
constant waitTime: time := 0 ns;

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
    
    
    stimuli: process
    variable err_cnt: integer := 0; 
    begin
        reset <= '0';
        carry <= '0';
        zero <= '0';
        
        wait for 120 ns;
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk PC failed";
		end if;
        instruction <= "000001000000000010";--ADDkk
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000010" and constant_aaa = "000000000010"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "000001" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' and
        sALU_enable <= '0' and sRegister_write_enable <= '0' and sStack_enable <= '0' and
        sIO_enable <= '0' and sRAM_enable <= '0' and sPC_enable <= '0' )) then
			err_cnt := err_cnt+1;
			report "ADDkk failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk WB failed";
		end if;
		
		
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADD PC failed";
		end if;
        instruction <= "000000000100000000";--ADD
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000000" and constant_aaa = "000100000000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0001" and sRegister_Y_adresse = "0000" and mux_ALU_select = '1'
        and sALU_select = "000000" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "ADD failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
		
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDCYkk PC failed";
		end if;
        instruction <= "000011000000000010";--ADDCYkk
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000010" and constant_aaa = "000000000010"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "000011" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "ADDCYkk failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDCY PC failed";
		end if;
        instruction <= "000010000100000000";--ADDCY
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000000" and constant_aaa = "000100000000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0001" and sRegister_Y_adresse = "0000" and mux_ALU_select = '1'
        and sALU_select = "000010" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "ADDCY failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ANDkk PC failed";
		end if;
        instruction <= "001001000000000010";--ANDkk
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000010" and constant_aaa = "000000000010"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "001001" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "ANDkk failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "AND PC failed";
		end if;
        instruction <= "001000000000010000";--AND
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00010000" and constant_aaa = "000000010000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0001" and mux_ALU_select = '1'
        and sALU_select = "001000" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "AND failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "CALL PC failed";
		end if;
        instruction <= "100001000000001000";--CALL 
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00001000" and constant_aaa = "000000001000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "00"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "100001" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '1' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "CALL  failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '1' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "JUMP failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "CALLC PC failed";
		end if;
        carry <= '1';
        instruction <= "100010000000001000";--CALLC 
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00001000" and constant_aaa = "000000001000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "00"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "100010" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '1' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "CALLC  failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '1' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "JUMP failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "CALLNC PC failed";
		end if;
        carry <= '0';
        instruction <= "100011000000001000";--CALLNC 
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00001000" and constant_aaa = "000000001000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "00"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "100011" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '1' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "CALLNC  failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '1' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "JUMP failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "CALLZ PC failed";
		end if;
        zero <= '1';
        instruction <= "100101000000001000";--CALLZ 
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00001000" and constant_aaa = "000000001000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "00"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "100101" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '1' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "CALLZ  failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '1' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "JUMP failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "CALLNZ PC failed";
		end if;
        zero <= '0';
        instruction <= "100100000000001000";--CALLNZ 
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00001000" and constant_aaa = "000000001000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "00"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "100100" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '1' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "CALLNZ  failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '1' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "JUMP failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "COMPAREkk PC failed";
		end if;
        instruction <= "011011000000000010";--COMPAREkk
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000010" and constant_aaa = "000000000010"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "011011" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "COMPAREkk failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "COMPARE PC failed";
		end if;
        instruction <= "011010000000010000";--COMPARE
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00010000" and constant_aaa = "000000010000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0001" and mux_ALU_select = '1'
        and sALU_select = "011010" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "COMPARE failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "FETCH PC failed";
		end if;
        instruction <= "010010000000010000";--FETCH
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00010000" and constant_aaa = "000000010000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "01"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0001" and mux_ALU_select = '1'
        and sALU_select = "010010" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '1' )) then
			err_cnt := err_cnt+1;
			report "FETCH failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '1')) then
		    err_cnt := err_cnt+1;
			report "Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "FETCHkk PC failed";
		end if;
        instruction <= "010011000000000010";--FETCHkk
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000010" and constant_aaa = "000000000010"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "01"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "010011" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '1' )) then
			err_cnt := err_cnt+1;
			report "FETCHkk failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '1')) then
		    err_cnt := err_cnt+1;
			report "Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "INPUT PC failed";
		end if;
        instruction <= "010110000000010000";--INPUT
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00010000" and constant_aaa = "000000010000"
		and mux_i_o_select = '1' and sIO_write_or_read = '0' and mux_register_select = "00"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0001" and mux_ALU_select = '0'
        and sALU_select = "010110" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "INPUT failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '1' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "INPUTkk PC failed";
		end if;
        instruction <= "010111000000000010";--INPUTkk
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000010" and constant_aaa = "000000000010"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "00"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "010111" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "INPUTkk failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '1' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "JUMP PC failed";
		end if;
        instruction <= "100110000000000100";--JUMP
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000100" and constant_aaa = "000000000100"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "00"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "100110" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '1' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "JUMP failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '1' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "JUMP failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "JUMPC PC failed";
		end if;
        carry <= '1';
        instruction <= "100111000000000100";--JUMPC
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000100" and constant_aaa = "000000000100"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "00"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "100111" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '1' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "JUMPC failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '1' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "JUMP failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "JUMPNC PC failed";
		end if;
        carry <= '0';
        instruction <= "101000000000000100";--JUMPNC
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000100" and constant_aaa = "000000000100"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "00"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "101000" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '1' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "JUMPNC failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '1' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "JUMP failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "JUMPZ PC failed";
		end if;
        zero <= '1';
        instruction <= "101010000000000100";--JUMPZ
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000100" and constant_aaa = "000000000100"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "00"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "101010" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '1' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "JUMPZ failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '1' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "JUMP failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "JUMPNZ PC failed";
		end if;
        zero <= '0';
        instruction <= "101001000000000100";--JUMPNZ
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000100" and constant_aaa = "000000000100"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "00"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "101001" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '1' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "JUMPNZ failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '1' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "JUMP failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "LOAD PC failed";
		end if;
        instruction <= "001110000000010000";--LOAD
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00010000" and constant_aaa = "000000010000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0001" and mux_ALU_select = '1'
        and sALU_select = "001110" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "LOAD failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "LOADkk PC failed";
		end if;
        instruction <= "001111000000000010";--LOADkk
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000010" and constant_aaa = "000000000010"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "001111" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "LOADkk failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "OR PC failed";
		end if;
        instruction <= "001010000000010000";--OR
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00010000" and constant_aaa = "000000010000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0001" and mux_ALU_select = '1'
        and sALU_select = "001010" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "OR failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ORkk PC failed";
		end if;
        instruction <= "001011000000000010";--ORkk
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000010" and constant_aaa = "000000000010"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "001011" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "ORkk failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "OUTPUT PC failed";
		end if;
        instruction <= "010100000000010000";--OUTPUT
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00010000" and constant_aaa = "000000010000"
		and mux_i_o_select = '1' and sIO_write_or_read = '1' and mux_register_select = "00"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0001" and mux_ALU_select = '0'
        and sALU_select = "010100" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "OUTPUT failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '1' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "OUTPUTpp PC failed";
		end if;
        instruction <= "010101000000000010";--OUTPUTpp
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000010" and constant_aaa = "000000000010"
		and mux_i_o_select = '0' and sIO_write_or_read = '1' and mux_register_select = "00"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "010101" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "OUTPUTpp failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '1' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "RETURN PC failed";
		end if;
        instruction <= "101011000000000000";--RETURN
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000000" and constant_aaa = "000000000000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "00"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "101011" and mux_stack_select = '1' and sStack_write_or_read = '1'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "RETURN failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '1' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "JUMP failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "RETURNC PC failed";
		end if;
        carry <= '1';
        instruction <= "101100000000000000";--RETURNC
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000000" and constant_aaa = "000000000000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "00"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "101100" and mux_stack_select = '1' and sStack_write_or_read = '1'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "RETURNC failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '1' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "JUMP failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "RETURNNC PC failed";
		end if;
        carry <= '0';
        instruction <= "101101000000000000";--RETURNNC
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000000" and constant_aaa = "000000000000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "00"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "101101" and mux_stack_select = '1' and sStack_write_or_read = '1'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "RETURNNC failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '1' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "JUMP failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "RETURNZ PC failed";
		end if;
        zero <= '1';
        instruction <= "101110000000000000";--RETURNZ
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000000" and constant_aaa = "000000000000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "00"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "101110" and mux_stack_select = '1' and sStack_write_or_read = '1'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "RETURNZ failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '1' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "JUMP failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "RETURNNZ PC failed";
		end if;
        zero <= '0';
        instruction <= "101111000000000000";--RETURNNZ
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000000" and constant_aaa = "000000000000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "00"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "101111" and mux_stack_select = '1' and sStack_write_or_read = '1'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "RETURNNZ failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '1' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "JUMP failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "RL PC failed";
		end if;
        instruction <= "110000000000000000";--RL
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000000" and constant_aaa = "000000000000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "110000" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "RL failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "RR PC failed";
		end if;
        instruction <= "110001000000000000";--RR
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000000" and constant_aaa = "000000000000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "110001" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "RR failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "SL0 PC failed";
		end if;
        instruction <= "110010000000000000";--SL0
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000000" and constant_aaa = "000000000000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "110010" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "SL0 failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "SL1 PC failed";
		end if;
        instruction <= "110011000000000000";--SL1
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000000" and constant_aaa = "000000000000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "110011" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "SL1 failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "SLA PC failed";
		end if;
        instruction <= "110100000000000000";--SLA
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000000" and constant_aaa = "000000000000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "110100" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "SLA failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "SLX PC failed";
		end if;
        instruction <= "110101000000000000";--SLX
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000000" and constant_aaa = "000000000000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "110101" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "SLX failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "SR0 PC failed";
		end if;
        instruction <= "110110000000000000";--SR0
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000000" and constant_aaa = "000000000000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "110110" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "SR0 failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "SR1 PC failed";
		end if;
        instruction <= "110111000000000000";--SR1
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000000" and constant_aaa = "000000000000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "110111" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "SR1 failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "SRA PC failed";
		end if;
        instruction <= "111000000000000000";--SRA
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000000" and constant_aaa = "000000000000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "111000" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "SRA failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "SRX PC failed";
		end if;
        instruction <= "111001000000000000";--SRX
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000000" and constant_aaa = "000000000000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "111001" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "SRX failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "STORE PC failed";
		end if;
        instruction <= "010000000000010000";--STORE
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00010000" and constant_aaa = "000000010000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "00"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0001" and mux_ALU_select = '1'
        and sALU_select = "010000" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "STORE failed";
		end if;
		
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '1')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "STOREss PC failed";
		end if;
        instruction <= "010001000000000010";--STOREss
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000010" and constant_aaa = "000000000010"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "00"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "010001" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "STOREss failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '1')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "SUB PC failed";
		end if;
        instruction <= "000100000000010000";--SUB
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00010000" and constant_aaa = "000000010000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0001" and mux_ALU_select = '1'
        and sALU_select = "000100" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "SUB failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "SUBkk PC failed";
		end if;
        instruction <= "000101000000000010";--SUBkk
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000010" and constant_aaa = "000000000010"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "000101" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "SUBkk failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "SUBCY PC failed";
		end if;
        instruction <= "000110000000010000";--SUBCY
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00010000" and constant_aaa = "000000010000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0001" and mux_ALU_select = '1'
        and sALU_select = "000110" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "SUBCY failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "SUBCYkk PC failed";
		end if;
        instruction <= "000111000000000010";--SUBCYkk
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000010" and constant_aaa = "000000000010"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "000111" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "SUBCYkk failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "TEST PC failed";
		end if;
        instruction <= "011000000000010000";--TEST
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00010000" and constant_aaa = "000000010000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0001" and mux_ALU_select = '1'
        and sALU_select = "011000" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "TEST failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "TESTkk PC failed";
		end if;
        instruction <= "011001000000000010";--TESTkk
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000010" and constant_aaa = "000000000010"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "011001" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "TESTkk failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "XOR PC failed";
		end if;
        instruction <= "001100000000010000";--XOR
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00010000" and constant_aaa = "000000010000"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0001" and mux_ALU_select = '1'
        and sALU_select = "001100" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "XOR failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        wait for WaitTime;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
        if (not(
		sPC_enable <= '1' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "XORkk PC failed";
		end if;
        instruction <= "001101000000000010";--XORkk
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "IP failed";
		end if;
        wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(constant_kk = "00000010" and constant_aaa = "000000000010"
		and mux_i_o_select = '0' and sIO_write_or_read = '0' and mux_register_select = "11"
        and sRegister_X_adresse = "0000" and sRegister_Y_adresse = "0000" and mux_ALU_select = '0'
        and sALU_select = "001101" and mux_stack_select = '0' and sStack_write_or_read = '0'
        and mux_PC_select = '0' and sRAM_write_or_read = '0' )) then
			err_cnt := err_cnt+1;
			report "XORkk failed";
		end if;
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ID failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ADDkk Reg read and Ram failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '1' and 
		sRegister_write_enable <= '0' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "ALU failed";
		end if;
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		if (not(
		sPC_enable <= '0' and 
		sALU_enable <= '0' and 
		sRegister_write_enable <= '1' and 
		sStack_enable <= '0' and
        sIO_enable <= '0' and 
        sRAM_enable <= '0')) then
		    err_cnt := err_cnt+1;
			report "WB failed";
		end if;
        
		
		
		
        
        if err_cnt = 0 then
            report "Overall Test Passed";
        else
            report "Overall Test Failed";
        end if; 
        wait;
    end process;

end Behavioral;
