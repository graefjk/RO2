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

entity IO is
    Port ( port_id_i : in std_ulogic_vector(7 downto 0);
           value_i : in std_ulogic_vector(7 downto 0);
           in_out_i : in std_ulogic;
           enable_i : in std_ulogic;
           value_o : out std_ulogic_vector(7 downto 0);
           clk_i : in std_ulogic;
           mio_b : inout std_ulogic_vector (53 downto 0);
           port_b : inout std_logic_vector (70 downto 0):= (others => 'Z');
           port_i : in std_ulogic_vector (19 downto 0);
           port_o : out std_ulogic_vector (7 downto 0);
           reset_o: out std_ulogic);
end IO;

architecture Behavioral of IO is
    type output_buffer_type is array (127 downto 0) of std_ulogic_vector(7 downto 0);
    signal output_buffer : output_buffer_type ;
	signal hdmi_clk : std_ulogic;
	type input_buffer_type is array (255 downto 0) of std_logic_vector(7 downto 0);
    signal input_buffer : input_buffer_type := (others => (others => 'Z'));--63: next systemside unused input
    
	signal pmod_out_enabled: std_ulogic_vector(3 downto 0) := "0000"; 
	
	signal reset_enable : std_ulogic_vector(7 downto 0) := "10000000";
    
    signal hdmi_data: std_ulogic_vector(2 downto 0):= "LLL";
begin
    
    reset_o <= '0' when (std_ulogic_vector(port_b(60 downto 53)) and reset_enable(7 downto 0)) = "00000000" else '1';
    
    
    pmod_out: for i in 0 to 3 generate
        port_b(16 + 8 * i downto 9 + 8 * i) <= to_stdlogicvector(output_buffer(i + 50)) when pmod_out_enabled(i) = '1' else (others => 'Z');
    end generate;
    
    
    main: process(clk_i) is
        
    begin
        if rising_edge(clk_i) then
         if enable_i = '1' then
           if in_out_i = '1' then
            if port_id_i(7) = '0' then  --Buffer output
				output_buffer(to_integer(unsigned(port_id_i))) <= value_i; 
			end if;
            if port_id_i(6 downto 0) = "0110111" then --Toggle use Button as reset- default 10000000
                reset_enable <= reset_enable xor value_i(7 downto 0);
                input_buffer(55) <= std_logic_vector(reset_enable);
            elsif port_id_i(6 downto 0) = "0110110" then --Pmod Toggle In/Out 1-toggle
                pmod_out_enabled <= pmod_out_enabled xor value_i(3 downto 0);
                input_buffer(54)(3 downto 0) <= std_logic_vector(pmod_out_enabled);
            end if;
           else 
            value_o <= to_stdulogicvector(input_buffer(to_integer(unsigned(port_id_i))));
           end if;
        --Pmod
           for i in 0 to 3 loop
            if pmod_out_enabled(i) = '0' then
                input_buffer(i + 50) <= port_b(16 + 8 * i downto 9 + 8 * i);
            end if;
           end loop;
		 end if;
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
    port map (O=>hdmi_clk, I=>port_i(0), IB=>port_i(1));
    ibufdata1 : IBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (O=>hdmi_data(0), I=>port_i(2), IB=>port_i(3));
    ibufdata2 : IBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (O=>hdmi_data(1), I=>port_i(4), IB=>port_i(5));
    ibufdata3 : IBUFDS
    generic map (IOSTANDARD =>"TMDS_33")
    port map (O=>hdmi_data(2), I=>port_i(6), IB=>port_i(7));
    
end Behavioral;

				 
