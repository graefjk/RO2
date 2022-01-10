----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.12.2021 10:57:33
-- Design Name: 
-- Module Name:  - 
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


package microcontroller_package is
    
    --generall architekture
    constant instruction_address_c : integer := 12; --size in bits for addressing a instruction in the instruction prom
    constant architecture_width_c: integer := 8; --width for the alu, the registers and scratchpadmemory
    
    --register things
    constant register_select_size_c: integer := 4; --size in bits for addressing a register
    
    --ram things
    constant ram_select_size_c: integer := 8; --size in bits for addressing a scratchpadmemory word, be aware that you can address max. architecture_with_c of ram
    constant ram_style_c: string := "distributed"; -- "registers", "distributed" or "block" can be used here
    
    --stack things
    constant stack_depth_c : integer := 128; -- depth of the stack
    constant stack_style_c : string := "distributed"; -- "registers", "distributed" or "block" can be used here

	component ADD
        port(   sA_i: in std_ulogic_vector(7 downto 0); --input signals
		        sB_i: in std_ulogic_vector(7 downto 0);
		        reset_i: in std_logic;
		        clk_i: in std_logic;
       
		        sC_o: out std_ulogic_vector(7 downto 0)); -- output signals);
    end component;

    component ALU
        port(   sA_i: in std_ulogic_vector(7 downto 0); --input signals
		        sB_i: in std_ulogic_vector(7 downto 0);
		        opcode_select_i: in std_ulogic_vector(5 downto 0);
		        reset_i: in std_logic;
		        clk_i: in std_logic;
		        enable_i: in std_logic;
       
		        sALU_o: out std_ulogic_vector(7 downto 0); -- output signals
		        sCARRY_o: out std_logic;
		        sZERO_o: out std_logic);
    end component;

    component Decoder
	    port(   instruction_i: in std_ulogic_vector(17 downto 0); -- input signals
                clk_i: in std_logic;
                reset_i: in std_logic;
        
                carry_i: in std_logic;--carry/zero
                zero_i: in std_logic;
        
                constant_kk_o: out std_ulogic_vector(7 downto 0); -- output signals -- Constant
                constant_aaa_o: out std_ulogic_vector(11 downto 0);
        
                mux_i_o_select_o: out std_logic; -- i/o signals
		        sIO_write_or_read_o: out std_logic;
		        sIO_enable_o: out std_logic;
        
                mux_register_select_o: out std_ulogic_vector(1 downto 0); --register signals
	            sRegister_X_adresse_o: out std_ulogic_vector(3 downto 0); 
                sRegister_Y_adresse_o: out std_ulogic_vector(3 downto 0);
	            sRegister_write_enable_o: out std_logic;
        
                mux_ALU_select_o: out std_logic; --ALU signals
                sALU_select_o: out std_ulogic_vector(5 downto 0);
				sALU_enable_o: out std_logic;
        
        
                mux_stack_select_o: out std_logic; --stack signals
		        sStack_write_or_read_o: out std_logic;
                sStack_enable_o: out std_logic;
        
                mux_PC_select_o: out std_logic;-- PC signal
				sPC_enable_o: out std_logic;
        
                sRAM_write_or_read_o: out std_logic; -- RAM signals
                sRAM_enable_o: out std_logic);
    end component;
	
	component IO
		Port ( 	port_id_i : in std_ulogic_vector(7 downto 0);
				value_i : in std_ulogic_vector(7 downto 0);
				in_out_i : in std_ulogic_vector(7 downto 0);
				enable_i : in std_ulogic;
				value_o : out std_ulogic_vector(7 downto 0);
				clk_i : in std_ulogic;
				mio_b : inout std_ulogic_vector (53 downto 0);
				port_b : inout std_ulogic_vector (11 downto 0));
    end component;
	
	component IP
        port(   pc_i : in std_ulogic_vector(11 downto 0);
                clk_i : in std_ulogic;
                instruction_o : out std_ulogic_vector(17 downto 0));
    end component;
	
	component MUX
		generic(    mux_width_g: integer := architecture_width_c);
		port(	    mux_s0_i: in std_ulogic_vector(mux_width_g - 1 downto 0); -- input signals
					mux_s1_i: in std_ulogic_vector(mux_width_g - 1 downto 0);
					mux_select_i: in std_ulogic; -- select signals
					mux_o : out std_ulogic_vector(mux_width_g - 1 downto 0)); -- output signals
    end component;
    	
	component PC
		port (    pc_i : in std_logic_vector(11 downto 0); -- input signals
                  enable_i : in std_logic;
                  reset_i : in std_logic;
                  clk_i : in std_logic;
                  pc_o : out std_logic_vector(11 downto 0)); -- output signals
    end component;

    component ram 
        generic(    ram_width_g: integer := architecture_width_c; 
                    ram_select_size_g: integer := ram_select_size_c;
                    ram_style_g: string := ram_style_c); -- "registers", "distributed" or "block" can be used here
        port(       write_data_i : in std_ulogic_vector(ram_width_g -1 downto 0);
                    address_i : in std_ulogic_vector(ram_select_size_g -1 downto 0);
                    write_or_read_i : in std_ulogic;
                    enable_i : in std_ulogic;
                    clk_i : in std_ulogic;
                    read_data_o : out std_ulogic_vector(ram_width_g -1 downto 0));
    end component;

    component registers
        generic(    register_width_g: integer := architecture_width_c; 
                    register_select_size_g: integer := register_select_size_c);
        port(       write_data_i : in std_ulogic_vector(register_width_g -1 downto 0);
                    write_address_i : in std_ulogic_vector(register_select_size_g -1 downto 0);
                    write_enable_i : in std_ulogic;
                    read_X_address_i : in std_ulogic_vector(register_select_size_g -1 downto 0);
                    read_Y_address_i : in std_ulogic_vector(register_select_size_g -1 downto 0);
                    reset_i : in std_logic;
                    clk_i : in std_logic;
                    read_X_data_o : out std_ulogic_vector(register_width_g -1 downto 0);
                    read_Y_data_o : out std_ulogic_vector(register_width_g -1 downto 0));
    end component;
    
    component stack
        generic(    instruction_address_g: integer := instruction_address_c;
                    stack_depth_g: integer := stack_depth_c;
                    stack_style_g: string := stack_style_c); -- "registers", "distributed" or "block" can be used here
        port(   sPC_i : in std_ulogic_vector( instruction_address_g -1 downto 0);
                write_or_read_i: in std_ulogic; -- 0 for write, 1 for read
                enable_i: in std_ulogic;
                reset_i: in std_ulogic;
                clk_i: in std_ulogic;
            
                full_o: out std_ulogic;
                empty_o: out std_ulogic;
            
                sStack_o: out std_ulogic_vector( instruction_address_g -1 downto 0)); 
    end component;

end package microcontroller_package;