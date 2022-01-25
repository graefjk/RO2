--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
--Date        : Thu Jan 13 20:57:18 2022
--Host        : DESKTOP-PUMQHVF running 64-bit major release  (build 9200)
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use work.bus_multiplexer_pkg.all;
entity design_1_wrapper is
    generic (number_of_cores : positive := 1);
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
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
    clk_i : in STD_ULOGIC;
    port_b : inout STD_LOGIC_VECTOR ( 70 downto 0 ) := (others => 'Z');
    port_i : in STD_ULOGIC_VECTOR ( 19 downto 0 );
    port_o : out STD_ULOGIC_VECTOR ( 7 downto 0 );
    reset_o : out STD_ULOGIC;
    port_id_i : in bus_array(number_of_cores - 1 downto 0,7 downto 0);
    value_i : in bus_array(number_of_cores - 1 downto 0,7 downto 0);
    value_o : out bus_array(number_of_cores - 1 downto 0,7 downto 0);
    in_out_i : in std_ulogic_vector (number_of_cores - 1 downto 0);
    enable_i : in std_ulogic_vector (number_of_cores - 1 downto 0)
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
    generic (number_of_cores : positive := number_of_cores);
  port (
    clk_i : in STD_ULOGIC;
    port_o : out STD_ULOGIC_VECTOR ( 7 downto 0 );
    port_id_i : in bus_array(number_of_cores - 1 downto 0,7 downto 0);
    value_i : in bus_array(number_of_cores - 1 downto 0,7 downto 0);
    value_o : out bus_array(number_of_cores - 1 downto 0,7 downto 0);
    in_out_i : in std_ulogic_vector (number_of_cores - 1 downto 0);
    enable_i : in std_ulogic_vector (number_of_cores - 1 downto 0);
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    port_b : inout STD_LOGIC_VECTOR ( 70 downto 0 ):= (others => 'Z');
    port_i : in STD_ULOGIC_VECTOR ( 19 downto 0 );
    reset_o : out STD_ULOGIC
  );
  end component design_1;
begin
design_1_i: component design_1
    generic map(number_of_cores => number_of_cores)
     port map (
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
      clk_i => clk_i,
      enable_i => enable_i,
      in_out_i => in_out_i,
      port_b(70 downto 0) => port_b(70 downto 0),
      port_i(19 downto 0) => port_i(19 downto 0),
      port_id_i => port_id_i,
      port_o(7 downto 0) => port_o(7 downto 0),
      reset_o => reset_o,
      value_i => value_i,
      value_o => value_o
    );
end STRUCTURE;
