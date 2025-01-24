
`include "definitions.v"
//`ifdef iverilog_comp
//`include "rtl/computation/LINEAR_LAYER.v"
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


module tb_lin_layer;

localparam CLK_PERIOD = 10;
localparam BIT_WIDTH = 32;
localparam EXTRA_BITS = 2;

wire clk;
reg rst;
reg acc_en;
wire [BIT_WIDTH + EXTRA_BITS - 1:0] acc_result;


// x = 1.23
wire [BIT_WIDTH + EXTRA_BITS - 1:0] x ;//= {2'b01, 32'h3f9d70a4};


CLK_GEN clk_generator(.clk(clk));

LINEAR_LAYER #(.WEIGHT_FILES("mem_files/R11.mem"), .NUM_UNKNOWNS(2)) UUT(
	.INPUT_SCALER(x),
	.CLK(clk), 
	//.ACC_EN(acc_en),
	.RESET(rst),
	.ACC_RESULT(acc_result)
);

WEIGHTS_ROM #(.DEPTH(2), .FILE_NAME("mem_files/IN1.mem")) uut1(
	.CLK(clk),
	.RESET(rst),
	.MEM_OUT(x)
);

initial begin
  $dumpfile("tb/computation/py_scripts/testing.dump");
  $dumpvars;
  // $monitor("Input: %h, Weight: %h, ALU out: %h, RESET: %b", x[31:0], w[31:0], acc_result[31:0], rst);
  // #1 rst<=1'bx;
  #(CLK_PERIOD*2) rst<=1; acc_en = 0;
  #(CLK_PERIOD*2) rst<=0; acc_en = 1; //x = {34'b0100111111100000000000000000000000};
  #(CLK_PERIOD);
  //uut1.weight_memory[0] = 34'b0100111110010011001100110011001101; //0.2
  #(CLK_PERIOD*6);//rst<=1;
  #(CLK_PERIOD)rst<=0;
  #(CLK_PERIOD*4);
  $finish;
end

endmodule

