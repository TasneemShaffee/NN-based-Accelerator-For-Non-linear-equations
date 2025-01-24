/*
An initial test bench for the ALU module

Helper modules used
	+ CLK_GEN : for driving the clock
*/
`include "definitions.v"
//`ifdef iverilog_comp
//`include "rtl/computation/ALU32_NP.v"
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



module tb_alu;

localparam CLK_PERIOD = 10;
localparam BIT_WIDTH = 32;
localparam EXTRA_BITS = 2;

wire clk;
reg rst;
reg acc_en;
wire [BIT_WIDTH + EXTRA_BITS - 1:0] acc_result;


// x = 1.23
reg [BIT_WIDTH + EXTRA_BITS - 1:0] x = {2'b01, 32'h3f9d70a4};

// w = 4.56
reg [BIT_WIDTH + EXTRA_BITS - 1:0] w = {2'b01, 32'h4091eb85};



CLK_GEN clk_generator(.clk(clk));
ALU #(.BIT_WIDTH(BIT_WIDTH), .EXTRA_BITS(EXTRA_BITS)) UUT(
	.WEIGHT_SCALER(w),
	.INPUT_SCALER(x),
	.CLK(clk), 
	.ACC_EN(acc_en),
	.RESET(rst),
	.ACC_RESULT(acc_result)
);




function real convert;
	input integer float_in;
	integer i;
	real cvt;
	begin
		convert = 0;
		for (i = 22; i> 0; i=i-1) begin
			convert = convert + float_in[i]*((2.0)**-(23-i));
		end
		convert = (1+convert)*((2.0)**(float_in[30:23]-127));
	end
	endfunction




initial begin
  $dumpfile("tb/computation/py_scripts/testing.dump");
  $dumpvars;
  $monitor("Input: %h, Weight: %h, ALU out: %h, RESET: %b", x[31:0], w[31:0], acc_result[31:0], rst);
  #1 rst<=1'bx;
  #(CLK_PERIOD*3) rst<=1; acc_en = 0;
  #(CLK_PERIOD*3) rst<=0; acc_en = 1; x = {2'b01, 32'h3f9d70a4}; w = {2'b01, 32'h4091eb85};
  // RESET is done, probe inputs and weight for a clock cycle
  // x = 1.23, w = 4.56; the accumulator output should be 1.23*4.56 = 5.6088 => 32'h40b37b4a
  // x = 7.89 w = 10.11 , now expected result should be 1.23*4.56 + 7.89*10.11 = 85.3767 >=32'h42aac0df
  #(CLK_PERIOD) x[31:0] = 32'h40fc7ae1; w[31:0] = 32'h4121c28f; 
  // now clear ACC, restart multiplication for another forward pass
  // next set of inputs are x=1.11 w=2.22; 1.11*2.22 = 2.4642 => 32'h401db574
  #(CLK_PERIOD) acc_en = 0; x[31:0] = 32'h3f8e147b; w[31:0]=32'h400e147b; 
  // next, we no longer asserting the reset, instead we accumulate the next set of weights
  // we set x=3.33 w=4.44 such that the expected result is now 1.11*2.22 + 3.33*4.44 = 17.2494 => 32'h4189fec5
  #(CLK_PERIOD) acc_en = 1; x[31:0] = 32'h40551eb8; w[31:0]=32'h408e147b;
  #(CLK_PERIOD);
  $finish;
end

endmodule

