-- (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:IO:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use work.bus_multiplexer_pkg.all;

ENTITY design_1_IO_0_0 IS
    generic (number_of_cores : positive := 1);
  PORT (
    port_id_i : in bus_array(number_of_cores - 1 downto 0,7 downto 0);
    value_i : in bus_array(number_of_cores - 1 downto 0,7 downto 0);
    value_o : out bus_array(number_of_cores - 1 downto 0,7 downto 0);
    in_out_i : in std_ulogic_vector (number_of_cores - 1 downto 0);
    enable_i : in std_ulogic_vector (number_of_cores - 1 downto 0);
    clk_i : IN STD_LOGIC;
    mio_b : INOUT STD_ULOGIC_VECTOR(53 DOWNTO 0);
    port_b : INOUT STD_LOGIC_VECTOR(70 DOWNTO 0):= (others => 'Z');
    port_i : IN STD_ULOGIC_VECTOR(19 DOWNTO 0);
    port_o : OUT STD_ULOGIC_VECTOR(7 DOWNTO 0);
    reset_o : OUT STD_LOGIC
  );
END design_1_IO_0_0;

ARCHITECTURE design_1_IO_0_0_arch OF design_1_IO_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_IO_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT IO IS
    generic (number_of_cores : positive := number_of_cores);
    PORT (
      port_id_i : in bus_array(number_of_cores - 1 downto 0,7 downto 0);
      value_i : in bus_array(number_of_cores - 1 downto 0,7 downto 0);
      value_o : out bus_array(number_of_cores - 1 downto 0,7 downto 0);
      in_out_i : in std_ulogic_vector (number_of_cores - 1 downto 0);
      enable_i : in std_ulogic_vector (number_of_cores - 1 downto 0);
      clk_i : IN STD_LOGIC;
      mio_b : INOUT STD_ULOGIC_VECTOR(53 DOWNTO 0);
      port_b : INOUT STD_LOGIC_VECTOR(70 DOWNTO 0):= (others => 'Z');
      port_i : IN STD_ULOGIC_VECTOR(19 DOWNTO 0);
      port_o : OUT STD_ULOGIC_VECTOR(7 DOWNTO 0);
      reset_o : OUT STD_LOGIC
    );
  END COMPONENT IO;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF design_1_IO_0_0_arch: ARCHITECTURE IS "IO,Vivado 2020.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design_1_IO_0_0_arch : ARCHITECTURE IS "design_1_IO_0_0,IO,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF design_1_IO_0_0_arch: ARCHITECTURE IS "design_1_IO_0_0,IO,{x_ipProduct=Vivado 2020.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=IO,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF design_1_IO_0_0_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF reset_o: SIGNAL IS "XIL_INTERFACENAME reset_o, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF reset_o: SIGNAL IS "xilinx.com:signal:reset:1.0 reset_o RST";
BEGIN
  U0 : IO
    generic map(number_of_cores => number_of_cores)
    PORT MAP (
      port_id_i => port_id_i,
      value_i => value_i,
      in_out_i => in_out_i,
      enable_i => enable_i,
      value_o => value_o,
      clk_i => clk_i,
      mio_b => mio_b,
      port_b => port_b,
      port_i => port_i,
      port_o => port_o,
      reset_o => reset_o
    );
END design_1_IO_0_0_arch;
