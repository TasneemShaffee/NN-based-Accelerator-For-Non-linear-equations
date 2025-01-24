/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : Backward Engine
+ Abstract  : A chain of two layers that implements the backward pass of the neural network
+ Notes     : 
  - The parameter file name MUST NOT EXCEED the size defined @ definitions.v for reliability
  - At this point, each neuron has a dedicated hardware unit, but we did not consider the case where too many neurons are needed
  - For the upper problem, maybe the control unit could handle scheduling the weights from different memory locations
  - The module input should represent the initial guesses and should be updated by the trainer each cycle
  - The ith output represents f_i(X) function for the given inputs
  - The output must also be connected to the backward pass for calculating the delta term and propagating it to the trainer
  - Since the nonlinear layer data is captured one cycle after it is ready, the reset pointer value for the address pointer
    is delayed by one to sync. with such delay
*/
`include "definitions.v"

`default_nettype none

module BWD_ENGINE#(
  parameter NUM_UNKNOWNS = 2,             // Total number of equation unknowns
  parameter NUM_NONLIN = 1,               // Number of nonlinear modules
  parameter BIT_WIDTH = 32,               // Floating point size
  parameter EXTRA_BITS = 2,               // Flopoco Floating point extra two bits. CAN ONLY have the values [0 OR 2]
  parameter ROM_FILES = "EXP.mem",        // ROM file names each file name must be a 7 letters string e.g. sin.txt, exp.txt,...
  parameter WEIGHT_FILES_L1 = "R0.mem",   // Weight columns memory contents. Same convention as ROM_FILES for the first nonlinear layer
  parameter WEIGHT_FILES_L2 = "R0.mem")   // Weight columns memory contents for the second linear layer
(
  input wire [BIT_WIDTH + EXTRA_BITS - 1:0]                 INPUT_SCALER,       // Float net scaler coming from the input FIFO representing initial guesses
  input wire                                                CLK,                // For sync. the adder output
  input wire                                                RESET,              // Accumulator register clear [might be omitted in future]
  input wire [(BIT_WIDTH + EXTRA_BITS)*NUM_NONLIN - 1:0]    NET_D_IN,           // Propagated derivatives from the previous layer    
  input wire [BIT_WIDTH + EXTRA_BITS - 1:0]                 ERROR_ACC_IN,       // Accumulated error from the previous layer    
 // input  wire  INITIAL_READ_FLAG,
  output wire [BIT_WIDTH + EXTRA_BITS - 1:0]                ERROR_ACC_OUT,      // Accumulated error propagated to the successor layer
  output wire [BIT_WIDTH + EXTRA_BITS - 1:0]                ACC_RESULT          // One by one float output from the output intermediate buffer
);

  // Internal wires, reg declaration area
  wire [BIT_WIDTH + EXTRA_BITS - 1:0]               layer_1_output;
  wire [BIT_WIDTH + EXTRA_BITS - 1:0]               error_value;
  wire                                              acc_en;

  // Internal modules instantiation
    
  LINEAR_LAYER_BWD #(.WEIGHT_FILES(WEIGHT_FILES_L1), .NUM_NONLIN(NUM_NONLIN), .NUM_UNKNOWNS(NUM_UNKNOWNS), .PTR_RESET_BASE(NUM_UNKNOWNS+NUM_NONLIN-1)) nonlinear_layer(
    .INPUT_SCALER(INPUT_SCALER),
    .CLK(CLK),
    .NET_D_IN(NET_D_IN),
    .ERROR_ACC_IN(ERROR_ACC_IN),
    .ERROR_ACC_OUT(error_value),
    .RESET(RESET),
    .ACC_RESULT(layer_1_output)
  );

  LINEAR_LAYER #(.WEIGHT_FILES(WEIGHT_FILES_L2), .NUM_UNKNOWNS(NUM_UNKNOWNS), .NUM_NONLIN(NUM_NONLIN), .PTR_RESET_BASE(NUM_UNKNOWNS+NUM_NONLIN-2)) linear_layer(
    .INPUT_SCALER(layer_1_output),
    .CLK(CLK), 
    .RESET(RESET),
    .ACC_EN(acc_en),
    .ERROR_ACC_IN(error_value),
    .ERROR_ACC_OUT(ERROR_ACC_OUT),
    .ACC_RESULT(ACC_RESULT)
  );

endmodule // BWD_ENGINE