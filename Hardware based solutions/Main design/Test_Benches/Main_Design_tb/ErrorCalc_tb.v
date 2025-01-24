`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:34:55 03/26/2018
// Design Name:   cmp
// Module Name:   D:/Amany Lectures/4th COMP. Graduation Project/amany/cmp_tb.v
// Project Name:  amany
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cmp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cmp_tb;

   /* Test numbers
	5.23 -> 01000000 10100111 01011100 00101001
	-0.322 -> 10111110 10100100 11011101 00101111
	-4.908 -> 11000000 10011101 00001110 01010110
	1.68406 -> 00111111 11010111 10001111 01000111
	*/
	parameter ELEMENT_WIDTH = 32;
	parameter Extra = 2;
   parameter Num_Unknowns = 2;
   parameter Num_Unknown_Per_Batch = 2;
	parameter CLK_PERIOD =10;
	
	// Inputs
	wire clk;
	reg rst;
	reg [33:0] current_err;
	reg [(34* Num_Unknown_Per_Batch) -1:0] current_weights ;

	// Outputs
	wire [(34*Num_Unknowns) -1:0] Best_weights;
	wire [33:0] Best_error;
	wire write_en;

   CLK_GEN  #(CLK_PERIOD) clk_gen(.clk(clk));
	// Instantiate the Unit Under Test (UUT)
	cmp #(ELEMENT_WIDTH,Extra,Num_Unknowns,Num_Unknown_Per_Batch) uut (
		.clk(clk), 
		.rst(rst), 
		.current_err(current_err), 
		.current_weights(current_weights), 
		.Best_weights(Best_weights),
		.Best_error(Best_error),
		.write_en(write_en)
	);

	initial begin
		// Initialize Inputs
		
		 rst<=1'b1;
    	#CLK_PERIOD rst<=1'b0;
	   
		/*//parameter Num_Unknown_Per_Batch = 1;
		#CLK_PERIOD current_weights = {2'b01,32'h40a75c29}; //{5.23}
		#CLK_PERIOD current_weights = {2'b01,32'hbea4dd2f}; //{-0.322}
		
		#CLK_PERIOD current_err = {2'b01 ,32'hc0000000}; //current_err = -2
		
						
		#CLK_PERIOD current_err = {2'b00 ,32'h3f07ae14}; //current_err = 0.53
		#CLK_PERIOD current_weights = {2'b01,32'hc09d0e56}; //{-4.908}
		#CLK_PERIOD	current_weights = {2'b01,32'h0}; //{0}
		
						
		#CLK_PERIOD current_err = {2'b00 ,32'h0};  //current_err = 0
		#CLK_PERIOD current_weights = {2'b01,32'hc0a75c29}; //{-5.23}
		#CLK_PERIOD	current_weights = {2'b01,32'hbea4dd2f}; //{-0.322}
						
      #CLK_PERIOD current_err = {2'b00 ,32'h3f07ae14};  //current_err = 0.53
		#CLK_PERIOD  current_weights = {2'b01,32'h0}; //{0}
		#CLK_PERIOD	current_weights = {2'b01,32'hbea4dd2f}; //{-0.322}*/
	
		
		
		//parameter Num_Unknown_Per_Batch = 2;				
		#CLK_PERIOD current_weights = {2'b01,32'h40a75c29, 2'b01,32'hbea4dd2f}; //{5.23,-0.322}
		
		#CLK_PERIOD current_err = {2'b01 ,32'hc0000000}; //current_err = -2
		            current_weights = {2'b01,32'h40a75c29, 2'b01,32'h0}; //{5.23,0}
						
		#CLK_PERIOD current_err = {2'b00 ,32'h3f07ae14}; //current_err = 0.53
		            current_weights = {2'b01,32'h0, 2'b01,32'hbea4dd2f}; //{0,-0.322}
						
		#CLK_PERIOD current_err = {2'b00 ,32'h0};  //current_err = 0
		            current_weights = {2'b01,32'hc0a75c29, 2'b01,32'hbea4dd2f}; //{-5.23,-0.322}
						
      #CLK_PERIOD current_err = {2'b00 ,32'h3f07ae14};  //current_err = 0.53
		            current_weights = {2'b01,32'h0, 2'b01,32'hbea4dd2f}; //{0,-0.322}
						
		#CLK_PERIOD $finish;
 
	end
      
endmodule

