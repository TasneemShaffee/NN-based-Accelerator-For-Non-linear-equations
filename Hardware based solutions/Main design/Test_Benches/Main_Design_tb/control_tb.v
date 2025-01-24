`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:     Amany Abdelhamid
//
// Create Date:   08:43:55 04/18/2018
// Design Name:   control_unit
// Module Name:   
// Project Name:  amany
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: control_unit
//
// Dependencies:
// 
// Revision:    
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module control_tb;  
   
    parameter CLK_PERIOD =10;
	 
	// Inputs
	reg training_done;
   wire clk;
	reg rst;
	
	// Outputs
	wire WASTED_CYCLE_STALL;
	wire old_weight_rd;
	wire write_training;
	wire INITIAL_ROM_READ_FLAG;
	wire training_mode;
	wire first_manh_finished;
	wire second_manh_finished;
	wire stop;
	
	CLK_GEN  #(CLK_PERIOD) clk_gen(.clk(clk));
  
	// Instantiate the Unit Under Test (UUT) 
	control_unit uut (
		.training_done(training_done),  
		.clk(clk), 
		.rst(rst), 
		.training_mode(training_mode), 
		.first_manh_finished(first_manh_finished),
		.second_manh_finished(second_manh_finished),
		.INITIAL_ROM_READ_FLAG(INITIAL_ROM_READ_FLAG),
		.old_weight_rd(old_weight_rd),
		.write_training(write_training),
		.WASTED_CYCLE_STALL(WASTED_CYCLE_STALL),
		.stop(stop)
	);

  /* always@(stall)begin
	if(stall)begin
		//#CLK_PERIOD;
		$finish;end
	end*/
	initial begin
		// Initialize Inputs
		training_done <= 0;
		rst <= 1;
		
		#CLK_PERIOD rst<=1'b0;
		
		         
		//#(15*CLK_PERIOD) rst<=1'b1;
      //#CLK_PERIOD rst<=1'b0;		
		
		//#(50*CLK_PERIOD) training_done<=1;
		#(100*CLK_PERIOD) $finish;
		

	end
      
endmodule

