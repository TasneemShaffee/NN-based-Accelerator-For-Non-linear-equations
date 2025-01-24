/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : Mem_readflags_Mux.v
+ Abstract  :The functionality of the mux is to choose between data produced from ROM memory or data produced from one of RAM memories.  

*/
module Mem_readflags_Mux#(
parameter BIT_WIDTH=32,
parameter EXTRA_BIT=2
)
(
 input  wire                               INITIAL_ROM_READ_FLAG,
 input  wire   [(BIT_WIDTH+EXTRA_BIT)-1:0] ROM_OUTPUT, 
 input  wire   [(BIT_WIDTH+EXTRA_BIT)-1:0] BUFFER_OUTPUT,
 output reg   [(BIT_WIDTH+EXTRA_BIT)-1:0] SCALAR_OUTPUT  
    );
always@(*) 
begin
if(INITIAL_ROM_READ_FLAG)
SCALAR_OUTPUT <=ROM_OUTPUT;
else SCALAR_OUTPUT <= BUFFER_OUTPUT;
end

endmodule
