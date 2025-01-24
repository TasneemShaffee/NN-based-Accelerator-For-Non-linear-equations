`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:34:31 06/09/2018 
// Design Name: 
// Module Name:    test_blocks_cu_training_MEM_tb 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module test_blocks_cu_training_MEM_tb(
    );
 parameter DATA_WIDTH=32;
  parameter RAM_DEPTH=2;
  parameter BIT_WIDTH = 32;
  parameter EXTRA_BITS = 2;
  parameter NUM_UNKNOWNS = 2;
  parameter NUM_NONLIN = 1;
  reg clk;
  reg rst;

 // reg [BIT_WIDTH + EXTRA_BITS - 1:0] l2_error;
  //reg [BIT_WIDTH + EXTRA_BITS - 1:0] delta_val;
  //reg training_rd;
  //reg training_wr;
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] Best_error;
  //reg test_write_buffer_bestweights;
initial begin
	clk<=0;
	forever #5 clk<=~clk;
end
test_blocks_cu_training_MEM#

(
  BIT_WIDTH  ,
  EXTRA_BITS ,
  NUM_UNKNOWNS ,
  NUM_NONLIN ,
  (NUM_UNKNOWNS+1)
 
)
 test_inst(
  .CLK(clk),
  .RESET(rst),
  //.l2_error(l2_error),
  //.test_write_buffer_bestweights(test_write_buffer_bestweights),
 // .delta_val( delta_val)
  .Best_error(Best_error)
);
initial begin
 rst=1'b0; 

 //l2_error={2'b01,32'b00111010100000110001001001101111};//0.001
 //delta_val={2'b01,32'b00111101110011001100110011001101};//0.1
 #5;
 rst=1'b1;
 #10;

 rst=1'b0;
  #10;
  #50;
 
 //expected output of manhattan 0x3dced917 first iteration 
 //expected output of manhattan 0x3dcd013b => second iteration
 #10;
 #10;
#20;
#50;
$finish;
 end
endmodule
