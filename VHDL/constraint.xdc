# This file is a general .xdc for the Zybo Z7 Rev. B
# It is compatible with the Zybo Z7-20 and Zybo Z7-10
# To use it in a project:
# - uncomment the lines corresponding to used pins
# - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

#Clock signal
set_property -dict {PACKAGE_PIN K17 IOSTANDARD LVCMOS33} [get_ports clk_i]
create_clock -period 8.000 -name sys_clk_pin -waveform {0.000 4.000} -add [get_ports clk_i]


#Switches
set_property -dict {PACKAGE_PIN G15 IOSTANDARD LVCMOS33} [get_ports {port_b[53]}]
set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports {port_b[54]}]
set_property -dict {PACKAGE_PIN W13 IOSTANDARD LVCMOS33} [get_ports {port_b[55]}]
set_property -dict {PACKAGE_PIN T16 IOSTANDARD LVCMOS33} [get_ports {port_b[56]}]


#Buttons
set_property -dict {PACKAGE_PIN K18 IOSTANDARD LVCMOS33} [get_ports {port_b[57]}]
set_property -dict {PACKAGE_PIN P16 IOSTANDARD LVCMOS33} [get_ports {port_b[58]}]
set_property -dict {PACKAGE_PIN K19 IOSTANDARD LVCMOS33} [get_ports {port_b[59]}]
set_property -dict {PACKAGE_PIN Y16 IOSTANDARD LVCMOS33} [get_ports {port_b[60]}]
#set_property -dict { PACKAGE_PIN B13   IOSTANDARD LVCMOS33 } [get_ports { test }]; #IO_L7P_T1_34 Sch=btn[4]
#set_property -dict { PACKAGE_PIN B9   IOSTANDARD LVCMOS33 } [get_ports { test }]; #IO_L7P_T1_34 Sch=btn[5]

#LEDs
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {port_b[61]}]
set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports {port_b[62]}]
set_property -dict {PACKAGE_PIN G14 IOSTANDARD LVCMOS33} [get_ports {port_b[63]}]
set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVCMOS33} [get_ports {port_b[64]}]
#set_property -dict { PACKAGE_PIN D8   IOSTANDARD LVCMOS33 } [get_ports { test }]; #IO_L3N_T0_DQS_AD1N_35 Sch=led[3]

##RGB LED 5 (Zybo Z7-20 only)
#set_property -dict { PACKAGE_PIN Y11   IOSTANDARD LVCMOS33 } [get_ports { led5_r }]; #IO_L18N_T2_13 Sch=led5_r
#set_property -dict { PACKAGE_PIN T5    IOSTANDARD LVCMOS33 } [get_ports { led5_g }]; #IO_L19P_T3_13 Sch=led5_g
#set_property -dict { PACKAGE_PIN Y12   IOSTANDARD LVCMOS33 } [get_ports { led5_b }]; #IO_L20P_T3_13 Sch=led5_b

#RGB LED 6
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports {port_b[65]}]
set_property -dict {PACKAGE_PIN F17 IOSTANDARD LVCMOS33} [get_ports {port_b[66]}]
set_property -dict {PACKAGE_PIN M17 IOSTANDARD LVCMOS33} [get_ports {port_b[67]}]


#Audio Codec
# Clock for 48 kHz sampling rate
create_clock -period 81.380 -waveform {0.000 40.690} [get_ports {port_b[1]}]
set_property -dict {PACKAGE_PIN R19 IOSTANDARD LVCMOS33} [get_ports {port_b[0]}]
set_property -dict {PACKAGE_PIN R17 IOSTANDARD LVCMOS33} [get_ports {port_b[1]}]
set_property -dict {PACKAGE_PIN P18 IOSTANDARD LVCMOS33} [get_ports {port_b[2]}]
set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS33} [get_ports {port_b[3]}]
set_property -dict {PACKAGE_PIN T19 IOSTANDARD LVCMOS33} [get_ports {port_b[4]}]
set_property -dict {PACKAGE_PIN R16 IOSTANDARD LVCMOS33} [get_ports {port_b[5]}]
set_property -dict {PACKAGE_PIN Y18 IOSTANDARD LVCMOS33} [get_ports {port_b[6]}]
set_property -dict {PACKAGE_PIN N18 IOSTANDARD LVCMOS33} [get_ports {port_b[7]}]
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports {port_b[8]}]


#Additional Ethernet signals
set_property -dict {PACKAGE_PIN F16 IOSTANDARD LVCMOS33 PULLUP true} [get_ports {port_b[68]}]
set_property -dict {PACKAGE_PIN E17 IOSTANDARD LVCMOS33} [get_ports {port_b[69]}]


#USB-OTG over-current detect pin
set_property -dict {PACKAGE_PIN U13 IOSTANDARD LVCMOS33} [get_ports {port_b[70]}]


##Fan (Zybo Z7-20 only)
#set_property -dict { PACKAGE_PIN Y13   IOSTANDARD LVCMOS33  PULLUP true    } [get_ports { fan_fb_pu }]; #IO_L20N_T3_13 Sch=fan_fb_pu

#HDMI Clock
create_clock -period 0.6734 -waveform {0.000 0.3367} [get_ports {port_b[45]}]
set_property -dict {PACKAGE_PIN P19 IOSTANDARD LVCMOS33} [get_ports {port_b[45]}]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {port_b[45]}]

#HDMI RX
set_property -dict {PACKAGE_PIN W19 IOSTANDARD LVCMOS33} [get_ports {port_b[46]}]
set_property -dict {PACKAGE_PIN W18 IOSTANDARD LVCMOS33} [get_ports {port_b[47]}]
set_property -dict {PACKAGE_PIN Y19 IOSTANDARD LVCMOS33} [get_ports {port_b[48]}]
set_property -dict {PACKAGE_PIN U19 IOSTANDARD TMDS_33} [get_ports {port_i[0]}]
set_property -dict {PACKAGE_PIN U18 IOSTANDARD TMDS_33} [get_ports {port_i[1]}]
set_property -dict {PACKAGE_PIN W20 IOSTANDARD TMDS_33} [get_ports {port_i[2]}]
set_property -dict {PACKAGE_PIN V20 IOSTANDARD TMDS_33} [get_ports {port_i[3]}]
set_property -dict {PACKAGE_PIN U20 IOSTANDARD TMDS_33} [get_ports {port_i[4]}]
set_property -dict {PACKAGE_PIN T20 IOSTANDARD TMDS_33} [get_ports {port_i[5]}]
set_property -dict {PACKAGE_PIN P20 IOSTANDARD TMDS_33} [get_ports {port_i[6]}]
set_property -dict {PACKAGE_PIN N20 IOSTANDARD TMDS_33} [get_ports {port_i[7]}]

##HDMI RX CEC (Zybo Z7-20 only)
#set_property -dict { PACKAGE_PIN Y8    IOSTANDARD LVCMOS33 } [get_ports { hdmi_rx_cec }]; #IO_L14N_T2_SRCC_13 Sch=hdmi_rx_cec


#HDMI TX
set_property -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS33} [get_ports {port_b[49]}]
set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVCMOS33} [get_ports {port_b[50]}]
set_property -dict {PACKAGE_PIN G18 IOSTANDARD LVCMOS33} [get_ports {port_b[51]}]
set_property -dict {PACKAGE_PIN H17 IOSTANDARD TMDS_33} [get_ports {port_o[0]}]
set_property -dict {PACKAGE_PIN H16 IOSTANDARD TMDS_33} [get_ports {port_o[1]}]
set_property -dict {PACKAGE_PIN D20 IOSTANDARD TMDS_33} [get_ports {port_o[2]}]
set_property -dict {PACKAGE_PIN D19 IOSTANDARD TMDS_33} [get_ports {port_o[3]}]
set_property -dict {PACKAGE_PIN B20 IOSTANDARD TMDS_33} [get_ports {port_o[4]}]
set_property -dict {PACKAGE_PIN C20 IOSTANDARD TMDS_33} [get_ports {port_o[5]}]
set_property -dict {PACKAGE_PIN A20 IOSTANDARD TMDS_33} [get_ports {port_o[6]}]
set_property -dict {PACKAGE_PIN B19 IOSTANDARD TMDS_33} [get_ports {port_o[7]}]

#HDMI TX CEC
set_property -dict {PACKAGE_PIN E19 IOSTANDARD LVCMOS33} [get_ports {port_b[52]}]


#Pmod Header JA (XADC)
set_property -dict {PACKAGE_PIN N15 IOSTANDARD LVCMOS33} [get_ports {port_b[9]}]
set_property -dict {PACKAGE_PIN L14 IOSTANDARD LVCMOS33} [get_ports {port_b[10]}]
set_property -dict {PACKAGE_PIN K16 IOSTANDARD LVCMOS33} [get_ports {port_b[11]}]
set_property -dict {PACKAGE_PIN K14 IOSTANDARD LVCMOS33} [get_ports {port_b[12]}]
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports {port_b[13]}]
set_property -dict {PACKAGE_PIN L15 IOSTANDARD LVCMOS33} [get_ports {port_b[14]}]
set_property -dict {PACKAGE_PIN J16 IOSTANDARD LVCMOS33} [get_ports {port_b[15]}]
set_property -dict {PACKAGE_PIN J14 IOSTANDARD LVCMOS33} [get_ports {port_b[16]}]


##Pmod Header JB (Zybo Z7-20 only)
#set_property -dict { PACKAGE_PIN V8    IOSTANDARD LVCMOS33     } [get_ports { port_b[17] }]; #IO_L15P_T2_DQS_13 Sch=jb_p[1]
#set_property -dict { PACKAGE_PIN W8    IOSTANDARD LVCMOS33     } [get_ports { port_b[18] }]; #IO_L15N_T2_DQS_13 Sch=jb_n[1]
#set_property -dict { PACKAGE_PIN U7    IOSTANDARD LVCMOS33     } [get_ports { port_b[19] }]; #IO_L11P_T1_SRCC_13 Sch=jb_p[2]
#set_property -dict { PACKAGE_PIN V7    IOSTANDARD LVCMOS33     } [get_ports { port_b[20] }]; #IO_L11N_T1_SRCC_13 Sch=jb_n[2]
#set_property -dict { PACKAGE_PIN Y7    IOSTANDARD LVCMOS33     } [get_ports { port_b[21] }]; #IO_L13P_T2_MRCC_13 Sch=jb_p[3]
#set_property -dict { PACKAGE_PIN Y6    IOSTANDARD LVCMOS33     } [get_ports { port_b[22] }]; #IO_L13N_T2_MRCC_13 Sch=jb_n[3]
#set_property -dict { PACKAGE_PIN V6    IOSTANDARD LVCMOS33     } [get_ports { port_b[23] }]; #IO_L22P_T3_13 Sch=jb_p[4]
#set_property -dict { PACKAGE_PIN W6    IOSTANDARD LVCMOS33     } [get_ports { port_b[24] }]; #IO_L22N_T3_13 Sch=jb_n[4]


#Pmod Header JC
set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports {port_b[17]}]
set_property -dict {PACKAGE_PIN W15 IOSTANDARD LVCMOS33} [get_ports {port_b[18]}]
set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports {port_b[19]}]
set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports {port_b[20]}]
set_property -dict {PACKAGE_PIN W14 IOSTANDARD LVCMOS33} [get_ports {port_b[21]}]
set_property -dict {PACKAGE_PIN Y14 IOSTANDARD LVCMOS33} [get_ports {port_b[22]}]
set_property -dict {PACKAGE_PIN T12 IOSTANDARD LVCMOS33} [get_ports {port_b[23]}]
set_property -dict {PACKAGE_PIN U12 IOSTANDARD LVCMOS33} [get_ports {port_b[24]}]


#Pmod Header JD
set_property -dict {PACKAGE_PIN T14 IOSTANDARD LVCMOS33} [get_ports {port_b[25]}]
set_property -dict {PACKAGE_PIN T15 IOSTANDARD LVCMOS33} [get_ports {port_b[26]}]
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {port_b[27]}]
set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports {port_b[28]}]
set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports {port_b[29]}]
set_property -dict {PACKAGE_PIN U15 IOSTANDARD LVCMOS33} [get_ports {port_b[30]}]
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {port_b[31]}]
set_property -dict {PACKAGE_PIN V18 IOSTANDARD LVCMOS33} [get_ports {port_b[32]}]


#Pmod Header JE
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports {port_b[33]}]
set_property -dict {PACKAGE_PIN W16 IOSTANDARD LVCMOS33} [get_ports {port_b[34]}]
set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports {port_b[35]}]
set_property -dict {PACKAGE_PIN H15 IOSTANDARD LVCMOS33} [get_ports {port_b[36]}]
set_property -dict {PACKAGE_PIN V13 IOSTANDARD LVCMOS33} [get_ports {port_b[37]}]
set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVCMOS33} [get_ports {port_b[38]}]
set_property -dict {PACKAGE_PIN T17 IOSTANDARD LVCMOS33} [get_ports {port_b[39]}]
set_property -dict {PACKAGE_PIN Y17 IOSTANDARD LVCMOS33} [get_ports {port_b[40]}]


#Pcam MIPI CSI-2 Connector
# This configuration expects the sensor to use 672Mbps/lane = 336 MHz HS_Clk
#create_clock -period 2.976 -waveform {0.000 1.488} [get_ports {port_b[71]}]
create_clock -period 2.976 -waveform {0.000 1.488} [get_ports {port_i[15]}]
set_property INTERNAL_VREF 0.6 [get_iobanks 35]
set_property -dict {PACKAGE_PIN J19 IOSTANDARD HSUL_12} [get_ports {port_i[8]}]; 
set_property -dict {PACKAGE_PIN H20 IOSTANDARD HSUL_12} [get_ports {port_i[9]}];  
set_property -dict {PACKAGE_PIN M18 IOSTANDARD HSUL_12} [get_ports {port_i[10]}];  
set_property -dict {PACKAGE_PIN L19 IOSTANDARD HSUL_12} [get_ports {port_i[11]}];  
set_property -dict {PACKAGE_PIN L20 IOSTANDARD HSUL_12} [get_ports {port_i[12]}];  
set_property -dict {PACKAGE_PIN J20 IOSTANDARD HSUL_12} [get_ports {port_i[13]}];  
set_property -dict {PACKAGE_PIN H18 IOSTANDARD LVDS_25} [get_ports {port_i[14]}];  
set_property -dict {PACKAGE_PIN J18 IOSTANDARD LVDS_25} [get_ports {port_i[15]}];  
set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVDS_25} [get_ports {port_i[16]}];  
set_property -dict {PACKAGE_PIN M19 IOSTANDARD LVDS_25} [get_ports {port_i[17]}];  
set_property -dict {PACKAGE_PIN L17 IOSTANDARD LVDS_25} [get_ports {port_i[18]}];  
set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVDS_25} [get_ports {port_i[19]}];  
set_property -dict {PACKAGE_PIN G19 IOSTANDARD LVCMOS33} [get_ports {port_b[41]}]; 
set_property -dict {PACKAGE_PIN G20 IOSTANDARD LVCMOS33 PULLUP true} [get_ports {port_b[42]}]; 
set_property -dict {PACKAGE_PIN F20 IOSTANDARD LVCMOS33} [get_ports {port_b[43]}]; 
set_property -dict {PACKAGE_PIN F19 IOSTANDARD LVCMOS33} [get_ports {port_b[44]}]; 


#Unloaded Crypto Chip SWI (for future use)
#set_property -dict {PACKAGE_PIN P19 IOSTANDARD LVCMOS33} [get_ports {port_b[45]}]


##Unconnected Pins (Zybo Z7-20 only)
#set_property PACKAGE_PIN T9 [get_ports {netic19_t9}]; #IO_L12P_T1_MRCC_13
#set_property PACKAGE_PIN U10 [get_ports {netic19_u10}]; #IO_L12N_T1_MRCC_13
#set_property PACKAGE_PIN U5 [get_ports {netic19_u5}]; #IO_L19N_T3_VREF_13
#set_property PACKAGE_PIN U8 [get_ports {netic19_u8}]; #IO_L17N_T2_13
#set_property PACKAGE_PIN U9 [get_ports {netic19_u9}]; #IO_L17P_T2_13
#set_property PACKAGE_PIN V10 [get_ports {netic19_v10}]; #IO_L21N_T3_DQS_13
#set_property PACKAGE_PIN V11 [get_ports {netic19_v11}]; #IO_L21P_T3_DQS_13
#set_property PACKAGE_PIN V5 [get_ports {netic19_v5}]; #IO_L6N_T0_VREF_13
#set_property PACKAGE_PIN W10 [get_ports {netic19_w10}]; #IO_L16P_T2_13
#set_property PACKAGE_PIN W11 [get_ports {netic19_w11}]; #IO_L18P_T2_13
#set_property PACKAGE_PIN W9 [get_ports {netic19_w9}]; #IO_L16N_T2_13
#set_property PACKAGE_PIN Y9 [get_ports {netic19_y9}]; #IO_L14P_T2_SRCC_13



