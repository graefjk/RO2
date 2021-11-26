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
         clk_i: in std_logic;
         reset_i: in std_logic;
         
         constant_kk_o: out std_logic_vector(7 downto 0); -- output signals -- Constant
         constant_aaa_o: out std_logic_vector(11 downto 0);
         
         mux_i_o_select_o: out std_logic; -- i/o signals
         
         mux_register_select_o: out std_logic_vector(1 downto 0); --register signals
	 sRegister_X_adresse_o: out std_logic_vector(3 downto 0); 
         sRegister_Y_adresse_o: out std_logic_vector(3 downto 0);
	 sRegister_write_enable_o: out std_logic;
         
         mux_ALU_select_o: out std_logic; --ALU signals
         sALU_select_o: out std_logic_vector(5 downto 0);
         
         
         mux_stack_select_o: out std_logic; --stack signals
         sStack_enable_o: out std_logic;
         
         mux_PC_select_o: out std_logic_vector(1 downto 0);-- PC signals
         or_PC_o: out std_logic;
         
         store_fetch_o: out std_logic; -- RAM signals
         sRAM_enable_o: out std_logic);
end Decoder;

architecture Behavioral of Decoder is

begin


end Behavioral;
