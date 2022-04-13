----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Tobias Weinschenk
-- 
-- Create Date: 13.12.2021 11:53:29
-- Design Name: 
-- Module Name: stack_tb - Behavioral
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


entity stack_tb_post is
--  no IO needed here
end stack_tb_post;

architecture Behavioral of stack_tb_post is
    component stack
        port(   sPC_i : in std_logic_vector( 12 -1 downto 0);
                write_or_read_i: in std_logic; -- 0 for write, 1 for read
                enable_i: in std_logic;
                reset_i: in std_logic;
                clk_i: in std_logic;
            
                 full_o: out std_logic;
                 empty_o: out std_logic;
            
                 sStack_o: out std_logic_vector( 12 -1 downto 0)
         );
    end component;
    
    signal sPC_s : std_logic_vector( 11 downto 0);
    signal write_or_read_s: std_logic; -- 0 for write, 1 for read
    signal enable_s: std_logic;
    signal reset_s: std_logic;
    signal clk_s: std_logic;
            
    signal full_s: std_logic;
    signal empty_s: std_logic;
            
    signal sStack_s: std_logic_vector( 11 downto 0);
    
    constant clk_period_c : time := 20 ns;
    
    begin
    
        uut: stack
            port map(   sPC_i => sPC_s,
                        write_or_read_i => write_or_read_s,
                        enable_i => enable_s,
                        reset_i => reset_s,
                        clk_i => clk_s,
                        full_o => full_s,
                        empty_o => empty_s,
                        sStack_o => sStack_s);
         
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
		          
		          reset_s <= '0';
		          
		          --check if the stack does not read if it is empty
		          enable_s <= '1';
		          write_or_read_s <= '1';
		          wait for 15ns; -- current time 15ns, next rising edge at 30ns
		          assert sStack_s = X"FFF" report "should be FFF because the stack should not read if it is empty" severity error;
		          
		          assert full_s = '0' report "full should be 0 at the start" severity error;
		          assert empty_s = '1' report "empty should be 1 at the start" severity error;
		          
		          --write a single value into stack
		          write_or_read_s <= '0';
		          sPC_s <= X"FFF";
		          wait for 20ns; --current time 35ns, next rising edge at 50ns
		          assert empty_s = '0' report "stack should not be empty anymore after writing" severity error;
		          
		          --check if the stack does something if enabled = 0
		          enable_s <= '0';
		          wait for 20ns; --current time 55ns, next rising edge at 70ns
		          --check manually in the simulation for any write activity here
		          write_or_read_s <= '1'; --now reading again
		          wait for 20ns; --current time 75ns, next rising edge at 90ns;
		          assert sStack_s = X"FFF" report "should still be FFF because we never read anything and enabled = 0 at the moment" severity error;
		          
		          enable_s <= '1';
		          wait for 20ns; --current time 95ns, next rising edge at 110ns;
		          assert sStack_s = X"FFF" report "error while reading" severity error;
		          assert empty_s = '1' report "stack should now be empty again" severity error;
		          
		          --fill the stack
		          write_or_read_s <= '0';
		          sPC_s <= X"FFF";
		          wait for 20ns * 127;
		          sPC_s <= X"FF0"; --other value for the last entry
		          wait for 20ns; --current time 2655ns, next rising edge at 2670ns
		          assert full_s = '1' report "stack should now be full" severity error;
		          
		          --let the stack be enabled on writing mode for 2 more rising edges - nothing should happen now, if so it would produce errors for the next reading test
		          wait for 40ns; --current time 2695ns, next rising edge at 2710ns
		          		          
		          write_or_read_s <= '1';
		          wait for 20ns; --current time 2715ns, next rising edge at 2730ns
		          assert sStack_s = X"FF0" report "error while reading the first time after filling the stack" severity error;
		          assert full_s = '0' report "stack should not be full anymore after reading" severity error;
		          wait for 20ns; --current time 2735ns, next rising edge at 2750ns
		          assert sStack_s = X"FFF" report "error while reading the second time after filling the stack" severity error;
		          
		          --test reset now
		          reset_s <= '1';
		          wait for 5ns; --current time 2740ns, next rising edge at 2750ns
		          assert sStack_s = X"FFF" report "output should be FFF with reset=1" severity error;
		          assert full_s = '0' report "stack should not be full after reset" severity error;
		          assert empty_s = '1' report "stack should be empty after reset" severity error;
		          reset_s <= '0';
		          
		          --check if the stack is writing and reading after reset again
		          write_or_read_s <= '1'; --now reading again
		          wait for 20ns; --current time 2760ns, next rising edge at 2770ns
		          assert sStack_s = X"FFF" report "stack should not read anything because it is empty" severity error;
		          
		          write_or_read_s <= '0'; --writing
		          sPC_s <= X"111";
		          wait for 20ns; --current time 2680ns, next rising edge at 2790ns
		          assert empty_s = '0' report "stack should not be empty after writing" severity error;
		          write_or_read_s <= '1'; --reading
		          wait for 20ns; --current time 2700ns, next rising edge at 2810ns
		          assert sStack_s = X"111" report "error while reading after reset" severity error;
		          assert empty_s = '1' report "stack should be empty after reading last item" severity error;
				finish;
		          
		  end process;            
        


end Behavioral;
