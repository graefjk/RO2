----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2017 10:57:44 AM
-- Design Name: 
-- Module Name: sim_ram1 - Behavioral
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

entity sim_ram1 is
--  Port ( );
end sim_ram1;

architecture Behavioral of sim_ram1 is
component ram
    generic(    ram_width_g: integer := 8; 
                ram_select_size_g: integer := 8);
    Port ( write_data_i : in std_ulogic_vector(ram_width_g -1 downto 0);
           address_i : in std_ulogic_vector(ram_select_size_g -1 downto 0);
           write_or_read_i : in std_ulogic;
           enable_i : in std_ulogic;
           reset_i : in std_ulogic;
           clk_i : in std_ulogic;
           read_data_o : out std_ulogic_vector(ram_width_g -1 downto 0)
           );
end component;

signal write_data : std_ulogic_vector(7 downto 0);
signal address :  std_ulogic_vector(7 downto 0); 
signal write_or_read : std_ulogic;
signal enable :  std_ulogic;
signal rst :  std_ulogic;
signal clk :  std_ulogic;
signal read_data : std_ulogic_vector(7 downto 0);

constant clk_period : time := 20 ns;

begin

uut: ram
    port map (write_data, address, write_or_read, enable, rst, clk, read_data);

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
	
	address <= "00101100";
	
	wait for 10 ns;
	write_data <= "11010100";
	write_or_read <= '1';
	enable <= '1';
	wait for 20 ns;
	
	write_or_read <= '0';	
	wait for 20 ns;	
	address <= "00000000";
	write_data <= "11111111";
	
	wait for 20 ns;
	enable <= '0';
	wait;
    end process;

end Behavioral;
