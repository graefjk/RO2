library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;

entity ADD is --kann überschrieben werden nur aus testgründen erstellt
    port (  sA_i : in std_ulogic_vector(11 downto 0);
            sB_i : in std_ulogic_vector(11 downto 0);
            reset_i : in std_ulogic;
            clk_i : in std_ulogic;
            sC_o : out std_ulogic_vector(11 downto 0));
end ADD;

architecture Behavioral of ADD is

    signal tmp_s : std_ulogic_vector(11 downto 0) := "000000000000"; --temporary value of next instruction

begin

end Behavioral;