`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:46:40 06/18/2018 
// Design Name: 
// Module Name:    NN_Without_CU 
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
module NN_Without_CU#(
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
  input wire training_mode,
  input wire stall,
  input wire local_initial_read_flag,
  input wire old_weight_rd,
  input wire local_write_training,
  input wire local_finish,
  input wire Finish_First_Manhattan_Iter,
  input wire Finish_Second_Manhattan_Iter,
  input wire Update_Weight,
  output reg  [BIT_WIDTH + EXTRA_BITS - 1:0] Best_error
    );

  wire [BIT_WIDTH + EXTRA_BITS - 1:0] acc_result_l1;
  //wire [BIT_WIDTH + EXTRA_BITS - 1:0] acc_result;
  wire [(BIT_WIDTH + EXTRA_BITS)*NUM_NONLIN - 1:0] net_d_out;
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] l1_error;
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] l2_error;
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] delta_val;

	wire Loaded_weight_end;
	wire best_weight_wr_update_weight;

  wire                                training_done;
  wire  [BIT_WIDTH + EXTRA_BITS - 1:0]  Best_weights;  
  
  wire [BIT_WIDTH + EXTRA_BITS - 1:0]  Local_Bestweights;  
  wire  [BIT_WIDTH + EXTRA_BITS - 1:0]Local_Besterror;
  wire  [BIT_WIDTH + EXTRA_BITS - 1:0]Local_UpdatedWeight_L1;
  //wire  [BIT_WIDTH + EXTRA_BITS - 1:0]Local_Training_Weight;
  wire  [BIT_WIDTH + EXTRA_BITS - 1:0]Local_Buffer_Weight;
  wire  [BIT_WIDTH + EXTRA_BITS - 1:0]Local_Rom_Weight;
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] input_scaler;     //input of first layer (roots)
  //wire [BIT_WIDTH + EXTRA_BITS - 1:0] saved_old_weight; //a copy that has old weight  
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] local_old_weight; //get the olde weight from buffer
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] local_input_scalar;
  
  wire local_upload_weight;
  wire local_stall;
  wire local_besterror_flag;
  wire local_write_en;
 // wire stall;   			 //signal disable blocks from working
  //wire stoping;
  //wire local_finish; 	//signal enables reating the saved best weights from buffer
  //wire training_mode; 	//signal indicates the training mode
  //wire local_initial_read_flag; //signal enables reading the inputs(initial guess) from ROM
  reg old_weight_wr; //flag to enable and disable saving old weights in buffer
  reg detect_loading_original_weights;
  reg [BIT_WIDTH + EXTRA_BITS - 1:0] delay_rom_weights;
  reg delay_detect_loading_original_weights;
  reg delay_update_weight;
  
   reg [BIT_WIDTH + EXTRA_BITS - 1:0] delay_test1;
   reg [BIT_WIDTH + EXTRA_BITS - 1:0] delay_test2;
  //wire local_write_training; // signal to enable /diable writting the data from training block in buffer
  //wire old_weight_rd; //signal to enable reading old weight to be used in training 
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] final_weight;
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] input_best_weights;
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] delay_fwd_test;
  reg [BIT_WIDTH + EXTRA_BITS - 1:0] input_weights_scalar;
  

  //assign old_weight_wr=local_write_training |local_initial_read_flag; 
  assign best_weight_wr_update_weight=local_write_en | local_initial_read_flag;
  assign input_best_weights= (local_initial_read_flag==1)?Local_Rom_Weight:local_old_weight;
  assign local_input_scalar=(input_scaler===34'bx)?34'b0:input_scaler;
  assign delay_fwd_test=(local_initial_read_flag==1)?local_input_scalar:delay_test2;
  
    FWD_ENGINE #(.WEIGHT_FILES_L1(WEIGHT_FILES_L1), .NUM_UNKNOWNS(2), .NUM_NONLIN(1), .WEIGHT_FILES_L2(WEIGHT_FILES_L2)) forward_engine(
    .INPUT_SCALER(local_input_scalar),
	 //.INPUT_SCALER(delay_fwd_test),
    .CLK(CLK), 
    .RESET(RESET),
    .NET_D_OUT(net_d_out),
	 .INITIAL_READ_FLAG(local_initial_read_flag),
    .ERROR_ACC_OUT(l1_error),
    .ACC_RESULT(acc_result_l1)
  );

  BWD_ENGINE #(.WEIGHT_FILES_L1(WEIGHT_FILES_L3), .NUM_UNKNOWNS(2), .NUM_NONLIN(1), .WEIGHT_FILES_L2(WEIGHT_FILES_L4)) backward_engine(
    .INPUT_SCALER(acc_result_l1),
    .CLK(CLK), 
    .NET_D_IN(net_d_out),
	 //.INITIAL_READ_FLAG(local_initial_read_flag),
    .ERROR_ACC_IN(l1_error),
    .ERROR_ACC_OUT(l2_error),
    .RESET(RESET),
    .ACC_RESULT(delta_val)
  );
ROM#(.DEPTH(4), .FILE_NAME(INITIAL_GUESS_FILE)) root_memory(
    .CLK(CLK),
    .RESET(RESET),
    .MEM_OUT(Local_Rom_Weight)
  );
 
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
.data_in(local_input_scalar),           	//input data for fifo.
.wr_en(old_weight_wr),                //writing enable signal
.rd_en(old_weight_rd),
//.Update_Weight(Update_Weight),
.Update_Weight(delay_update_weight),
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
// .ROM_OUTPUT(Local_Rom_Weight), 
 .ROM_OUTPUT(input_weights_scalar),
 .BUFFER_OUTPUT(Local_Buffer_Weight),
 .SCALAR_OUTPUT(final_weight)  
    ); 
	 
	 
Mem_readflags_Mux#(
BIT_WIDTH,
EXTRA_BITS
)
mux_3_inst
(
 //.INITIAL_ROM_READ_FLAG(Loaded_weight_end),
 //.INITIAL_ROM_READ_FLAG(detect_loading_original_weights),
 
 .INITIAL_ROM_READ_FLAG(delay_detect_loading_original_weights),
 //.ROM_OUTPUT(local_old_weight),  
 .ROM_OUTPUT(delay_rom_weights),
 .BUFFER_OUTPUT(final_weight),
 .SCALAR_OUTPUT(input_scaler)  
    ); 
	 
 New_Training_block#(
BIT_WIDTH,
EXTRA_BITS,
NUM_UNKNOWNS
)
trainingblock_inst
(
 .rst(RESET),
 .clk(CLK),
 .training_mode(training_mode),
 .SQUARED_ERROR(l2_error),
 .DELTA_WEIGHT(delta_val),
 .OLD_WEIGHT(local_old_weight),
 .training_done(training_done) ,
 .Best_error(Local_Besterror),         
 .ENABLE(stall), 
 .Finish_First_Manhattan_Iter(Finish_First_Manhattan_Iter),
 .Finish_Second_Manhattan_Iter(Finish_Second_Manhattan_Iter),
 .MEMORY_UPDATED_WEIGHT(Local_UpdatedWeight_L1), //result of training 
 .write_en(local_write_en) //it indicates that best weights shall be saved in buffer
);
always@(posedge CLK)begin
Best_error<=Local_Besterror;
input_weights_scalar<=Local_Rom_Weight;
old_weight_wr<=local_write_training |local_initial_read_flag;
detect_loading_original_weights<=Loaded_weight_end;
delay_detect_loading_original_weights<=detect_loading_original_weights;
delay_rom_weights<=local_old_weight;
delay_update_weight<=Update_Weight;
//delay_test1<=local_input_scalar;
//delay_test2<=delay_test1;
end
endmodule 