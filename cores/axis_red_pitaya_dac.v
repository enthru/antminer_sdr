`timescale 1 ns / 1 ps

module axis_red_pitaya_dac #
(
  parameter integer DAC_DATA_WIDTH = 14,
  parameter integer AXIS_TDATA_WIDTH = 32
)
(
  // PLL signals
  input  wire                        aclk,
  input  wire                        wrt_clk,
  input  wire                        locked,

  // DAC signals
  output wire                        dac_clk,
  output reg  [DAC_DATA_WIDTH-1:0]   dac_dat,

  // Slave side
  output wire                        s_axis_tready,
  input  wire [AXIS_TDATA_WIDTH-1:0] s_axis_tdata,
  input  wire                        s_axis_tvalid
);

  reg [DAC_DATA_WIDTH-1:0] data_reg;

  wire [DAC_DATA_WIDTH-1:0] data_wire;

  assign data_wire = s_axis_tdata[DAC_DATA_WIDTH-1:0];

  always @(posedge aclk) begin
    if (~locked || ~s_axis_tvalid) begin
      data_reg <= {DAC_DATA_WIDTH{1'b0}};
    end else begin
      data_reg <= {data_wire[DAC_DATA_WIDTH-1], ~data_wire[DAC_DATA_WIDTH-2:0]};
    end
  end

  always @(posedge aclk) begin
    dac_dat <= data_reg;
  end

  assign s_axis_tready = 1'b1;
  assign dac_clk = wrt_clk;

endmodule
