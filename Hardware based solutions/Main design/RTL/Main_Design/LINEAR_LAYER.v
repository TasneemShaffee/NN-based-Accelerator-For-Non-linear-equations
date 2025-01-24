/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : LINEAR_LAYER
+ Abstract  : The implementation of of a linear layer of neurons
+ Notes     : 
  - NUM_NEURONS of the LAYER module is calculated as NUM_UNKNOWNS + NUM_NONLIN
  - The order of the files given in the argument ROM_FILES must have the first row file name at the right
  - The ACC_EN signal is removed from the top interface and is now controlled based on the address pointer of the weight buffers
  - The result should be ready and valid after <NUM_UNKNOWNS+NUM_NONLIN+1> cycles from the reset signal; and then expect a valid
    output every <NUM_UNKNOWNS+NUM_NONLIN> cycles

*/
`default_nettype none
/*
* Make sure to un-comment the include section if using an external compiler e.g. iverilog
*/
// ALU flopoco primitives directory. Should be changed whenever the flopoco primitives are changed
`include "definitions.v"
//`ifdef iverilog_comp
//`include "rtl/computation/LAYER.v"    
//`include "rtl/computation/INTERMEDIATE_BUFFER.v"
//`include "rtl/storage/WEIGHTS_ROM.v"
//`include "definitions.v"
//`endif

//

module LINEAR_LAYER #(
  parameter NUM_UNKNOWNS = 2,           // Total number of equation unknowns
  parameter NUM_NONLIN = 1,             // Number of nonlinear modules at the previous linear layer
  parameter BIT_WIDTH = 32,             // Floating point size
  parameter EXTRA_BITS = 2,             // Flopoco Floating point extra two bits. CAN ONLY have the values [0 OR 2]
  parameter PTR_RESET_BASE = 0,           // Counter reset value
  parameter WEIGHT_FILES = "R0.mem")    // Weight columns memory concents. Same convention as ROM_FILES
(
  input wire [BIT_WIDTH + EXTRA_BITS - 1:0]                 INPUT_SCALER,       // Float net scaler coming from the input FIFO
  input wire                                                CLK,                // For sync. the adder output
  input wire                                                RESET,              // Accumulator register clear [might be omitted in future]
  input wire [(BIT_WIDTH + EXTRA_BITS)*NUM_NONLIN - 1:0]    NET_D_IN,           // Propagated derivatives from the previous layer  
  input wire [BIT_WIDTH + EXTRA_BITS - 1:0]                 ERROR_ACC_IN,       // Accumulated error from the previous layer
  output wire                                               ACC_EN,             // ACC enable control signal shared for other modules
  output wire [(BIT_WIDTH + EXTRA_BITS)*NUM_NONLIN - 1:0]   NET_D_OUT,          // Propagated derivatives to the successor layer
  output wire [BIT_WIDTH + EXTRA_BITS - 1:0]                ERROR_ACC_OUT,      // Accumulated error propagated to the successor layer
  output wire [BIT_WIDTH + EXTRA_BITS - 1:0]                ACC_RESULT          // One by one float output from the intermediate buffer
);

  // Internal wires, reg declaration area
  wire [(BIT_WIDTH + EXTRA_BITS)*(NUM_UNKNOWNS) - 1:0] buffer_weights;       // All the buffers output for the LAYER
  wire [(BIT_WIDTH + EXTRA_BITS)*(NUM_UNKNOWNS) - 1:0] maccs_outputs;        // All the ALUs outputs pre-LUT
  wire                                                 acc_en;               // accumulate enable signal per ALU
  genvar s;

  // Internal wire assignment
  assign ACC_EN = acc_en;
 // assign local_buffer_weights=(INITIAL_READ_FLAG==1)?buffer_weights:delay_buffer_weights;
  
  // Internal modules instantiation
  LAYER #(.BIT_WIDTH(BIT_WIDTH), .EXTRA_BITS(EXTRA_BITS), .NUM_NEURONS((NUM_UNKNOWNS))) layer_core(
	.WEIGHT_VECTOR(buffer_weights),
	//.WEIGHT_VECTOR(local_buffer_weights),
	.INPUT_SCALER(INPUT_SCALER),
	.CLK(CLK), 
	.ACC_EN(acc_en),
	.RESET(RESET),
	.ACC_RESULT(maccs_outputs)
);

  INTERMEDIATE_BUFFER #(.NUM_NEURONS((NUM_UNKNOWNS)), .BIT_WIDTH(BIT_WIDTH),. EXTRA_BITS(EXTRA_BITS))  intermediate_logic(
    .layer_output(maccs_outputs),
    .inter_en(~acc_en),
    .clk(CLK),
    .net_derivative_in(NET_D_IN),
    .net_derivative_out(NET_D_OUT),
    .error_in(ERROR_ACC_IN),
    .error_out(ERROR_ACC_OUT),
    .shift_res(ACC_RESULT)
  );

  WEIGHTS_ROM 
  #(.BIT_WIDTH(BIT_WIDTH*NUM_UNKNOWNS), .EXTRA_BITS(EXTRA_BITS*NUM_UNKNOWNS), .DEPTH(NUM_UNKNOWNS+NUM_NONLIN+1), .FILE_NAME(WEIGHT_FILES), .PTR_RESET_BASE(PTR_RESET_BASE)) weight_buff(
    .CLK(CLK),
    .RESET(RESET),
    .ACC_EN(acc_en),
    .MEM_OUT(buffer_weights)
  );

endmodule // LINEAR_LAYER
