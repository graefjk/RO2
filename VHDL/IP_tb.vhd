
library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity IP_tb is

end entity IP_tb;

-------------------------------------------------------------------------------

architecture sim of IP_tb is

  -- component ports
  signal pc    : std_ulogic_vector(11 downto 0) := (others => '0');
  signal inst    : std_ulogic_vector(17 downto 0);

  -- clock
  signal clk : std_ulogic := '1';

begin  -- architecture sim

  -- component instantiation
  DUT : entity work.IP
    port map (
      pc_i    => pc,
      clk_i    => clk,
      instruction_o => inst
      );
      
  clk <= not clk after 10 ns;
  process
  variable seed1, seed2: positive;               -- seed values for random generator
    variable rand: real;   -- random real-number value in range 0 to 1.0  
    variable range_of_rand : real := 1000.0;    -- the range of random values created will be 0 to +1000.
begin
    wait for 5 ns;
    uniform(seed1, seed2, rand);   -- generate random number
    pc <= std_ulogic_vector(to_unsigned(integer(rand*range_of_rand),12));  -- rescale to 0..1000, convert integer part 
    wait for 5 ns;
end process;
  
end architecture sim;

-------------------------------------------------------------------------------

configuration ip_tb_sim_cfg of ip_tb is
  for sim
  end for;
end ip_tb_sim_cfg;

-------------------------------------------------------------------------------
