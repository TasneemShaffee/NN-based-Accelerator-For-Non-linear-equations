`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:08:26 06/18/2018 
// Design Name: 
// Module Name:    NN_without_CU_TB 
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
module NN_with_CU_TB(
    );
parameter DATA_WIDTH=32;
  parameter RAM_DEPTH=2; 
  parameter BIT_WIDTH = 32;
  parameter EXTRA_BITS = 2;
  parameter NUM_UNKNOWNS = 2;
  parameter NUM_NONLIN = 1;
  parameter Manh_iter = 1;          
  parameter Adam_iter = 0;          
  parameter total_iter = 1; 
  reg clk;
  reg rst;

  
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] Best_error;
  //reg test_write_buffer_bestweights;
initial begin
	clk<=0;
	forever #5 clk<=~clk;
end
NN_Without_CU#

(
  BIT_WIDTH  ,
  EXTRA_BITS ,
  NUM_UNKNOWNS ,
  NUM_NONLIN ,
  (NUM_UNKNOWNS+1),
   Manh_iter ,          
   Adam_iter ,          
  total_iter 
 
)
 test_inst(
 .CLK(clk),
 .RESET(rst),
 .Best_error(Best_error)
);
initial begin
rst=1'b0; 
#5;
 rst=1'b1;
 #11;
 rst=1'b0;

  
 /*
 old_weight_rd=1;
 stall=0;
  #10; 
  Update_Weight=1;
  local_write_training=1; 
  #5;
  #5;
  old_weight_rd=0;
  #10;
  stall=1;
  Update_Weight=0;
  local_write_training=0;
  #10;
  #10; 
  #10;
  #10;
  */
/*
 #5;
 rst=1'b1;
 #11;
 rst=1'b0;
 local_initial_read_flag=1; //load weights
  #5;
  #15;
  #5;
  #15;
  
  local_initial_read_flag=0;
  #40;
  old_weight_rd=1;
  #10;
  local_write_training=1;
  Update_Weight=1;
  #10;
  old_weight_rd=0;
  #10;
  local_write_training=0;
  Update_Weight=0;
  #30;
  old_weight_rd=1;
  #10;
  local_write_training=1;
  Update_Weight=1;
  #10;
  old_weight_rd=0;
  #10;
  local_write_training=0;
  Update_Weight=0;
  Finish_First_Manhattan_Iter=1;
  local_finish=1;
  #10;
  Finish_First_Manhattan_Iter=0;
  #30;
  local_finish=0;
  old_weight_rd=1;
  #10;
  local_write_training=1;
  Update_Weight=1;
  #10;
  old_weight_rd=0;
  #10;
  local_write_training=0;
  Update_Weight=0;
  #30;
  old_weight_rd=1;
  #10;
  local_write_training=1;
  Update_Weight=1;
  #10;
  old_weight_rd=0;
  local_finish=1;
  #10;
  local_write_training=0;
  Update_Weight=0;
  Finish_Second_Manhattan_Iter=1;
  training_mode=0;
  
  #30;
  local_finish=0;
  old_weight_rd=1;
  #10;
  local_write_training=1;
  Update_Weight=1;
  #10;
  old_weight_rd=0;
  #10;
  local_write_training=0;
  Update_Weight=0;
  #30;
  */
$finish;
 end


endmodule
