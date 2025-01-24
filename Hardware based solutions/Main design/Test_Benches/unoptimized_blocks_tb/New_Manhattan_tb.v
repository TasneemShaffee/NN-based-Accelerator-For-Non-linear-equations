`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:37 06/17/2018 
// Design Name: 
// Module Name:    New_Manhattan_tb 
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
module New_Manhattan_tb(
    );
parameter BIT_WIDTH=32;
parameter EXTRA_BITS=2;
parameter NUMBER_INSTANCES=1;
reg [BIT_WIDTH+EXTRA_BITS-1:0]old_weight;
reg [BIT_WIDTH+EXTRA_BITS-1:0]eta;
reg Manhattan_Enable;
reg [BIT_WIDTH+EXTRA_BITS-1:0]Differentiated_Error;	
wire [NUMBER_INSTANCES*(BIT_WIDTH+EXTRA_BITS)-1:0] Updated_Weights ;
New_Manhattan#(
32,
2
)
inst_0
(
.Differentiated_Error(Differentiated_Error),
.Manhattan_Enable(Manhattan_Enable),
.Old_Weights(old_weight),
.eta(eta),
.Updated_Weights(Updated_Weights)
);

initial begin
 $display ("time\t Updated_Weights  Differentiated_Error old_weight  eta Manhattan_Enable ");	
 $monitor ("%g\t %h        %h      %h    ", $time,Updated_Weights ,
  Differentiated_Error, old_weight,eta,Manhattan_Enable);
 #5;
 #5;
 
 Manhattan_Enable=0;
 #9;
 Manhattan_Enable=1;
 eta={2'b01,32'b00111010100000110001001001101111};//eta=0.001
//data_in={2'b01,32'b00111111011111010111000010100100}; //0.99 
Differentiated_Error={2'b01,32'b10111111011111010111000010100100}; //-0.99     
old_weight={2'b01,32'b00111110011000010100011110101110}; //0.22 
//expected result  0.219=>0x3e604189=>00111110011000000100000110001001
//result of new eta =0x38d1b717=0.0001
#9;
Manhattan_Enable=0;
#5;
#4;
Manhattan_Enable=1;
eta={2'b01,32'b00111000110100011011011100010111};//eta=0.0001
Differentiated_Error={2'b01,32'b00111111011111010111000010100100}; //0.99     
old_weight={2'b01,32'b00111110011000010100011110101110}; //0.22 //10111110011000010100011110101110 =>0.22
//expected the answer to be  0.2201=0x3e6161e5 //and 0.22+0.001=0.221 =>00111110011000100100110111010011 or 0x3e624dd3
//eta=0.00001=0x3727c5ac
#9;
Manhattan_Enable=1;
 eta={2'b01,32'b00111010100000110001001001101111};//eta=0.001
Differentiated_Error={2'b01,32'b10111111011111010111000010100100}; //-0.99     
old_weight={2'b01,32'b00111110011000010100011110101110}; //0.22 //10111110011000010100011110101110 =>0.22
//output  0x3e604189
#9;
eta={2'b01,32'b10111000110100011011011100010111};//eta=-0.0001
Differentiated_Error={2'b00,32'b00000000000000000000000000000000};    
old_weight={2'b01,32'b00111110011000010100011110101110}; //0.22 //10111110011000010100011110101110 =>0.22
//expected output 0x3e6147ae
#9;
 eta={2'b01,32'b00111010100000110001001001101111};//eta=0.001
Differentiated_Error={2'b01,32'b10111111011111010111000010100100}; //-0.99     
old_weight={2'b01,32'b00111110011000010100011110101110}; //0.22 //10111110011000010100011110101110 =>0.22
//output  0x3e604189
#9;
Manhattan_Enable=0;
#10;
Manhattan_Enable=1;
eta={2'b01,32'b10111000110100011011011100010111};//eta=-0.0001
Differentiated_Error={2'b00,32'b00000000000000000000000000000000};    
old_weight={2'b01,32'b00111111000000000000000000000000}; //0.5 
//expected value =0x3f000000
#9;
$finish;
end
endmodule
