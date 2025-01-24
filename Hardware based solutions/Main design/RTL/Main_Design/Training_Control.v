/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : Training_Control.v
+ Abstract  :This block is responsible for controlling the training block.
+Note 		:It activates and diactivate the adam and manhattan blocks based on training mode signal sent by control unit.
*/
module Training_Control#
(parameter size_of_data = 1)
(rst, clk, training_mode, 
SQUARED_ERROR, training_done, adam_signal, manhatten_signal
);

input rst;                   //reset signal
input clk; 						  //clock signal
input training_mode;         //Flag that indicate if the training mode is manhattan or adam.
input [34-1:0] SQUARED_ERROR;//The receiving comperator flags.
output reg training_done;    //Flag to control unit to indcate that the training is done.
output reg adam_signal;      //Flag to activate or deactivate the adam module.
output reg manhatten_signal; //Flag to activate or deactivate the manhattan module.

always @(posedge clk or posedge rst)
begin
if (rst) begin
training_done<=0;
adam_signal<=0;
manhatten_signal<=0;
end
else 
begin
if (SQUARED_ERROR ==(34'b0))begin
training_done<=1;
manhatten_signal <= 1'b0;
adam_signal<= 1'b0;
end
else begin
if (training_mode) begin
adam_signal<= 1'b0;
manhatten_signal <= 1'b1;
training_done<=0;
end
else if (!training_mode) begin
manhatten_signal <= 1'b0;
adam_signal<= 1'b1;
training_done<=0;
end
end
end
end
endmodule //Training_control
