set_input_delay -max 6.0 -clock adc_clk_i [get_ports adc_dat_a_i[*]]
set_input_delay -min 3.5 -clock adc_clk_i [get_ports adc_dat_a_i[*]]

set_input_delay -max 6.0 -clock adc_clk_i [get_ports adc_dat_b_i[*]]
set_input_delay -min 3.5 -clock adc_clk_i [get_ports adc_dat_b_i[*]]
