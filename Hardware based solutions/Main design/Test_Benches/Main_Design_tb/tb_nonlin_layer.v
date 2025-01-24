
`include "definitions.v"
`ifdef iverilog_comp
`include "rtl/computation/NONLINEAR_LAYER.v"
`endif

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


module tb_nonlin_layer;

localparam CLK_PERIOD = 10;
localparam BIT_WIDTH = 32;
localparam EXTRA_BITS = 2;
localparam NUM_UNKNOWNS = 2;
localparam NUM_NONLIN = 1;

wire clk;
reg rst;
reg acc_en;
wire [BIT_WIDTH + EXTRA_BITS - 1:0] acc_result;

// x = 1.23
wire [BIT_WIDTH + EXTRA_BITS - 1:0] x ;//= {2'b01, 32'h3f9d70a4};

wire [BIT_WIDTH-1:0] acc_result_ieee;
wire [BIT_WIDTH-1:0] x_ieee;
assign acc_result_ieee = acc_result[BIT_WIDTH-1:0]&{BIT_WIDTH{acc_result[BIT_WIDTH]}};
assign x_ieee = x[BIT_WIDTH-1:0]&{BIT_WIDTH{x[BIT_WIDTH]}};



CLK_GEN clk_generator(.clk(clk));

NONLINEAR_LAYER #(.WEIGHT_FILES("mem_files/R11.mem"), .NUM_NONLIN(NUM_NONLIN), .NUM_UNKNOWNS(NUM_UNKNOWNS+1), .ROM_FILES("EXP.mem")) UUT(
  .INPUT_SCALER(x),
  .CLK(clk), 
	//.ACC_EN(acc_en),
  .RESET(rst),
  .ACC_RESULT(acc_result)
);

WEIGHTS_ROM #(.DEPTH(4), .FILE_NAME("mem_files/IN1.mem")) uut1(
  .CLK(clk),
  .RESET(rst),
  .MEM_OUT(x)
);

genvar s;

generate
  for (s = 0; s<NUM_UNKNOWNS+NUM_NONLIN+1; s=s+1) begin : macc_debug
    wire [BIT_WIDTH-1:0] macc_out_iee = UUT.layer_core.neurons[s].macc_unit.ACC_RESULT[BIT_WIDTH-1:0] & {BIT_WIDTH{UUT.layer_core.neurons[s].macc_unit.ACC_RESULT[BIT_WIDTH]}};
    wire [BIT_WIDTH-1:0] macc_weight_iee = UUT.layer_core.neurons[s].macc_unit.WEIGHT_SCALER[BIT_WIDTH-1:0] & {BIT_WIDTH{UUT.layer_core.neurons[s].macc_unit.WEIGHT_SCALER[BIT_WIDTH]}};
  end

endgenerate

initial begin
  $dumpfile("tb/computation/py_scripts/testing.dump");
  $dumpvars;
  // $monitor("Input: %h, Weight: %h, ALU out: %h, RESET: %b", x[31:0], w[31:0], acc_result[31:0], rst);
  // #1 rst<=1'bx;
  #(CLK_PERIOD*2) rst<=1; acc_en = 0;
  #(CLK_PERIOD*2) rst<=0; acc_en = 1; //x = {34'b0100111111100000000000000000000000};
  #(CLK_PERIOD);
  //uut1.weight_memory[0] = 34'b0100111110010011001100110011001101; //0.2
  #(CLK_PERIOD*6);rst<=1;
  #(CLK_PERIOD)rst<=0;
  #(CLK_PERIOD*8);
  $finish;
end

endmodule

