----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2017 10:57:44 AM
-- Design Name: 
-- Module Name: sim_registers1 - Behavioral
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

entity sim_registers1 is
--  Port ( );
end sim_registers1;

architecture Behavioral of sim_registers1 is
component registers
    generic(    register_width_g: integer := 8; 
                register_select_size_g: integer := 4);
    Port ( write_data_i : in std_ulogic_vector(register_width_g -1 downto 0);
           write_address_i : in std_ulogic_vector(register_select_size_g -1 downto 0);
           write_enable_i : in std_ulogic;
           read_X_address_i : in std_ulogic_vector(register_select_size_g -1 downto 0);
           read_Y_address_i : in std_ulogic_vector(register_select_size_g -1 downto 0);
           reset_i : in std_ulogic;
           clk_i : in std_ulogic;
           read_X_data_o : out std_ulogic_vector(register_width_g -1 downto 0);
           read_Y_data_o : out std_ulogic_vector(register_width_g -1 downto 0));
end component;

signal write_data : std_ulogic_vector(7 downto 0);
signal write_address :  std_ulogic_vector(3 downto 0); 
signal write_enable :  std_ulogic;
signal read_X_address :  std_ulogic_vector(3 downto 0);
signal read_Y_address :  std_ulogic_vector(3 downto 0);
signal rst :  std_ulogic;
signal clk :  std_ulogic;
signal read_X_data :  std_ulogic_vector(7 downto 0);
signal read_Y_data :  std_ulogic_vector(7 downto 0);

constant clk_period : time := 20 ns;

begin

uut: registers
    port map (write_data, write_address, write_enable, read_X_address, read_Y_address, rst, clk, read_X_data, read_Y_data);

    clk_process : process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;
    
    rst_process : process
    begin
        rst <= '0';
        wait for 15 ns;
        rst <= '1';
        wait for 15 ns;
        rst <= '0';
        wait;
    end process;
    
    stimuli : process
    variable err_cnt: integer := 0; 
    begin
	wait for 45 ns;
	
	read_X_address <= "0000";
	read_Y_address <= "1100";
	
	wait for 10 ns;
	
	write_address <= "0000";
	write_data <= "11010100";
	write_enable <= '1';
	wait for 20 ns;
	
	write_address <= "1100";
	write_data <= "10010010";
	write_enable <= '1';	

	
    wait for 20 ns;
	write_enable <= '0';	
	write_address <= "0000";
	write_data <= "11111111";
	wait;
    end process;

end Behavioral;
