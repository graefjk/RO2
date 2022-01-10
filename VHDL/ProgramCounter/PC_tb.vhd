----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 04.12.2021 12:00:50
-- Design Name:
-- Module Name: sim_PC_tb - Behavioral
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
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sim_PC_tb is
    --  Port ( );
end sim_PC_tb;

architecture Behavioral of sim_PC_tb is
    component PC
        port (
            pc_i : in std_logic_vector(11 downto 0);
            enable_i : in std_logic;
            reset_i : in std_logic;
            clk_i : in std_logic;

            pc_o : out std_logic_vector(11 downto 0));
    end component;

    signal pc_s : std_logic_vector(11 downto 0);
    signal enable_s : std_logic;
    signal reset_s : std_logic;
    signal clk_s : std_logic;
    signal pc_o_s : std_logic_vector(11 downto 0);

    constant clk_period : time := 20 ns;

begin

    uut : PC port map(
        enable_i => enable_s,
        reset_i => reset_s,
        clk_i => clk_s,
        pc_i => pc_s,
        pc_o => pc_o_s);

    clk_process : process
    begin
        clk_s <= '0';
        wait for clk_period / 2;
        clk_s <= '1';
        wait for clk_period / 2;
    end process;

    stimuli : process
        variable err_cnt : integer := 0;
    begin
        enable_s <= '1';
        reset_s <= '0';
        pc_s <= "000000000000";
        wait for 120 ns;

        enable_s <= '1';
        reset_s <= '0';
        pc_s <= "010101010101";
        wait until rising_edge(clk_s);
        wait until falling_edge(clk_s);
        if (not(pc_o_s = "010101010101")) then
            err_cnt := err_cnt + 1;
            report "counting Failed";
        end if;

        enable_s <= '0';
        reset_s <= '0';
        pc_s <= "000000000110";
        wait until rising_edge(clk_s);
        wait until falling_edge(clk_s);
        if (not(pc_o_s = "010101010101")) then
            err_cnt := err_cnt + 1;
            report "set a new value, even tho enable_s was 0";
        end if;

        enable_s <= '1';
        reset_s <= '1';
        pc_s <= "010101010101";
        wait until rising_edge(clk_s);
        wait until falling_edge(clk_s);
        if (not(pc_o_s = "000000000000")) then
            err_cnt := err_cnt + 1;
            report "resetting (enable = 1) Failed";
        end if;

        pc_s <= "010101010101";
        wait for 120 ns; --set the value to something != 0

        enable_s <= '0';
        reset_s <= '1';
        pc_s <= "010101010101";
        wait until rising_edge(clk_s);
        wait until falling_edge(clk_s);
        if (not(pc_o_s = "000000000000")) then
            err_cnt := err_cnt + 1;
            report "resetting (enable = 0) Failed";
        end if;

        if err_cnt = 0 then
            report "Overall Test Passed";
        else
            report "Overall Test Failed";
        end if;
        wait;
    end process;

end Behavioral;