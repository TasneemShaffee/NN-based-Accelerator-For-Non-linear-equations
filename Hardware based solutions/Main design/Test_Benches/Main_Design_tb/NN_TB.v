`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:02:06 06/21/2018 
// Design Name: 
// Module Name:    NN_TB 
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
module NN_TB();
 parameter DATA_WIDTH=32;
  parameter RAM_DEPTH=2;
  parameter BIT_WIDTH = 32;
  parameter EXTRA_BITS = 2;
  parameter NUM_UNKNOWNS = 2;
  parameter NUM_NONLIN = 1;
  reg clk;
  reg rst;

  
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] Best_error;
  wire stop_training;
  wire  [NUM_UNKNOWNS*(BIT_WIDTH + EXTRA_BITS) - 1:0] out;
 
initial begin
	clk<=0;
	forever #5 clk<=~clk;
end
NN#

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
 .Best_error(Best_error),
 .stop_training(stop_training),
 .out(out)
);
initial begin
rst=1'b0; 

 #5;
 rst=1'b1;
 #11;
 rst=1'b0;
 #900;
  
$finish;
 end


endmodule
