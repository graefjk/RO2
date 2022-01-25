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
				port_id_i : IN std_logic_vector(7 DOWNTO 0);
				value_i : IN std_logic_vector(7 DOWNTO 0);
				in_out_i : IN std_logic;
				enable_i : IN STD_LOGIC;
				value_o : OUT std_logic_vector(7 DOWNTO 0);
				clk_i : in STD_LOGIC;
				port_b : inout std_logic_vector ( 70 downto 0 ) := (others => 'Z');
				port_i : in std_logic_vector ( 19 downto 0 );
				port_o : out std_logic_vector ( 7 downto 0 );
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
    signal port_b_s : std_logic_vector ( 70 downto 0 ) := (others => '0');
    signal port_i : std_logic_vector ( 19 downto 0 );
    signal port_o : std_logic_vector ( 7 downto 0 );
    signal value_i_s: std_logic_vector(7 downto 0);
    signal value_o_s: std_logic_vector(7 downto 0);
    signal port_id_s: std_logic_vector(7 downto 0);
    signal in_out_s: std_logic;
    signal enable_s: std_logic;
    
    constant clk_period: time := 8 ns;
    
    signal err_cnt_led :integer := 0;
    signal err_cnt_sw :integer := 0;
    
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
    
    stimuli: process
    begin
        enable_s <= '1';
        value_i_s <= "00000000";
        port_id_s <= "00111110";
        in_out_s <= '0';
        for k in 0 to 256 loop
	       port_b_s(60 downto 53) <= std_logic_vector(to_unsigned(k,8));
	       wait for clk_period;
	       if not(value_o_s = std_logic_vector(to_unsigned(k,8))) then
	           err_cnt_sw <= err_cnt_sw + 1;
	           report "Switch Failed";
	       end if;
	    end loop;
        for i in 0 to 6 loop
            enable_s <= '1';
            if i < 6 then
                value_i_s <= std_logic_vector(to_signed(i * 42, 8));
            else 
                value_i_s <= std_logic_vector(to_signed(255, 8));
            end if;
            port_id_s <= std_logic_vector(to_unsigned(i + 56, 8));
            in_out_s <= '1';
            wait for clk_period;            
		end loop;
		enable_s <= '0';
        for j in 0 to 5 loop
            LED_setontime(j) <= j * 42;
        end loop;
        LED_setontime(6) <= 255;
        LED_test_length <= "LLLHHHHHHHH";
        
	    
		if err_cnt_sw + err_cnt_led = 0 then
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
end Behavioral;
