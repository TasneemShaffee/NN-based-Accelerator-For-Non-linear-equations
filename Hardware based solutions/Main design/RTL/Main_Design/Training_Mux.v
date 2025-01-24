/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : Training_mux.v
+ Abstract  :This module does multiplexing for the updated weight based on the training mode.
*/
`default_nettype none
module Training_Mux
#(
parameter BIT_WIDTH=32,
parameter EXTRA_BIT=2
)
(
input wire   [(BIT_WIDTH+EXTRA_BIT)-1:0] MANHATTAN_UPDATED_WEIGHT, //Result of Manhattan module
input wire   [(BIT_WIDTH+EXTRA_BIT)-1:0] ADAM_UPDATED_WEIGHT,      //Result of Adam module
input wire       training_mode,                                    //Training mode signal
output reg [(BIT_WIDTH+EXTRA_BIT)-1:0] MEMORY_UPDATED_WEIGHT       //The output signal
    );
//Checking the training mode and update the output port based on the result of condition	 
always@(*) 
begin
if(training_mode)
MEMORY_UPDATED_WEIGHT<=MANHATTAN_UPDATED_WEIGHT;
else MEMORY_UPDATED_WEIGHT<=ADAM_UPDATED_WEIGHT;
end
endmodule
