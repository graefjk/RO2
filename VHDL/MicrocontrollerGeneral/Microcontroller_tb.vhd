----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.12.2021 12:00:50
-- Design Name: 
-- Module Name: Microcontroller_tb - Behavioral
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

entity Microcontroller_tb is
--  Port ( );
end Microcontroller_tb;

architecture Behavioral of Microcontroller_tb is
component Microcontroller
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
            port_b : inout std_ulogic_vector ( 70 downto 0 );
            port_i : in std_ulogic_vector ( 19 downto 0 );
            port_o : out std_ulogic_vector ( 7 downto 0 ));
end component;

signal reset_s: std_logic;
signal clk_s: std_logic;

signal DDR_addr: STD_LOGIC_VECTOR ( 14 downto 0 );
signal DDR_ba : STD_LOGIC_VECTOR ( 2 downto 0 );
signal DDR_cas_n : STD_LOGIC;
signal DDR_ck_n :  STD_LOGIC;
signal DDR_ck_p : STD_LOGIC;
signal DDR_cke : STD_LOGIC;
signal DDR_cs_n : STD_LOGIC;
signal DDR_dm : STD_LOGIC_VECTOR ( 3 downto 0 );
signal DDR_dq : STD_LOGIC_VECTOR ( 31 downto 0 );
signal DDR_dqs_n : STD_LOGIC_VECTOR ( 3 downto 0 );
signal DDR_dqs_p : STD_LOGIC_VECTOR ( 3 downto 0 );
signal DDR_odt : STD_LOGIC;
signal DDR_ras_n : STD_LOGIC;
signal DDR_reset_n : STD_LOGIC;
signal DDR_we_n : STD_LOGIC;
signal FIXED_IO_ddr_vrn : STD_LOGIC;
signal FIXED_IO_ddr_vrp : STD_LOGIC;
signal FIXED_IO_mio : STD_LOGIC_VECTOR ( 53 downto 0 );
signal FIXED_IO_ps_clk : STD_LOGIC;
signal FIXED_IO_ps_porb : STD_LOGIC;
signal FIXED_IO_ps_srstb : STD_LOGIC;
signal port_b : std_ulogic_vector ( 71 downto 0 );
signal port_i : std_ulogic_vector ( 19 downto 0 );
signal port_o : std_ulogic_vector ( 7 downto 0 );

constant clk_period: time := 20 ns;
constant waitTime: time := 0 ns;

begin

uut: Microcontroller port map (
			--reset_i => reset_s, 
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
            port_o(7 downto 0) => port_o(7 downto 0));

    clk_process: process
    begin
        clk_s <= '0';
        wait for clk_period / 2;
        clk_s <= '1';
        wait for clk_period / 2;
    end process;
    

    
    stimuli: process
    begin
		reset_s <= '0';
		wait for 120 ns;

    end process;

end Behavioral;
