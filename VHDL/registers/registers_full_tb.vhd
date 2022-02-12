----------------------------------------------------------------------------------
-- Company: Group 2
-- Engineer: Jochen Benzenhöfer
-- 
-- Create Date: 05/02/2022 10:57:44 PM
-- Design Name: registers full testbench
-- Module Name: sim_registers1 - Behavioral
-- Project Name: microcontroller
-- Target Devices: 
-- Tool Versions: 
-- Description: full testbench for the register file
-- 
-- Dependencies: library IEEE;
-- 
-- Revision:
-- Revision 0.5
-- Additional Comments: full test with asserts
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.env.finish;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity registers_full_tb is
--  no IO needed here
end registers_full_tb;

architecture Behavioral of registers_full_tb is
	component registers
		generic(	register_width_g: integer := 8; 
					register_select_size_g: integer := 4);
		port(		write_data_i : in std_ulogic_vector(register_width_g -1 downto 0);
					write_address_i : in std_ulogic_vector(register_select_size_g -1 downto 0);
					write_enable_i : in std_ulogic;
					read_X_address_i : in std_ulogic_vector(register_select_size_g -1 downto 0);
					read_Y_address_i : in std_ulogic_vector(register_select_size_g -1 downto 0);
					reset_i : in std_ulogic;
					clk_i : in std_ulogic;
					read_X_data_o : out std_ulogic_vector(register_width_g -1 downto 0);
					read_Y_data_o : out std_ulogic_vector(register_width_g -1 downto 0));
	end component;

	signal write_data_s : std_ulogic_vector(7 downto 0);
	signal write_address_s :  std_ulogic_vector(3 downto 0); 
	signal write_enable_s :  std_ulogic;
	signal read_X_address_s :  std_ulogic_vector(3 downto 0);
	signal read_Y_address_s :  std_ulogic_vector(3 downto 0);
	signal reset_s :  std_ulogic;
	signal clk_s :  std_ulogic;
	signal read_X_data_s :  std_ulogic_vector(7 downto 0);
	signal read_Y_data_s :  std_ulogic_vector(7 downto 0);

    constant register_select_size_c: integer := 4;
    constant register_width_c: integer := 8;
 	constant clk_period_c : time := 8 ns;

	begin

		uut: registers
			port map(	write_data_i => write_data_s,
						write_address_i => write_address_s,
						write_enable_i => write_enable_s,
						read_X_address_i => read_X_address_s,
						read_Y_address_i => read_Y_address_s,
						reset_i => reset_s,
						clk_i => clk_s,
						read_X_data_o => read_X_data_s,
						read_Y_data_o => read_Y_data_s);

		clk_process : process
			begin
				clk_s <= '0';
				wait for clk_period_c / 2;
				clk_s <= '1';
				wait for clk_period_c / 2;
		end process;
	   
		test : process
		    variable seed1, seed2: positive;               -- seed values for random generator
            variable rand: real;   -- random real-number value in range 0 to 1.0
            variable random_address, random_address_2: integer;
            type register_array is array(2**register_select_size_c - 1 downto 0) of std_ulogic_vector(register_width_c - 1 downto 0);
            variable randomData : register_array := (others => (others => '0'));
            
			begin
				--read uninitialized
				for i in 0 to 2**(register_select_size_c - 1) loop
					read_X_address_s <= std_ulogic_vector(to_unsigned(2*i,register_select_size_c));
					read_Y_address_s <= std_ulogic_vector(to_unsigned(2*i + 1,register_select_size_c));
					wait for clk_period_c;
				
					assert read_X_data_s = "00000000" and read_Y_data_s = "00000000" report "wrong init value" severity error;
				end loop;
				
				--init reset test
				reset_s <= '1';
				wait for clk_period_c;
				reset_s <= '0';    
				for i in 0 to 2**(register_select_size_c - 1) loop
					read_X_address_s <= std_ulogic_vector(to_unsigned(2*i,register_select_size_c));
					read_Y_address_s <= std_ulogic_vector(to_unsigned(2*i + 1,register_select_size_c));
					wait for clk_period_c;
					assert read_X_data_s = "00000000" and read_Y_data_s = "00000000" report "wrong value after reset" severity error;
				end loop;
				
				--full value test
				for i in 0 to 2**register_select_size_c - 1 loop
					write_address_s <= std_ulogic_vector(to_unsigned(i,register_select_size_c));
					for j in 0 to 2**register_width_c loop
						write_enable_s <= '1';
						write_data_s <= std_ulogic_vector(to_unsigned(j,register_width_c));
						wait for clk_period_c;
						write_enable_s <= '0';
						read_X_address_s <= std_ulogic_vector(to_unsigned(i,register_select_size_c));
					    read_Y_address_s <= std_ulogic_vector(to_unsigned(i,register_select_size_c));
						wait for clk_period_c;				
						assert read_X_data_s = std_ulogic_vector(to_unsigned(j,register_width_c)) and read_Y_data_s = std_ulogic_vector(to_unsigned(j,register_width_c)) report "wrong written value" severity error;
					end loop;
				end loop;
				
				--reset test after writes
				reset_s <= '1';
				wait for clk_period_c;
				reset_s <= '0';    
				for i in 0 to 2**(register_select_size_c - 1) loop
					read_X_address_s <= std_ulogic_vector(to_unsigned(2*i,register_select_size_c));
					read_Y_address_s <= std_ulogic_vector(to_unsigned(2*i + 1,register_select_size_c));
					wait for clk_period_c;
					assert read_X_data_s = "00000000" and read_Y_data_s = "00000000" report "wrong value after reset" severity error;
				end loop;
				
				-- random write
				for i in 0 to 2**register_width_c loop
				    uniform(seed1, seed2, rand);
				    random_address := integer(rand * Real(2**register_select_size_c - 1));
				    write_address_s <= std_ulogic_vector(to_unsigned(random_address  ,register_select_size_c));
				    write_enable_s <= '1';
				    uniform(seed1, seed2, rand);
				    randomData(random_address) := std_ulogic_vector(to_unsigned(integer(rand * Real(2**register_width_c - 1)),register_width_c));
					write_data_s <= randomData(random_address);
					wait for clk_period_c;
					write_enable_s <= '0';
					read_X_address_s <= std_ulogic_vector(to_unsigned(random_address  ,register_select_size_c));
					read_Y_address_s <= std_ulogic_vector(to_unsigned(random_address  ,register_select_size_c));
					wait for clk_period_c;				
					assert read_X_data_s = randomData(random_address) and read_Y_data_s = randomData(random_address) report "wrong written value" severity error;
				end loop;
				
				-- random read
				for i in 0 to 2**register_width_c loop
				    uniform(seed1, seed2, rand);
				    random_address := integer(rand * Real(2**register_select_size_c - 1));
				    uniform(seed1, seed2, rand);
				    random_address_2 := integer(rand * Real(2**register_select_size_c - 1));
					write_enable_s <= '0';
					read_X_address_s <= std_ulogic_vector(to_unsigned(random_address  ,register_select_size_c));
					read_Y_address_s <= std_ulogic_vector(to_unsigned(random_address_2  ,register_select_size_c));
					wait for clk_period_c;				
					assert read_X_data_s = randomData(random_address) and read_Y_data_s = randomData(random_address_2) report "wrong read value" severity error;
				end loop;
				finish;
		end process;
end Behavioral;
