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
library work;
use work.microcontroller_package.all;

entity Microcontroller is
    port(   clk_i: in std_ulogic;
            --
            DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );--IO ports
            DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
            DDR_cas_n : inout STD_LOGIC;
            DDR_ck_n : inout STD_LOGIC;
            DDR_ck_p : inout STD_LOGIC;
            DDR_cke : inout STD_LOGIC;
            DDR_cs_n : inout STD_LOGIC;
            DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
            DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
            DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
            DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
            DDR_odt : inout STD_LOGIC;
            DDR_ras_n : inout STD_LOGIC;
            DDR_reset_n : inout STD_LOGIC;
            DDR_we_n : inout STD_LOGIC;
            FIXED_IO_ddr_vrn : inout STD_LOGIC;
            FIXED_IO_ddr_vrp : inout STD_LOGIC;
            FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
            FIXED_IO_ps_clk : inout STD_LOGIC;
            FIXED_IO_ps_porb : inout STD_LOGIC;
            FIXED_IO_ps_srstb : inout STD_LOGIC;
            port_b : inout std_ulogic_vector ( 70 downto 0 );
            port_i : in std_ulogic_vector ( 19 downto 0 );
            port_o : out std_ulogic_vector ( 7 downto 0 );
            reset_o: in std_ulogic);
end Microcontroller;

architecture Behavioral of Microcontroller is

--inputs on toplevel
signal reset_s: std_ulogic;
signal clk_s: std_ulogic;

--register outputs:
signal read_X_data_s: std_ulogic_vector(architecture_width_c -1 downto 0);
signal read_Y_data_s: std_ulogic_vector(architecture_width_c -1 downto 0);

--ram outputs:
signal sRAM_read_data_s: std_ulogic_vector(architecture_width_c -1 downto 0);

--stack outputs:
signal sStack_s: std_ulogic_vector(instruction_address_c -1 downto 0);
signal full_s: std_ulogic;
signal empty_s: std_ulogic;



signal mux_PC_select_s: std_logic;
signal mux_stack_select_s: std_logic;
signal mux_register_select_s: std_ulogic_vector(1 downto 0);
signal mux_ALU_select_s: std_logic;
signal mux_i_o_select_s: std_logic;

signal mux_register_s: std_ulogic_vector(architecture_width_c -1 downto 0);

signal pc_i_s: std_ulogic_vector(instruction_address_c -1 downto 0);
signal pc_s: std_ulogic_vector(instruction_address_c -1 downto 0);
signal sADD_x_s: std_ulogic_vector(architecture_width_c -1 downto 0);
signal sADD_y_s: std_ulogic_vector(instruction_address_c -1 downto 0);
signal sADD_s: std_ulogic_vector(instruction_address_c -1 downto 0);
signal instruction_s: std_ulogic_vector(17 downto 0);
--signal port_id_s: std_logic;
signal value_i_s: std_ulogic_vector(architecture_width_c -1 downto 0);
signal value_o_s: std_ulogic_vector(architecture_width_c -1 downto 0);
signal port_b_s: std_ulogic_vector(architecture_width_c -1 downto 0);

--register input signals
signal write_data_s: std_ulogic_vector(architecture_width_c -1 downto 0);
signal write_address_s:std_ulogic_vector(register_select_size_c -1 downto 0);
signal sRegister_X_adresse_s: std_ulogic_vector(register_select_size_c -1 downto 0);
signal sRegister_Y_adresse_s: std_ulogic_vector(register_select_size_c -1 downto 0);
signal sRegister_write_enable_s: std_ulogic;

--ram input signals
signal sRAM_write_or_read_s: std_ulogic;
signal sRAM_enable_s: std_logic;
signal sRAM_address_s: std_ulogic_vector(ram_select_size_c -1 downto 0);
signal sRAM_write_data_s: std_ulogic_vector(architecture_width_c -1 downto 0);


--stack input signals
signal sStack_write_or_read_s: std_ulogic;
signal sStack_enable_s: std_ulogic;



signal sALU_select_s: std_ulogic_vector(5 downto 0);
signal sALU_s: std_ulogic_vector(7 downto 0);
signal sCARRY_s: std_logic;
signal sZERO_s: std_logic;
signal sB_s: std_ulogic_vector(7 downto 0);


signal constant_kk_s: std_ulogic_vector(7 downto 0);
signal constant_aaa_s: std_ulogic_vector(11 downto 0);

signal sPC_enable_s: std_logic;
signal sADD_enable_s: std_logic;

signal sIO_write_or_read_s: std_logic;
signal sIO_enable_s: std_logic;
signal sALU_enable_s: std_logic;

begin
registers_instance: registers
    generic map(    register_width_g => architecture_width_c,
                    register_select_size_g => register_select_size_c)
    port map(       write_data_i => write_data_s,
				    write_address_i => write_address_s,
				    write_enable_i => sRegister_write_enable_s,
				    read_X_address_i => sRegister_X_adresse_s,
				    read_Y_address_i => sRegister_Y_adresse_s,
				    reset_i => reset_s,
				    clk_i => clk_s,
				    read_X_data_o => read_X_data_s,
				    read_Y_data_o => read_Y_data_s);

ram_instance: ram
    generic map(    ram_width_g => architecture_width_c,
                    ram_select_size_g => ram_select_size_c,
                    ram_style_g => ram_style_c)
    port map(   clk_i => clk_s,
				write_or_read_i => sRAM_write_or_read_s,
				enable_i => sRAM_enable_s,
				address_i => sRAM_address_s,
				write_data_i => sRAM_write_data_s,
				read_data_o => sRAM_read_data_s);


stack_instance: stack
generic map(    instruction_address_g => instruction_address_c,
                stack_depth_g  => stack_depth_c,
                stack_style_g  => stack_style_c)
port map(       sPC_i => pc_s,
		        write_or_read_i => sStack_write_or_read_s,
				enable_i => sStack_enable_s,
				reset_i => reset_s,
				clk_i => clk_s,
				sStack_o => sStack_s,
				full_o => full_s,
				empty_o => empty_s);
		
ip_instance: IP
    port map(   pc_i => pc_s,
				clk_i => clk_s,
				instruction_o => instruction_s);
					
decoder_instance: Decoder
    port map(   instruction_i => instruction_s,  
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
					


io_instance: design_1_wrapper
    port map(   port_id_i => port_b_s,
				value_i => read_X_data_s, 
				in_out_i => sIO_write_or_read_s,
				enable_i => sIO_enable_s,
				value_o => value_i_s,
				clk_i => clk_s,
                DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
                DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
                DDR_cas_n => DDR_cas_n,
                DDR_ck_n => DDR_ck_n,
                DDR_ck_p => DDR_ck_p,
                DDR_cke => DDR_cke,
                DDR_cs_n => DDR_cs_n,
                DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
                DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
                DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
                DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
                DDR_odt => DDR_odt,
                DDR_ras_n => DDR_ras_n,
                DDR_reset_n => DDR_reset_n,
                DDR_we_n => DDR_we_n,
                FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
                FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
                FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
                FIXED_IO_ps_clk => FIXED_IO_ps_clk,
                FIXED_IO_ps_porb => FIXED_IO_ps_porb,
                FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
                port_b(70 downto 0) => port_b(70 downto 0),
                port_i(19 downto 0) => port_i(19 downto 0),
                port_o(7 downto 0) => port_o(7 downto 0),
                reset_o => reset_s);

				
											
alu_instance: ALU
    port map(   sA_i => read_X_data_s,
				sB_i => sB_s,
				opcode_select_i => sALU_select_s,
				reset_i => reset_s,
				clk_i => clk_s,
				enable_i => sALU_enable_s,
				sALU_o => sALU_s,
				sCARRY_o => sCARRY_s,
				sZERO_o => sZERO_s);
				
	
					

pc_instance: PC
    port map(   pc_i => pc_i_s,
                enable_i => sPC_enable_s,
                reset_i => reset_s,
                clk_i => clk_s,
                pc_o => pc_s);
				
				
				
add_instance: ADD
    port map(   sA_i => sADD_y_s,
				sB_i => "000000000001",
				reset_i => reset_s,
				clk_i => clk_s,
				sC_o => sADD_s);

				
				
mux_PC_instance: MUX
    generic map(mux_width_g => 12)
    port map(   mux_s0_i => sADD_s,
				mux_s1_i => constant_aaa_s,
				mux_select_i => mux_PC_select_s,
				mux_o => pc_i_s);	

				
				
mux_Stack_instance: MUX
    generic map(mux_width_g => 12)
    port map(   mux_s0_i => pc_s,
				mux_s1_i => sStack_s,
				mux_select_i => mux_stack_select_s,
				mux_o => sADD_y_s);	
				

				
mux_register1_instance: MUX
    port map(   mux_s0_i => value_i_s,
				mux_s1_i => mux_register_s,
				mux_select_i => mux_register_select_s(0),
				mux_o => write_data_s);		
				

				
mux_register2_instance: MUX
    port map(   mux_s0_i => sRAM_read_data_s,
				mux_s1_i => sALU_s,
				mux_select_i => mux_register_select_s(1),
				mux_o => mux_register_s);	
									

				
mux_ALU_instance: MUX
    port map(   mux_s0_i => constant_kk_s,
				mux_s1_i => read_Y_data_s,
				mux_select_i => mux_ALU_select_s,
				mux_o => sB_s);	
									

				
mux_i_o_instance: MUX
    port map(   mux_s0_i => constant_kk_s,
				mux_s1_i => read_Y_data_s,
				mux_select_i => mux_i_o_select_s,
				mux_o => port_b_s);	
				
				
				
--top level mapping					
clk_s <= clk_i;


end Behavioral;
