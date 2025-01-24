module test_NN();
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
 reg Update_Weight; 
 wire [BIT_WIDTH + EXTRA_BITS - 1:0] Best_error;
initial begin 
 clk<=0; 
 forever #5 clk<=~clk; 
 end 
NN_Without_CU#(BIT_WIDTH  ,EXTRA_BITS ,NUM_UNKNOWNS ,NUM_NONLIN ,(NUM_UNKNOWNS+1))
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
.Update_Weight(Update_Weight),
.local_finish(local_finish),
.Best_error(Best_error)
);
 initial begin 
 rst=1'b0; 
 stall=1; 
 training_mode=1; 
 Finish_First_Manhattan_Iter=0; 
 Finish_Second_Manhattan_Iter=0; 
 local_initial_read_flag=0; 
 old_weight_rd=0; 
 local_write_training=0; 
 local_finish=0; 
 Update_Weight=0;
 #5; 
 rst=1'b1; 
 #11; 
 rst=1'b0; 
 local_initial_read_flag=1; //load weights 
 #40; 
 local_initial_read_flag=0; 
 #160; 
 old_weight_rd=1; 
 stall=0; 
 training_mode=0;
 #10;
 Update_Weight=1; 
 local_write_training=1; 
 #10;  
 stall=0; 
 old_weight_rd=0; 
 #10;
 stall=1; 
 Update_Weight=0; 
local_write_training=0; 
training_mode=1;
//................
 #170;
old_weight_rd=1;training_mode=0;
 
 #10;
  stall=0; 
  //new delta appeared 
 //write new updated weight 
 Update_Weight=1; 
 local_write_training=1; 
#10; //new second delta 
 old_weight_rd=0;training_mode=1;
 #10;training_mode=1; 
stall=1;
 Update_Weight=0; 
 local_write_training=0; 
//................
 #170;
old_weight_rd=1;training_mode=0;
 
 #10;
  stall=0; 
  //new delta appeared 
 //write new updated weight 
 Update_Weight=1; 
 local_write_training=1; 
#10; //new second delta 
 old_weight_rd=0;training_mode=1;
 #10;training_mode=1; 
stall=1;
 Update_Weight=0; 
 local_write_training=0; 
//................
 #170;
old_weight_rd=1;training_mode=0;
 
 #10;
  stall=0; 
  //new delta appeared 
 //write new updated weight 
 Update_Weight=1; 
 local_write_training=1; 
#10; //new second delta 
 old_weight_rd=0;training_mode=1;
 #10;training_mode=1; 
stall=1;
 Update_Weight=0; 
 local_write_training=0; 
//................
 #170;
old_weight_rd=1;training_mode=0;
 
 #10;
  stall=0; 
  //new delta appeared 
 //write new updated weight 
 Update_Weight=1; 
 local_write_training=1; 
#10; //new second delta 
 old_weight_rd=0;training_mode=1;
 #10;training_mode=1; 
stall=1;
 Update_Weight=0; 
 local_write_training=0; 
//................
 #170;
old_weight_rd=1;training_mode=0;
 
 #10;
  stall=0; 
  //new delta appeared 
 //write new updated weight 
 Update_Weight=1; 
 local_write_training=1; 
#10; //new second delta 
 old_weight_rd=0;training_mode=1;
 #10;training_mode=1; 
stall=1;
 Update_Weight=0; 
 local_write_training=0; 
//................
 #170;
old_weight_rd=1;training_mode=0;
 
 #10;
  stall=0; 
  //new delta appeared 
 //write new updated weight 
 Update_Weight=1; 
 local_write_training=1; 
#10; //new second delta 
 old_weight_rd=0;training_mode=1;
 #10;training_mode=1; 
stall=1;
 Update_Weight=0; 
 local_write_training=0; 
//................
 #170;
old_weight_rd=1;training_mode=0;
 
 #10;
  stall=0; 
  //new delta appeared 
 //write new updated weight 
 Update_Weight=1; 
 local_write_training=1; 
#10; //new second delta 
 old_weight_rd=0;training_mode=1;
 #10;training_mode=1; 
stall=1;
 Update_Weight=0; 
 local_write_training=0; 
//................
 #170;
old_weight_rd=1;training_mode=0;
 
 #10;
  stall=0; 
  //new delta appeared 
 //write new updated weight 
 Update_Weight=1; 
 local_write_training=1; 
#10; //new second delta 
 old_weight_rd=0;training_mode=1;
 #10;training_mode=1; 
stall=1;
 Update_Weight=0; 
 local_write_training=0; 
//................
 #170;
old_weight_rd=1;training_mode=0;
 
 #10;
  stall=0; 
  //new delta appeared 
 //write new updated weight 
 Update_Weight=1; 
 local_write_training=1; 
#10; //new second delta 
 old_weight_rd=0;training_mode=1;
 #10;training_mode=1; 
  stall=1;
 Update_Weight=0; 
 local_write_training=0; 

 $finish;
 end 
 endmodule 
