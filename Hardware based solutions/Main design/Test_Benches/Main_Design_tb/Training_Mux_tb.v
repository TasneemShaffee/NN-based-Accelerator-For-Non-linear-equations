`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:00:52 03/31/2018 
// Design Name: 
// Module Name:    Training_Mux_tb 
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
module Training_Mux_tb(
    );
parameter BIT_WIDTH=32;
parameter EXTRA_BIT=2;
reg   [(BIT_WIDTH+EXTRA_BIT)-1:0] MANHATTAN_UPDATED_WEIGHT;
reg   [(BIT_WIDTH+EXTRA_BIT)-1:0] ADAM_UPDATED_WEIGHT;
reg      training_mode;
wire [(BIT_WIDTH+EXTRA_BIT)-1:0] MEMORY_UPDATED_WEIGHT;


Training_Mux
#(
 BIT_WIDTH,
 EXTRA_BIT
)
tm_inst
(
 .MANHATTAN_UPDATED_WEIGHT(MANHATTAN_UPDATED_WEIGHT),
 .ADAM_UPDATED_WEIGHT(ADAM_UPDATED_WEIGHT),
 .training_mode(training_mode),
 .MEMORY_UPDATED_WEIGHT(MEMORY_UPDATED_WEIGHT)
    );
initial begin
MANHATTAN_UPDATED_WEIGHT={2'b01,32'b00111101101110000101000111101100}; //0.09=>0x3db851ec 
ADAM_UPDATED_WEIGHT={2'b01,32'b00111110011000010100011110101110}; //0.22 => 0x3e6147ae
training_mode=1;
#10;
MANHATTAN_UPDATED_WEIGHT={2'b01,32'b00111111000000000000000000000000}; //0.5=>0x3f000000 
ADAM_UPDATED_WEIGHT={2'b01,32'b00111111010111101011100001010010}; //0.87 => 0x3f5eb852
training_mode=0;
#10;
$finish;
end
endmodule
