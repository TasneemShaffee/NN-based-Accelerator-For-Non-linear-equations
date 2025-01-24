`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:33:05 03/26/2018 
// Design Name: 
// Module Name:    adam_tb 
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
module adam_tb(
    );
parameter BIT_WIDTH=32;
parameter EXTRA_BITS=2;
parameter NUMBER_NEURONS=1;
reg [BIT_WIDTH+EXTRA_BITS-1:0]OLD_WEIGHT;
reg [BIT_WIDTH+EXTRA_BITS-1:0]eta;
reg adam_Enable;
reg clk;
reg rst;

reg [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BITS)-1:0] DELTA_WEIGHT;	
wire[NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BITS)-1:0] UPDATED_WEIGHT ;


//output for test
	 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BITS)-1:0] output_test1;
	 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BITS)-1:0] output_test2;
	 wire[NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BITS)-1:0] output_test3;
	 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BITS)-1:0] output_test4;
	 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BITS)-1:0] output_test5;
	 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BITS)-1:0] output_test6;
	 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BITS)-1:0] output_test7;
	 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BITS)-1:0] output_test8;
	 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BITS)-1:0] output_test9;
	 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BITS)-1:0] output_test10;
	 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BITS)-1:0] output_test11;
	 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BITS)-1:0] output_test12;
	 wire [(BIT_WIDTH)-1:0] output_test13;
    wire[NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BITS)-1:0] output_test14;
	 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BITS)-1:0] output_test15;
	 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BITS)-1:0] output_test16;
	 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BITS)-1:0] output_test17;
adam#(
 BIT_WIDTH,
 EXTRA_BITS,
 3,
NUMBER_NEURONS
)
adam_inst(
    .clk(clk),  //clock 
    .rst(rst), //reset
	 .DELTA_WEIGHT(DELTA_WEIGHT), // the calculated error of the result
	 .ADAM_ENABLE(adam_Enable),     //flag to activate the adam block
	 .OLD_WEIGHT(OLD_WEIGHT),
	 .eta(eta),
	 //for test
	 
	 .output_test1(output_test1),
	 .output_test2(output_test2),
	 .output_test3(output_test3),
	 .output_test4(output_test4),
	 .output_test5(output_test5),
	 .output_test6(output_test6),
	 .output_test7(output_test7),
	 .output_test8(output_test8),
	 .output_test9(output_test9),
	 .output_test10(output_test10),
	 .output_test11(output_test11),
	 .output_test12(output_test12),
	 .output_test13(output_test13),
	 .output_test14(output_test14),
	 .output_test15(output_test15),
	 .output_test16(output_test16),
	 .output_test17(output_test17),
	 //real output
	 .UPDATED_WEIGHT(UPDATED_WEIGHT)
    );
initial begin
	clk<=0;
	
	forever #5 clk<=~clk;
end
initial begin
  rst=1'b0;
 #5;
 rst=1'b1;
 #5;
 rst=1'b0;
 eta={2'b01,32'b10111010100000110001001001101111};//eta=-0.001
adam_Enable=1;
DELTA_WEIGHT={2'b01,32'b00111101101110000101000111101100}; //0.09    
//OLD_WEIGHT={2'b01,32'b00111110011000010100011110101110}; //0.22 
OLD_WEIGHT={2'b01,32'b00111001010100011011011100010111}; //0.0002
#5;
#5;
//#5;
adam_Enable=1;
eta={2'b01,32'b00111010100000110001001001101111};//eta=0.001
DELTA_WEIGHT={2'b01,32'b00111101101110000101000111101100}; //0.09    
//OLD_WEIGHT={2'b01,32'b00111110011000010100011110101110}; //0.22 
OLD_WEIGHT={2'b01,32'b00111001010100011011011100010111}; //0.0002
//expected output is  0.2201=0x3e6161e5 
#10;
//adam_Enable=0;
 eta={2'b01,32'b10111010100000110001001001101111};//eta=-0.001
adam_Enable=1;
DELTA_WEIGHT={2'b01,32'b00111101101110000101000111101100}; //0.09    
//OLD_WEIGHT={2'b01,32'b00111110011000010100011110101110}; //0.22 
OLD_WEIGHT={2'b01,32'b00111001010100011011011100010111}; //0.0002
#5;
#5;
adam_Enable=1;
eta={2'b01,32'b00111010100000110001001001101111};//eta=0.001
DELTA_WEIGHT={2'b01,32'b00111101101110000101000111101100}; //0.09    
//OLD_WEIGHT={2'b01,32'b00111110011000010100011110101110}; //0.22 
OLD_WEIGHT={2'b01,32'b00111001010100011011011100010111}; //0.0002
//expected output is  0.2201=0x3e6161e5 
#10;
#10;
//#5;
adam_Enable=0;
#10;
$finish;
end;

endmodule
