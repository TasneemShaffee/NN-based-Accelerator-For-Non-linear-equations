`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:02:01 06/09/2018 
// Design Name: 
// Module Name:    test_blocks_cu_training_MEM 
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
module test_blocks_cu_training_MEM#(
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
 // input  wire [BIT_WIDTH + EXTRA_BITS - 1:0] l2_error,
  //input wire test_write_buffer_bestweights,
  //input wire [BIT_WIDTH + EXTRA_BITS - 1:0] delta_val
  output reg  [BIT_WIDTH + EXTRA_BITS - 1:0] Best_error
    );

  wire [BIT_WIDTH + EXTRA_BITS - 1:0] acc_result_l1;
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] acc_result;
  wire [(BIT_WIDTH + EXTRA_BITS)*NUM_NONLIN - 1:0] net_d_out;
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] l1_error;
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] l2_error;
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] delta_val;


  wire                                training_done;
  wire  [BIT_WIDTH + EXTRA_BITS - 1:0]  Best_weights;  
  
  wire [BIT_WIDTH + EXTRA_BITS - 1:0]  Local_Bestweights;  
  wire  [BIT_WIDTH + EXTRA_BITS - 1:0]Local_Besterror;
  wire  [BIT_WIDTH + EXTRA_BITS - 1:0]Local_UpdatedWeight_L1;
  wire  [BIT_WIDTH + EXTRA_BITS - 1:0]Local_Training_Weight;
  wire  [BIT_WIDTH + EXTRA_BITS - 1:0]Local_Buffer_Weight;
  wire  [BIT_WIDTH + EXTRA_BITS - 1:0]Local_Rom_Weight;
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] input_scaler;     //input of first layer (roots)
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] saved_old_weight; //a copy that has old weight  
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] local_old_weight; //get the olde weight from buffer
  wire local_upload_weight;
  wire local_stall;
  wire local_besterror_flag;
  wire local_write_en;
  wire stall;   			 //signal disable blocks from working
  wire stoping;
  wire local_finish; 	//signal enables reating the saved best weights from buffer
  wire training_mode; 	//signal indicates the training mode
  wire local_initial_read_flag; //signal enables reading the inputs(initial guess) from ROM
  wire old_weight_wr; //flag to enable and disable saving old weights in buffer
  wire local_write_training; // signal to enable /diable writting the data from training block in buffer
  wire old_weight_rd; //signal to enable reading old weight to be used in training 
  
  
  assign old_weight_wr=local_write_training |local_initial_read_flag;

  
    FWD_ENGINE #(.WEIGHT_FILES_L1(WEIGHT_FILES_L1), .NUM_UNKNOWNS(2), .NUM_NONLIN(1), .WEIGHT_FILES_L2(WEIGHT_FILES_L2)) forward_engine(
    .INPUT_SCALER(input_scaler),
    .CLK(CLK), 
    .RESET(RESET),
    .NET_D_OUT(net_d_out),
    .ERROR_ACC_OUT(l1_error),
    .ACC_RESULT(acc_result_l1)
  );

  BWD_ENGINE #(.WEIGHT_FILES_L1(WEIGHT_FILES_L3), .NUM_UNKNOWNS(2), .NUM_NONLIN(1), .WEIGHT_FILES_L2(WEIGHT_FILES_L4)) backward_engine(
    .INPUT_SCALER(acc_result_l1),
    .CLK(CLK), 
    .NET_D_IN(net_d_out),
    .ERROR_ACC_IN(l1_error),
    .ERROR_ACC_OUT(l2_error),
    .RESET(RESET),
    .ACC_RESULT(delta_val)
  );

 control_unit_1
#(
 NUM_UNKNOWNS,
 Extra_Cycles          ///This is the num of cycles wasted through updating weights
)
cu_inst
(
     .rst(RESET),                      //if 1 --> reset and initialize  && 0 --> continue
	 .clk(CLK),
    .training_done(training_done),          //if 1 --> stop iterations and training because required error achieved
	 .training_mode(training_mode),       // if 1 --> manhattan & 0 --> adam 
    .stall(stoping),              //if 1 --> stop training and deactivate all modules because 
	 .WASTED_CYCLE_STALL(stall)   ,                             //required iterations are done or training_done is high
    .INITIAL_ROM_READ_FLAG(local_initial_read_flag),	// 1 --> at the start of the training
 	.old_weight_rd(old_weight_rd),
	.write_training(local_write_training),
	.finished(local_finish)             // if 1 --> mode iterations has finished (Adam or Manhattan)
    );
  
 WEIGHTS_ROM #(.DEPTH(4), .FILE_NAME(INITIAL_GUESS_FILE)) root_memory(
    .CLK(CLK),
    .RESET(RESET),
    .MEM_OUT(Local_Rom_Weight)
  );

 Seq_TrainingBlock#(
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
 //.OLD_WEIGHT(input_scaler),
 .OLD_WEIGHT(local_old_weight),
 .training_done(training_done) ,
// .Best_weights(Local_Bestweights),  
 .Best_error(Local_Besterror),         
 .ENABLE(stall), 
 .MEMORY_UPDATED_WEIGHT(Local_UpdatedWeight_L1), //result of training 
 .write_en(local_write_en) //it indicates that best weights shall be saved in buffer
);

//Buffer
MEM
#(
BIT_WIDTH, //Width of input data
EXTRA_BITS, // the bits that needed to determine the number of entries in queue, in this case (4 bits), the queue has 16 entries.    
1
)
memory_best_weights
(
.clk(CLK),                                 	//input clock
.rst(RESET),                                	//input reset
.data_in(input_scaler),                   	// input data for fifo.
.wr_en(local_write_en),                      //writing enable signal
//.wr_en(test_write_buffer_bestweights),
.rd_en(local_finish),                        // reading enable signal => when training is finished 
.stall(stall) ,
.data_out(Best_weights)  		               //the data that outcomes from queue.
                       			
    );
/*
always@(*)
	 begin
	if (stall) begin
      local_write_training<=0;
      end	
		else if (!stall)
		local_write_training<=1;
	 end*/
MEM
#(
BIT_WIDTH, //Width of input data
EXTRA_BITS, // the bits that needed to determine the number of entries in queue, in this case (4 bits), the queue has 16 entries.    
1
)
memory_save_old_weight
(
.clk(CLK),                                 	//input clock
.rst(RESET),                                	//input reset
.data_in(input_scaler),           	//input data for fifo.
.wr_en(old_weight_wr),                //writing enable signal
//.rd_en(~local_finish),                       //reading enable signal
.rd_en(old_weight_rd),
.stall(stall) ,
.data_out(local_old_weight)  				//the data that outcomes from queue.  
    );
	 
/* 
//Buffer
MEM
#(
BIT_WIDTH, //Width of input data
EXTRA_BITS, // the bits that needed to determine the number of entries in queue, in this case (4 bits), the queue has 16 entries.    
1
)
memory_training_weights
(
.clk(CLK),                                 	//input clock
.rst(RESET),                                	//input reset
.data_in(Local_UpdatedWeight_L1),           	//input data for fifo.
.wr_en(training_wr),                //writing enable signal
//.rd_en(~local_finish),                       //reading enable signal
.rd_en(training_rd),
.stall(stall) ,
.data_out(Local_Training_Weight)  				//the data that outcomes from queue.  
    );
*/

/*	 
//This Mux selects whether training block output or best weights (old weights) will be taken. 	 
Mem_Mux#(
BIT_WIDTH,
EXTRA_BITS
)
mux_inst
(
.training_finish(local_finish), 					 //flag in	dicates wther the taken data is from training buffer or from best weights buffer
.TRAINING_OUTPUT(Local_Training_Weight),      //data comes out from training buffer
.BEST_WEIGHT(Best_weights) ,                  //data comes out from best weights buffer
.OUTPUT_WEIGHT(Local_Buffer_Weight)   			 //The output data 
    );
	 */
	 
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
 .SCALAR_OUTPUT(input_scaler)  
    );
endmodule
