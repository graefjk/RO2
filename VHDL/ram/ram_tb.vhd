----------------------------------------------------------------------------------
-- Company: Group 2
-- Engineer: 
-- 
-- Create Date: 04/03/2017 10:57:44 AM
-- Design Name: ram testbench
-- Module Name: ram_tb - Behavioral
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

entity ram_tb is
--  no IO needed here
end ram_tb;

architecture Behavioral of ram_tb is
    component ram
        generic(    ram_width_g: integer := 8; 
                    ram_select_size_g: integer := 8;
                    ram_style_g: string := "distributed");
        port(       write_data_i : in std_ulogic_vector(ram_width_g -1 downto 0);
                    address_i : in std_ulogic_vector(ram_select_size_g -1 downto 0);
                    write_or_read_i : in std_ulogic;
                    enable_i : in std_ulogic;
                    clk_i : in std_ulogic;
                    read_data_o : out std_ulogic_vector(ram_width_g -1 downto 0));
    end component;

    signal write_data_s : std_ulogic_vector(7 downto 0);
    signal address_s :  std_ulogic_vector(7 downto 0); 
    signal write_or_read_s : std_ulogic;
    signal enable_s :  std_ulogic;
    signal clk_s :  std_ulogic;
    signal read_data_s : std_ulogic_vector(7 downto 0);

    constant clk_period : time := 20 ns;

    begin

        uut: ram
            generic map(    ram_width_g => 8,
                            ram_select_size_g => 8,
                            ram_style_g => "distributed")
            port map(   write_data_i => write_data_s,
                        address_i => address_s,
                        write_or_read_i => write_or_read_s,
                        enable_i => enable_s,
                        clk_i => clk_s,
                        read_data_o => read_data_s);

            clk_process : process
                begin
                    clk_s <= '0';
                    wait for clk_period / 2;
                    clk_s <= '1';
                    wait for clk_period / 2;
            end process;
        
            stimuli : process
                begin
	               -- reminder: rising clock edge at 10 ns + t * 20 ns
	               address_s <= "00000000";
	               write_data_s <= "10101010";
	               enable_s <= '0';
	               write_or_read_s <= '0';
	               wait for 20ns;
	               assert read_data_s = "UUUUUUUU" report "should be undefined becuase it was never enabled at rising edge" severity error;
	               
	               enable_s <= '1';
	               wait for 15 ns; --current time is 35ns, next risinge edge at 50ns
	               assert read_data_s = "00000000" report "should be zeros in the beginning after first rising edge" severity error;
	               write_or_read_s <= '1';
	               wait for 20 ns; --current time is 55ns, next risinge edge at 70ns
	               write_or_read_s <= '0';
	               assert read_data_s = "00000000" report "output should be still zeros because there was no other rising clock edge after writing" severity error;
	               
	               wait for 20 ns; --current time is 75ns, next rising edge at 90ns
	               assert read_data_s = "10101010" report "written daten does not show on output properly after next rising edge with enable=1" severity error;
	              
	              enable_s <= '0';
	              address_s <= "11111111";
	              write_or_read_s <= '0';
	              wait for 20ns; --current time is 95ns, next rising edgte at 110ns
	              assert read_data_s = "10101010" report "should still output the previous value beacause enable=0" severity error;
	              
	              
	              finish;
            end process;

end Behavioral;
