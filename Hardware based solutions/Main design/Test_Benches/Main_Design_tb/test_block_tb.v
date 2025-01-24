`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:21:29 05/23/2018 
// Design Name: 
// Module Name:    test_block_tb 
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
module test_block_tb(
    );
	 parameter DATA_WIDTH=32;
    parameter RAM_DEPTH=2;
	  parameter BIT_WIDTH = 32;
  parameter EXTRA_BITS = 2;
  reg clk;
  reg rst;
  reg                                training_mode;
  reg [BIT_WIDTH + EXTRA_BITS - 1:0] l2_error;
  reg local_initial_read_flag;
  reg local_finish;
  reg stall;
  reg [BIT_WIDTH + EXTRA_BITS - 1:0] delta_val;
  reg training_rd;
  reg training_wr;
  reg test_write_buffer_bestweights;
initial begin
	clk<=0;
	forever #5 clk<=~clk;
end
test_block test_inst(
  .CLK(clk),
  .RESET(rst),
  .training_mode(training_mode),
  .l2_error(l2_error),
  .local_initial_read_flag(local_initial_read_flag),
  .local_finish(local_finish),
  .stall(stall),
  .training_rd(training_rd),
  .training_wr(training_wr),
  .test_write_buffer_bestweights(test_write_buffer_bestweights),
  .delta_val( delta_val)
);
initial begin
 rst=1'b0;
 training_wr=0;
 stall=1;
 training_rd=0;
 local_initial_read_flag=0;
 local_finish=0;
 l2_error={2'b01,32'b00111010100000110001001001101111};//0.001
 delta_val={2'b01,32'b00111101110011001100110011001101};//0.1
 training_mode=1;
 #5;
 rst=1'b1;
 local_initial_read_flag=1;
 #10;
 stall=0;
 rst=1'b0;
  training_wr=1;
  test_write_buffer_bestweights=1;
 //expected output of manhattan 0x3dced917 first iteration 
 //expected output of manhattan 0x3dcd013b => second iteration
 #10;
 #10;

 local_initial_read_flag=0; //finished reading from rom
  //traini
 training_rd=1;
  //training_mode=0; //let it be adam	
  #10;
   test_write_buffer_bestweights=0;
  //training_mode=0;
  #10;
  training_rd=0;
  local_finish=1;
  #20;
$finish;
 end
endmodule
