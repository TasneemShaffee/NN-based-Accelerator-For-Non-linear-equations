`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:59:11 04/09/2018 
// Design Name: 
// Module Name:    Seq_TrainingBlock_tb 
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
module Seq_TrainingBlock_tb(
    );

parameter BIT_WIDTH=32;
parameter EXTRA_BIT=2;
parameter NUMBER_WEIGHTS=2;
parameter NUMBER_NEURONS=1;
reg rst;
reg clk;
reg training_mode;
reg   [(BIT_WIDTH+EXTRA_BIT)-1:0] DELTA_WEIGHT;
reg   [(BIT_WIDTH+EXTRA_BIT)-1:0] OLD_WEIGHT;
reg [(BIT_WIDTH+EXTRA_BIT)-1:0] eta;
reg [(BIT_WIDTH+EXTRA_BIT)-1:0]SQUARED_ERROR;
//wire [(BIT_WIDTH+EXTRA_BIT)-1:0] New_eta;
//wire[(BIT_WIDTH+EXTRA_BIT)-1:0] UPDATED_WEIGHT_ADAM;
//wire [(BIT_WIDTH+EXTRA_BIT)-1:0] UPDATED_WEIGHT_MANHATTAN;
wire training_done;
//wire test1;
//wire test2;
//wire [(BIT_WIDTH+EXTRA_BIT)-1:0]test3;
wire  [(BIT_WIDTH+EXTRA_BIT)-1:0] MEMORY_UPDATED_WEIGHT;
wire [((BIT_WIDTH+EXTRA_BIT)*NUMBER_NEURONS) -1:0]            Best_weights;  
wire  [(BIT_WIDTH+EXTRA_BIT) -1:0]                           Best_error;
//TrainingWrapper
 Seq_TrainingBlock
#(
 BIT_WIDTH,
 EXTRA_BIT,
NUMBER_WEIGHTS,
NUMBER_NEURONS
)
training_block_inst(
.rst(rst),
.clk(clk),
.training_mode(training_mode),
.training_done(training_done), 
.SQUARED_ERROR(SQUARED_ERROR),
.DELTA_WEIGHT(DELTA_WEIGHT),
.OLD_WEIGHT(OLD_WEIGHT),
//.eta(eta),
//.New_eta(New_eta),
//.test1(test1),
//.test2(test2),
//.test3(test3),
.Best_weights(Best_weights),
.Best_error(Best_error),
//.UPDATED_WEIGHT_ADAM(UPDATED_WEIGHT_ADAM),
//.UPDATED_WEIGHT_MANHATTAN(UPDATED_WEIGHT_MANHATTAN),
.MEMORY_UPDATED_WEIGHT(MEMORY_UPDATED_WEIGHT)
);

initial begin
	clk<=0;
	forever #5 clk<=~clk;
end
initial begin
 rst =1'b0;
 training_mode=1;
 SQUARED_ERROR=0; //train
 /*
eta={2'b01,32'b00111010100000110001001001101111};//eta=0.001
DELTA_WEIGHT={2'b01,32'b10111111011111010111000010100100}; //-0.09    
OLD_WEIGHT={2'b01,32'b00111110011000010100011110101110}; //0.22*/
 #10;
 rst=1'b1;
 #10;
 rst=1'b0;
 #5;
 
 training_mode=1;
 SQUARED_ERROR=1; //train
eta={2'b01,32'b00111010100000110001001001101111};//eta=0.001
DELTA_WEIGHT={2'b01,32'b10111111011111010111000010100100}; //-0.09    
OLD_WEIGHT={2'b01,32'b00111110011000010100011110101110}; //0.22 
//expected result  0.219=>0x3e604189 =>00111110011000000100000110001001
//result of new eta =0x38d1b717=0.0001
#10;
//#10;
training_mode=1;
eta={2'b01,32'b00111000110100011011011100010111};//eta=0.0001
DELTA_WEIGHT={2'b01,32'b00111101101110000101000111101100}; //0.09    
OLD_WEIGHT={2'b01,32'b00111110011000010100011110101110}; //0.22 
//expected the answer to be  =>0.2201 =>0x3e6161e5
//eta=0.00001 =>0x3727c5ac
#10;
#10;

//......................................Adam...........................................................................
training_mode=0;//adam
 SQUARED_ERROR=1; //train
eta={2'b01,32'b10111010100000110001001001101111};//eta=-0.001
DELTA_WEIGHT={2'b01,32'b00111101101110000101000111101100}; //0.09    
OLD_WEIGHT={2'b01,32'b00111001010100011011011100010111}; //0.0002
//expected output is 0x3a916b01
#10;
//#10;

eta={2'b01,32'b00111010100000110001001001101111};//eta=0.001
DELTA_WEIGHT={2'b01,32'b00111101101110000101000111101100}; //0.09    
OLD_WEIGHT={2'b01,32'h3e4ccccd}; //0.2
//expected output is 0xb139fa73
#10;
//.............................Stop Training................................
//#10;
//SQUARED_ERROR=0;//stop training 
//#10;
//.................................Adam.......................................
SQUARED_ERROR=1;
training_mode=0;
#10;
eta={2'b01,32'b00111010100000110001001001101111};//eta=0.001
DELTA_WEIGHT={2'b01,32'b00111101101110000101000111101100}; //0.09    
OLD_WEIGHT={2'b01,32'b00111001010100011011011100010111}; //0.0002
#10;
//#10;
//..............................Training is done..............................
SQUARED_ERROR=0;
#10;
//#5;
//Expected don't cares
//................................Manhattan....................................
SQUARED_ERROR=1;
training_mode=1;
eta={2'b01,32'b00111010100000110001001001101111};//eta=0.001
DELTA_WEIGHT={2'b01,32'b00111101101110000101000111101100}; //0.09    
OLD_WEIGHT={2'b01,32'b00111001010100011011011100010111}; //0.0002
//expected the answer to be  0x3e604189 
//result of new eta =0x38d1b717=0.0001
#10;
//#10;

//#20;
$finish;
end
endmodule
