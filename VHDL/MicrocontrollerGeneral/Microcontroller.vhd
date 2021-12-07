----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2021 12:00:50
-- Design Name: 
-- Module Name: Microcontroller - Behavioral
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

entity Microcontroller is
--  Port ( );
end Microcontroller;

architecture Behavioral of Microcontroller is
component ALU
    Port (
		sA_i: in std_logic_vector(7 downto 0); --input signals
		sB_i: in std_logic_vector(7 downto 0);
		opcode_select_i: in std_logic_vector(5 downto 0);
		reset_i: in std_logic;
		clk_i: in std_logic;
       
		sALU_o: out std_logic_vector(7 downto 0); -- output signals
		sCARRY_o: out std_logic;
		sZERO_o: out std_logic);
end component;

component Decoder
	Port ( instruction_i: in std_logic_vector(17 downto 0); -- input signals
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
        sRAM_enable_o: out std_logic);
end component;

component registers
    generic(    register_width_g: integer := 8; 
                register_select_size_g: integer := 4);
    Port ( write_data_i : in std_ulogic_vector(register_width_g -1 downto 0);
           write_address_i : in std_ulogic_vector(register_select_size_g -1 downto 0);
           write_enable_i : in std_ulogic;
           read_X_address_i : in std_ulogic_vector(register_select_size_g -1 downto 0);
           read_Y_address_i : in std_ulogic_vector(register_select_size_g -1 downto 0);
           reset_i : in std_logic;
           clk_i : in std_logic;
           read_X_data_o : out std_ulogic_vector(register_width_g -1 downto 0);
           read_Y_data_o : out std_ulogic_vector(register_width_g -1 downto 0));
end component;

component rams_sp_wf 
    generic(
        ram_width_g: integer := 8; 
        ram_select_size_g: integer := 8
    );
    port(
        clk_i : in std_ulogic;
        write_or_read_i : in std_ulogic;
        enable_i : in std_ulogic;
        address_i : in std_ulogic_vector(ram_select_size_g -1 downto 0);
        write_data_i   : in  std_ulogic_vector(ram_width_g -1 downto 0);
        read_data_o : out std_ulogic_vector(ram_width_g -1 downto 0);
        reset_i : in std_ulogic
    );
end component;

component IO
    Port ( port_id_i : in std_ulogic_vector(7 downto 0);
           value_i : in std_ulogic_vector(7 downto 0);
           in_out_i : in std_ulogic_vector(7 downto 0);
           enable_i : in std_ulogic;
           value_o : out std_ulogic_vector(7 downto 0);
           clk_i : in std_ulogic;
           port_b : inout std_ulogic_vector (256 downto 0));
end component;

component IP
    Port ( pc_i : in STD_LOGIC;
           clk_i : in STD_LOGIC;
           instruction_o : out STD_LOGIC);
end component;

--signal sA: std_logic_vector(7downto 0);
--signal sB: std_logic_vector(7downto 0);
-- signal opcode_select: std_logic_vector(5 downto 0);
signal reset: std_logic;
signal clk: std_logic;

-- signal sALU: std_logic_vector(7 downto 0);
-- signal sCARRY: std_logic;
-- signal sZERO: std_logic;

-- constant clk_period: time := 20 ns;

begin

uut: ALU port map (sA, sB, opcode_select, reset, clk, sALU, sCARRY, sZERO);

    clk_process: process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;
    
    rst_process: process
    begin
        reset <= '0';
        wait for 275 ns;
        --reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait;
    end process;
    
    

end Behavioral;
