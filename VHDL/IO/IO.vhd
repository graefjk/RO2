----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2021 04:06:17 PM
-- Design Name: 
-- Module Name: IO - Behavioral
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
-- From https://stackoverflow.com/questions/28468334/using-array-of-std-logic-vector-as-a-port-type-with-both-ranges-using-a-generic
package bus_multiplexer_pkg is
        type bus_array is array(natural range <>, natural range <>) of std_ulogic;

        procedure set_row(signal slm : out bus_array; constant row : natural; slv : in std_ulogic_vector(7 downto 0));
        function get_row(signal slm : in bus_array; constant row : natural) return std_ulogic_vector ;
end package;

package body bus_multiplexer_pkg is
        procedure set_row(signal slm : out bus_array; constant row : natural; slv : in std_ulogic_vector(7 downto 0)) is
        begin
                for i in 7 downto 0 loop
                        slm(row, i) <= slv(i);
                end loop;
        end procedure;

        function get_row(signal slm : in bus_array; constant row : natural) return std_ulogic_vector is
            variable slv: std_ulogic_vector(7 downto 0);
        begin
                for i in 7 downto 0 loop
                        slv(i) := slm(row, i);
                end loop;
                return slv;
        end function;
end package body;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
library unisim;
use unisim.vcomponents.all;
use work.bus_multiplexer_pkg.all;



entity IO is
    generic (number_of_cores : positive := 1);
    Port ( clk_i : in std_ulogic;
           mio_b : inout std_ulogic_vector (53 downto 0);
           port_b : inout std_logic_vector (70 downto 0):= (others => 'Z');
           port_i : in std_ulogic_vector (19 downto 0);
           port_o : out std_ulogic_vector (7 downto 0);
           reset_o: out std_ulogic;
           port_id_i : in bus_array(number_of_cores - 1 downto 0,7 downto 0);
           value_i : in bus_array(number_of_cores - 1 downto 0,7 downto 0);
           value_o : out bus_array(number_of_cores - 1 downto 0,7 downto 0);
           in_out_i : in std_ulogic_vector (number_of_cores - 1 downto 0);
           enable_i : in std_ulogic_vector (number_of_cores - 1 downto 0));
end IO;

architecture Behavioral of IO is
    type output_buffer_type is array (127 downto 0) of std_ulogic_vector(7 downto 0);
    signal output_buffer : output_buffer_type ;
	signal hdmi_clk : std_ulogic;
	type input_buffer_type is array (255 downto 0) of std_logic_vector(7 downto 0);
    signal input_buffer : input_buffer_type := (others => (others => 'Z'));--63: next systemside unused input
    
	signal pmod_out_enabled: std_ulogic_vector(3 downto 0) := "0000"; 
	
	signal reset_enable : std_ulogic_vector(7 downto 0) := "10000000";
    
    signal hdmi_data: std_ulogic_vector(2 downto 0):= "ZZZ";
    signal hdmi_data_in: std_ulogic_vector(2 downto 0):= "ZZZ";
    type parallel_tmds is array (2 downto 0) of std_ulogic_vector(9 downto 0);
    signal hdmi_in_parallel: parallel_tmds := (others => (others => 'Z'));
    
    signal hdmi_sda: std_ulogic := '0';
    signal sda_sender: std_ulogic := '0';
    signal sdc_clk: std_ulogic := '0';
    signal hdmi_hda: std_ulogic := '0';
    signal hdmi_vde: std_ulogic := '0';
    signal clkfbout_hdmi_clk, CLK_IN_hdmi_clk, CLK_OUT_1x_hdmi_clk, CLK_OUT_5x_hdmi_clk, SerialClk, PixelClk : std_logic;
    signal rMMCM_Reset,aMMCM_Locked, clkout1b_unused, clkout2_unused, clkout2b_unused, clkout3_unused, clkout3b_unused, clkout4_unused, clkout5_unused, clkout6_unused, drdy_unused, psdone_unused, clkfbstopped_unused, clkinstopped_unused, clkfboutb_unused, clkout0b_unused, clkout1_unused : std_logic;
    signal do_unused : std_logic_vector(15 downto 0);
    signal temp: std_ulogic_vector(7 downto 0);
    
begin
    
    reset_o <= '0' when (std_ulogic_vector(port_b(60 downto 53)) and reset_enable(7 downto 0)) = "00000000" else '1';
    
    pmod_out: for i in 0 to 3 generate
        port_b(16 + 8 * i downto 9 + 8 * i) <= to_stdlogicvector(output_buffer(i + 50)) when pmod_out_enabled(i) = '1' else (others => 'Z');
    end generate;
    
    
    main: process(clk_i) is
    begin
        if rising_edge(clk_i) then
            for i in number_of_cores - 1 downto 0 loop
             if enable_i(i) = '1' then
               if in_out_i(i) = '1' then
                if port_id_i(i,7) = '0' then  --Buffer output
                    output_buffer(to_integer(unsigned(get_row(port_id_i,i)))) <= get_row(value_i,i); 
                end if;
                if get_row(port_id_i,i)(6 downto 0) = "0110111" then --Toggle use Button as reset- default 10000000
                    reset_enable <= reset_enable xor get_row(value_i,i)(7 downto 0);
                    input_buffer(55) <= std_logic_vector(reset_enable);
                elsif get_row(port_id_i,i)(6 downto 0) = "0110110" then --Pmod Toggle In/Out 1-toggle
                    pmod_out_enabled <= pmod_out_enabled xor get_row(value_i,i)(3 downto 0);
                    input_buffer(54)(3 downto 0) <= std_logic_vector(pmod_out_enabled);
                end if;
               else 
                set_row(value_o,i,to_stdulogicvector(input_buffer(to_integer(unsigned(get_row(port_id_i,i))))));
               end if;
              end if;
          end loop;
        end if;
     end process;
     
     --Pmod
     Pmod:process(clk_i) is        
     begin
        if rising_edge(clk_i) then
           for i in 0 to 3 loop
            if pmod_out_enabled(i) = '0' then
                input_buffer(i + 50) <= port_b(16 + 8 * i downto 9 + 8 * i);
            end if;
           end loop;
		 end if;
     end process;
	 
     --LED
     LED: process(clk_i) is
     variable  led_clk_counter: unsigned(7 downto 0) := "11111110";
     begin
     if(rising_edge(clk_i)) then
        for i in 67 downto 61 loop
            if unsigned(output_buffer(i - 5)) > led_clk_counter then
                port_b(i) <= '1';
            else 
                port_b(i) <= '0';
            end if;
        end loop;
        if(led_clk_counter > 0) then            
            led_clk_counter := led_clk_counter - 1;
        else 
            led_clk_counter := "11111110";
        end if;
     end if;
     end process;
     
     
     --Switches/Buttons
     Sw:process(clk_i) is
     begin
     if(rising_edge(clk_i)) then
        input_buffer(62) <= port_b(60 downto 53);
     end if;
     end process;
     
     HDMI_DDC:process(hdmi_clk) is
     begin
        --if (rising_edge(hdmi_clk) or falling_edge(hdmi_clk)) then
        if rising_edge(hdmi_clk) then
            if sda_sender = '0' then
                if port_b(48) = 'Z' then
                    sda_sender <= '1';
                    port_b(51) <= 'Z';
                    if port_b(51) = 'X' then
                        port_b(48) <= not hdmi_sda;
                        hdmi_sda <= not hdmi_sda;
                    else
                        port_b(48) <= port_b(51);
                        hdmi_sda <= port_b(51);
                    end if;
                else
                    port_b(48) <= 'Z';
                    port_b(51) <= port_b(48);
                    hdmi_sda <= port_b(48);
                end if;
            else
                if port_b(51) = 'Z' then
                    sda_sender <= '0';
                    port_b(48) <= 'Z';
                    if port_b(48) = 'X' then
                        port_b(51) <= not hdmi_sda;
                        hdmi_sda <= not hdmi_sda;
                    else
                        port_b(51) <= port_b(48);
                        hdmi_sda <= port_b(48);
                    end if;
                else
                    port_b(51) <= 'Z';
                    port_b(48) <= port_b(51);
                    hdmi_sda <= port_b(51);
                end if;
            end if;
        end if;
     end process;
     
     HDMI_in:process(SerialClk, PixelClk)
     variable cycle: unsigned(3 downto 0) := "0001";
     variable new_pxl : std_ulogic:= '1';
     begin
        if rising_edge(SerialClk) then
            if (PixelClk = '1' and new_pxl = '1') or cycle > 9 then
                hdmi_in_parallel(0)(0) <= hdmi_data_in(0);
                hdmi_in_parallel(1)(0) <= hdmi_data_in(1);
                hdmi_in_parallel(2)(0) <= hdmi_data_in(2);
                cycle := "0001";
                new_pxl := '0';
            else
                hdmi_in_parallel(0)(to_integer(cycle)) <= hdmi_data_in(0);
                hdmi_in_parallel(1)(to_integer(cycle)) <= hdmi_data_in(1);
                hdmi_in_parallel(2)(to_integer(cycle)) <= hdmi_data_in(2);
                cycle := cycle + 1;
            end if; 
            if new_pxl = '0' and PixelClk = '0' then
                new_pxl := '1';
            end if;
        end if;
     end process;
     
    port_b(50) <= sdc_clk;
    sdc_clk <= port_b(47);
    
    port_b(46) <= hdmi_hda;
    hdmi_hda <= port_b(49);
    
    
    DVI_ClkGenerator: MMCME2_BASE
       generic map
          (BANDWIDTH            => "OPTIMIZED",
          CLKOUT4_CASCADE      => FALSE,
          STARTUP_WAIT         => FALSE,
          DIVCLK_DIVIDE        => 1,
          CLKFBOUT_MULT_F      => 10.0,
          CLKFBOUT_PHASE       => 0.000,
          CLKOUT0_DIVIDE_F     => 1.0,
          CLKOUT0_PHASE        => 0.000,
          CLKOUT0_DUTY_CYCLE   => 0.500)
       port map
       -- Output clocks
       (
          CLKFBOUT            => clkfbout_hdmi_clk,
          CLKFBOUTB           => clkfboutb_unused,
          CLKOUT0             => SerialClk,
          CLKOUT0B            => clkout0b_unused,
          CLKOUT1             => clkout1_unused,
          CLKOUT1B            => clkout1b_unused,
          CLKOUT2             => clkout2_unused,
          CLKOUT2B            => clkout2b_unused,
          CLKOUT3             => clkout3_unused,
          CLKOUT3B            => clkout3b_unused,
          CLKOUT4             => clkout4_unused,
          CLKOUT5             => clkout5_unused,
          CLKOUT6             => clkout6_unused,
          -- Input clock control
          CLKFBIN             => clkfbout_hdmi_clk,
          CLKIN1              => PixelClk,
          -- Other control and status signals
          LOCKED              => aMMCM_Locked,
          PWRDWN              => '0',
          RST                 => rMMCM_Reset);
    
    
    obuf : OBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (I=>hdmi_clk, O=>port_o(0), OB=>port_o(1));
    obufdata1 : OBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (I=>hdmi_data(0), O=>port_o(2), OB=>port_o(3));
    obufdata2 : OBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (I=>hdmi_data(1), O=>port_o(4), OB=>port_o(5));
    obufdata3 : OBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (I=>hdmi_data(2), O=>port_o(6), OB=>port_o(7));
    
    ibuf : IBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (O=>PixelClk, I=>port_i(0), IB=>port_i(1));
    ibufdata1 : IBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    --port map (O=>hdmi_data_in(0), I=>port_i(2), IB=>port_i(3));
    port map (O=>hdmi_data(0), I=>port_i(2), IB=>port_i(3));
    ibufdata2 : IBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    --port map (O=>hdmi_data_in(1), I=>port_i(4), IB=>port_i(5));
    port map (O=>hdmi_data(1), I=>port_i(4), IB=>port_i(5));
    ibufdata3 : IBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    --port map (O=>hdmi_data_in(2), I=>port_i(6), IB=>port_i(7));
    port map (O=>hdmi_data(2), I=>port_i(6), IB=>port_i(7));
    
end Behavioral;

				 
