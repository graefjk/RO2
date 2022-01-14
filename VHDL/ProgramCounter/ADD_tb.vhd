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

entity sim_ADD_tb is
    --  Port ( );
end sim_ADD_tb;

architecture Behavioral of sim_ADD_tb is
    component ADD
        port (
            sA_i : in std_ulogic_vector(11 downto 0);
            sB_o : out std_ulogic_vector(11 downto 0));
    end component;

    signal sA_s : std_ulogic_vector(11 downto 0);
    signal clk_s : std_logic;
    signal sB_s : std_ulogic_vector(11 downto 0);

    constant clk_period : time := 20 ns;

begin

    uut : ADD port map(
        sA_i => sA_s,
        sB_o => sB_s);

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

        sA_s <= (others => '0');
        sA_s(0) <= '0';
        wait for 1 ns;
        if (not(sB_s(0) = '1')) then
            err_cnt := err_cnt + 1;
            report "00+01=01 Failed";
        end if;

        wait for 3 ns;

        sA_s <= (others => '0');
        sA_s(0) <= '1';
        wait for 1 ns;
        if (not(sB_s(1 downto 0) = "10")) then
            err_cnt := err_cnt + 1;
            report "01+01=10 Failed";
        end if;

        wait for 3 ns;

        sA_s <= (others => '0');
        sA_s(1 downto 0) <= "10";
        wait for 1 ns;
        if (not(sB_s(1 downto 0) = "11")) then
            err_cnt := err_cnt + 1;
            report "10+01=11 Failed";
        end if;

        wait for 3 ns;

        sA_s <= (others => '1');
        sA_s(1 downto 0) <= "11";
        wait for 1 ns;
        if (not(sB_s(11 downto 0) = "000000000000")) then
            err_cnt := err_cnt + 1;
            report "...111 + ...001 = ...000 Failed";
        end if;

        wait for 3 ns;

        sA_s <= (others => '1');
        sA_s(1 downto 0) <= "10";
        wait for 1 ns;
        if (not(sB_s(11 downto 0) = "111111111111")) then
            err_cnt := err_cnt + 1;
            report "...110 + ...001 = ...111 Failed";
        end if;

        wait for 3 ns;

        if err_cnt = 0 then
            report "Overall Test Passed";
        else
            report "Overall Test Failed";
        end if;
        wait;
    end process;

end Behavioral;