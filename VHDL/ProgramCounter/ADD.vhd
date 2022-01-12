library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;

entity ADD is --kann überschrieben werden nur aus testgründen erstellt
    port (pc_i : in std_ulogic_vector(11 downto 0);
    enable_i : in std_logic;
    reset_i : in std_logic;
    clk_i : in std_logic;

    pc_o : out std_ulogic_vector(11 downto 0));
end ADD;

architecture Behavioral of ADD is

    signal tmp_s : std_ulogic_vector(11 downto 0) := "000000000000"; --temporary value of next instruction

begin

end Behavioral;