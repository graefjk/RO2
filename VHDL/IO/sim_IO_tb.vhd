----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jochen Benzenhöfer
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IO_tb is
--  Port ( );
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
				port_id_i : IN std_ulogic_vector(7 DOWNTO 0);
				value_i : IN std_ulogic_vector(7 DOWNTO 0);
				in_out_i : IN STD_ULOGIC;
				enable_i : IN STD_ULOGIC;
				value_o : OUT std_ulogic_vector(7 DOWNTO 0);
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
    signal port_b_s : std_logic_vector ( 70 downto 0 );
    signal port_i : std_ulogic_vector ( 19 downto 0 );
    signal port_o : std_ulogic_vector ( 7 downto 0 );
    signal value_i_s: std_ulogic_vector(7 downto 0);
    signal value_o_s: std_ulogic_vector(7 downto 0);
    signal port_id_s: std_ulogic_vector(7 downto 0);
    signal in_out_s: std_logic;
    signal enable_s: std_logic;
    
    constant clk_period: time := 8 ns;    
    constant clk_period_hdmi: time := 0.6734 ns;
    
    signal clk_hdmi_s: std_ulogic;
    signal rec_clk_hdmi_s: std_ulogic;
    signal send_value_hdmi: std_ulogic_vector(2 downto 0) := "000";
    signal rec_value_hdmi: std_ulogic_vector(2 downto 0) := "000";
    
    signal err_cnt_led :integer := 0;
    signal err_cnt_sw :integer := 0;
    signal err_cnt_pmod :integer := 0;
    signal err_cnt_hdmi :integer := 0;
    
    type LED_type is array (0 to 6) of integer;
    signal LED_ontime: LED_type := (others => 0);
    signal LED_test_length: std_logic_vector(10 downto 0) := (others => 'Z');
    signal LED_setontime : LED_type := (others => 0);
    
begin
    io_instance: design_1_wrapper
        port map(   
            port_id_i => port_id_s,
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
    
	--currently not implemented
    HDMI_test: process(clk_hdmi_s)
    variable seed1, seed2: positive;               -- seed values for random generator
    variable rand: real;   -- random real-number value in range 0 to 1.0  
    variable range_of_rand : real := 7.0;
    begin
		if falling_edge(clk_hdmi_s) then
            uniform(seed1, seed2, rand);   -- generate random number
            send_value_hdmi <= std_ulogic_vector(to_unsigned(integer(rand*range_of_rand),3));
	    end if;
    end process;
    port_b_s <= (others => 'Z');
    
    HDMI_test_rec: process(rec_clk_hdmi_s)
    variable seed1, seed2: positive;               -- seed values for random generator
    variable rand: real;   -- random real-number value in range 0 to 1.0  
    variable range_of_rand : real := 7.0;
    begin
		if rising_edge(rec_clk_hdmi_s) then
            if rec_value_hdmi /= send_value_hdmi then
               err_cnt_hdmi <= err_cnt_hdmi + 1;
	           report "Hdmi Failed";
            end if;
	    end if;
    end process;
    port_b_s <= (others => 'Z');
    
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
