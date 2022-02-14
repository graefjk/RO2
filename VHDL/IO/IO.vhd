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
    signal output_buffer_s : output_buffer_type := (others => (others => '0'));
	type input_buffer_type is array (255 downto 0) of std_logic_vector(7 downto 0);
    signal input_buffer_s : input_buffer_type := (others => (others => '0'));
    
	signal pmod_out_enabled_s: std_ulogic_vector(3 downto 0) := "0000"; 
	
	signal reset_enable_s : std_ulogic_vector(7 downto 0) := "10000000";
	
	--HdmiDDC
	signal ddc_changed_s, old_ddc_val_s: std_ulogic := '0';
    signal hdmi_sda_s: std_ulogic := '0';
    signal sda_sender_s, sda_next_sender_s: std_ulogic := '0';
    signal sda_start_s: unsigned (3 downto 0):= "0000";
    signal sdc_clk_s: std_ulogic := '0';
    signal hdmi_hda_s: std_ulogic := '0';
    signal sda_value_s: std_ulogic_vector(6 downto 0):= "ZZZZZZZ";
    signal ddc_unused_s, hda_unused_s: std_ulogic := '0';
    
    --Hdmi Data
    signal hdmi_data_in_s, hdmi_data_out_s: std_ulogic_vector(2 downto 0):= "ZZZ";
    type parallel_tmds is array (2 downto 0) of std_ulogic_vector(9 downto 0);
    signal hdmi_data_buffer_s, hdmi_out_parallel_s: parallel_tmds := (others => (others => 'Z'));
    type parallel_rgb is array (2 downto 0) of std_ulogic_vector(7 downto 0);
    signal hdmi_in_rgb_s: parallel_rgb := (others => (others => 'Z'));
    type input is array (2 downto 0) of std_ulogic_vector(18 downto 0);
    signal hdmi_in_parallel_s : input := (others => (others => 'Z'));
    signal hdmi_vde_s: std_logic := '0';--active video signal
    signal hdmi_ade_s: std_logic := '0';--active audio signal
    signal hdmi_data_type_s: std_ulogic_vector(5 downto 0) := "000000";-- For each channel 00- control signals, 01 video signal, 10 audio signal, 11 data signal or undefined
    signal hdmi_c_s: std_ulogic_vector(5 downto 0) := "000000";
    signal clkfbout_hdmi_clk_s,SerialClk_s, PixelClk_s, clk_out_s : std_logic;
    signal rMMCM_Reset_s,aMMCM_Locked_s, clkout1b_unused_s, clkout2_unused_s, clkout2b_unused_s, clkout3_unused_s, clkout3b_unused_s, clkout4_unused_s, clkout5_unused_s, clkout6_unused_s, clkfboutb_unused_s, clkout0b_unused_s, clkout1_unused_s : std_logic;
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
    
    
    
    
    reset_o <= '0' when (std_ulogic_vector(port_b(60 downto 53)) and reset_enable_s(7 downto 0)) = "00000000" else '1';
    
    pmod_out: for i in 0 to 3 generate
        port_b(16 + 8 * i downto 9 + 8 * i) <= to_stdlogicvector(output_buffer_s(i + 50)) when pmod_out_enabled_s(i) = '1' else (others => 'Z');
    end generate;
    
    
    main: process(clk_i) is
    begin
        if rising_edge(clk_i) then
            for i in number_of_cores - 1 downto 0 loop
             if enable_i(i) = '1' then
               if in_out_i(i) = '1' then
                if port_id_i(i,7) = '0' then  --Buffer output
                    output_buffer_s(to_integer(unsigned(get_row(port_id_i,i)))) <= get_row(value_i,i); 
                end if;
                if get_row(port_id_i,i)(6 downto 0) = "0110111" then --Toggle use Button as reset- default 10000000
                    reset_enable_s <= reset_enable_s xor get_row(value_i,i)(7 downto 0);
                    input_buffer_s(55) <= std_logic_vector(reset_enable_s);
                elsif get_row(port_id_i,i)(6 downto 0) = "0110110" then --Pmod Toggle In/Out 1-toggle
                    pmod_out_enabled_s <= pmod_out_enabled_s xor get_row(value_i,i)(3 downto 0);
                    input_buffer_s(54)(3 downto 0) <= std_logic_vector(pmod_out_enabled_s);
                end if;
               else 
                set_row(value_o,i,to_stdulogicvector(input_buffer_s(to_integer(unsigned(get_row(port_id_i,i))))));
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
                if pmod_out_enabled_s(i) = '0' then
                    if input_buffer_s(i + 50) /= port_b(16 + 8 * i downto 9 + 8 * i) then
                        input_buffer_s(i + 56) <= input_buffer_s(i + 50);
                        input_buffer_s(i + 50) <= port_b(16 + 8 * i downto 9 + 8 * i);
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
            if unsigned(output_buffer_s(i - 5)) > led_clk_counter then
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
        if input_buffer_s(62) /= port_b(60 downto 53) then
            input_buffer_s(60) <= input_buffer_s(61);
            input_buffer_s(61) <= input_buffer_s(62);
            input_buffer_s(62) <= port_b(60 downto 53);
        end if;
     end if;
     end process;
     
      
      DDC_clk_in:IOBUF
      port map (O=>sdc_clk_s,I=>'0', IO=>port_b(47), T=> '1');
      --DDC_clk_out:IOBUF
      --port map (I=>sdc_clk_s,O=>ddc_unused_s, IO=>port_b(50), T=> '0');
      Hot_plug_in:IOBUF
      port map (O=>hdmi_hda_s,I=>'0', IO=>port_b(49), T=> '1');
      --Hot_plug_out:IOBUF
      --port map (I=>hdmi_hda_s,O=>hda_unused_s, IO=>port_b(46), T=> '0');
      
      port_b(50) <= sdc_clk_s when TRUE else 'Z';
      --sdc_clk_s <= port_b(47);
      
      port_b(46) <= hdmi_hda_s when TRUE else 'Z';
      --hdmi_hda_s <= port_b(49);
      
      port_b(48) <= port_b(51) when sda_sender_s = '1' else 'Z';
      port_b(51) <= port_b(48) when sda_sender_s = '0' else 'Z';
    
      --new DDC
      ddc_changed_s <= '1' when port_b(48) /= old_ddc_val_s else '0';
      HDMI_DDC_start_detection:process(ddc_changed_s) is
      begin
        if rising_edge(ddc_changed_s) then
            if sdc_clk_s = '1' then
                if port_b(48) = '0' then
                    sda_start_s <= sda_start_s + 1;
                else
                    sda_start_s <= (others => '0');
                end if;
            end if;
        end if;
      end process;
      
      HDMI_DDC_rec:process(sdc_clk_s) is
        variable cnt, old_start_number: unsigned(3 downto 0) := "0000";
        variable first_byte: std_ulogic := '1';
      begin
        if rising_edge(sdc_clk_s) then
            old_ddc_val_s <= port_b(48);
            if sda_start_s = 0 then --transmission not started
                cnt := "0000";
                first_byte := '1';
                sda_next_sender_s <= '0';
            else     
                if sda_start_s /= old_start_number then --new start
                    old_start_number := sda_start_s;
                    cnt := "0000";
                    first_byte := '1';
                    sda_next_sender_s <= '0';
                else
                    case to_integer(cnt) is 
                        when 6 downto 0 =>-- Data Bit
                            if sda_next_sender_s = '0' then
                                sda_value_s(to_integer(cnt)) <= port_b(51);
                            else 
                                sda_value_s(to_integer(cnt)) <= port_b(48);
                            end if;
                        when 7 =>--W/R Bit
                            if sda_next_sender_s = '0' then
                                input_buffer_s(43) <= port_b(51) & std_logic_vector(sda_value_s);
                            else 
                                input_buffer_s(43) <= port_b(48) & std_logic_vector(sda_value_s);
                            end if;
                            if first_byte = '1' then
                                 sda_next_sender_s <= port_b(51);
                            end if;
                        when 8 =>--Next Byte(Ack Transmission)
                            first_byte := '0';
                            cnt := "0000";
                        when others => --transmission start
                            if sda_next_sender_s = '0' then
                                sda_value_s(0) <= port_b(51);
                            else 
                                sda_value_s(0) <= port_b(48);
                            end if;
                            first_byte := '1';
                            cnt := "0000";
                    end case;
                    cnt := cnt + 1;
                end if;
            end if;
        end if;
      end process;
      
      HDMI_DDC_state:process(sdc_clk_s) is
        variable ddc_state: unsigned(3 downto 0) := "1010";
        variable ddc_byte_number: integer := 0;
        variable old_start_number: unsigned(3 downto 0) := "0000";
      begin
        if falling_edge(sdc_clk_s) then
            if sda_start_s = 0 then --transmission not started
                ddc_state := "1010";
                ddc_byte_number := 0;
                sda_sender_s <= '0';
            else     
                if sda_start_s /= old_start_number then --new start
                    old_start_number := sda_start_s;
                    ddc_state := "1010";
                    ddc_byte_number := 0;
                    sda_sender_s <= '0';
                else
                    case to_integer(ddc_state) is 
                        when 15 downto 10 => --transmission start
                            ddc_state := "0000";
                            if ddc_byte_number > 0 then
                                sda_sender_s <= sda_next_sender_s; -- change sender depending on r/w bit
                            else 
                                sda_sender_s <= '0';-- set sender to default sender
                            end if;
                            ddc_byte_number := ddc_byte_number + 1;
                        when 8 =>--Ack Transmission
                            sda_sender_s <= not sda_sender_s;
                        when 9 =>--Next Byte
                            ddc_state := "0000";
                            if ddc_byte_number > 0 then
                                sda_sender_s <= sda_next_sender_s; -- change sender depending on r/w bit
                            else 
                                sda_sender_s <= '0';-- set sender to default sender
                            end if;
                            ddc_byte_number := ddc_byte_number + 1;
                        when others =>--Data
                    end case;
                    ddc_state := ddc_state + 1;
                end if;
            end if;
        end if;
      end process;
      
      
      --old DDC
--     HDMI_DDC:process(sdc_clk_s) is
--     begin
--        if rising_edge(sdc_clk_s) then
--            if sda_sender_s = '0' then
--                if port_b(48) = 'Z' then
--                    sda_sender_s <= '1';
--                    port_b(51) <= 'Z';
--                    if port_b(51) = 'X' then
--                        port_b(48) <= not hdmi_sda_s;
--                        hdmi_sda_s <= not hdmi_sda_s;
--                    else
--                        port_b(48) <= port_b(51);
--                        hdmi_sda_s <= port_b(51);
--                    end if;
--                else
--                    port_b(48) <= 'Z';
--                    port_b(51) <= port_b(48);
--                    hdmi_sda_s <= port_b(48);
--                end if;
--            else
--                if port_b(51) = 'Z' then
--                    sda_sender_s <= '0';
--                    port_b(48) <= 'Z';
--                    if port_b(48) = 'X' then
--                        port_b(51) <= not hdmi_sda_s;
--                        hdmi_sda_s <= not hdmi_sda_s;
--                    else
--                        port_b(51) <= port_b(48);
--                        hdmi_sda_s <= port_b(48);
--                    end if;
--                else
--                    port_b(51) <= 'Z';
--                    port_b(48) <= port_b(51);
--                    hdmi_sda_s <= port_b(51);
--                end if;
--            end if;
--        end if;
--     end process;
     
     HDMI_Deserializer:process(SerialClk_s)     
     begin
        if rising_edge(SerialClk_s) then
            hdmi_in_parallel_s(0)(18 downto 0) <= hdmi_in_parallel_s(0)(17 downto 0) & hdmi_data_in_s(0);
            hdmi_in_parallel_s(1)(18 downto 0) <= hdmi_in_parallel_s(1)(17 downto 0) & hdmi_data_in_s(1);
            hdmi_in_parallel_s(2)(18 downto 0) <= hdmi_in_parallel_s(2)(17 downto 0) & hdmi_data_in_s(2);
        end if;
     end process;
     
     HDMI_in: for i in 0 to 2 generate
         process(PixelClk_s)
            variable data_in_10: std_ulogic_vector(9 downto 0);
            variable data_in_8: std_ulogic_vector(7 downto 0);
         begin
            if rising_edge(PixelClk_s) then
                data_in_10 := (hdmi_in_parallel_s(i)(18 downto 9));
                case data_in_10 is
                    --Control tokens decode straight to C0, C1 values
                    when "1101010100" =>
                       hdmi_c_s(i * 2) <= '0';
                       hdmi_c_s(i * 2 + 1) <= '0';
                       hdmi_data_type_s(2*i) <= '0';
                       hdmi_data_type_s(2*i + 1) <= '0';
                       hdmi_data_buffer_s(i) <= "1101010100";
                    when "0010101011" =>
                       hdmi_c_s(i * 2) <= '1';
                       hdmi_c_s(i * 2 + 1) <= '0';
                       hdmi_data_type_s(2*i) <= '0';
                       hdmi_data_type_s(2*i + 1) <= '0';     
                       hdmi_data_buffer_s(i) <= "0010101011"; 
                    when "0101010100" =>
                       hdmi_c_s(i * 2) <= '0';
                       hdmi_c_s(i * 2 + 1) <= '1';
                       hdmi_data_type_s(2*i) <= '0';
                       hdmi_data_type_s(2*i + 1) <= '0';
                       hdmi_data_buffer_s(i) <= "0101010100";
                    when "1010101011" =>
                       hdmi_c_s(i * 2) <= '1';
                       hdmi_c_s(i * 2 + 1) <= '1';
                       hdmi_data_type_s(2*i) <= '0';
                       hdmi_data_type_s(2*i + 1) <= '0';
                       hdmi_data_buffer_s(i) <= "1010101011";
                    when "0011001101" =>
                        if i = 1 then
                            hdmi_data_type_s(2*i) <= '0';
                            hdmi_data_type_s(2*i + 1) <= '0';
                        else
                            hdmi_data_type_s(2*i) <= '1';
                            hdmi_data_type_s(2*i + 1) <= '0';
                        end if;
                        hdmi_data_buffer_s(i) <= "0011001101";
                    when "1100110010" =>
                        if i = 1 then
                            hdmi_data_type_s(2*i) <= '1';
                            hdmi_data_type_s(2*i + 1) <= '1';
                        else
                            hdmi_data_type_s(2*i) <= '0';
                            hdmi_data_type_s(2*i + 1) <= '1';
                        end if;
                        hdmi_data_buffer_s(i) <= "1100110010";
                    --If not control token, it's encoded data
                    when others =>
                       hdmi_data_type_s(2*i) <= '1';
                       hdmi_data_type_s(2*i + 1) <= '1';
                       if hdmi_vde_s = '1' then
                           if data_in_10(9) = '0' then
                                data_in_8 := data_in_10(7 downto 0);
                           else
                                data_in_8 := not data_in_10(7 downto 0);
                           end if;
                           hdmi_in_rgb_s(i)(0) <= data_in_8(0);
                           input_buffer_s(44 + i) <= input_buffer_s(47 + i);
                           input_buffer_s(47 + i)(0)<= data_in_8(0);
                           for iBit in 1 to 7 loop
                              if (data_in_10(8) = '1') then
                                 hdmi_in_rgb_s(i)(iBit) <= data_in_8(iBit) xor data_in_8(iBit-1);
                                 input_buffer_s(47 + i)(iBit) <= data_in_8(iBit) xor data_in_8(iBit-1);
                              else
                                 hdmi_in_rgb_s(i)(iBit) <= data_in_8(iBit) xnor data_in_8(iBit-1);
                                 input_buffer_s(47 + i)(iBit) <= data_in_8(iBit) xnor data_in_8(iBit-1);
                              end if;
                           end loop;
                       else
                           hdmi_in_rgb_s(i) <= data_in_10(7 downto 0);
                       end if;
                       hdmi_data_buffer_s(i) <= data_in_10;
                 end case;
                 if hdmi_data_type_s = "010101" or hdmi_data_type_s = "010111" or hdmi_data_type_s = "011101" or hdmi_data_type_s = "011111" or 
                            hdmi_data_type_s = "110101" or hdmi_data_type_s = "110111" or hdmi_data_type_s = "111101" or (hdmi_data_type_s = "111111" and hdmi_vde_s = '1') then
                    hdmi_vde_s <= '1';
                 else
                    hdmi_vde_s <= '0';
                 end if;
                 if hdmi_data_type_s(5 downto 2) = "1010" or hdmi_data_type_s(5 downto 2) = "1011" or
                            hdmi_data_type_s(5 downto 2) = "1110" or (hdmi_data_type_s(5 downto 2) = "1111" and hdmi_ade_s = '1') then
                    hdmi_ade_s <= '1';
                 else 
                    hdmi_ade_s <= '0';
                 end if;
            end if;
         end process;
     end generate;
     
     HDMI_out: for i in 0 to 2 generate
         process(PixelClk_s)
            variable data_out_10: std_ulogic_vector(9 downto 0);
            variable data_out_8: std_ulogic_vector(7 downto 0);
            variable temp_toBig: std_ulogic_vector(15 downto 0);
            
            variable sob_in, sob_temp: unsigned(3 downto 0);
            variable data_temp: std_ulogic_vector(8 downto 0);
            
            variable disparity, bias: signed(4 downto 0) := "00000";
            variable cond_balanced, cond_not_balanced: std_ulogic;--two different conditions
            
            
         begin
            if rising_edge(PixelClk_s) then
                if hdmi_vde_s = '0' or hdmi_data_buffer_s(i) = "1100110010" or hdmi_data_buffer_s(i) = "0011001101" then
                    data_out_10 := hdmi_data_buffer_s(i);
                    disparity := "00000";
                else
                    case output_buffer_s(44 + i) is 
                        when "00000000" =>-- Addition without Overflow 
                            if to_integer(unsigned(output_buffer_s(47 + i))) + to_integer(unsigned(hdmi_in_rgb_s(i))) > 255 then
                                data_out_8 := "11111111";
                            else
                                data_out_8 := std_ulogic_vector(unsigned(output_buffer_s(47 + i)) + unsigned(hdmi_in_rgb_s(i)));
                            end if;
                        when "00000001" =>-- Addition
                            data_out_8 := std_ulogic_vector(unsigned(output_buffer_s(47 + i)) + unsigned(hdmi_in_rgb_s(i)));
                        when "00000010" =>-- Subtraction without Overflow 
                            if to_integer(unsigned(output_buffer_s(47 + i))) - to_integer(unsigned(hdmi_in_rgb_s(i))) < 0 then
                                data_out_8 := "11111111";
                            else
                                data_out_8 := std_ulogic_vector(unsigned(output_buffer_s(47 + i)) - unsigned(hdmi_in_rgb_s(i)));
                            end if;
                        when "00000011" =>-- Subtraction
                            data_out_8 := std_ulogic_vector(unsigned(output_buffer_s(47 + i)) - unsigned(hdmi_in_rgb_s(i)));
                        when "00000100" =>-- Multiplication without Overflow 
                            if to_integer(unsigned(output_buffer_s(47 + i))) * to_integer(unsigned(hdmi_in_rgb_s(i))) > 255 then
                                data_out_8 := "11111111";
                            else
                                temp_toBig := std_ulogic_vector(unsigned(output_buffer_s(47 + i)) * unsigned(hdmi_in_rgb_s(i)));
                                data_out_8 := temp_toBig(7 downto 0);
                            end if;
                        when "00000101" =>-- Multiplication
                            temp_toBig := std_ulogic_vector(unsigned(output_buffer_s(47 + i)) * unsigned(hdmi_in_rgb_s(i)));
                            data_out_8 := temp_toBig(7 downto 0);
                        when "00000110" =>-- Division round up
                            data_out_8 := std_ulogic_vector(unsigned(output_buffer_s(47 + i)) / unsigned(hdmi_in_rgb_s(i)));
                            if unsigned(data_out_8) * unsigned(hdmi_in_rgb_s(i)) /= unsigned(output_buffer_s(47 + i)) then
                                data_out_8 := std_ulogic_vector(unsigned(data_out_8) + 1);
                            end if;
                        when "00000111" =>-- Division round down
                            data_out_8 := std_ulogic_vector(unsigned(output_buffer_s(47 + i)) / unsigned(hdmi_in_rgb_s(i)));
                        when "00001000" =>-- And
                            data_out_8 := output_buffer_s(47 + i) and hdmi_in_rgb_s(i);
                        when "00001001" =>-- Or
                            data_out_8 := output_buffer_s(47 + i) or hdmi_in_rgb_s(i);
                        when "00001010" =>-- xor
                            data_out_8 := output_buffer_s(47 + i) xor hdmi_in_rgb_s(i);
                        when "00001011" =>-- Not
                            data_out_8 := not hdmi_in_rgb_s(i);
                        when "00001100" =>-- Nand
                            data_out_8 := output_buffer_s(47 + i) nand hdmi_in_rgb_s(i);
                        when "00001101" =>-- Nor
                            data_out_8 := output_buffer_s(47 + i) nor hdmi_in_rgb_s(i);
                        when "00001110" =>-- xnor
                            data_out_8 := output_buffer_s(47 + i) xnor hdmi_in_rgb_s(i);
                        when others =>
                            data_out_8 := output_buffer_s(47 + i);
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
            hdmi_out_parallel_s(i)<= data_out_10;
         end process;
     end generate;
     
     
     
     HDMI_Serializer:process(SerialClk_s, hdmi_out_parallel_s) 
        variable cnt : unsigned(3 downto 0) := "1001";
        variable old_value: parallel_tmds := (others => (others => 'Z'));
     begin
        if rising_edge(SerialClk_s) then
            if (old_value /= hdmi_out_parallel_s) or cnt > 9 then
              cnt := "1001";
              old_value := hdmi_out_parallel_s;
            end if;
            if cnt = "1001" then
                clk_out_s <= '1';
            end if;
            if cnt = "0100" then
                clk_out_s <= '0';
            end if;
            hdmi_data_out_s(0) <= hdmi_out_parallel_s(0)(to_integer(cnt));
            hdmi_data_out_s(1) <= hdmi_out_parallel_s(1)(to_integer(cnt));
            hdmi_data_out_s(2) <= hdmi_out_parallel_s(2)(to_integer(cnt));
            cnt := cnt - 1;
        end if;
     end process;
    
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
          CLKFBOUT            => clkfbout_hdmi_clk_s,
          CLKFBOUTB           => clkfboutb_unused_s,
          CLKOUT0             => SerialClk_s,
          CLKOUT0B            => clkout0b_unused_s,
          CLKOUT1             => clkout1_unused_s,
          CLKOUT1B            => clkout1b_unused_s,
          CLKOUT2             => clkout2_unused_s,
          CLKOUT2B            => clkout2b_unused_s,
          CLKOUT3             => clkout3_unused_s,
          CLKOUT3B            => clkout3b_unused_s,
          CLKOUT4             => clkout4_unused_s,
          CLKOUT5             => clkout5_unused_s,
          CLKOUT6             => clkout6_unused_s,
          -- Input clock control
          CLKFBIN             => clkfbout_hdmi_clk_s,
          CLKIN1              => PixelClk_s,
          -- Other control and status signals
          LOCKED              => aMMCM_Locked_s,
          PWRDWN              => '0',
          RST                 => rMMCM_Reset_s);
    
    
    obuf : OBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (I=>clk_out_s, O=>port_o(0), OB=>port_o(1));
    obufdata1 : OBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (I=>hdmi_data_out_s(0), O=>port_o(2), OB=>port_o(3));--Blue
    obufdata2 : OBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (I=>hdmi_data_out_s(1), O=>port_o(4), OB=>port_o(5));--Green
    obufdata3 : OBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (I=>hdmi_data_out_s(2), O=>port_o(6), OB=>port_o(7));--Red
    
    ibuf : IBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (O=>PixelClk_s, I=>port_i(0), IB=>port_i(1));
    ibufdata1 : IBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (O=>hdmi_data_in_s(0), I=>port_i(2), IB=>port_i(3));--Blue
    ibufdata2 : IBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (O=>hdmi_data_in_s(1), I=>port_i(4), IB=>port_i(5));--Green
    ibufdata3 : IBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (O=>hdmi_data_in_s(2), I=>port_i(6), IB=>port_i(7));--Red
    
end Behavioral;

				 
