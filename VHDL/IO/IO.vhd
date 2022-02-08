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
    signal output_buffer : output_buffer_type := (others => (others => '0'));
	type input_buffer_type is array (255 downto 0) of std_logic_vector(7 downto 0);
    signal input_buffer : input_buffer_type := (others => (others => '0'));
    
	signal pmod_out_enabled: std_ulogic_vector(3 downto 0) := "0000"; 
	
	signal reset_enable : std_ulogic_vector(7 downto 0) := "10000000";
	
	--HdmiDDC
    signal hdmi_sda: std_ulogic := '0';
    signal sda_sender: std_ulogic := '0';
    signal sdc_clk: std_ulogic := '0';
    signal hdmi_hda: std_ulogic := '0';
    
    --Hdmi Data
    signal hdmi_data_in, hdmi_data_out: std_ulogic_vector(2 downto 0):= "ZZZ";
    type parallel_tmds is array (2 downto 0) of std_ulogic_vector(9 downto 0);
    signal hdmi_data_buffer, hdmi_out_parallel: parallel_tmds := (others => (others => 'Z'));
    type parallel_rgb is array (2 downto 0) of std_ulogic_vector(7 downto 0);
    signal hdmi_in_rgb: parallel_rgb := (others => (others => 'Z'));
    type input is array (2 downto 0) of std_ulogic_vector(18 downto 0);
    signal hdmi_in_parallel : input := (others => (others => 'Z'));
    signal hdmi_vde: std_ulogic := '0';--active video signal
    signal hdmi_ade: std_ulogic := '0';--active audio signal
    signal hdmi_data_type: std_ulogic_vector(5 downto 0) := "000000";-- For each channel 00- control signals, 01 video signal, 10 audio signal, 11 data signal or undefined
    signal hdmi_c: std_ulogic_vector(5 downto 0) := "000000";
    signal clkfbout_hdmi_clk,SerialClk, PixelClk, clk_out : std_logic;
    signal rMMCM_Reset,aMMCM_Locked, clkout1b_unused, clkout2_unused, clkout2b_unused, clkout3_unused, clkout3b_unused, clkout4_unused, clkout5_unused, clkout6_unused, clkfboutb_unused, clkout0b_unused, clkout1_unused : std_logic;
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
     Pmod:for i in 0 to 3 generate
         process(clk_i) is        
         begin
            if rising_edge(clk_i) then
                if pmod_out_enabled(i) = '0' then
                    if input_buffer(i + 50) /= port_b(16 + 8 * i downto 9 + 8 * i) then
                        input_buffer(i + 56) <= input_buffer(i + 50);
                        input_buffer(i + 50) <= port_b(16 + 8 * i downto 9 + 8 * i);
                    end if;
                end if;
             end if;
         end process;
     end generate;
	 
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
        if input_buffer(62) /= port_b(60 downto 53) then
            input_buffer(60) <= input_buffer(61);
            input_buffer(61) <= input_buffer(62);
            input_buffer(62) <= port_b(60 downto 53);
        end if;
     end if;
     end process;
     
     HDMI_DDC:process(sdc_clk) is
     begin
        if rising_edge(sdc_clk) then
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
     
     HDMI_Deserializer:process(SerialClk)     
     begin
        if rising_edge(SerialClk) then
            hdmi_in_parallel(0)(18 downto 0) <= hdmi_in_parallel(0)(17 downto 0) & hdmi_data_in(0);
            hdmi_in_parallel(1)(18 downto 0) <= hdmi_in_parallel(1)(17 downto 0) & hdmi_data_in(1);
            hdmi_in_parallel(2)(18 downto 0) <= hdmi_in_parallel(2)(17 downto 0) & hdmi_data_in(2);
        end if;
     end process;
     
     HDMI_in: for i in 0 to 2 generate
         process(PixelClk)
            variable data_in_10: std_ulogic_vector(9 downto 0);
            variable data_in_8: std_ulogic_vector(7 downto 0);
         begin
            if rising_edge(PixelClk) then
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
                           input_buffer(44 + i) <= input_buffer(47 + i);
                           input_buffer(47 + i)(0)<= data_in_8(0);
                           for iBit in 1 to 7 loop
                              if (data_in_10(8) = '1') then
                                 hdmi_in_rgb(i)(iBit) <= data_in_8(iBit) xor data_in_8(iBit-1);
                                 input_buffer(47 + i)(iBit) <= data_in_8(iBit) xor data_in_8(iBit-1);
                              else
                                 hdmi_in_rgb(i)(iBit) <= data_in_8(iBit) xnor data_in_8(iBit-1);
                                 input_buffer(47 + i)(iBit) <= data_in_8(iBit) xnor data_in_8(iBit-1);
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
         process(PixelClk)
            variable data_out_10: std_ulogic_vector(9 downto 0);
            variable data_out_8: std_ulogic_vector(7 downto 0);
            variable temp_toBig: std_ulogic_vector(15 downto 0);
            
            variable sob_in, sob_temp: unsigned(3 downto 0);
            variable data_temp: std_ulogic_vector(8 downto 0);
            
            variable disparity, bias: signed(4 downto 0) := "00000";
            variable cond_balanced, cond_not_balanced: std_ulogic;--two different conditions
            
            
         begin
            if rising_edge(PixelClk) then
                if hdmi_vde = '0' or hdmi_data_buffer(i) = "1100110010" or hdmi_data_buffer(i) = "0011001101" then
                    data_out_10 := hdmi_data_buffer(i);
                    disparity := "00000";
                else
                    case output_buffer(44 + i) is 
                        when "00000000" =>-- Addition without Overflow 
                            if to_integer(unsigned(output_buffer(47 + i))) + to_integer(unsigned(hdmi_in_rgb(i))) > 255 then
                                data_out_8 := "11111111";
                            else
                                data_out_8 := std_ulogic_vector(unsigned(output_buffer(47 + i)) + unsigned(hdmi_in_rgb(i)));
                            end if;
                        when "00000001" =>-- Addition
                            data_out_8 := std_ulogic_vector(unsigned(output_buffer(47 + i)) + unsigned(hdmi_in_rgb(i)));
                        when "00000010" =>-- Subtraction without Overflow 
                            if to_integer(unsigned(output_buffer(47 + i))) - to_integer(unsigned(hdmi_in_rgb(i))) < 0 then
                                data_out_8 := "11111111";
                            else
                                data_out_8 := std_ulogic_vector(unsigned(output_buffer(47 + i)) - unsigned(hdmi_in_rgb(i)));
                            end if;
                        when "00000011" =>-- Subtraction
                            data_out_8 := std_ulogic_vector(unsigned(output_buffer(47 + i)) - unsigned(hdmi_in_rgb(i)));
                        when "00000100" =>-- Multiplication without Overflow 
                            if to_integer(unsigned(output_buffer(47 + i))) * to_integer(unsigned(hdmi_in_rgb(i))) > 255 then
                                data_out_8 := "11111111";
                            else
                                temp_toBig := std_ulogic_vector(unsigned(output_buffer(47 + i)) * unsigned(hdmi_in_rgb(i)));
                                data_out_8 := temp_toBig(7 downto 0);
                            end if;
                        when "00000101" =>-- Multiplication
                            temp_toBig := std_ulogic_vector(unsigned(output_buffer(47 + i)) * unsigned(hdmi_in_rgb(i)));
                            data_out_8 := temp_toBig(7 downto 0);
                        when "00000110" =>-- Division round up
                            data_out_8 := std_ulogic_vector(unsigned(output_buffer(47 + i)) / unsigned(hdmi_in_rgb(i)));
                            if unsigned(data_out_8) * unsigned(hdmi_in_rgb(i)) /= unsigned(output_buffer(47 + i)) then
                                data_out_8 := std_ulogic_vector(unsigned(data_out_8) + 1);
                            end if;
                        when "00000111" =>-- Division round down
                            data_out_8 := std_ulogic_vector(unsigned(output_buffer(47 + i)) / unsigned(hdmi_in_rgb(i)));
                        when "00001000" =>-- And
                            data_out_8 := output_buffer(47 + i) and hdmi_in_rgb(i);
                        when "00001001" =>-- Or
                            data_out_8 := output_buffer(47 + i) or hdmi_in_rgb(i);
                        when "00001010" =>-- xor
                            data_out_8 := output_buffer(47 + i) xor hdmi_in_rgb(i);
                        when "00001011" =>-- Not
                            data_out_8 := not hdmi_in_rgb(i);
                        when "00001100" =>-- Nand
                            data_out_8 := output_buffer(47 + i) nand hdmi_in_rgb(i);
                        when "00001101" =>-- Nor
                            data_out_8 := output_buffer(47 + i) nor hdmi_in_rgb(i);
                        when "00001110" =>-- xnor
                            data_out_8 := output_buffer(47 + i) xnor hdmi_in_rgb(i);
                        when others =>
                            data_out_8 := output_buffer(47 + i);
                    end case;
                    sob_in := sum_bits(data_out_8);
                    data_temp(0) := data_out_8(0);
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
     
     hdmi_vde <= '1' when hdmi_data_type = "010101" or hdmi_data_type = "010111" or 
                            hdmi_data_type = "011101" or hdmi_data_type = "011111" or 
                            hdmi_data_type = "110101" or hdmi_data_type = "110111" or 
                            hdmi_data_type = "111101" or (hdmi_data_type = "111111" and hdmi_vde = '1') else '0';
     hdmi_ade <= '1' when hdmi_data_type(5 downto 2) = "1010" or hdmi_data_type(5 downto 2) = "1011" or
                            hdmi_data_type(5 downto 2) = "1110" or (hdmi_data_type(5 downto 2) = "1111" and hdmi_ade = '1') else '0';
     
     HDMI_Serializer:process(SerialClk, hdmi_out_parallel) 
        variable cnt : unsigned(3 downto 0) := "1001";
        variable old_value: parallel_tmds := (others => (others => 'Z'));
     begin
        if rising_edge(SerialClk) then
            if (old_value /= hdmi_out_parallel) or cnt > 9 then
              cnt := "1001";
              old_value := hdmi_out_parallel;
            end if;
            if cnt = "1001" then
                clk_out <= '1';
            end if;
            if cnt = "0100" then
                clk_out <= '0';
            end if;
            hdmi_data_out(0) <= hdmi_out_parallel(0)(to_integer(cnt));
            hdmi_data_out(1) <= hdmi_out_parallel(1)(to_integer(cnt));
            hdmi_data_out(2) <= hdmi_out_parallel(2)(to_integer(cnt));
            cnt := cnt - 1;
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
          CLKOUT0_DUTY_CYCLE   => 0.500,
          CLKIN1_PERIOD        => 10.0)
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
    port map (I=>clk_out, O=>port_o(0), OB=>port_o(1));
    obufdata1 : OBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (I=>hdmi_data_out(0), O=>port_o(2), OB=>port_o(3));--Blue
    obufdata2 : OBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (I=>hdmi_data_out(1), O=>port_o(4), OB=>port_o(5));--Green
    obufdata3 : OBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (I=>hdmi_data_out(2), O=>port_o(6), OB=>port_o(7));--Red
    
    ibuf : IBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (O=>PixelClk, I=>port_i(0), IB=>port_i(1));
    ibufdata1 : IBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (O=>hdmi_data_in(0), I=>port_i(2), IB=>port_i(3));--Blue
    ibufdata2 : IBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (O=>hdmi_data_in(1), I=>port_i(4), IB=>port_i(5));--Green
    ibufdata3 : IBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (O=>hdmi_data_in(2), I=>port_i(6), IB=>port_i(7));--Red
    
end Behavioral;

				 
