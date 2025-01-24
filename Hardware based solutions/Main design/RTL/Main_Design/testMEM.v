`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:52:20 06/06/2018 
// Design Name: 
// Module Name:    testMEM 
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
module testMEM(
    );
	 
reg CLK;
reg RESET;
//reg stall;
reg wr_en;
reg rd_en;
reg [33:0]data_in;
wire[33:0] data_out;
initial begin
	CLK<=0;
	forever #5 CLK<=~CLK;
end
MEM
#(
32, //Width of input data
2, // the bits that needed to determine the number of entries in queue, in this case (4 bits), the queue has 16 entries.    
1
)
inst
(
.clk(CLK),                                 	//input clock
.rst(RESET),                                	//input reset
.data_in(data_in),                   	// input data for fifo.
.wr_en(wr_en),                      //writing enable signal
.rd_en(rd_en),                        // reading enable signal => when training is finished 
//.stall(stall) ,
.data_out(data_out) 
);
initial begin
RESET=0;
wr_en=0;
 rd_en=0;
//stall=1;
#5;
RESET=1'b1;
  #10;
  RESET=1'b0;
  //stall=0;
  wr_en=1;
  rd_en=0;
  data_in=34'b0100111101110011001100110011001101;
  // #10;
//	rd_en=1;
	//wr_en=0;
	#10;
	rd_en=1;
	data_in=34'b0100111111100000000000000000000000;
	#10;
	data_in=34'b0100111111100000000000000000000001;
	#10;
	data_in=34'b0100111111100000000000000000000011;
	#10;
	//rd_en=0;
	//wr_en=1;
	//#10;
	//rd_en=1;
	//wr_en=0;
	#10;
	/*
	stall=1;
	wr_en=0;
	rd_en=0;
	#10;
	

	stall=1;
	wr_en=1;
	rd_en=1;
	#10
	stall=0;
  wr_en=1;
  rd_en=1;
  data_in=34'b0000000000000000000000000000000000;
   #10;
	data_in=34'b0100111101110011001100110011001101;
	#10;*/
$finish;
end
endmodule
