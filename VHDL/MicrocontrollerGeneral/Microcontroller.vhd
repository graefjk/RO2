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
		enable_i: in std_logic;
       
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

signal reset_s: std_logic;
signal clk_s: std_logic;

signal mux_PC_select_s: std_logic;
signal mux_stack_select_s: std_logic;
signal mux_register_select_s: std_logic_vector(1 downto 0);
signal mux_ALU_select_s: std_logic;
signal mux_i_o_select_s: std_logic;

signal pc_i_s: std_logic;
signal pc_s: std_logic;
signal sADD_x_s: std_logic;
signal sADD_y_s: std_logic;
signal sADD_s: std_logic;
signal sStack_s: std_logic;
signal full_s: std_logic;
signal empty_s: std_logic;
signal instruction_s: std_logic;
signal port_id_s: std_logic;
signal value_i_s: std_logic;
signal value_o_s: std_logic;
signal port_b_s: std_logic;
signal write_data_s: std_logic;
signal sRegister_X_adresse_s: std_logic;
signal sRegister_Y_adresse_s: std_logic;
signal read_X_data_s: std_logic;
signal read_Y_data_s: std_logic;
signal sB_s: std_logic;
signal sALU_select_s: std_logic;
signal sALU_s: std_logic;
signal sCARRY_s: std_logic;
signal sZERO_s: std_logic;
signal sZERO_s: std_logic;

signal constant_kk_s: std_logic;
signal constant_aaa_s: std_logic;

signal sPC_enable_s: std_logic;
signal sADD_enable_s: std_logic;
signal sStack_write_or_read_s: std_logic;
signal sStack_enable_s: std_logic;
signal sIO_write_or_read_s: std_logic;
signal sIO_enable_s: std_logic;
signal sRegister_write_enable_s: std_logic;
signal sALU_enable_s: std_logic;
signal sRAM_write_or_read_s: std_logic;
signal read_data_s: std_logic;

-- constant clk_period: time := 20 ns;

begin

uut: PC port map (	pc_i => pc_i_s,
					enable_i => sPC_enable_s,
					reset_i => reset_s,
					clk_i => clk_s,
					pc_o => pc_s);
		
uut: ADD port map (	sADD_x_i => sADD_x_s,
					sADD_y_i => sADD_y_s,
					enable_i => sADD_enable_s,
					reset_i => reset_s,
					clk_i => clk_s,
					sADD_o => sADD_s);

uut: Stack port map (	sPC_i => pc_s,
						write_or_read_i => sStack_write_or_read_s,
						enable_i => sStack_enable_s,
						reset_i => reset_s,
						clk_i => clk_s,
						sStack_o => sStack_s,
						full_o => full_s,
						empty_o => empty_s);
		
uut: IP port map (	pc_i => pc_s,
					clk_i => clk_s,
					instruction_o => instruction_s);
					
uut: Decoder port map (	instruction_i => instruction_s,  
						reset_i => reset_s, 
						clk_i => clk_s,
						carry_i => sCARRY_s, 
						zero_i => sZERO_s, 
						constant_kk_o => constant_kk_s, 
						constant_aaa_o => constant_aaa_s, 
						mux_i_o_select_o => mux_i_o_select_s, 
						sIO_write_or_read_o => sIO_write_or_read_s, 
						sIO_enable_o => sIO_enable_s, 
						mux_register_select_o => mux_register_select_s,
						sRegister_X_adresse_o => sRegister_X_adresse_s,
						sRegister_Y_adresse_o => sRegister_Y_adresse_s,
						sRegister_write_enable_o => sRegister_write_enable_s,
						mux_ALU_select_o => mux_ALU_select_s,
						sALU_select_o => sALU_select_s,
						sALU_enable_o => sALU_enable_s,
						mux_stack_select_o => mux_stack_select_s,
						sStack_write_or_read_o => sStack_write_or_read_s,
						sStack_enable_o => sStack_enable_s,
						mux_PC_select_o => mux_PC_select_s,
						sPC_enable_o => sPC_enable_s,
						sRAM_write_or_read_o => sRAM_write_or_read_s,
						sRAM_enable_o => sRAM_enable_s);
						
uut: IO port map ( 	port_id_i => port_id_s,
					value_i => value_i_s,
					in_out_i => sIO_write_or_read_s,
					enable_i => sIO_enable_s,
					value_o => value_o_s
					clk_i => clk_s
					port_b => port_b_s);
					
uut: registers port map (	write_data_i => write_data_s,
							write_address_i => sRegister_X_adresse_s,
							write_enable_i => sRegister_write_enable_s,
							read_X_address_i => sRegister_X_adresse_s,
							read_Y_address_i => sRegister_Y_adresse_s,
							reset_i => reset_s,
							clk_i => clk_s,
							read_X_data_o => read_X_data_s,
							read_Y_data_o => read_Y_data_s);
							
uut: ALU port map (	sA_i => read_X_data_s,
					sB_i => sB_s,
					opcode_select_i => sALU_select_s,
					reset_i => reset_s,
					clk_i => clk_s,
					enable_i => sALU_enable_s,
					sALU_o => sALU_s,
					sCARRY_o => sCARRY_s,
					sZERO_o => sZERO_s);
					
uut: rams_sp_wf port map (	clk_i => clk_s,
							write_or_read_i => sRAM_write_or_read_s,
							enable_i => sRAM_enable_s,
							address_i => sB_s,
							write_data_i => read_X_data_s,
							read_data_o => read_data_s);

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
