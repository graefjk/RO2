----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.11.2021 15:28:58
-- Design Name: 
-- Module Name: ALU - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
 Port (A_i: in std_logic_vector(7 downto 0); --input signals
       B_i: in std_logic_vector(7 downto 0);
       Opcode_select_i: in std_logic_vector(5 downto 0);
       reset_i: in std_logic;
       Clk_i: in std_logic;
       
       
       ALU_o: out std_logic_vector(7 downto 0); -- output signals
       CARRY_o: out std_logic;
       ZERO_o: out std_logic);
end ALU;

architecture Behavioral of ALU is

begin


end Behavioral;
