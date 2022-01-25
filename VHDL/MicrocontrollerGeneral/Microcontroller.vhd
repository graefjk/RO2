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
use work.bus_multiplexer_pkg.all;

entity Microcontroller is
    port(   clk_i: in std_ulogic;
            --reset_i: in std_ulogic;
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
            port_b : inout std_logic_vector ( 70 downto 0 );
            port_i : in std_ulogic_vector ( 19 downto 0 );
            port_o : out std_ulogic_vector ( 7 downto 0 ));
            --reset_o: in std_ulogic);
end Microcontroller;

architecture Behavioral of Microcontroller is

--inputs on toplevel
signal reset_s: std_ulogic;
signal reset_IO_s: std_ulogic;
signal clk_s: std_ulogic;

type array_type is array (number_of_cores - 1 downto 0) of std_ulogic_vector(7 downto 0);
signal port_id_core_s : array_type ;
signal value_i_core_s : array_type ;
signal value_o_core_s : array_type ;
signal port_id_s : bus_array(number_of_cores - 1 downto 0,7 downto 0);
signal value_i_s : bus_array(number_of_cores - 1 downto 0,7 downto 0);
signal value_o_s : bus_array(number_of_cores - 1 downto 0,7 downto 0);
signal in_out_s : std_ulogic_vector (number_of_cores - 1 downto 0);
signal enable_s : std_ulogic_vector (number_of_cores - 1 downto 0);

begin

io_instance: design_1_wrapper
    generic map(number_of_cores => number_of_cores)
    port map(   port_id_i => port_id_s,
				value_i => value_i_s, 
				in_out_i => in_out_s,
				enable_i => enable_s,
				value_o => value_o_s,
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
Cores:for i in number_of_cores - 1 downto 0 generate
    core_instance: Core
    generic map(File_Name => File_Name & integer'image(i) & File_Ending)
    port map(
           clk_i => clk_s,
		   reset_i=> reset_s,
           port_id_i => port_id_core_s(i),
           value_i => value_i_core_s(i),
           value_o => value_o_core_s(i),
           in_out_i => in_out_s(i),
           enable_i => enable_s(i)
    );
end generate;

Array_to_Bus:for i in number_of_cores - 1 downto 0 generate
    value_o_core_s(i) <= get_row(value_o_s,i);
    set_row(value_i_s,i,value_i_core_s(i));
    set_row(port_id_s,i,port_id_core_s(i));
end generate;

clk_s <= clk_i;

end Behavioral;
