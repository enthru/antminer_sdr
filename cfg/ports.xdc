
# set_property CFGBVS VCCO [current_design]
# set_property CONFIG_VOLTAGE 3.3 [current_design]

### ADC

# data

set_property IOSTANDARD LVCMOS33 [get_ports {adc_dat_a_i[*]}]
set_property IOB TRUE [get_ports {adc_dat_a_i[*]}]

set_property PACKAGE_PIN T17 [get_ports {adc_dat_a_i[0]}]
set_property PACKAGE_PIN R18 [get_ports {adc_dat_a_i[1]}]
set_property PACKAGE_PIN R17 [get_ports {adc_dat_a_i[2]}]
set_property PACKAGE_PIN R16 [get_ports {adc_dat_a_i[3]}]
set_property PACKAGE_PIN V16 [get_ports {adc_dat_a_i[4]}]
set_property PACKAGE_PIN W16 [get_ports {adc_dat_a_i[5]}]
set_property PACKAGE_PIN Y19 [get_ports {adc_dat_a_i[6]}]
set_property PACKAGE_PIN Y18 [get_ports {adc_dat_a_i[7]}]
set_property PACKAGE_PIN V20 [get_ports {adc_dat_a_i[8]}]
set_property PACKAGE_PIN W20 [get_ports {adc_dat_a_i[9]}]
set_property PACKAGE_PIN U20 [get_ports {adc_dat_a_i[10]}]
set_property PACKAGE_PIN T20 [get_ports {adc_dat_a_i[11]}]

set_property IOSTANDARD LVCMOS33 [get_ports {adc_dat_b_i[*]}]
set_property IOB TRUE [get_ports {adc_dat_b_i[*]}]

set_property PACKAGE_PIN C20 [get_ports {adc_dat_b_i[0]}]
set_property PACKAGE_PIN B20 [get_ports {adc_dat_b_i[1]}]
set_property PACKAGE_PIN J15 [get_ports {adc_dat_b_i[2]}]
set_property PACKAGE_PIN A20 [get_ports {adc_dat_b_i[3]}]
set_property PACKAGE_PIN E17 [get_ports {adc_dat_b_i[4]}]
set_property PACKAGE_PIN D18 [get_ports {adc_dat_b_i[5]}]
set_property PACKAGE_PIN D19 [get_ports {adc_dat_b_i[6]}]
set_property PACKAGE_PIN D20 [get_ports {adc_dat_b_i[7]}]
set_property PACKAGE_PIN E18 [get_ports {adc_dat_b_i[8]}]
set_property PACKAGE_PIN E19 [get_ports {adc_dat_b_i[9]}]
set_property PACKAGE_PIN J16 [get_ports {adc_dat_b_i[10]}]
set_property PACKAGE_PIN F17 [get_ports {adc_dat_b_i[11]}]

# clock input
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {system_i/pll_0/inst/clk_in1_system_pll_0_0}]
set_property IOSTANDARD LVCMOS33 [get_ports adc_clk_i]
#l12p
set_property PACKAGE_PIN K17 [get_ports adc_clk_i]

# clock duty cycle stabilizer (CSn)

set_property IOSTANDARD LVCMOS33 [get_ports adc_csn_o]
set_property PACKAGE_PIN G15 [get_ports adc_csn_o]
set_property SLEW FAST [get_ports adc_csn_o]
set_property DRIVE 8 [get_ports adc_csn_o]

### DAC
set_property IOSTANDARD LVCMOS33 [get_ports {dac_dat_o[*]}]
set_property SLEW SLOW [get_ports {dac_dat_o[*]}]
set_property DRIVE 4 [get_ports {dac_dat_o[*]}]
# set_property IOB TRUE [get_ports {dac_dat_o[*]}]

#l8p
#set_property PACKAGE_PIN W14 [get_ports {dac_dat_o[0]}]
#l8n
#set_property PACKAGE_PIN Y14 [get_ports {dac_dat_o[1]}]
#l6p
#set_property PACKAGE_PIN P14 [get_ports {dac_dat_o[2]}]
#l6n
#set_property PACKAGE_PIN R14 [get_ports {dac_dat_o[3]}]
#l5n
#set_property PACKAGE_PIN T15 [get_ports {dac_dat_o[4]}]
#l5p
#set_property PACKAGE_PIN T14 [get_ports {dac_dat_o[5]}]
#l4p
#set_property PACKAGE_PIN V12 [get_ports {dac_dat_o[6]}]
#l4n
#set_property PACKAGE_PIN W13 [get_ports {dac_dat_o[7]}]
#l3p
#set_property PACKAGE_PIN V13 [get_ports {dac_dat_o[8]}]
#0_plug2
#set_property PACKAGE_PIN R19 [get_ports {dac_dat_o[9]}]
#l2p
#set_property PACKAGE_PIN T12 [get_ports {dac_dat_o[10]}]
#l2n
#set_property PACKAGE_PIN U12 [get_ports {dac_dat_o[11]}]
#l1n
#set_property PACKAGE_PIN T10 [get_ports {dac_dat_o[12]}]
#l1p
#set_property PACKAGE_PIN T11 [get_ports {dac_dat_o[13]}]


#l8p
set_property PACKAGE_PIN T11 [get_ports {dac_dat_o[0]}]
#l8n
set_property PACKAGE_PIN T10 [get_ports {dac_dat_o[1]}]
#l6p
set_property PACKAGE_PIN U12 [get_ports {dac_dat_o[2]}]
#l6n
set_property PACKAGE_PIN T12 [get_ports {dac_dat_o[3]}]
#l5n
set_property PACKAGE_PIN R19 [get_ports {dac_dat_o[4]}]
#l5p
set_property PACKAGE_PIN V13 [get_ports {dac_dat_o[5]}]
#l4p
set_property PACKAGE_PIN W13 [get_ports {dac_dat_o[6]}]
#l4n
set_property PACKAGE_PIN V12 [get_ports {dac_dat_o[7]}]
#l3p
set_property PACKAGE_PIN T14 [get_ports {dac_dat_o[8]}]
#0_plug2
set_property PACKAGE_PIN T15 [get_ports {dac_dat_o[9]}]
#l2p
set_property PACKAGE_PIN R14 [get_ports {dac_dat_o[10]}]
#l2n
set_property PACKAGE_PIN P14 [get_ports {dac_dat_o[11]}]
#l1n
set_property PACKAGE_PIN Y14 [get_ports {dac_dat_o[12]}]
#l1p
set_property PACKAGE_PIN W14 [get_ports {dac_dat_o[13]}]

# DAC stuff
set_property IOSTANDARD LVCMOS33 [get_ports dac_*_o]
set_property SLEW FAST [get_ports dac_*_o]
set_property DRIVE 8 [get_ports dac_*_o]

set_property PACKAGE_PIN M20 [get_ports dac_wrt_o]
set_property PACKAGE_PIN K14 [get_ports dac_sel_o]
#Clock
set_property PACKAGE_PIN Y16 [get_ports dac_clk_o]
set_property PACKAGE_PIN J14 [get_ports dac_rst_o]

### Expansion connector
set_property IOSTANDARD LVCMOS33 [get_ports {exp_p_tri_io[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {exp_n_tri_io[*]}]
set_property SLEW FAST [get_ports {exp_p_tri_io[*]}]
set_property SLEW FAST [get_ports {exp_n_tri_io[*]}]
set_property DRIVE 8 [get_ports {exp_p_tri_io[*]}]
set_property DRIVE 8 [get_ports {exp_n_tri_io[*]}]

#PTT l15p
set_property PACKAGE_PIN F19 [get_ports {exp_p_tri_io[0]}]
set_property PACKAGE_PIN L20 [get_ports {exp_n_tri_io[0]}]
#preamp l16n
set_property PACKAGE_PIN G18 [get_ports {exp_p_tri_io[1]}]
set_property PACKAGE_PIN K19 [get_ports {exp_n_tri_io[1]}]
#att 10 l22p
set_property PACKAGE_PIN W18 [get_ports {exp_p_tri_io[2]}]
set_property PACKAGE_PIN J19 [get_ports {exp_n_tri_io[2]}]
#att 20 l22n
set_property PACKAGE_PIN W19 [get_ports {exp_p_tri_io[3]}]
set_property PACKAGE_PIN L16 [get_ports {exp_n_tri_io[3]}]
#h1 l17n
set_property PACKAGE_PIN H20 [get_ports {exp_p_tri_io[4]}]
set_property PACKAGE_PIN L17 [get_ports {exp_n_tri_io[4]}]
#h2 l16p
set_property PACKAGE_PIN G17 [get_ports {exp_p_tri_io[5]}]
set_property PACKAGE_PIN N15 [get_ports {exp_n_tri_io[5]}]
#h3 l17p
set_property PACKAGE_PIN J20 [get_ports {exp_p_tri_io[6]}]
set_property PACKAGE_PIN G19 [get_ports {exp_n_tri_io[6]}]
#h4 l15n
set_property PACKAGE_PIN F20 [get_ports {exp_p_tri_io[7]}]
set_property PACKAGE_PIN H16 [get_ports {exp_n_tri_io[7]}]

set_property PULLTYPE PULLUP [get_ports {exp_n_tri_io[0]}]
set_property PULLTYPE PULLUP [get_ports {exp_n_tri_io[1]}]
set_property PULLTYPE PULLUP [get_ports {exp_n_tri_io[2]}]
set_property PULLTYPE PULLUP [get_ports {exp_n_tri_io[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {exp_n_alex[*]}]
set_property SLEW FAST [get_ports {exp_n_alex[*]}]
set_property DRIVE 8 [get_ports {exp_n_alex[*]}]

set_property PACKAGE_PIN H17 [get_ports {exp_n_alex[0]}]
set_property PACKAGE_PIN G20 [get_ports {exp_n_alex[1]}]
set_property PACKAGE_PIN H18 [get_ports {exp_n_alex[2]}]
set_property PACKAGE_PIN H15 [get_ports {exp_n_alex[3]}]
