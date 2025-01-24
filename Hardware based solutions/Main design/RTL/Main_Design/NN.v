
/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : Top Module (NN)
+ Abstract  : Top module that has all the needed components to implement NN solver.

*/
module NN#(
parameter BIT_WIDTH = 32,              		//Bit width of the data
  parameter EXTRA_BITS = 2,						//Extra bits were neeeded by Flopoco library
  parameter NUM_UNKNOWNS = 2,						//Number of unknowns of the system of equations
  parameter NUM_NONLIN = 1,                  //Number of nonlinear expressions in the given system of equations
  parameter Extra_Cycles = 3 ,               //Estimated wasted cycles of the system
  parameter depth=2,
  parameter INITIAL_GUESS_FILE = "IN1.mem",  //File has initial guess of the system of equations
  parameter WEIGHT_FILES_L1 = "R11.mem",     //File has the coefficients of first layer that were needed to be multiplied by the first input 
  parameter WEIGHT_FILES_L2 = "R21.mem",     //File has the coefficients of first layer that were needed to be multiplied by the second input 
  parameter WEIGHT_FILES_L3 = "R12.mem",     //File has the coefficients of second layer that were needed to be multiplied by the first input 
  parameter WEIGHT_FILES_L4 = "R22.mem"      //File has the coefficients of second layer that were needed to be multiplied by the second input
)(
  input wire CLK,																	//Clock signal to synchronize the system
  input wire RESET,                                           		//Reset signal to initiate the system
  output reg  [BIT_WIDTH + EXTRA_BITS - 1:0] Best_error,
  output reg stop_training,													//Output stop signal from control units detecs that the training is done 
  output reg  [NUM_UNKNOWNS*(BIT_WIDTH + EXTRA_BITS) - 1:0] out
    );

  wire training_mode;  												//training mode signals connects training and control unit
  wire stall;         												//stall signal to ban training from execution
  wire local_initial_read_flag; 									//Loads the inital gues for firs time
  wire old_weight_rd;
  wire local_write_training;										// signal enables the updates roots to be saved in root memory
  wire local_finish;													//Signal detects the end of current training mode to enable the read signals of the best weights memory to load the best roots to the fwd engine
  wire Finish_First_Manhattan_Iter;								//Signal detects the finishing of first Manhattan training mode iterations
  wire Finish_Second_Manhattan_Iter;							//Signal detects the finishing of second Manhattan training mode iterations and begining of Adam mode
  wire Update_Weight;												//Signal detects to write the updated roots in the roots memory updating the padding values
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] acc_result_l1;		//result of fwd engine
  wire [(BIT_WIDTH + EXTRA_BITS)*NUM_NONLIN - 1:0] net_d_out; //neuron error result
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] l1_error;						//the calculated error is propagated through first layer 
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] l2_error;						//the calculated error is propagated through second layer
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] delta_val;					//the delta weight of each root 

  wire Loaded_weight_end;													//read signal is enabled when the padding values are loaded from memories
  wire best_weight_wr_update_weight;
  wire                                training_done;				//Signal indiactes the finishing of the training
  wire  	[BIT_WIDTH + EXTRA_BITS - 1:0]  Best_weights;           
  wire 	[BIT_WIDTH + EXTRA_BITS - 1:0]  Local_Bestweights;  
  wire  	[BIT_WIDTH + EXTRA_BITS - 1:0]Local_Besterror;
  wire  	[BIT_WIDTH + EXTRA_BITS - 1:0]Local_UpdatedWeight_L1;
  wire  	[BIT_WIDTH + EXTRA_BITS - 1:0]Local_Buffer_Weight;
  wire  	[BIT_WIDTH + EXTRA_BITS - 1:0]Local_Rom_Weight;
  wire 	[BIT_WIDTH + EXTRA_BITS - 1:0] input_scaler;     //input of first layer (roots)  
  wire 	[BIT_WIDTH + EXTRA_BITS - 1:0] local_old_weight; //get the olde weight from buffer
  wire 	[BIT_WIDTH + EXTRA_BITS - 1:0] local_input_scalar;
  
  wire local_upload_weight;
  wire local_stall;
  wire local_besterror_flag;
  wire local_write_en;
  wire stop;
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] final_weight;
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] input_best_weights;
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] delay_fwd_test;
  wire delay_wr_save_old_weights_memory;
  wire sync_old_weights;
  reg delay_wr_save_old_weights_reg;
  reg old_weight_wr; //flag to enable and disable saving old weights in buffer
  reg detect_loading_original_weights;
  reg [BIT_WIDTH + EXTRA_BITS - 1:0] delay_rom_weights;
  reg [BIT_WIDTH + EXTRA_BITS - 1:0] second_delay_rom_weights; //To delay the weights produced from ROM memory two cycles
  reg delay_detect_loading_original_weights;
  reg delay_update_weight;
  reg [BIT_WIDTH + EXTRA_BITS - 1:0] input_weights_scalar;
  //reg [BIT_WIDTH + EXTRA_BITS - 1:0]delay_test2;
  //Assign local wires
  assign best_weight_wr_update_weight=local_write_en | local_initial_read_flag; //update for roots in case of best weights or initial guess 
  assign input_best_weights= (local_initial_read_flag==1)?Local_Rom_Weight:local_old_weight;
  assign local_input_scalar=(input_scaler==34'b0)?34'b0:input_scaler;//if the training stoped execution then load zeros to fwd engine till the training starts the execution again
  //assign delay_fwd_test=(local_initial_read_flag==1)?local_input_scalar:delay_test2;
  assign delay_wr_save_old_weights_memory=(delay_wr_save_old_weights_reg==0)?0:old_weight_wr;
  //Instantiation modules
  //Forward engine
	 FWD_ENGINE #(.WEIGHT_FILES_L1(WEIGHT_FILES_L1), .NUM_UNKNOWNS(2), .NUM_NONLIN(1), .WEIGHT_FILES_L2(WEIGHT_FILES_L2)) forward_engine(
    .INPUT_SCALER(local_input_scalar),
    .CLK(CLK), 
    .RESET(RESET),
    .NET_D_OUT(net_d_out),
	 .INITIAL_READ_FLAG(local_initial_read_flag),
    .ERROR_ACC_OUT(l1_error),
    .ACC_RESULT(acc_result_l1)
  );
	//Backward engine
  BWD_ENGINE #(.WEIGHT_FILES_L1(WEIGHT_FILES_L3), .NUM_UNKNOWNS(2), .NUM_NONLIN(1), .WEIGHT_FILES_L2(WEIGHT_FILES_L4)) backward_engine(
    .INPUT_SCALER(acc_result_l1),
    .CLK(CLK), 
    .NET_D_IN(net_d_out),
    .ERROR_ACC_IN(l1_error),
    .ERROR_ACC_OUT(l2_error),
    .RESET(RESET),
    .ACC_RESULT(delta_val)
  );
  //Rom memory to load initial guess 
ROM#(.DEPTH(4), .FILE_NAME(INITIAL_GUESS_FILE)) root_memory(
    .CLK(CLK),
    .RESET(RESET),
    .MEM_OUT(Local_Rom_Weight)
  );
//best weights memory that saves the best roots that lead to best error during training 
MEM_WEIGHTS
#(
BIT_WIDTH, 
EXTRA_BITS, 
NUM_UNKNOWNS,
depth
)
memory_best_weights
(
.clk(CLK),                                 	
.rst(RESET),                                	 
.data_in(input_best_weights),                
.wr_en(best_weight_wr_update_weight),         
.rd_en(local_finish),                         
.Update_Weight(Update_Weight), 
.local_initial_read_flag(local_initial_read_flag),
.data_out(Best_weights)  		                               			
    );
//roots memory that stores the roots of the system of equations	 
MEM_WEIGHTS
#(
BIT_WIDTH, 
EXTRA_BITS, 
NUM_UNKNOWNS,
depth
)
memory_save_old_weight
(
.clk(CLK),                                 	
.rst(RESET),                                	
.data_in(local_input_scalar),           	
.wr_en(delay_wr_save_old_weights_memory),              
.rd_en(old_weight_rd),
.Update_Weight(delay_update_weight),
.Loaded_weight_end(Loaded_weight_end),
.data_out(local_old_weight)  				
    );
//Multiplex between data produced from training block (updated roots)and best weights.
Mem_Mux#(
BIT_WIDTH,
EXTRA_BITS
)
mux_inst
(
.training_finish(local_finish), 					 
.TRAINING_OUTPUT(Local_UpdatedWeight_L1),      
.BEST_WEIGHT(Best_weights) ,                  
.OUTPUT_WEIGHT(Local_Buffer_Weight)   			 
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
 .ROM_OUTPUT(input_weights_scalar),
 .BUFFER_OUTPUT(Local_Buffer_Weight),
 .SCALAR_OUTPUT(final_weight)  
    ); 
	 
//It multiplex between intial guess and the updated roots	 
Mem_readflags_Mux#(
BIT_WIDTH,
EXTRA_BITS
)
mux_3_inst
(

 .INITIAL_ROM_READ_FLAG(delay_detect_loading_original_weights),  
 .ROM_OUTPUT(delay_rom_weights),
 .BUFFER_OUTPUT(final_weight),
 .SCALAR_OUTPUT(input_scaler)  
    ); 
//Instantiate training block for weights update	 
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
 .MEMORY_UPDATED_WEIGHT(Local_UpdatedWeight_L1), 
 .write_en(local_write_en) 
);
//Control unit
control_unit_2#(NUM_UNKNOWNS ) c1(
   .clk(CLK),
	.rst(RESET),
	.training_done(training_done),
	.training_mode(training_mode),
	.INITIAL_ROM_READ_FLAG(local_initial_read_flag),
	.WASTED_CYCLE_STALL(stall),
	.old_weight_rd(old_weight_rd),
	.write_training(local_write_training),
	.write_enable(Update_Weight),
	.first_manh_finished(Finish_First_Manhattan_Iter),
	.second_manh_finished(Finish_Second_Manhattan_Iter),
	.finished(local_finish),
	.stop(stop)
);
//Applying some delays for some data to achieve the syncronization between blocks.
always@(posedge CLK)begin
if (RESET)
begin
delay_wr_save_old_weights_reg<=0;
end
else begin
if (local_initial_read_flag)
delay_wr_save_old_weights_reg<=1;
end
Best_error<=Local_Besterror;
input_weights_scalar<=Local_Rom_Weight;
old_weight_wr<=local_write_training |local_initial_read_flag;
detect_loading_original_weights<=Loaded_weight_end;
delay_detect_loading_original_weights<=detect_loading_original_weights;
delay_rom_weights<=local_old_weight;
delay_update_weight<=Update_Weight;
stop_training<=stop;
out[33:0]<=local_old_weight;
end
endmodule
