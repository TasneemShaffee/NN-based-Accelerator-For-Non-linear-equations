`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:51:35 06/17/2018 
// Design Name: 
// Module Name:    MEMORIES 
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
module MEMORIES#(
parameter BIT_WIDTH = 32,
  parameter EXTRA_BITS = 2,
  parameter NUM_UNKNOWNS = 2,
  parameter NUM_NONLIN = 1,
  parameter Extra_Cycles = 3 ,
  parameter INITIAL_GUESS_FILE = "IN1.mem",
  parameter WEIGHT_FILES_L1 = "R11.mem",
  parameter WEIGHT_FILES_L2 = "R21.mem",
  parameter WEIGHT_FILES_L3 = "R12.mem",
  parameter WEIGHT_FILES_L4 = "R22.mem"
)(
 input wire CLK,
  input wire RESET,
  input wire local_initial_read_flag,
  input wire old_weight_rd,
  input wire local_write_training,
  input wire local_finish,
  input wire Update_Weight,
  input wire  [BIT_WIDTH + EXTRA_BITS - 1:0]Local_UpdatedWeight_L1,
  input wire local_write_en
);
wire [BIT_WIDTH + EXTRA_BITS - 1:0] input_scaler;     
wire  [BIT_WIDTH + EXTRA_BITS - 1:0]Local_Buffer_Weight;
wire  [BIT_WIDTH + EXTRA_BITS - 1:0]Local_Rom_Weight;
wire  [BIT_WIDTH + EXTRA_BITS - 1:0]  Best_weights; 
wire [BIT_WIDTH + EXTRA_BITS - 1:0] local_old_weight;
wire [BIT_WIDTH + EXTRA_BITS - 1:0] final_weight;
wire [BIT_WIDTH + EXTRA_BITS - 1:0] input_best_weights;
wire Loaded_weight_end;
wire best_weight_wr_update_weight;
wire old_weight_wr;
assign old_weight_wr=local_write_training |local_initial_read_flag; 
assign best_weight_wr_update_weight=local_write_training | local_initial_read_flag;

WEIGHTS_ROM #(.DEPTH(4), .FILE_NAME(INITIAL_GUESS_FILE)) root_memory(
    .CLK(CLK),
    .RESET(RESET),
    .MEM_OUT(Local_Rom_Weight)
  );
 assign input_best_weights= (local_initial_read_flag==1)?Local_Rom_Weight:local_old_weight;
MEM_WEIGHTS
#(
BIT_WIDTH, //Width of input data
EXTRA_BITS, // the bits that needed to determine the number of entries in queue, in this case (4 bits), the queue has 16 entries.    
NUM_UNKNOWNS,
2
)
memory_best_weights
(
.clk(CLK),                                 	 //input clock
.rst(RESET),                                	 //input reset
.data_in(input_best_weights),                 // input data for fifo.
.wr_en(best_weight_wr_update_weight),         //writing enable signal
.rd_en(local_finish),                         // reading enable signal => when training is finished
.Update_Weight(Update_Weight), 
//.Loaded_weight_end(Loaded_weight_end),
.local_initial_read_flag(local_initial_read_flag),
.data_out(Best_weights)  		               //the data that outcomes from queue.                   			
    );
	 
MEM_WEIGHTS
#(
BIT_WIDTH, //Width of input data
EXTRA_BITS, // the bits that needed to determine the number of entries in queue, in this case (4 bits), the queue has 16 entries.    
NUM_UNKNOWNS,
2
)
memory_save_old_weight
(
.clk(CLK),                                 	//input clock
.rst(RESET),                                	//input reset
.data_in(input_scaler),           	//input data for fifo.
.wr_en(old_weight_wr),                //writing enable signal
.rd_en(old_weight_rd),
.Update_Weight(Update_Weight),
.Loaded_weight_end(Loaded_weight_end),
.data_out(local_old_weight)  				//the data that outcomes from queue.  
    );
	 
Mem_Mux#(
BIT_WIDTH,
EXTRA_BITS
)
mux_inst
(
.training_finish(local_finish), 					 //flag indicates wether the taken data is from training buffer or from best weights buffer
.TRAINING_OUTPUT(Local_UpdatedWeight_L1),      //data comes out from training buffer
.BEST_WEIGHT(Best_weights) ,                  //data comes out from best weights buffer
.OUTPUT_WEIGHT(Local_Buffer_Weight)   			 //The output data 
    );	 
	 
//this mux indicates which data will be loaded.for first run of the top module 
//is to load the initial guess of the user then load the data that comes out from buffer(training buffer or best weights buffer).	 
Mem_readflags_Mux#(
BIT_WIDTH,
EXTRA_BITS
)
mux_2_inst
(
 .INITIAL_ROM_READ_FLAG(local_initial_read_flag),
 .ROM_OUTPUT(Local_Rom_Weight), 
 .BUFFER_OUTPUT(Local_Buffer_Weight),
 .SCALAR_OUTPUT(final_weight)  
    ); 
	 
	 
Mem_readflags_Mux#(
BIT_WIDTH,
EXTRA_BITS
)
mux_3_inst
(
 .INITIAL_ROM_READ_FLAG(Loaded_weight_end),
 .ROM_OUTPUT(local_old_weight), 
 .BUFFER_OUTPUT(final_weight),
 .SCALAR_OUTPUT(input_scaler)  
    ); 
endmodule
