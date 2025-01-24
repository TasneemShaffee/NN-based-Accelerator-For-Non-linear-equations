`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:51:14 03/12/2018 
// Design Name: 
// Module Name:    manhttan_tb 
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
module manhttan_tb(
    );

parameter BIT_WIDTH=32;
parameter EXTRA_BITS=2;
parameter NUMBER_INSTANCES=1;
reg [BIT_WIDTH+EXTRA_BITS-1:0]old_weight;
reg [BIT_WIDTH+EXTRA_BITS-1:0]eta;
reg Manhattan_Enable;
reg clk;
reg rst;
reg [BIT_WIDTH+EXTRA_BITS-1:0]Differentiated_Error;	
wire [NUMBER_INSTANCES*(BIT_WIDTH+EXTRA_BITS)-1:0] Updated_Weights ;
wire [(BIT_WIDTH+EXTRA_BITS)-1:0] New_eta;
manhttan #(
32,
2
)
inst_0
(
.clk(clk),
.rst(rst),
.Differentiated_Error(Differentiated_Error),
.Manhattan_Enable(Manhattan_Enable),
.Old_Weights(old_weight),
.eta(eta),
.New_eta(New_eta),
.Updated_Weights(Updated_Weights)
);

initial begin
	clk<=0;
	forever #5 clk<=~clk;
end
initial begin
 $display ("time\t Updated_Weights clk Differentiated_Error old_weight  eta Manhattan_Enable rst");	
 $monitor ("%g\t %h   %h     %h      %h       %b", $time,Updated_Weights ,
 clk, Differentiated_Error, old_weight,eta,Manhattan_Enable,rst);
 #5;
 rst=1'b1;
 #5;
 rst=1'b0;
 
 Manhattan_Enable=0;
 #10;
 Manhattan_Enable=1;
 eta={2'b01,32'b00111010100000110001001001101111};//eta=0.001
//data_in={2'b01,32'b00111111011111010111000010100100}; //0.99 
Differentiated_Error={2'b01,32'b10111111011111010111000010100100}; //-0.99     
old_weight={2'b01,32'b00111110011000010100011110101110}; //0.22 
//expected result  0.219=>0x3e604189=>00111110011000000100000110001001
//result of new eta =0x38d1b717=0.0001
#5;
#5;
#10;
Manhattan_Enable=0;
#5;
#5;
Manhattan_Enable=1;
eta={2'b01,32'b00111000110100011011011100010111};//eta=0.0001
Differentiated_Error={2'b01,32'b00111111011111010111000010100100}; //0.99     
old_weight={2'b01,32'b00111110011000010100011110101110}; //0.22 //10111110011000010100011110101110 =>0.22
//expected the answer to be  0.2201=0x3e6161e5 //and 0.22+0.001=0.221 =>00111110011000100100110111010011 or 0x3e624dd3
//eta=0.00001=0x3727c5ac
#10;
#10;
Manhattan_Enable=0;
#10;
Manhattan_Enable=1;
eta={2'b01,32'b10111000110100011011011100010111};//eta=-0.0001
Differentiated_Error={2'b01,32'b10111111011111010111000010100100}; //-0.99     
old_weight={2'b01,32'b00111110011000010100011110101110}; //0.22 //10111110011000010100011110101110 =>0.22
//output  0.2201=0x3e6161e5
#20;
$finish;
end;
endmodule
