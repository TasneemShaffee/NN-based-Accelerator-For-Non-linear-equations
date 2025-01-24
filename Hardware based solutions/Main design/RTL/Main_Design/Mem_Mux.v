/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : Mem_Mux.v
+ Abstract  :Multiplex between best weights and the output produced from training.  
*/
module Mem_Mux#(
parameter BIT_WIDTH=32,
parameter EXTRA_BIT=2
)
(
input wire   training_finish, 
input wire   [(BIT_WIDTH+EXTRA_BIT)-1:0] TRAINING_OUTPUT,      
input wire   [(BIT_WIDTH+EXTRA_BIT)-1:0] BEST_WEIGHT ,
output reg   [(BIT_WIDTH+EXTRA_BIT)-1:0]  OUTPUT_WEIGHT   //The output signal
    );

always@(*) 
begin
if(training_finish)
OUTPUT_WEIGHT <=BEST_WEIGHT;
else OUTPUT_WEIGHT <= TRAINING_OUTPUT;
end

endmodule
