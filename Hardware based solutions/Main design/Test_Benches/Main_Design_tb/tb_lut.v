/*
An initial test bench for the LUT module

Helper modules used
	+ CLK_GEN : for driving the clock
*/

/*
An intensive testbench for the ALU module
	+ Random sequences are generated by the Python script 
	+ A high level model written in python is used as the golden model for testing
	+ The results of both UUT and the python model are compared [from the python script side] and a plot is shown
	+ The parameter <num_test_cases> is used to control the number of the testcases both from the script and from the hdl file 
	+ The tb is invoked from the python script

Helper modules used
	+ CLK_GEN : for driving the clock
*/

`include "rtl/storage/ACTIVATION_LUT.v"

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



module tb_lut;

localparam CLK_PERIOD = 10;
localparam BIT_WIDTH = 32;
localparam EXTRA_BITS = 0;
localparam num_test_cases = 100;

wire clk;
reg rst;
reg acc_en; 
wire [BIT_WIDTH + EXTRA_BITS - 1:0] lut_result;


// x = 0
reg [BIT_WIDTH + EXTRA_BITS - 1:0] x = {2'b01, 32'h0};


// 32*1 floats + 2*1 extra bits
reg [33:0] test_vector_mem [0:num_test_cases-1];
reg [BIT_WIDTH-1:0] test_results [0:num_test_cases];
integer test_case = 0;
integer result_file;

CLK_GEN clk_generator(
	.clk(clk)
);

ACTIVATION_LUT #(.BIT_WIDTH(BIT_WIDTH), .EXTRA_BITS(EXTRA_BITS), .FILE_NAME("rtl/computation/EXP_ROM.txt")) UUT(
	.INPUT_SCALER(x),
	.CLK(clk), 
	.MEM_OUT(lut_result)
);


initial begin

  $monitor("Input: %b, LUT out: %b, LUT_ADDR: %d", x[31:0],  lut_result[31:0], UUT.lut_address);

  // some random initial state
  #1 rst<=1'bx;
  // weight for some CLK_CYCLES; then reset the accumultor
  //#(CLK_PERIOD) x<=32'b 11000000010101010001111010111000;	//-3.33
	#(CLK_PERIOD) x<=32'b 10111110111001100110011001100110;	//-0.4
	#(CLK_PERIOD) x<=32'b 10111111001001100110011001100110;	//0.95
	//#(CLK_PERIOD) x<=32'b 00111111100000000000000000000000;	//1
	//#(CLK_PERIOD) x<=32'b 00111111100001100110011001100110;	//.05
	// #(CLK_PERIOD) x<=32'b 11000000010101010001111010111000;
//	#(CLK_PERIOD) x<=32'b 11000000010101010001111010111000;
  #(CLK_PERIOD) ;
	$finish;
end

endmodule

