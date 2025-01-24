
`include "definitions.v"
//`ifdef iverilog_comp
//`include "rtl/computation/FWD_ENGINE.v"
//`include "rtl/computation/BWD_ENGINE.v"
//`endif

module CLK_GEN #(
	parameter CLK_PERIOD = 10 )
(
	output reg clk
);
initial begin
	clk<=0;
	forever #(CLK_PERIOD/2) clk<=~clk;
end
endmodule


module tb_fwd_bwd;

localparam CLK_PERIOD = 10;
localparam BIT_WIDTH = 32;
localparam EXTRA_BITS = 2;
localparam NUM_UNKNOWNS = 2;
localparam NUM_NONLIN = 1;

wire clk;
reg rst;
reg acc_en;
wire [BIT_WIDTH + EXTRA_BITS - 1:0] acc_result_l1;
wire [BIT_WIDTH + EXTRA_BITS - 1:0] acc_result;
wire [(BIT_WIDTH + EXTRA_BITS)*NUM_NONLIN - 1:0]   net_d_out;
wire [BIT_WIDTH + EXTRA_BITS - 1:0] l1_error;
wire [BIT_WIDTH + EXTRA_BITS - 1:0] l2_error;

// x = 1.23
wire [BIT_WIDTH + EXTRA_BITS - 1:0] x ;//= {2'b01, 32'h3f9d70a4};

wire [BIT_WIDTH-1:0] acc_result_ieee;
wire [BIT_WIDTH-1:0] x_ieee;
wire [BIT_WIDTH-1:0] err_ieee;
assign acc_result_ieee = acc_result[BIT_WIDTH-1:0]&{BIT_WIDTH{acc_result[BIT_WIDTH]}};
assign x_ieee = x[BIT_WIDTH-1:0]&{BIT_WIDTH{x[BIT_WIDTH]}};
assign err_ieee = UUT1.ERROR_ACC_OUT;

CLK_GEN clk_generator(.clk(clk));

FWD_ENGINE #(.WEIGHT_FILES_L1("R11.mem"), .NUM_UNKNOWNS(2), .NUM_NONLIN(1), .WEIGHT_FILES_L2("R21.mem")) UUT(
	.INPUT_SCALER(x),
	.CLK(clk), 
	.RESET(rst),
    .NET_D_OUT(net_d_out),
    .ERROR_ACC_OUT(l1_error),
	.ACC_RESULT(acc_result_l1)
);

BWD_ENGINE #(.WEIGHT_FILES_L1("R12.mem"), .NUM_UNKNOWNS(2), .NUM_NONLIN(1), .WEIGHT_FILES_L2("R22.mem")) UUT1(
	.INPUT_SCALER(acc_result_l1),
	.CLK(clk), 
    .NET_D_IN(net_d_out),
    .ERROR_ACC_IN(l1_error),
    .ERROR_ACC_OUT(l2_error),
	.RESET(rst),
	.ACC_RESULT(acc_result)
);

WEIGHTS_ROM #(.DEPTH(4), .FILE_NAME("IN1.mem")) uut2(
	.CLK(clk),
	.RESET(rst),
	.MEM_OUT(x)
);

genvar s;

generate
  for (s = 0; s<NUM_UNKNOWNS; s=s+1) begin : l2_macc_debug
    wire [BIT_WIDTH-1:0] l2_macc_out_iee = UUT1.linear_layer.layer_core.neurons[s].macc_unit.ACC_RESULT[BIT_WIDTH-1:0] & {BIT_WIDTH{UUT.linear_layer.layer_core.neurons[s].macc_unit.ACC_RESULT[BIT_WIDTH]}};
    wire [BIT_WIDTH-1:0] l2_macc_weight_iee = UUT1.linear_layer.layer_core.neurons[s].macc_unit.WEIGHT_SCALER[BIT_WIDTH-1:0] & {BIT_WIDTH{UUT.linear_layer.layer_core.neurons[s].macc_unit.WEIGHT_SCALER[BIT_WIDTH]}};
  end
  for (s = 0; s<NUM_UNKNOWNS; s=s+1) begin : l1_macc_debug
    wire [BIT_WIDTH-1:0] l1_macc_out_iee = UUT1.nonlinear_layer.layer_core.neurons[s].macc_unit.ACC_RESULT[BIT_WIDTH-1:0] & {BIT_WIDTH{UUT.nonlinear_layer.layer_core.neurons[s].macc_unit.ACC_RESULT[BIT_WIDTH]}};
    wire [BIT_WIDTH-1:0] l1_macc_weight_iee = UUT1.nonlinear_layer.layer_core.neurons[s].macc_unit.WEIGHT_SCALER[BIT_WIDTH-1:0] & {BIT_WIDTH{UUT.nonlinear_layer.layer_core.neurons[s].macc_unit.WEIGHT_SCALER[BIT_WIDTH]}};
  end
endgenerate
initial begin
  $dumpfile("D:/semester 10/Graduation_project/integartion_17_5/integration/testing.dump");
  $dumpvars;
  // $monitor("Input: %h, Weight: %h, ALU out: %h, RESET: %b", x[31:0], w[31:0], acc_result[31:0], rst);
  // #1 rst<=1'bx;
  #(CLK_PERIOD*2) rst<=1; acc_en = 0;
  #(CLK_PERIOD*2) rst<=0; acc_en = 1; //x = {34'b0100111111100000000000000000000000};
  #(CLK_PERIOD*9);
  //uut1.weight_memory[0] = 34'b0100111110010011001100110011001101; //0.2
  #(CLK_PERIOD*6);//rst<=1;
  #(CLK_PERIOD)rst<=0;
  #(CLK_PERIOD*40);
  $finish;
end

endmodule

