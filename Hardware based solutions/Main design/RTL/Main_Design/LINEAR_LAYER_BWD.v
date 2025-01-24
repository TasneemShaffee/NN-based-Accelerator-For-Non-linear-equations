/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : LINEAR_LAYER_BWD
+ Abstract  : The implementation of of a linear layer of neurons used in the back propagation
+ Notes     : 
  - NUM_NEURONS of the LAYER module is calculated as NUM_UNKNOWNS + NUM_NONLIN
  - The ACC_EN signal is removed from the top interface and is now controlled based on the address pointer of the weight buffers
  - The result should be ready and valid after <NUM_UNKNOWNS+NUM_NONLIN+1> cycles from the reset signal; and then expect a valid
    output every <NUM_UNKNOWNS+NUM_NONLIN> cycles
  - Memory depth is set to <NUM_UNKNOWNS+NUM_NONLIN+1> in order to match the previous layer depth
    this is because at this point the layer consumes outputs faster than the previous layer produces them

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
//`include "rtl/flopoco/FPmul_nonpipe.v"
`include "definitions.v"
//`endif

//

module LINEAR_LAYER_BWD #(
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
  input  wire  INITIAL_READ_FLAG,
  output wire                                               ACC_EN,             // ACC enable control signal shared for other modules
  output wire [BIT_WIDTH + EXTRA_BITS - 1:0]                ERROR_ACC_OUT,      // Accumulated error propagated to the successor layer
  output wire [BIT_WIDTH + EXTRA_BITS - 1:0]                ACC_RESULT          // One by one float output from the intermediate buffer
);

  // Internal wires, reg declaration area
  wire [(BIT_WIDTH + EXTRA_BITS)*(NUM_UNKNOWNS+NUM_NONLIN) - 1:0] buffer_weights;       // All the buffers output for the LAYER
  wire [(BIT_WIDTH + EXTRA_BITS)*(NUM_UNKNOWNS+NUM_NONLIN) - 1:0] maccs_outputs;        // All the ALUs outputs pre-LUT
  wire [(BIT_WIDTH + EXTRA_BITS)*(NUM_UNKNOWNS+NUM_NONLIN) - 1:0] maccs_outputs_pre_mul;
  wire                                                            acc_en;               // accumulate enable signal per ALU
  wire [(BIT_WIDTH + EXTRA_BITS)*NUM_NONLIN - 1:0]                net_d_out;            // Propagated derivatives to the successor layer
  //reg  [(BIT_WIDTH + EXTRA_BITS)*(NUM_UNKNOWNS+NUM_NONLIN) - 1:0] delay_buffer_weights;
  //wire [(BIT_WIDTH + EXTRA_BITS)*(NUM_UNKNOWNS+NUM_NONLIN) - 1:0] local_buffer_weights;
  genvar s;
  //assign local_buffer_weights=(INITIAL_READ_FLAG==1)?buffer_weights:delay_buffer_weights;
  // Internal wire assignment
  assign ACC_EN = acc_en;

  // Internal modules instantiation
  LAYER #(.BIT_WIDTH(BIT_WIDTH), .EXTRA_BITS(EXTRA_BITS), .NUM_NEURONS((NUM_UNKNOWNS+NUM_NONLIN))) layer_core(
	.WEIGHT_VECTOR(buffer_weights),
	//.WEIGHT_VECTOR(local_buffer_weights),
	.INPUT_SCALER(INPUT_SCALER),
	.CLK(CLK), 
	.ACC_EN(acc_en),
	.RESET(RESET),
	.ACC_RESULT(maccs_outputs_pre_mul)
);

  INTERMEDIATE_BUFFER #(.NUM_NEURONS((NUM_UNKNOWNS+NUM_NONLIN)), .BIT_WIDTH(BIT_WIDTH),. EXTRA_BITS(EXTRA_BITS))  intermediate_logic(
    .layer_output(maccs_outputs),
    .inter_en(~acc_en),//INTERMEDIATE_EN),
    .clk(CLK),
    .net_derivative_in(NET_D_IN),
    .net_derivative_out(net_d_out),
    .error_in(ERROR_ACC_IN),
    .error_out(ERROR_ACC_OUT),
    .shift_res(ACC_RESULT)
  );

  WEIGHTS_ROM #(.BIT_WIDTH(BIT_WIDTH*(NUM_UNKNOWNS+NUM_NONLIN)), .EXTRA_BITS(EXTRA_BITS*(NUM_UNKNOWNS+NUM_NONLIN)), .DEPTH(NUM_UNKNOWNS+NUM_NONLIN+1), .FILE_NAME(WEIGHT_FILES), .PTR_RESET_BASE(PTR_RESET_BASE)) weight_buff(
    .CLK(CLK),
    .RESET(RESET),
    .ACC_EN(acc_en),
    .MEM_OUT(buffer_weights)
  );

  generate
    for (s = 0; s<(NUM_UNKNOWNS+NUM_NONLIN); s=s+1) begin : LUTs
    // place LUTs for the nonlinear neurons
    if(s >= NUM_UNKNOWNS) begin

	FPmul_nonpipe MULTIPLIER_UNIT(
		.X(maccs_outputs_pre_mul[(BIT_WIDTH+EXTRA_BITS)*(s+1)-1: (BIT_WIDTH+EXTRA_BITS)*s]),
		.Y(net_d_out[(BIT_WIDTH+EXTRA_BITS)*((s - (NUM_UNKNOWNS))+1)-1: (BIT_WIDTH+EXTRA_BITS)*(s - (NUM_UNKNOWNS))]),
		.R(maccs_outputs[(BIT_WIDTH+EXTRA_BITS)*(s+1)-1: (BIT_WIDTH+EXTRA_BITS)*s])
		);
    end
    else begin
      // direct connection to the intermediate logic
      assign maccs_outputs[(BIT_WIDTH+EXTRA_BITS)*(s+1)-1: (BIT_WIDTH+EXTRA_BITS)*s] = maccs_outputs_pre_mul[(BIT_WIDTH+EXTRA_BITS)*(s+1)-1: (BIT_WIDTH+EXTRA_BITS)*s];
    end
    end
  endgenerate
  /*
always@(posedge CLK)begin
delay_buffer_weights<=buffer_weights;
end
*/
endmodule // LINEAR_LAYER_BWD
