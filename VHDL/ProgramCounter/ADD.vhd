library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;

entity ADD is
    port (  sA_i : in std_ulogic_vector(11 downto 0);
            sB_o : out std_ulogic_vector(11 downto 0));
end ADD;

architecture Behavioral of ADD is

    signal increment : std_ulogic_vector(11 downto 0) := "000000000001";

begin
    sB_o <= to_stdulogicvector(to_stdlogicvector(sA_i) + to_stdlogicvector(increment)) when not (sA_i = "UUUUUUUUUUUU") else "000000000000";

end Behavioral;