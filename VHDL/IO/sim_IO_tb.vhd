----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2022 11:09:36 PM
-- Design Name: 
-- Module Name: IO_tb - Behavioral
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
use ieee.numeric_std.all;
use ieee.math_real.all;
library unisim;
use unisim.vcomponents.all;
use work.bus_multiplexer_pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IO_tb is
constant number_of_cores: positive := 1;
end IO_tb;

architecture Behavioral of IO_tb is
    component design_1_wrapper
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
				port_id_i : in bus_array(number_of_cores - 1 downto 0,7 downto 0);
                value_i : in bus_array(number_of_cores - 1 downto 0,7 downto 0);
                value_o : out bus_array(number_of_cores - 1 downto 0,7 downto 0);
                in_out_i : in std_ulogic_vector (number_of_cores - 1 downto 0);
                enable_i : in std_ulogic_vector (number_of_cores - 1 downto 0);
				clk_i : in STD_LOGIC;
				port_b : inout std_logic_vector ( 70 downto 0 );
				port_i : in std_ulogic_vector ( 19 downto 0 );
				port_o : out std_ulogic_vector ( 7 downto 0 );
				reset_o : out STD_ULOGIC
        );
    end component;
    
    signal clk_s: std_logic;
    signal reset_s: std_logic;
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
    signal port_b_s : std_logic_vector ( 70 downto 0 ) := (others => 'Z');
    signal port_i : std_ulogic_vector ( 19 downto 0 );
    signal port_o : std_ulogic_vector ( 7 downto 0 );
    signal value_i_s: std_ulogic_vector(7 downto 0);
    signal value_o_s: std_ulogic_vector(7 downto 0);
    signal port_id_s: std_ulogic_vector(7 downto 0);
    signal in_out_s: std_logic;
    signal enable_s: std_logic;
    
    signal port_id_o_s: bus_array(number_of_cores - 1 downto 0,7 downto 0);
    signal value_o_o_s: bus_array(number_of_cores - 1 downto 0,7 downto 0);
    signal value_i_i_s: bus_array(number_of_cores - 1 downto 0,7 downto 0);
    
    constant clk_period: time := 8 ns;    
    constant clk_period_hdmi: time := 6.734 ns;
    constant ser_clk_period_hdmi: time := 0.6734 ns;
    
    signal clk_hdmi_s: std_ulogic;
    signal ser_clk_hdmi_s: std_ulogic;
    signal rec_clk_hdmi_s: std_ulogic;
    signal send_value_hdmi: std_ulogic_vector(2 downto 0) := "000";
    signal rec_value_hdmi: std_ulogic_vector(2 downto 0) := "ZZZ";
    
    signal err_cnt_led :integer := 0;
    signal err_cnt_sw :integer := 0;
    signal err_cnt_pmod :integer := 0;
    signal err_cnt_hdmi :integer := 0;
    
    type LED_type is array (0 to 6) of integer;
    signal LED_ontime: LED_type := (others => 0);
    signal LED_test_length: std_logic_vector(10 downto 0) := (others => 'Z');
    signal LED_setontime : LED_type := (others => 0);
    
    
    signal clkfbout_hdmi_clk : std_logic;
    signal rMMCM_Reset,aMMCM_Locked, clkout1b_unused, clkout2_unused, clkout2b_unused, clkout3_unused, clkout3b_unused, clkout4_unused, clkout5_unused, clkout6_unused, clkfboutb_unused, clkout0b_unused, clkout1_unused : std_logic;
    type parallel_tmds is array (2 downto 0) of std_ulogic_vector(9 downto 0);
    signal hdmi_data_buffer,hdmi_data_buffer_in, hdmi_out_parallel: parallel_tmds := (others => (others => 'Z'));
    type input is array (2 downto 0) of std_ulogic_vector(19 downto 0);
    signal hdmi_in_parallel : input := (others => (others => 'Z'));
    type parallel_rgb is array (2 downto 0) of std_ulogic_vector(7 downto 0);
    signal hdmi_in_rgb, rgb_val, rgb_val_rec: parallel_rgb := (others => (others => 'Z'));
    signal hdmi_vde: std_ulogic := '0';--active video signal
    signal hdmi_ade: std_ulogic := '0';--active audio signal
    signal hdmi_data_type: std_ulogic_vector(5 downto 0) := "000000";-- For each channel 00- control signals, 01 video signal, 10 audio signal, 11 data signal or undefined
    signal hdmi_c: std_ulogic_vector(5 downto 0) := "000000";
    function sum_bits(u : std_ulogic_vector) return unsigned is
        variable sum : unsigned(3 downto 0);
    begin
      assert u'length < 16 report "sum_bits error";
      sum := to_unsigned(0,4);
        for i in u'range loop
         sum := sum + unsigned(u(i downto i));
        end loop;
        return sum;
    end sum_bits;


begin

    set_row(port_id_o_s,0,port_id_s);
    value_o_s <= get_row(value_o_o_s,0);
    set_row(value_i_i_s,0,value_i_s);
    
    io_instance: design_1_wrapper
        port map(   
            port_id_i => port_id_o_s,
			value_i => value_i_i_s, 
			in_out_i(0) => in_out_s,
			enable_i(0) => enable_s,
			value_o => value_o_o_s,
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
            port_b(70 downto 0) => port_b_s(70 downto 0),
            port_i(19 downto 0) => port_i(19 downto 0),
            port_o(7 downto 0) => port_o(7 downto 0),
            reset_o => reset_s);
            

    clk_process: process
    begin
        clk_s <= '0';
        wait for clk_period / 2;
        clk_s <= '1';
        wait for clk_period / 2;
    end process;
    
    clk_hdmi_process: process
    begin
        clk_hdmi_s <= '0';
        wait for clk_period_hdmi / 2;
        clk_hdmi_s <= '1';
        wait for clk_period_hdmi / 2;
    end process;
    
    port_b_s(47)<= clk_hdmi_s;
    
    ser_clk_hdmi_process: MMCME2_BASE
       generic map
          (BANDWIDTH            => "OPTIMIZED",
          CLKOUT4_CASCADE      => FALSE,
          STARTUP_WAIT         => FALSE,
          DIVCLK_DIVIDE        => 1,
          CLKFBOUT_MULT_F      => 10.0,
          CLKFBOUT_PHASE       => 0.000,
          CLKOUT0_DIVIDE_F     => 1.0,
          CLKOUT0_PHASE        => 0.000,
          CLKOUT0_DUTY_CYCLE   => 0.500,
          CLKIN1_PERIOD        => 6.734)
       port map
       -- Output clocks
       (
          CLKFBOUT            => clkfbout_hdmi_clk,
          CLKFBOUTB           => clkfboutb_unused,
          CLKOUT0             => ser_clk_hdmi_s,
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
          CLKIN1              => clk_hdmi_s,
          -- Other control and status signals
          LOCKED              => aMMCM_Locked,
          PWRDWN              => '0',
          RST                 => rMMCM_Reset);
    
    stimuli: process
    begin
        in_out_s <= '1';
        enable_s <= '1';
        value_i_s <= "10000000";
        port_id_s <= "00110111";
        wait for clk_period;
        enable_s <= '0';
        value_i_s <= "00000000";
        port_id_s <= "00000000";
        wait for clk_period;
        --LED 
        for i in 0 to 6 loop
		    port_b_s(61 + i) <= 'Z';
            enable_s <= '1';
            if i < 6 then
                value_i_s <= std_ulogic_vector(to_signed(i * 42, 8));
            else 
                value_i_s <= std_ulogic_vector(to_signed(255, 8));
            end if;
            port_id_s <= std_ulogic_vector(to_unsigned(i + 56, 8));
            in_out_s <= '1';
            wait for clk_period;            
		end loop;
		enable_s <= '1';
        value_i_s <= "00000000";
        port_id_s <= "00111110";
        in_out_s <= '0';
        for j in 0 to 5 loop
            LED_setontime(j) <= j * 42;
        end loop;
        LED_setontime(6) <= 255;
        LED_test_length <= "LLLHHHHHHHH";
        
        --Switches/Buttons
	    for k in 0 to 256 loop
	       port_b_s(60 downto 53) <= std_logic_vector(to_unsigned(k,8));
	       wait for clk_period * 2;
	       if not(value_o_s = std_ulogic_vector(to_unsigned(k,8))) then
	           err_cnt_sw <= err_cnt_sw + 1;
	           report "Switch Failed";
	       end if;
	    end loop;
	    
	    --Pmods in
	    enable_s <= '1';
        value_i_s <= "00000000";
        
        in_out_s <= '0';
	    for l in 0 to 3 loop
	       port_id_s <= std_ulogic_vector(to_unsigned(50 + l,8));
            for m in 0 to 256 loop
               port_b_s(16 + 8 * l downto 9 + 8 * l) <= std_logic_vector(to_unsigned(m,8));
               wait for clk_period * 2;
               if not(value_o_s = std_ulogic_vector(to_unsigned(m,8))) then
                   err_cnt_pmod <= err_cnt_pmod + 1;
                   report "Pmod in failed";
               end if;
            end loop;
	    end loop;
	    
	    --Pmods out
	    enable_s <= '1';
        --value_o_s <= "00000000";
        in_out_s <= '1';
        port_id_s <= std_ulogic_vector(to_unsigned(54,8));
        value_i_s <= "00001111";
        wait for clk_period;
	    for n in 0 to 3 loop
	       port_b_s(16 + 8 * n downto 9 + 8 * n) <= (others => 'Z');
	       port_id_s <= std_ulogic_vector(to_unsigned(50 + n,8));
            for o in 0 to 256 loop
               value_i_s <= std_ulogic_vector(to_unsigned(o,8));
               wait for clk_period;
               if not(port_b_s(16 + 8 * n downto 9 + 8 * n) = std_logic_vector(to_unsigned(o,8))) then
                   err_cnt_pmod <= err_cnt_pmod + 1;
                   report "Pmod in failed";
               end if;
            end loop;
	    end loop;	    
	    
	    --HDMI-DDC
	       --Single Byte Test
        wait until falling_edge(clk_hdmi_s);
	    for i in 0 to 255 loop
            port_b_s(48) <= '1';
            port_b_s(51) <= 'Z';
            wait until rising_edge(clk_hdmi_s);
            wait for clk_period_hdmi/4;
            port_b_s(48) <= '0';
            port_b_s(51) <= 'Z';
            wait for clk_period_hdmi/2;
            for j in 7 downto 0 loop
                port_b_s(48) <= to_unsigned(i,8)(j);
                port_b_s(51) <= 'Z';
                wait for clk_period_hdmi;
            end loop;
            port_b_s(51) <= '1';
            port_b_s(48) <= 'Z';
            wait until falling_edge(clk_hdmi_s);
            port_b_s(48) <= '0';
            port_b_s(51) <= 'Z';
            wait for clk_period_hdmi/2;
            wait for clk_period_hdmi/4;
            port_b_s(48) <= '1';
            port_b_s(51) <= 'Z';
            wait for clk_period_hdmi/2;
        end loop;
            --Multi Byte Test write
        wait until falling_edge(clk_hdmi_s);
        port_b_s(48) <= '1';
        port_b_s(51) <= 'Z';
        wait until rising_edge(clk_hdmi_s);
        wait for clk_period_hdmi/4;
        port_b_s(48) <= '0';
        port_b_s(51) <= 'Z';
        wait for clk_period_hdmi/2;
        for i in 0 to 255 loop
            for j in 7 downto 0 loop
                port_b_s(48) <= to_unsigned(i,8)(j);
                port_b_s(51) <= 'Z';
                wait for clk_period_hdmi;
            end loop;
            port_b_s(51) <= '1';
            port_b_s(48) <= 'Z';
            wait for clk_period_hdmi;
        end loop;
	    wait until falling_edge(clk_hdmi_s);
        port_b_s(48) <= '0';
        port_b_s(51) <= 'Z';
        wait for clk_period_hdmi/2;
        wait for clk_period_hdmi/4;
        port_b_s(48) <= '1';
        port_b_s(51) <= 'Z';
        
            --Multi Byte Test read
        wait until falling_edge(clk_hdmi_s);
        port_b_s(48) <= '1';
        port_b_s(51) <= 'Z';
        wait until rising_edge(clk_hdmi_s);
        wait for clk_period_hdmi/4;
        port_b_s(48) <= '0';
        port_b_s(51) <= 'Z';
        wait for clk_period_hdmi/2;
        for j in 7 downto 0 loop
            port_b_s(48) <= to_unsigned(1,8)(j);
            port_b_s(51) <= 'Z';
            wait for clk_period_hdmi;
        end loop;
        port_b_s(51) <= '1';
        port_b_s(48) <= 'Z';
        wait for clk_period_hdmi;
        for i in 2 to 256 loop
            for j in 7 downto 0 loop
                port_b_s(51) <= to_unsigned(i,8)(j);
                port_b_s(48) <= 'Z';
                wait for clk_period_hdmi;
            end loop;
            port_b_s(48) <= '1';
            port_b_s(51) <= 'Z';
            wait for clk_period_hdmi;
        end loop;
	    wait until falling_edge(clk_hdmi_s);
        port_b_s(48) <= '0';
        port_b_s(51) <= 'Z';
        wait for clk_period_hdmi/2;
        wait for clk_period_hdmi/4;
        port_b_s(48) <= '1';
        port_b_s(51) <= 'Z';
        wait for clk_period_hdmi;
            --Multi Start Test
        for i in 0 to 255 loop
            wait until falling_edge(clk_hdmi_s);
            port_b_s(48) <= '1';
            port_b_s(51) <= 'Z';
            wait until rising_edge(clk_hdmi_s);
            wait for clk_period_hdmi/4;
            port_b_s(48) <= '0';
            port_b_s(51) <= 'Z';
            wait for clk_period_hdmi/2;
            for j in 7 downto 0 loop
                port_b_s(48) <= to_unsigned(1,8)(j);
                port_b_s(51) <= 'Z';
                wait for clk_period_hdmi;
            end loop;
            port_b_s(51) <= '1';
            port_b_s(48) <= 'Z';
            wait for clk_period_hdmi;
            for j in 7 downto 0 loop
                port_b_s(51) <= to_unsigned(i,8)(j);
                port_b_s(48) <= 'Z';
                wait for clk_period_hdmi;
            end loop;
            port_b_s(48) <= '1';
            port_b_s(51) <= 'Z';
            wait for clk_period_hdmi;
        end loop;
	    wait until falling_edge(clk_hdmi_s);
        port_b_s(48) <= '0';
        port_b_s(51) <= 'Z';
        wait for clk_period_hdmi/2;
        wait for clk_period_hdmi/4;
        port_b_s(48) <= '1';
        port_b_s(51) <= 'Z';
        wait for clk_period_hdmi;
        
	    --Hdmi
        wait until rising_edge(clk_hdmi_s);
	    for i in 0 to 7 loop
	        hdmi_data_buffer_in(0) <= "0011001101";
	        hdmi_data_buffer_in(1) <= "1100110010";
	        hdmi_data_buffer_in(2) <= "0011001101";
	        wait for 2*clk_period;
	        hdmi_data_buffer_in <= (others =>(others => 'Z'));
            enable_s <= '1';
            value_i_s <= std_ulogic_vector(to_unsigned(i, 8));
            port_id_s <= std_ulogic_vector(to_unsigned(46, 8));
            wait for clk_period;
            for j in 0 to 255 loop
                enable_s <= '1';
                value_i_s <= std_ulogic_vector(to_unsigned(j, 8));
                port_id_s <= std_ulogic_vector(to_unsigned(47, 8));
                wait for clk_period;
                for k in 0 to 255 loop
                    enable_s <= '1';
                    value_i_s <= std_ulogic_vector(to_unsigned(k, 8));
                    port_id_s <= std_ulogic_vector(to_unsigned(48, 8));
                    wait for clk_period;
                    for l in 0 to 255 loop
                        enable_s <= '1';
                        value_i_s <= std_ulogic_vector(to_unsigned(l, 8));
                        port_id_s <= std_ulogic_vector(to_unsigned(49, 8));
                        wait for clk_period;
                        enable_s <= '0';
                        value_i_s <= "00000000";
                        port_id_s <= "00000000";
                        wait for clk_period;
                        for m in 0 to 255 loop
                            for n in 0 to 255 loop
                                for o in 0 to 255 loop
                                    hdmi_vde <= '1';
                                    rgb_val(0) <= std_ulogic_vector(to_unsigned(m, 8));
                                    rgb_val(1) <= std_ulogic_vector(to_unsigned(n, 8));
                                    rgb_val(2) <= std_ulogic_vector(to_unsigned(o, 8));
                                    wait for clk_period_hdmi;
                                end loop;
                            end loop;
                        end loop;
                    end loop;
                end loop;
            end loop;
        end loop;
		if err_cnt_sw + err_cnt_led + err_cnt_pmod + err_cnt_hdmi = 0 then
            report "Overall Test Passed";
        else
            report "Overall Test Failed";
        end if;       
        wait;
    end process;   
    
    LED_test: process(clk_s)
    variable cycle_cnt: integer := 0;
    begin
		if rising_edge(clk_s) then
		  if signed(LED_test_length) >= 0 then
              cycle_cnt := cycle_cnt + 1;
              for i in 0 to 6 loop
                  if port_b_s(61 + i) = '1' then
                      LED_ontime(i) <= LED_ontime(i) +1;
                  end if;
              end loop;
              LED_test_length <= std_logic_vector(signed(LED_test_length) -1);
          else
           for i in 0 to 6 loop
	           if not(LED_ontime(i) = LED_setontime(i)) then
	               err_cnt_led <= err_cnt_led + 1;
			       report "LED Failed";
			   end if;
			   LED_ontime(i) <= LED_setontime(i);
	       end loop;
	      end if;
		end if;
    end process;
    
--    HDMI_test: process(ser_clk_hdmi_s)
--    variable seed1, seed2: positive;               -- seed values for random generator
--    variable rand: real;   -- random real-number value in range 0 to 1.0  
--    variable range_of_rand : real := 7.0;
--    begin
--		if falling_edge(ser_clk_hdmi_s) then
--            uniform(seed1, seed2, rand);   -- generate random number
--            send_value_hdmi <= std_ulogic_vector(to_unsigned(integer(rand*range_of_rand),3));
--            if to_unsigned(integer(rand*range_of_rand),3) mod 2 = 0 then
--                if to_unsigned(integer(rand*range_of_rand),3) mod 4 = 0 then
--                    port_b_s(48) <= '1';
--                else
--                    port_b_s(48) <= '0';
--                end if;
--                port_b_s(51) <= 'Z';
--             else
--                if to_unsigned(integer(rand*range_of_rand),3) mod 4 = 1 then
--                    port_b_s(51) <= '1';
--                else
--                    port_b_s(51) <= '0';
--                end if;
--                port_b_s(48) <= 'Z';
--             end if;
--	    end if;
--    end process;
--    HDMI_test_rec: process(rec_clk_hdmi_s)
--    variable seed1, seed2: positive;               -- seed values for random generator
--    variable rand: real;   -- random real-number value in range 0 to 1.0  
--    variable range_of_rand : real := 7.0;
--    begin
--		if rising_edge(rec_clk_hdmi_s) then
--            if rec_value_hdmi /= send_value_hdmi or port_b_s(48) /= port_b_s(51) then--wrong, one cycle later
--               err_cnt_hdmi <= err_cnt_hdmi + 1;
--	           report "Hdmi Failed";
--            end if;
--	    end if;
--    end process;
--    port_b_s <= (others => 'Z');
    
    
    HDMI_Deserializer:process(ser_clk_hdmi_s)     
     begin
        if rising_edge(ser_clk_hdmi_s) then
            hdmi_in_parallel(0)(19 downto 0) <= hdmi_in_parallel(0)(18 downto 0) & rec_value_hdmi(0);
            hdmi_in_parallel(1)(19 downto 0) <= hdmi_in_parallel(1)(18 downto 0) & rec_value_hdmi(1);
            hdmi_in_parallel(2)(19 downto 0) <= hdmi_in_parallel(2)(18 downto 0) & rec_value_hdmi(2);
        end if;
     end process;
     
     HDMI_in: for i in 0 to 2 generate
         process(clk_hdmi_s)
            variable data_in_10: std_ulogic_vector(9 downto 0);
            variable data_in_8: std_ulogic_vector(7 downto 0);
         begin
            if rising_edge(clk_hdmi_s) then
                data_in_10 := (hdmi_in_parallel(i)(18 downto 9));
                case data_in_10 is
                    --Control tokens decode straight to C0, C1 values
                    when "1101010100" =>
                       hdmi_c(i * 2) <= '0';
                       hdmi_c(i * 2 + 1) <= '0';
                       hdmi_data_type(2*i) <= '0';
                       hdmi_data_type(2*i + 1) <= '0';
                       hdmi_data_buffer(i) <= "1101010100";
                    when "0010101011" =>
                       hdmi_c(i * 2) <= '1';
                       hdmi_c(i * 2 + 1) <= '0';
                       hdmi_data_type(2*i) <= '0';
                       hdmi_data_type(2*i + 1) <= '0';     
                       hdmi_data_buffer(i) <= "0010101011"; 
                    when "0101010100" =>
                       hdmi_c(i * 2) <= '0';
                       hdmi_c(i * 2 + 1) <= '1';
                       hdmi_data_type(2*i) <= '0';
                       hdmi_data_type(2*i + 1) <= '0';
                       hdmi_data_buffer(i) <= "0101010100";
                    when "1010101011" =>
                       hdmi_c(i * 2) <= '1';
                       hdmi_c(i * 2 + 1) <= '1';
                       hdmi_data_type(2*i) <= '0';
                       hdmi_data_type(2*i + 1) <= '0';
                       hdmi_data_buffer(i) <= "1010101011";
                    when "0011001101" =>
                        if i = 1 then
                            hdmi_data_type(2*i) <= '0';
                            hdmi_data_type(2*i + 1) <= '0';
                        else
                            hdmi_data_type(2*i) <= '1';
                            hdmi_data_type(2*i + 1) <= '0';
                        end if;
                        hdmi_data_buffer(i) <= "0011001101";
                    when "1100110010" =>
                        if i = 1 then
                            hdmi_data_type(2*i) <= '1';
                            hdmi_data_type(2*i + 1) <= '1';
                        else
                            hdmi_data_type(2*i) <= '0';
                            hdmi_data_type(2*i + 1) <= '1';
                        end if;
                        hdmi_data_buffer(i) <= "1100110010";
                    --If not control token, it's encoded data
                    when others =>
                       hdmi_data_type(2*i) <= '1';
                       hdmi_data_type(2*i + 1) <= '1';
                       if hdmi_vde = '1' then
                           if data_in_10(9) = '0' then
                                data_in_8 := data_in_10(7 downto 0);
                           else
                                data_in_8 := not data_in_10(7 downto 0);
                           end if;
                           hdmi_in_rgb(i)(0) <= data_in_8(0);
                           rgb_val_rec(i)(0)<= data_in_8(0);
                           for iBit in 1 to 7 loop
                              if (data_in_10(8) = '1') then
                                 hdmi_in_rgb(i)(iBit) <= data_in_8(iBit) xor data_in_8(iBit-1);
                                 rgb_val_rec(i)(iBit) <= data_in_8(iBit) xor data_in_8(iBit-1);
                              else
                                 hdmi_in_rgb(i)(iBit) <= data_in_8(iBit) xnor data_in_8(iBit-1);
                                 rgb_val_rec(i)(iBit) <= data_in_8(iBit) xnor data_in_8(iBit-1);
                              end if;
                           end loop;
                       else
                           hdmi_in_rgb(i) <= data_in_10(7 downto 0);
                       end if;
                       hdmi_data_buffer(i) <= data_in_10;
                 end case;
            end if;
         end process;
     end generate;
     
     HDMI_out: for i in 0 to 2 generate
         process(clk_hdmi_s)
            variable data_out_10: std_ulogic_vector(9 downto 0);
            variable data_out_8: std_ulogic_vector(7 downto 0);
            variable temp_toBig: std_ulogic_vector(15 downto 0);
            
            variable sob_in, sob_temp: unsigned(3 downto 0);
            variable data_temp: std_ulogic_vector(8 downto 0);
            
            variable disparity, bias: signed(4 downto 0) := "00000";
            variable cond_balanced, cond_not_balanced: std_ulogic;--two different conditions
            
            
         begin
            if rising_edge(clk_hdmi_s) then
                if hdmi_vde = '0' or hdmi_data_buffer_in(i) = "1100110010" or hdmi_data_buffer_in(i) = "0011001101" then
                    data_out_10 := hdmi_data_buffer_in(i);
                    disparity := "00000";
                else
                    data_out_8 := rgb_val(i);
                    sob_in := sum_bits(data_out_8);
                    --data_temp(0) := data_out_8(0);
                    if sob_in > 4 or (sob_in = 4 and data_out_8(0) = '0') then
                        for i in 1 to 7 loop
                            data_out_8(i) := data_out_8(i-1) xnor data_out_8(i);
                        end loop;
                        data_temp(8) := '0';
                    else
                        for i in 1 to 7 loop
                            data_out_8(i) := data_out_8(i-1) xor data_out_8(i);
                        end loop;
                        data_temp(8) := '1';
                    end if;
                    
                    data_temp(7 downto 0) := data_out_8;
                    sob_temp := sum_bits(data_temp);
                    if disparity = 0 or sob_temp = 4 then 
                        cond_balanced := '1';
                    else
						cond_balanced := '0';
				    end if;

                    if (disparity > 0 and sob_temp > 4) or (disparity < 0 and sob_temp < 4) then
                        cond_not_balanced :=  '1';
                    else -- too many 0's
                        cond_not_balanced :=  '0';
                    end if;
                    
			        if cond_balanced = '1' and data_temp(8) = '0' then
			             data_out_10 := not data_temp(8) & data_temp(8) & not data_temp(7 downto 0);
			        elsif cond_balanced = '1' and data_temp(8) = '1' then
			             data_out_10 := not data_temp(8) & data_temp(8) & data_temp(7 downto 0)  ;      
			        elsif cond_not_balanced = '1' then
			             data_out_10 := '1' & data_temp(8) & not data_temp(7 downto 0);
			        else
			             data_out_10 := '0' & data_temp(8) & data_temp(7 downto 0);
			        end if;

                    bias := signed('0' & (8 - sob_temp)) - signed('0' & sob_temp);
                                     
			        if cond_balanced = '1' and data_temp(8) = '0' then
			             disparity := disparity + bias;
			        elsif cond_balanced = '1' and data_temp(8) = '1'then
			             disparity := disparity - bias;                
			        elsif cond_not_balanced = '1' then
			             disparity := disparity + signed('0' & data_temp(8 downto 8) & '0') + bias;
			        else
			             disparity := disparity - signed('0' & not data_temp(8 downto 8) & '0') - bias;
			        end if;
                end if;
            end if;
            hdmi_out_parallel(i)<= data_out_10;
         end process;
     end generate;
     
     HDMI_Serializer:process(ser_clk_hdmi_s, hdmi_out_parallel) 
        variable cnt : unsigned(3 downto 0) := "1001";
     begin
        if rising_edge(ser_clk_hdmi_s) then
            if cnt < 10 then
                send_value_hdmi(0) <= hdmi_out_parallel(0)(to_integer(cnt));
                send_value_hdmi(1) <= hdmi_out_parallel(1)(to_integer(cnt));
                send_value_hdmi(2) <= hdmi_out_parallel(2)(to_integer(cnt));
                cnt := cnt - 1;
            end if;
        elsif hdmi_out_parallel'event then
            cnt := "1001";
        end if;
     end process;
    
    obuf : OBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (I=>clk_hdmi_s, O=>port_i(0), OB=>port_i(1));
    obufdata1 : OBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (I=>send_value_hdmi(0), O=>port_i(2), OB=>port_i(3));
    obufdata2 : OBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (I=>send_value_hdmi(1), O=>port_i(4), OB=>port_i(5));
    obufdata3 : OBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (I=>send_value_hdmi(2), O=>port_i(6), OB=>port_i(7));
    
    ibuf : IBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (O=>rec_clk_hdmi_s, I=>port_o(0), IB=>port_o(1));
    ibufdata1 : IBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (O=>rec_value_hdmi(0), I=>port_o(2), IB=>port_o(3));
    ibufdata2 : IBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (O=>rec_value_hdmi(1), I=>port_o(4), IB=>port_o(5));
    ibufdata3 : IBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (O=>rec_value_hdmi(2), I=>port_o(6), IB=>port_o(7));
end Behavioral;
