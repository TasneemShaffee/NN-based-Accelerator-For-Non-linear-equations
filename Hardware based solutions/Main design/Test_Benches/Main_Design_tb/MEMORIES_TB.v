`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:25:23 06/17/2018 
// Design Name: 
// Module Name:    MEMORIES_TB 
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
module MEMORIES_TB(
    );
parameter DATA_WIDTH=32;
  parameter RAM_DEPTH=2;
  parameter BIT_WIDTH = 32;
  parameter EXTRA_BITS = 2;
  parameter NUM_UNKNOWNS = 2;
  parameter NUM_NONLIN = 1;
  reg clk;
  reg rst;
  reg [BIT_WIDTH + EXTRA_BITS - 1:0]Local_UpdatedWeight_L1;
  reg local_initial_read_flag;
  reg old_weight_rd;
  reg local_write_training;
  reg local_finish;
  reg Update_Weight;
  reg local_write_en;
  //reg test_write_buffer_bestweights;
initial begin
	clk<=0;
	forever #5 clk<=~clk;
end
MEMORIES#

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
 .local_initial_read_flag(local_initial_read_flag),
 .old_weight_rd(old_weight_rd),
 .local_write_training(local_write_training),
 .local_finish(local_finish),
 .Local_UpdatedWeight_L1(Local_UpdatedWeight_L1),
 .local_write_en(local_write_en),
 .Update_Weight(Update_Weight)
);
initial begin
rst=1'b0; 
Local_UpdatedWeight_L1={2'b01,32'h3f000000};
old_weight_rd=0;
local_write_en=0;
local_finish=0;
local_write_training=0;
Update_Weight=0;

 #5;
 rst=1'b1;
 #11;
 rst=1'b0;
 local_initial_read_flag=1; //read from rom weight and send it to fwd_bwd/save initial weights as best weights
  #5;
  #5;
  #5;
  local_initial_read_flag=1;
  #5;
  #5;
  #10;
  local_initial_read_flag=0; //stop reading from rom weight 
  //local_write_en=1;
  local_write_training=1;  //write in old weight memory 
  Update_Weight=1;//update first two weights/update the number of unknowns only
  #5;
  #15;
  local_write_training=0; //
  local_write_en=0;
  Update_Weight=0;
  #5;
  #15;
  old_weight_rd=1; //read first two updated number of unknowns 
  #10;
  local_write_en=1; //write old weights as best weights in best weights memory 
  Update_Weight=1; //write the number of unknowns of odl weights only 
  #10;
  old_weight_rd=0;
  #5;
  local_write_en=0; //stop writing best weights 
  #15;
   #5;
	local_finish=1; //read all the best weights including the padding weights 
  #15;
  #5;
  #15;
  #5;
  local_finish=0;
  #20;
  $finish;
  end
endmodule
