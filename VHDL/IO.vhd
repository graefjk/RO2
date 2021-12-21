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
           in_out_i : in std_ulogic_vector(7 downto 0);
           enable_i : in std_ulogic;
           value_o : out std_ulogic_vector(7 downto 0);
           clk_i : in std_ulogic;
           mio_b : inout std_ulogic_vector (53 downto 0);
           port_b : inout std_ulogic_vector (11 downto 0));
end IO;

architecture Behavioral of IO is
    type storage_type is array (127 downto 0) of std_ulogic_vector(7 downto 0);
    signal storage : storage_type;
    attribute storage_style : string;
    attribute storage_style of storage : signal is "block";
    signal mdio_clk : std_ulogic := '0'; -- 1/50 of clk_i
    
begin
    process(clk_i, mio_b(36), mio_b(48)) is
    variable usb_0_to_send : std_ulogic_vector(7 downto 0) := (others => '0');
    variable usb_1_to_send : std_ulogic_vector(7 downto 0) := (others => '0');
    variable usb_0_to_send_rst: std_ulogic := '0';
    variable usb_1_to_send_rst: std_ulogic := '0';
    variable Flash_data : std_ulogic_vector(15 downto 0) := (others => '0');
    variable Flash_adress : std_ulogic_vector(31 downto 0) := (others => '0');
    variable Flash_counter: integer := 0;
    variable Flash_in_out: std_ulogic := '0';
    begin
        if rising_edge(clk_i) then
         if enable_i = '1' then
           if in_out_i = "0" then
            
           else 
            if port_id_i(7) = '1' then --Intermediate Storage
                storage(to_integer(unsigned(port_id_i(6 downto 0)))) <= value_i; 
            elsif port_id_i(6 downto 0) = "0000000" then --USB0
                usb_0_to_send := value_i;           
            elsif port_id_i(6 downto 0) = "0000001" then --USB1
                usb_1_to_send := value_i;
                
            elsif port_id_i(6 downto 0) = "0000010" then --SPI Flash data 0
                Flash_data(7 downto 0) := value_i;
                Flash_counter := 21;
            elsif port_id_i(6 downto 0) = "0000011" then --SPI Flash data 1
                Flash_data(15 downto 8) := value_i;
            elsif port_id_i(6 downto 0) = "0000100" then --SPI Flash adress 0
                Flash_adress(31 downto 24) := value_i;
            elsif port_id_i(6 downto 0) = "0000101" then --SPI Flash adress 1
                Flash_adress(23 downto 16) := value_i;
            elsif port_id_i(6 downto 0) = "0000110" then --SPI Flash adress 2
                Flash_adress(15 downto 8) := value_i;
            elsif port_id_i(6 downto 0) = "0000111" then --SPI Flash adress 3
                Flash_adress(7 downto 0) := value_i;
                
            elsif port_id_i(6 downto 0) = "0000010" then --Ethernet MDIO data 0
                Flash_data(7 downto 0) := value_i;
            elsif port_id_i(6 downto 0) = "0000011" then --Ethernet MDIO data 1
                Flash_data(15 downto 8) := value_i;
            elsif port_id_i(6 downto 0) = "0000100" then --Ethernet MDIO adress 0
                Flash_adress(31 downto 24) := value_i;
            elsif port_id_i(6 downto 0) = "0000101" then --Ethernet MDIO adress 1
                Flash_adress(23 downto 16) := value_i;
            elsif port_id_i(6 downto 0) = "0000010" then --Ethernet 
                Flash_data(7 downto 0) := value_i;
                
            end if;
           end if;
           -- reset for usb sending queue
           if usb_0_to_send_rst = '1' then
            usb_0_to_send := "00000000";
           end if;
           if usb_1_to_send_rst = '1' then
            usb_1_to_send := "00000000";
           end if;
         else            
         end if;
         --Flash
         if flash_counter > 0 then
                case flash_counter is
                    -- send comand EB
                    when 21|20|19|17|15|14  => mio_b(2) <= '1';
                        mio_b(10) <= '1';
                    when 18|16 => mio_b(2) <= '0';
                        mio_b(10) <= '0';
                    when 12 downto 9 => mio_b(5 downto 2) <= flash_adress(flash_counter + 19 - (12 - flash_counter)*3 downto flash_counter + 16 - (12 - flash_counter)*3);
                        mio_b(13 downto 10) <= flash_adress(flash_counter + 3 - (12 - flash_counter)*3 downto flash_counter - (12 - flash_counter)*3);
                    when others => mio_b(10) <= '0';
                end case;
                flash_counter := flash_counter - 1;
          end if;
        end if;
        --USB
        if falling_edge(mio_b(36)) then
            if mio_b(31) = '1' then -- interface is to slow -> stop sending
            elsif usb_0_to_send = "00000000" then -- nothing to send
                usb_0_to_send_rst := '0';
            elsif mio_b(29) = '0' then -- send data
                mio_b(35 downto 32) <= usb_0_to_send(3 downto 0);
                mio_b(39 downto 37) <= usb_0_to_send(7 downto 5);
                mio_b(28) <= usb_0_to_send(4);
                usb_0_to_send_rst := '1';
                mio_b(30) <= '0';
            elsif usb_0_to_send /= "00000000" then -- something to send, but interface is sending
                mio_b(30) <= '1';
            end if;
        end if;
        if falling_edge(mio_b(48)) then
            if mio_b(43) = '1' then -- interface is to slow -> stop sending
            elsif usb_1_to_send = "00000000" then -- nothing to send
                usb_1_to_send_rst := '0';
            elsif mio_b(41) = '0' then -- send data
                mio_b(47 downto 44) <= usb_1_to_send(3 downto 0);
                mio_b(51 downto 49) <= usb_1_to_send(7 downto 5);
                mio_b(40) <= usb_1_to_send(4);
                usb_1_to_send_rst := '1';
                mio_b(42) <= '0';
            elsif usb_1_to_send /= "00000000" then -- something to send, but interface is sending
                mio_b(42) <= '1';
            end if;
        end if;
     end process;
     
     
     --flash clocks
     mio_b(6) <= clk_i;
     mio_b(9) <= clk_i;
     mio_b(8) <= clk_i;
     
     
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
end Behavioral;
