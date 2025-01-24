`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:25 06/13/2018 
// Design Name: 
// Module Name:    Updated_Training_Block_tb 
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
module Updated_Training_Block_tb();

parameter BIT_WIDTH=32;
parameter EXTRA_BIT=2;
parameter NUMBER_WEIGHTS=2;
parameter NUMBER_NEURONS=1;
reg rst;
reg clk;
reg training_mode;
reg   [(BIT_WIDTH+EXTRA_BIT)-1:0] DELTA_WEIGHT;
reg   [(BIT_WIDTH+EXTRA_BIT)-1:0] OLD_WEIGHT;
//reg [(BIT_WIDTH+EXTRA_BIT)-1:0] eta;
reg [(BIT_WIDTH+EXTRA_BIT)-1:0]SQUARED_ERROR;
wire training_done;
wire  [(BIT_WIDTH+EXTRA_BIT)-1:0] MEMORY_UPDATED_WEIGHT;
//wire [((BIT_WIDTH+EXTRA_BIT)*NUMBER_NEURONS) -1:0]            Best_weights;  
wire  [(BIT_WIDTH+EXTRA_BIT) -1:0]                           Best_error;
wire write_en ;
reg Finish_First_Manhattan_Iter;                          
reg Finish_Second_Manhattan_Iter;
reg ENABLE;
 New_Training_block
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
.ENABLE(ENABLE),
.Finish_First_Manhattan_Iter(Finish_First_Manhattan_Iter),                           
.Finish_Second_Manhattan_Iter(Finish_Second_Manhattan_Iter),
.Best_error(Best_error),
.write_en (write_en ),
.MEMORY_UPDATED_WEIGHT(MEMORY_UPDATED_WEIGHT)
);

initial begin
	clk<=0;
	forever #5 clk<=~clk;
end
initial begin
 rst =1'b0;
 ENABLE=0;
 training_mode=1;
 Finish_First_Manhattan_Iter=0;
 Finish_Second_Manhattan_Iter=0;
 SQUARED_ERROR=0; //train
 #10;
 rst=1'b1;
 #5;
 rst=1'b0;
 //#5;
 training_mode=1;
 SQUARED_ERROR=1; //train
DELTA_WEIGHT={2'b01,32'b10111111011111010111000010100100}; //-0.09    
OLD_WEIGHT={2'b01,32'b00111110011000010100011110101110}; //0.22 
//expected result  0.12=>0x3df5c28f
#10;
Finish_First_Manhattan_Iter=1;
DELTA_WEIGHT={2'b01,32'b00111101101110000101000111101100}; //0.09  
//expected result 0.23 => 0x3e6b851f
//eta=0.01 =>0x3c23d70a
#20;
Finish_First_Manhattan_Iter=0;
//......................................Adam...........................................................................
Finish_Second_Manhattan_Iter=1;
training_mode=0;//adam
 SQUARED_ERROR=1; //train
DELTA_WEIGHT={2'b01,32'b00111101101110000101000111101100}; //0.09    
OLD_WEIGHT={2'b01,32'b00111001010100011011011100010111}; //0.0002
//expected output is 0x3c184801
#10;
Finish_Second_Manhattan_Iter=0;
DELTA_WEIGHT={2'b01,32'b00111101101110000101000111101100}; //0.09    
OLD_WEIGHT={2'b01,32'h3e4ccccd}; //0.2
//expected output is 0x3e561cdf
#10;
#10;
//................................Manhattan....................................
SQUARED_ERROR=1;
#10;
training_mode=1;
DELTA_WEIGHT={2'b01,32'b00111101101110000101000111101100}; //0.09    
OLD_WEIGHT={2'b01,32'b00111001010100011011011100010111}; //0.0002
//expected the answer to be  0.1002 => 0x3dcd35a8
//result of new eta =0.1
#10;
Finish_First_Manhattan_Iter=1;
DELTA_WEIGHT={2'b01,32'b00111101101110000101000111101100}; //0.09    
OLD_WEIGHT={2'b01,32'b00111001010100011011011100010111}; //0.0002
//result=0x3c271de7
#10


//.................................Adam.......................................
SQUARED_ERROR=1;
training_mode=0;
Finish_First_Manhattan_Iter=0;
Finish_Second_Manhattan_Iter=1;
DELTA_WEIGHT={2'b01,32'b00111101101110000101000111101100}; //0.09    
OLD_WEIGHT={2'b01,32'b00111001010100011011011100010111}; //0.0002
//0x3c184801
#10;
//#10;
//..............................Training is done..............................
SQUARED_ERROR=0;
#10;
//#5;

#20;
$finish;
end

endmodule
