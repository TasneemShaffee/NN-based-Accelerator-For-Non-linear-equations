`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:59:34 06/15/2018 
// Design Name: 
// Module Name:    Without_CU_tb 
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
module Without_CU_tb(
    );
parameter DATA_WIDTH=32;
  parameter RAM_DEPTH=2;
  parameter BIT_WIDTH = 32;
  parameter EXTRA_BITS = 2;
  parameter NUM_UNKNOWNS = 2;
  parameter NUM_NONLIN = 1;
  reg clk;
  reg rst;

  reg training_mode;
  reg Finish_First_Manhattan_Iter;
  reg Finish_Second_Manhattan_Iter;
  reg stall;
  reg local_initial_read_flag;
  reg old_weight_rd;
  reg local_write_training;
  reg local_finish;
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] Best_error;
  //reg test_write_buffer_bestweights;
initial begin
	clk<=0;
	forever #5 clk<=~clk;
end
Without_CU#

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
 .training_mode(training_mode),
 .stall(stall),
 .Finish_First_Manhattan_Iter(Finish_First_Manhattan_Iter),
 .Finish_Second_Manhattan_Iter(Finish_Second_Manhattan_Iter),
 .local_initial_read_flag(local_initial_read_flag),
 .old_weight_rd(old_weight_rd),
 .local_write_training(local_write_training),
 .local_finish(local_finish),
 .Best_error(Best_error)
);
initial begin
rst=1'b0; 
stall=1;
training_mode=1;
 #5;
 rst=1'b1;
 #11;
 rst=1'b0;
 local_initial_read_flag=1;
  #5;
  #15;
  local_initial_read_flag=0;
  #9;
  #9;
  old_weight_rd=1;
  stall=0; //training activation
 //expected output of manhattan 0x3dced917 first iteration 
 //expected output of manhattan 0x3dcd013b => second iteration
 #9;
 local_write_training=1;
 #9;
 old_weight_rd=0;//deactivate read old weights
 Finish_First_Manhattan_Iter=1;// do adaptive step for manhattan
#9;
Finish_First_Manhattan_Iter=0; //deactivate this signal /not to do adaptive step
local_write_training=0; //deactivatd write weights of training 
stall=1;
#39;
old_weight_rd=1;
stall=0; //training activation
old_weight_rd=1; //read from old weight from memory
#9;
local_write_training=1; //write in memory updated weight
#9;
old_weight_rd=0;
#9;
local_write_training=0;
stall=1;
Finish_Second_Manhattan_Iter=1; //reset the eta signal
#9;
Finish_Second_Manhattan_Iter=0; // stop resetting eta for next iterations
#39;
$finish;
 end

endmodule
