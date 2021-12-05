----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2021 16:19:03
-- Design Name: 
-- Module Name: sim_Decoder_tb - Behavioral
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

-- we define an empty entity because the use of this module is 
--to run a test-simulation for the the processor's part Decoder 
entity sim_Decoder_tb is
--  Port ( );
end sim_Decoder_tb;

-- we write and define the simulation data in the architecture part of our module
architecture Behavioral of sim_Decoder_tb is
-- we create a new component Decoder,
-- which represents the Decoder part in our processor
component Decoder
   port(instruction_i: in std_logic_vector(17 downto 0); -- input signals
         clk_i: in std_logic;
         reset_i: in std_logic;
         
         carry_i: in std_logic;--carry/zero
         zero_i: in std_logic;
         
         constant_kk_o: out std_logic_vector(7 downto 0); -- output signals -- Constant
         constant_aaa_o: out std_logic_vector(11 downto 0);
         
         mux_i_o_select_o: out std_logic; -- i/o signals
		 sIO_write_or_read_o: out std_logic;
		 sIO_enable_o: out std_logic;
         
         mux_register_select_o: out std_logic_vector(1 downto 0); --register signals
	     sRegister_X_adresse_o: out std_logic_vector(3 downto 0); 
         sRegister_Y_adresse_o: out std_logic_vector(3 downto 0);
	     sRegister_write_enable_o: out std_logic;
         
         mux_ALU_select_o: out std_logic; --ALU signals
         sALU_select_o: out std_logic_vector(5 downto 0);
         
         
         mux_stack_select_o: out std_logic; --stack signals
		 sStack_write_or_read_o: out std_logic;
         sStack_enable_o: out std_logic;
         
         mux_PC_select_o: out std_logic;-- PC signal
         
         sRAM_write_or_read_o: out std_logic; -- RAM signals
         sRAM_enable_o: out std_logic
   );
end component;

-- we create internal signals which will be used in our simulation
        signal instruction_i_s: std_logic_vector(17 downto 0); -- input signals
        signal clk_i_s: std_logic;
        signal reset_i_s:  std_logic;
         
        signal carry_i_s: std_logic;--carry/zero
        signal zero_i_s:  std_logic;
         
        signal constant_kk_o_s:  std_logic_vector(7 downto 0); -- output signals -- Constant
        signal constant_aaa_o_s:  std_logic_vector(11 downto 0);
         
        signal mux_i_o_select_o_s:  std_logic; -- i/o signals
		signal sIO_write_or_read_o_s:  std_logic;
		signal sIO_enable_o_s:  std_logic;
         
        signal mux_register_select_o_s:  std_logic_vector(1 downto 0); --register signals
	    signal sRegister_X_adresse_o_s:  std_logic_vector(3 downto 0); 
        signal sRegister_Y_adresse_o_s:  std_logic_vector(3 downto 0);
	    signal sRegister_write_enable_o_s:  std_logic;
         
        signal mux_ALU_select_o_s:  std_logic; --ALU signals
        signal sALU_select_o_s:  std_logic_vector(5 downto 0);
         
         
        signal mux_stack_select_o_s:  std_logic; --stack signals
		signal sStack_write_or_read_o_s:  std_logic;
        signal sStack_enable_o_s:  std_logic;
         
        signal mux_PC_select_o_s:  std_logic;-- PC signal
         
        signal sRAM_write_or_read_o_s:  std_logic; -- RAM signals
        signal sRAM_enable_o_s:  std_logic;
    -- we define a new constant clk_period 
    -- and give it the type time and the value of 20 ns  
    -- this constant will be used to define our tact-period  
        constant clk_period: time := 20 ns;
begin
-- we map our signals into the defined component Decoder
uut: Decoder port map(instruction_i_s,-- input signals
                      clk_i_s,
                      reset_i_s,
                      
                      carry_i_s,--carry/zero
                      zero_i_s,
                      
                      constant_kk_o_s, -- output signals -- Constant
                      constant_aaa_o_s,
                      
                      mux_i_o_select_o_s, -- i/o signals
                      sIO_write_or_read_o_s,
                      sIO_enable_o_s,
                      
                      mux_register_select_o_s, --register signals
                      sRegister_X_adresse_o_s,
                      sRegister_Y_adresse_o_s,
                      sRegister_write_enable_o_s,
                      
                      mux_ALU_select_o_s, --ALU signals
                      sALU_select_o_s,
                      
                      mux_stack_select_o_s, --stack signals
                      sStack_write_or_read_o_s,
                      sStack_enable_o_s,
                      
                      mux_PC_select_o_s,-- PC signal
                      
                      sRAM_write_or_read_o_s, -- RAM signals
                      sRAM_enable_o_s                     
);
-- we use a process operatin to define our clk wich will change its value
--every 10 ns which makes our period-value equals to 20ns
    clk_process: process
    begin
        clk_i_s <= '0';
        wait for clk_period / 2;
        clk_i_s <= '1';
        wait for clk_period / 2;
    end process;
    
-- we use a process operation to make the simulation reset all values 
--to its initial value which is 0 after 1000ns  
     rst_process: process
    begin
        reset_i_s <= '0';
        wait for 1000 ns;
        reset_i_s <= '1';
        wait for 20 ns;
        reset_i_s <= '0';
        wait;
    end process;
    
   -- here we write the defirent simulation cases 
 stimuli: process 
   begin
   instruction_i_s<="000000101011100110";  --ADD
   carry_i_s<='1';
   zero_i_s<='1';
   wait for 20ns;
   
   instruction_i_s<="000001101011100110";  --ADDkk
   carry_i_s<='1';
   zero_i_s<='1';
   wait for 20ns; 

   instruction_i_s<="000010101011100110";  --ADDCY
   carry_i_s<='1';
   zero_i_s<='1';
   wait for 20ns;
   
   instruction_i_s<="000000101011100110";  --ADDCYkk
   carry_i_s<='1';
   zero_i_s<='1';
   wait for 20ns;  
      
 end process;
end Behavioral;
