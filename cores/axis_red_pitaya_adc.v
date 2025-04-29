module axis_red_pitaya_adc # 
( 
	parameter integer DAC_DATA_WIDTH = 12 
) 
( 
	input wire aclk, 
	output wire adc_csn, 
	input wire [11:0] adc_dat_a, 
	input wire [11:0] adc_dat_b, 
	output wire m_axis_tvalid, 
	output wire [31:0] m_axis_tdata 
);

assign adc_csn = 1'b1; 
assign m_axis_tvalid = 1'b1;

wire signed [15:0] data_a_signed = $signed({1'b0, adc_dat_a}) - 13'sd2048; 
wire signed [15:0] data_b_signed = $signed({1'b0, adc_dat_b}) - 13'sd2048;

assign m_axis_tdata = {data_b_signed, data_a_signed};

endmodule
