----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.11.2021 15:37:19
-- Design Name: 
-- Module Name: Decoder - Behavioral
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

entity Decoder is
  Port ( instruction_i: in std_logic_vector(17 downto 0); -- input signals
         Clk_i: in std_logic;
         reset_i: in std_logic;
         
         constant_kk_o: out std_logic_vector(7 downto 0); -- output signals -- Constant
         constant_aaa_o: out std_logic_vector(11 downto 0);
         
         MUX_i_o_select_o: out std_logic; -- i/o signals
         
         register_X_ID_o: out std_logic_vector(3 downto 0); --register signals
         register_Y_ID_o: out std_logic_vector(3 downto 0);
         MUX_register_select_o: out std_logic_vector(1 downto 0);
         
         MUX_ALU_select_o: out std_logic; --ALU signals
         ALU_select_o: out std_logic_vector(5 downto 0);
         
         
         MUX_stack_select_o: out std_logic; --stack signals
         Stack_enable_o: out std_logic;
         
         MUX_PC_select_o: out std_logic_vector(1 downto 0);-- PC signals
         OR_PC_o: out std_logic;
         
         store_fetch_o: out std_logic; -- RAM signals
         RAM_enable_o: out std_logic);
end Decoder;

architecture Behavioral of Decoder is

begin


end Behavioral;