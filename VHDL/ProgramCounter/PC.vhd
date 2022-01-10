library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;

entity PC is
    port (pc_i : in std_logic_vector(11 downto 0);
    enable_i : in std_logic;
    reset_i : in std_logic;
    clk_i : in std_logic;

    pc_o : out std_logic_vector(11 downto 0));
end PC;

architecture Behavioral of PC is

    signal tmp_s : std_logic_vector(11 downto 0) := "000000000000"; --temporary value of next instruction

begin
    operations : process (clk_i, reset_i, enable_i, pc_i)
    begin
        if reset_i = '1' then
            tmp_s <= "000000000000";
        else
            if enable_i = '1' then
                if rising_edge(clk_i) then
                    tmp_s <= pc_i;
                end if;
            end if;
        end if;

    end process operations;
    pc_o <= tmp_s;
end Behavioral;