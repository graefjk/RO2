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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IO is
    Port ( port_id_i : in std_ulogic_vector(7 downto 0);
           value_i : in std_ulogic_vector(7 downto 0);
           in_out_i : in std_ulogic;
           enable_i : in std_ulogic;
           value_o : out std_ulogic_vector(7 downto 0);
           clk_i : in std_ulogic;
           mio_b : inout std_ulogic_vector (53 downto 0);
           port_b : inout std_logic_vector (70 downto 0);
           port_i : in std_ulogic_vector (19 downto 0);
           port_o : out std_ulogic_vector (7 downto 0);
           port_reset_i: in std_ulogic;
           reset_o: out std_ulogic);
end IO;

architecture Behavioral of IO is
    type input_buffer_type is array (255 downto 0) of std_logic_vector(7 downto 0);
    signal input_buffer : input_buffer_type ;--63: next systemside unused input
    
    type output_buffer_type is array (127 downto 0) of std_ulogic_vector(7 downto 0);
    signal output_buffer : output_buffer_type ;
    
    signal mdio_clk : std_ulogic := '0'; -- 1/50 of clk_i
    
    --Audio
    signal playbackCounter: unsigned(3 downto 0) := "1000";
    signal recordCounter: unsigned(3 downto 0) := "1000";
    signal configCounter: unsigned(3 downto 0) := "1000";
    
    --HDMI from digilent github
    signal pxl_clk: std_ulogic;
    type data_in_type is array(2 downto 0) of std_ulogic_vector(7 downto 0);
    signal pDataOut: data_in_type;
    type data_out_type is array(2 downto 0) of std_ulogic_vector(9 downto 0);
    signal pDataOutRaw: data_out_type;
    type q is array(2 downto 0) of std_ulogic_vector(8 downto 0);
    signal q_m_1, q_m_xor_1, q_m_xnor_1, q_m_2: q;
    type q2 is array(2 downto 0) of std_ulogic_vector(9 downto 0);
    signal control_token_2, q_out_2: q2;
    type n is array(2 downto 0) of unsigned(3 downto 0);--range 0-8
    signal n1d_1, n1q_m_2, n0q_m_2, n1q_m_1 : n; 
    type cnt is array(2 downto 0) of signed(4 downto 0) ;--range -8 - +8 + sign
    signal dc_bias_2, cnt_t_3, cnt_t_2 : cnt := ("00000","00000","00000"); 
    signal pC0_1, pC1_1, pVde_1, pC0_2, pC1_2, pVde_2 : std_ulogic_vector(2 downto 0);
    signal cond_not_balanced_2, cond_balanced_2 : std_ulogic_vector(2 downto 0);
    
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
    reset_o <= port_reset_i;
    process(clk_i, mio_b(36), mio_b(48)) is
    
    variable usb_0_to_send_rst: std_ulogic := '0';
    variable usb_1_to_send_rst: std_ulogic := '0';
    variable Flash_counter: integer := -1;
    variable Flash_in_out: std_ulogic := '0';
    variable audio_muted: std_ulogic := '1';
    variable pmod_out_enabled: std_ulogic_vector(3 downto 0) := "0000"; 
    begin
        if rising_edge(clk_i) then
         if enable_i = '1' then
           if in_out_i = '0' then
            value_o <= to_stdulogicvector(input_buffer(to_integer(unsigned(port_id_i))));
           else 
            if port_id_i(7) = '0' then  --Buffer output
            output_buffer(to_integer(unsigned(port_id_i))) <= value_i; 
            elsif port_id_i(7) = '1' then --Intermediate Storage
            input_buffer(to_integer(unsigned(port_id_i))) <= to_stdlogicvector(value_i); 
--                storage(to_integer(unsigned(port_id_i(6 downto 0)))) <= value_i; 
--            if port_id_i(6 downto 0) = "0000000" then --USB0   
--            elsif port_id_i(6 downto 0) = "0000001" then --USB1
--            elsif port_id_i(6 downto 0) = "0000010" then --SPI Flash data 0
--                Flash_counter := 25;
--            elsif port_id_i(6 downto 0) = "0000011" then --SPI Flash data 1 
--            elsif port_id_i(6 downto 0) = "0000100" then --SPI Flash data 2 
--            elsif port_id_i(6 downto 0) = "0000101" then --SPI Flash data 3 
--            elsif port_id_i(6 downto 0) = "0000110" then --SPI Flash adress 0 
--            elsif port_id_i(6 downto 0) = "0000111" then --SPI Flash adress 1
--            elsif port_id_i(6 downto 0) = "0001000" then --SPI Flash adress 2
--            elsif port_id_i(6 downto 0) = "0001001" then --SPI Flash adress 3(only last bit)
--            elsif port_id_i(6 downto 0) = "0001000" then --Ethernet0 MDIO data 0
--            elsif port_id_i(6 downto 0) = "0001001" then --Ethernet0 MDIO data 1
--            elsif port_id_i(6 downto 0) = "0001010" then --Ethernet0 MDIO adress 0
--            elsif port_id_i(6 downto 0) = "0001011" then --Ethernet0 MDIO adress 1
--            elsif port_id_i(6 downto 0) = "0001101" then --Ethernet0
--            elsif port_id_i(6 downto 0) = "0001110" then --Ethernet0 control Signals
            
            elsif port_id_i(6 downto 0) = "0010000" then --Toogle Mute Audio
                port_b(2) <= audio_muted;
                audio_muted := not audio_muted;
            elsif port_id_i(6 downto 0) = "0010001" then --Send Audio
                playbackCounter <= "0000";
            elsif port_id_i(6 downto 0) = "0010010" then --Record Audio
                recordCounter <= "0000";
            elsif port_id_i(6 downto 0) = "0010011" then --Config Audio
                configCounter <= "0000";
            elsif port_id_i(6 downto 0) = "0010100" then --Pmod XADC(JA)
            elsif port_id_i(6 downto 0) = "0010101" then --Pmod High-Speed1(JC)
            elsif port_id_i(6 downto 0) = "0010110" then --Pmod High-Speed2(JD)
            elsif port_id_i(6 downto 0) = "0010111" then --Pmod Standard(JE)
            elsif port_id_i(6 downto 0) = "0011000" then --Pmod Toggle In/Out 1-toggle
                pmod_out_enabled := pmod_out_enabled or value_i(3 downto 0);
            --0011001 reserved for future use
            elsif port_id_i(6 downto 0) = "0011010" then --PCam control -Bit0 buffer ld input, Bit1 buffer hs input
            elsif port_id_i(6 downto 0) = "0011011" then --Send HDMI Control -Bit0-2 ctrl0, Bit3-5 ctrl1
                pVde_1(2 downto 0) <= "000";
                pC0_1(2 downto 0) <= value_i(2 downto 0); 
                pC0_1(2 downto 0) <= value_i(5 downto 3); 
            elsif port_id_i(6 downto 0) = "0011100" then --Send HDMI RED and send
                pVde_1(2 downto 0) <= "111";
            elsif port_id_i(6 downto 0) = "0011101" then --Send HDMI Green 
            elsif port_id_i(6 downto 0) = "0011110" then --Send HDMI Blue
            elsif port_id_i(6 downto 0) = "0111000" then --activate LED 1 with value/256 percent brightness
            elsif port_id_i(6 downto 0) = "0111001" then --activate LED 2 with value/256 percent brightness
            elsif port_id_i(6 downto 0) = "0111010" then --activate LED 3 with value/256 percent brightness
            elsif port_id_i(6 downto 0) = "0111011" then --activate LED 4 with value/256 percent brightness
            elsif port_id_i(6 downto 0) = "0111100" then --activate LED 5 Red with value/256 percent brightness
            elsif port_id_i(6 downto 0) = "0111001" then --activate LED 5 Green with value/256 percent brightness
            elsif port_id_i(6 downto 0) = "0111010" then --activate LED 5 Blue with value/256 percent brightness
            end if;
           end if;
           
           --Pmod
           for i in 0 to 3 loop
            if pmod_out_enabled(i) = '1' then
                port_b(16 + 8 * i downto 9 + 8 * i) <= to_stdlogicvector(output_buffer(i + 20));
            else
                if input_buffer(i + 20) /= port_b(16 + 8 * i downto 9 + 8 * i) then
                    input_buffer(to_integer(unsigned(input_buffer(63)))) <= input_buffer(i + 20);-- transfer old value to empty input field
                    input_buffer(to_integer(unsigned(input_buffer(63))) + 1) <= std_logic_vector(to_unsigned(i + 20, 8));-- store port_id
                    input_buffer(63) <= std_logic_vector(unsigned(input_buffer(63))+ 2);
                    input_buffer(i + 20) <= port_b(16 + 8 * i downto 9 + 8 * i);
                end if;
            end if;
           end loop;
           
           -- reset for usb sending queue
           if usb_0_to_send_rst = '1' then
            output_buffer(0) <= (others => '0');     
           end if;
           if usb_1_to_send_rst = '1' then
            output_buffer(1) <= (others => '0');
           end if;
         end if;
         --Flash
         if flash_counter >= 0 then
                case flash_counter is
                    -- send command EB
                    when 23|22|21|19|17|16  => mio_b(2) <= '1';
                        mio_b(10) <= '1';
                    when 20|18 => mio_b(2) <= '0';
                        mio_b(10) <= '0';
                    -- first two bits of address
                    when 15 => mio_b(5 downto 2) <= (others => '1');
                        mio_b(13 downto 10) <= (others => '1');
                    when 14 => mio_b(5 downto 2) <= (others => '1');
                        mio_b(13 downto 10) <= "110" & output_buffer(9)(7);
                    -- address
                    when 13 downto 11 => mio_b(5 downto 2) <= output_buffer(flash_counter - 5)(3 downto 0);
                        mio_b(13 downto 10) <= output_buffer(flash_counter - 5)(7 downto 4);
                    -- mode and dummy
                    when 9 downto 5 => mio_b(5 downto 2) <= (others => '0');
                        mio_b(13 downto 10) <= (others => '0');
                    -- data
                    when 4 downto 0 => mio_b(5 downto 2) <= output_buffer(flash_counter + 2)(3 downto 0);
                        mio_b(13 downto 10) <= output_buffer(flash_counter + 2)(7 downto 4);
                    -- default, should never be used
                    when others => mio_b(5 downto 2) <= (others => '0');
                        mio_b(13 downto 10) <= (others => '0');
                end case;
                flash_counter := flash_counter - 1;
          end if;
        end if;
        --USB
        if falling_edge(mio_b(36)) then
            if mio_b(31) = '1' then -- interface is to slow -> stop sending
            elsif output_buffer(0) = "00000000" then -- nothing to send
                usb_0_to_send_rst := '0';
            elsif mio_b(29) = '0' then -- send data
                mio_b(35 downto 32) <= output_buffer(0)(3 downto 0);
                mio_b(39 downto 37) <= output_buffer(0)(7 downto 5);
                mio_b(28) <= output_buffer(0)(4);
                --output_buffer(0) <= "00000000";
                usb_0_to_send_rst := '1';
                mio_b(30) <= '0';
            elsif output_buffer(0) /= "00000000" then -- something to send, but interface is sending
                mio_b(30) <= '1';
            end if;
        end if;
        if falling_edge(mio_b(48)) then
            if mio_b(43) = '1' then -- interface is to slow -> stop sending
            elsif output_buffer(1) = "00000000" then -- nothing to send
                usb_1_to_send_rst := '0';
            elsif mio_b(41) = '0' then -- send data
                mio_b(47 downto 44) <= output_buffer(1)(3 downto 0);
                mio_b(51 downto 49) <= output_buffer(1)(7 downto 5);
                mio_b(40) <= output_buffer(1)(4);
                --output_buffer(0) <= "00000000";
                usb_1_to_send_rst := '1';
                mio_b(42) <= '0';
            elsif output_buffer(1) /= "00000000" then -- something to send, but interface is sending
                mio_b(42) <= '1';
            end if;
        end if;
        if unsigned(input_buffer(63)) > 127 then
            input_buffer(63) <= std_logic_vector(to_unsigned(64, 8));
        end if;
     end process;
     
     
     --flash clocks
     --mio_b(6) <= clk_i;
     --mio_b(9) <= clk_i;
     --mio_b(8) <= clk_i;
     
     
     --MDIO clock
     process(clk_i) is
     variable  mdio_clk_counter: integer := 50;
     begin
     if(rising_edge(clk_i)) then
        if(mdio_clk_counter > 0) then
            mdio_clk_counter := mdio_clk_counter - 1;
        else 
            mdio_clk_counter := 50;
            mdio_clk <= not mdio_clk;
        end if;
     end if;
     end process;
     
     --Audio clocks
     --Master
     --port_b(1) <= port_b(1);
     --Serial
     port_b(0) <= port_b(1);
     --Record
     port_b(6) <= port_b(1);
     --Playback
     port_b(2) <= port_b(1);
     --config
     port_b(7) <= port_b(1);
     
     --Audio
     process(port_b(1)) is
     begin
     if(rising_edge(port_b(1))) then
        if playbackCounter < 8 then
            if playbackCounter < 4 then
                port_b(4) <= '1';-- Left Channel
            else
                port_b(4) <= '0';-- Right Channel
            end if;
            port_b(3) <= output_buffer(17)(to_integer(playbackCounter)); --Send Data
            playbackCounter <= playbackCounter - 1;
        end if;
        if configCounter < 8 then
            port_b(8) <= output_buffer(19)(to_integer(configCounter)); --Send Configdata
            configCounter <= configCounter - 1;
        end if;
        if recordCounter < 8 then
            if recordCounter < 4 then
                port_b(4) <= '1';-- Left Channel
            else
                port_b(4) <= '0';-- Right Channel
            end if;
            input_buffer(18)(to_integer(recordCounter)) <= port_b(5); --Record Data
            recordCounter <= recordCounter - 1;
        end if;
     end if;
     end process;
     --LED
     process(clk_i) is
     variable  led_clk_counter: integer := 256;
     begin
     if(rising_edge(clk_i)) then
        if(led_clk_counter > -1) then
            led_clk_counter := led_clk_counter - 1;
            for i in 67 downto 61 loop
                if led_clk_counter < to_integer(signed(output_buffer(i - 5))) then
                    port_b(i) <= '1';
                else 
                    port_b(i) <= '0';
                end if;
            end loop;
        else 
            led_clk_counter := 256;
        end if;
     end if;
     end process;
     
     
     --Switches/Buttons
     process(clk_i) is
        variable  led_clk_counter: integer := 256;
     begin
     if(rising_edge(clk_i)) then
        if input_buffer(62) /= port_b(60 downto 53) then
           input_buffer(to_integer(unsigned(input_buffer(63)))) <= input_buffer(62);-- transfer old value to empty input field
           input_buffer(to_integer(unsigned(input_buffer(63))) + 1) <= std_logic_vector(to_unsigned(62, 8));-- store port_id
           input_buffer(63) <= std_logic_vector(unsigned(input_buffer(63))+ 2);
           input_buffer(62) <= port_b(60 downto 53);
        end if;
     end if;
     end process;
     
     --Pcam lp
     process(port_i(9)) is
        variable lp_clk_cnt: unsigned(1 downto 0) := "00";
        variable lp_buffer: std_ulogic_vector(7 downto 0) := (others => '0');
     begin
        if rising_edge(port_i(9)) then
            lp_buffer(2 * to_integer(lp_clk_cnt)) := port_i(11);
            lp_buffer(2 * to_integer(lp_clk_cnt) + 1) := port_i(13);
            lp_clk_cnt := lp_clk_cnt + 1;
            if lp_clk_cnt > 3 then
                lp_clk_cnt := "00";
                if output_buffer(26)(0) = '1' then
                    if input_buffer(61) /= to_stdlogicvector(lp_buffer) then
                        input_buffer(to_integer(unsigned(input_buffer(63)))) <= input_buffer(61);-- transfer old value to empty input field
                        input_buffer(to_integer(unsigned(input_buffer(63))) + 1) <= std_logic_vector(to_unsigned(61, 8));-- store port_id
                        input_buffer(63) <= std_logic_vector(unsigned(input_buffer(63))+ 2);
                        input_buffer(61) <= to_stdlogicvector(lp_buffer);
                    end if;
                end if;
            end if;
        end if;
     end process;
     
     --Pcam hs
     process(port_i(15)) is
        variable hs_clk_cnt: unsigned(1 downto 0) := "00";
        variable hs_buffer: std_ulogic_vector(7 downto 0) := (others => '0');
     begin
        if rising_edge(port_i(15)) then
            hs_buffer(2 * to_integer(hs_clk_cnt)) := port_i(17);
            hs_buffer(2 * to_integer(hs_clk_cnt) + 1) := port_i(19);
            hs_clk_cnt := hs_clk_cnt + 1;
            if hs_clk_cnt > 3 then
                hs_clk_cnt := "00";
                if output_buffer(26)(1) = '1' then
                    if input_buffer(60) /= to_stdlogicvector(hs_buffer) then
                        input_buffer(to_integer(unsigned(input_buffer(63)))) <= input_buffer(60);-- transfer old value to empty input field
                        input_buffer(to_integer(unsigned(input_buffer(63))) + 1) <= std_logic_vector(to_unsigned(60, 8));-- store port_id
                        input_buffer(63) <= std_logic_vector(unsigned(input_buffer(63))+ 2);
                        input_buffer(60) <= to_stdlogicvector(hs_buffer);
                    end if;
                end if;
            end if;
        end if;
     end process;
    --HDMI from Digilent repository
    RGB : for j in 2 downto 0 generate
        Stage1: process(pxl_clk)
         
        begin
            if Rising_Edge(pxl_clk) then
        
                n1d_1(j) <= sum_bits(pDataOut(j)(7 downto 0));
                pDataOut(j) <= output_buffer(28 + j); --insert data into the pipeline;
            end if;
        end process Stage1;
        
        ----------------------------------------------------------------------------------
        -- Choose one of the two encoding options based on n1d_1
        ----------------------------------------------------------------------------------
--        q_m_xor_1(j)(0) <= pDataOut(j)(0);
--        encode1: for i in 1 to 7 generate
--            q_m_xor_1(j)(i) <= q_m_xor_1(j)(i-1) xor pDataOut(j)(i);
--        end generate encode1;
--        q_m_xor_1(j)(8) <= '1';
        
        q_m_xnor_1(j)(0) <= pDataOut(j)(0);
        encode2: for i in 1 to 7 generate
            q_m_xnor_1(j)(i) <= q_m_xnor_1(j)(i-1) xnor pDataOut(j)(i);
        end generate encode2;
        q_m_xnor_1(j)(8) <= '0';
        
        q_m_1(j) <= q_m_xnor_1(j) when n1d_1(j) > 4 or (n1d_1(j) = 4 and pDataOut(j)(0) = '0') else
                 q_m_xor_1(j);
        
        n1q_m_1(j) <= sum_bits(q_m_1(j)(7 downto 0));
                
        ----------------------------------------------------------------------------------
        -- Pipeline stage 2, balance DC
        ----------------------------------------------------------------------------------
        Stage2: process(pxl_clk)
        begin
            if Rising_Edge(pxl_clk) then
                n1q_m_2(j) <= n1q_m_1(j);
                n0q_m_2(j) <= 8 - n1q_m_1(j);
                q_m_2(j) <= q_m_1(j);
                pC0_2(j) <= pC0_1(j);
                pC1_2(j) <= pC1_1(j);
                pVde_2(j) <= pVde_1(j);
            end if;
        end process Stage2;
        
        cond_balanced_2(j) <=   '1' when cnt_t_3(j) = 0 or n1q_m_2(j) = 4 else -- DC balanced output
                                   '0';
        cond_not_balanced_2(j) <=  '1' when (cnt_t_3(j) > 0 and n1q_m_2(j) > 4) or -- too many 1's
                                             (cnt_t_3(j) < 0 and n1q_m_2(j) < 4) else -- too many 0's
                                '0';
        
        control_token_2(j) <= 	"1101010100" when pC1_2(j) = '0' and pC0_2(j) = '0' else
                             "0010101011" when pC1_2(j) = '0' and pC0_2(j) = '1' else
                             "0101010100" when pC1_2(j) = '1' and pC0_2(j) = '0' else
                             "1010101011";
                                    
        q_out_2(j) <=  control_token_2(j)												when pVde_2(j) = '0' else	--control period
                       not q_m_2(j)(8) & q_m_2(j)(8) & not q_m_2(j)(7 downto 0)    when cond_balanced_2(j) = '1' and q_m_2(j)(8) = '0' else
                       not q_m_2(j)(8) & q_m_2(j)(8) & q_m_2(j)(7 downto 0)        when cond_balanced_2(j) = '1' and q_m_2(j)(8) = '1' else
                       '1' & q_m_2(j)(8) & not q_m_2(j)(7 downto 0)             when cond_not_balanced_2(j) = '1' else
                       '0' & q_m_2(j)(8) & q_m_2(j)(7 downto 0);	--DC balanced
        
        dc_bias_2(j) <= signed('0' & n0q_m_2(j)) - signed('0' & n1q_m_2(j));
        
        cnt_t_2(j) <=  to_signed(0, cnt_t_2(j)'length)                                   when pVde_2(j) = '0' else	--control period
                       cnt_t_3(j) + dc_bias_2(j)                                          when cond_balanced_2(j) = '1' and q_m_2(j)(8) = '0' else
                       cnt_t_3(j) - dc_bias_2(j)                                            when cond_balanced_2(j) = '1' and q_m_2(j)(8) = '1' else
                       cnt_t_3(j) + signed('0' & q_m_2(j)(8 downto 8) & '0') + dc_bias_2(j)	   when cond_not_balanced_2(j) = '1' else
                       cnt_t_3(j) - signed('0' & not q_m_2(j)(8 downto 8) & '0') - dc_bias_2(j);
        
        ----------------------------------------------------------------------------------
        -- Pipeline stage 3, registered output
        ----------------------------------------------------------------------------------
        Stage3: process(pxl_clk)
        begin
           if Rising_Edge(pxl_clk) then
              cnt_t_3(j) <= cnt_t_2(j);
              pDataOutRaw(j) <= q_out_2(j); --encoded, ready to be serialized
           end if;
        end process Stage3;
    end generate;
    hdmi_serial: process(port_b(45))
        variable clk_cnt: unsigned(3 downto 0):= "0000";
    begin
        if Rising_Edge(port_b(45)) then
            for i in 1 to 3 loop
                port_o(i*2) <= pDataOutRaw(i - 1)(to_integer(clk_cnt));
                port_o(i*2 + 1) <= not pDataOutRaw(i - 1)(to_integer(clk_cnt));
            end loop;
            if clk_cnt < 4 then
                pxl_clk <= '0';
            else 
                pxl_clk <= '1';
            end if;
            clk_cnt := (clk_cnt + 1) mod 10;
        end if;
    end process hdmi_serial;
    --port_o(0) <= port_b(45);
    --port_o(1) <= not port_b(45);
end Behavioral;

				 
