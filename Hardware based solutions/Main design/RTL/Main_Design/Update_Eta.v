/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : Update_Eta.v
+ Abstract  :This module does adaptive step for eta in Manhattan updating rule and reset it when adam is been used.
+Notes		:It updates the eta between transition between one to other.
				 When first Manhattan is finished eta is updated to value equal 0.01.
				 After finishing the second Manhattan invokation,the eta is updated to 0.001.	
*/
module Update_Eta
#(
parameter BIT_WIDTH=32,
parameter EXTRA_BIT=2
)
(
 input wire rst,
 input wire Finish_First_Manhattan_Iter,                           //signal indicates that first iterations of manhattan have been done
 input wire Finish_Second_Manhattan_Iter,                          //signal indicates that second iterations of manhattan have been done and
																						 //adam iterations will be begin
 input wire Manhaatan_Enable,
 input wire [(BIT_WIDTH+EXTRA_BIT)-1:0] eta,                                   //The old value for eta
 output reg [(BIT_WIDTH+EXTRA_BIT)-1:0] New_eta                                //The new value of  eta        
    );
localparam epson={2'b01,32'b00111101110011001100110011001101};//epson=1E-1=0.1
localparam epson2={2'b01,32'b00111100001000111101011100001010};// epson2=0.01
localparam epson3={2'b01,32'b00111010100000110001001001101111};//epson3=0.001
wire [(BIT_WIDTH+EXTRA_BIT)-1:0] local_new_eta;

always@(*) 
begin
if (rst)
New_eta<=epson;
else begin
if ((Finish_First_Manhattan_Iter==0) && (Finish_Second_Manhattan_Iter==0) )
begin
if (Manhaatan_Enable)
New_eta<=epson; // reset eta for manhattan
end
else if (Finish_First_Manhattan_Iter) begin
//New_eta<=local_new_eta; //do adaptive step for manhattan
if (Manhaatan_Enable)
New_eta<=epson2;
end
else if (Finish_Second_Manhattan_Iter )begin
New_eta<=epson3; //update eta for adam 
end
else New_eta<=eta;
end
end
endmodule
