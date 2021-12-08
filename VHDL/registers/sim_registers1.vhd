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
use std.env.finish;

entity sim_registers1 is
--  no IO needed here
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

signal write_data_s : std_ulogic_vector(7 downto 0);
signal write_address_s :  std_ulogic_vector(3 downto 0); 
signal write_enable_s :  std_ulogic;
signal read_X_address_s :  std_ulogic_vector(3 downto 0);
signal read_Y_address_s :  std_ulogic_vector(3 downto 0);
signal reset_s :  std_ulogic;
signal clk_s :  std_ulogic;
signal read_X_data_s :  std_ulogic_vector(7 downto 0);
signal read_Y_data_s :  std_ulogic_vector(7 downto 0);

constant clk_period_c : time := 20 ns;

begin

uut: registers
    port map(   write_data_i => write_data_s,
                write_address_i => write_address_s,
                write_enable_i => write_enable_s,
                read_X_address_i => read_X_address_s,
                read_Y_address_i => read_Y_address_s,
                reset_i => reset_s,
                clk_i => clk_s,
                read_X_data_o => read_X_data_s,
                read_Y_data_o => read_Y_data_s
              );

    clk_process : process
    begin
        clk_s <= '0';
        wait for clk_period_c / 2;
        clk_s <= '1';
        wait for clk_period_c / 2;
    end process;
       
    test : process
    begin
    -- reminder: rising clock edge at 10 ns + t * 20 ns
    
    --reset the register at the beginning of the test
    reset_s <= '1';
    wait for 2 ns;
    reset_s <= '0';    
    
    --test if inital reset and reading works
	wait for 3 ns;	--wait for reset, current time 5ns
	read_X_address_s <= "0000";
	read_Y_address_s <= "1111";
	wait for 10 ns;
	-- wait for the first rising clock edge and then read the output at time: 15ns
	assert read_X_data_s = "00000000" and read_Y_data_s = "00000000" report "does not reset or something with reading failed" severity error;
	
	
	--test if reading and writing works in the correct intervalls
	--if write and read are on the same address it should read the current value out of the register at the next rising clock edge
	--and it should write into the register at the same rising clock edge
	--at the next rising clock edge it should then provide the new data
	wait for 10 ns;
	-- time: 25ns, next rising clock edge at 30ns
    read_X_address_s <= "0000";
	write_address_s <= "0000";
	write_data_s <= "10101010";
	write_enable_s <= '1';
	assert read_X_data_s = "00000000" report "changed output to before even the writing clock edge" severity error;
	wait for 10 ns; -- current time 35ns
	assert read_X_data_s = "00000000" report "changed output to before the next rising clock edge after writing" severity error;
	write_enable_s <= '0';
	wait for 20 ns; --current time 55 ns
	assert read_X_data_s = "10101010" report "did not change output after rising clock edge" severity error;
	
	
	--test if the reset overrides other inputs
	wait for 5 ns; -- current time 60ns, next rising clock edge at 70ns
	write_address_s <= "1100";
	write_data_s <= "10010010";
	write_enable_s <= '1';
	read_X_address_s <= "1100";
	read_Y_address_s <= "0000";
	reset_s <= '1';
	wait for 5 ns; -- current time 65ns
	assert read_X_data_s = "00000000" report "did not reset yet, which is fine because the reset is async but not the reading of the output" severity note;
    wait for 10 ns; --current time 75ns, next rising clock edge at 90ns
    assert read_X_data_s = "00000000" and read_Y_data_s = "00000000"
        report "output did not reset after rising clock edge" severity error;
    wait for 20ns; -- current time 95ns, next rising clock edge at 110ns
	assert read_X_data_s = "00000000" and read_Y_data_s = "00000000"
    report "output change after another rising clock edge with reset still set" severity error;
    
    --check if it will read the data after reset is set back to 0
    reset_s <= '0';
    wait for 20 ns; -- current time 115ns, next rising clock edge at 130ns
    assert read_X_data_s = "00000000" and read_Y_data_s = "00000000"
        report "should still output 0 because it just read the data into memory" severity error;
    wait for 20 ns; --current time 135ns;
    assert read_X_data_s = "10010010" and read_Y_data_s = "00000000"
        report "did not output the data in memory at rising clock edge" severity error;
    
    
	wait for 200 ns;
	finish;
    end process;
    
    

end Behavioral;
