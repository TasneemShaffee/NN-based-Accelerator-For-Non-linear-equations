/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : NONLINEAR_LAYER
+ Abstract  : The implementation of of a non linear layer of neurons
+ Notes     : 
  - LUT file names in the ROM_FILE parameters must be 5 letters each
  - NUM_NEURONS of the LAYER module is calculated as NUM_UNKNOWNS + NUM_NONLIN
  - This module uses a LUT FOR EACH nonlinear ALU meaning that it does not utilize memory units nor reuses data
    and the same memory content might be repeated for several neurons
  - The order of the files given in the argument ROM_FILES must have the first row file name at the right
  - The ACC_EN signal is removed from the top interface and is now controlled based on the address pointer of the weight buffers
  - The result should be ready and valid after <NUM_UNKNOWNS+NUM_NONLIN+1> cycles from the reset signal; and then expect a valid
    output every <NUM_UNKNOWNS+NUM_NONLIN> cycles
  - When chaining the LUT; NUM_UNKNOWNS-1 is used since the forward engine assumes an extra ALU devoted for the unity bias to
    the next layer
  - Also it is and`ed with && s != (NUM_UNKNOWNS+NUM_NONLIN-1) to avoid chaining a lut at this ALU [it must output a 1 to act as the
    bias for the next layer]; [a bias is a unity input]
*/
`default_nettype none
/*
* Make sure to un-comment the include section if using an external compiler e.g. iverilog
*/
// ALU flopoco primitives directory. Should be changed whenever the flopoco primitives are changed
//`ifndef NONLINEAR_LAYER_
`define NONLINEAR_LAYER_
`include "definitions.v"
//`ifdef iverilog_comp
//`include "rtl/computation/LAYER.v"    
//`include "rtl/computation/INTERMEDIATE_BUFFER.v"
//`include "rtl/storage/WEIGHTS_ROM.v"
//`include "rtl/storage/ACTIVATION_LUT.v"
//`endif

//

module NONLINEAR_LAYER #(
  parameter NUM_UNKNOWNS = 2,           // Total number of equation unknowns
  parameter NUM_NONLIN = 1,             // Number of nonlinear modules
  parameter BIT_WIDTH = 32,             // Floating point size
  parameter EXTRA_BITS = 2,             // Flopoco Floating point extra two bits. CAN ONLY have the values [0 OR 2]
  parameter ROM_FILES = "EXP.mem",      // ROM file names each file name must be a 7 letters string e.g. sin.txt, exp.txt,...
  parameter ROM_FILES_D = "EXP.mem",    // ROM file names for the lut activation derivatives
  parameter WEIGHT_FILES = "R0.mem")    // Weight columns memory concents. Same convention as ROM_FILES
(
  input wire [BIT_WIDTH + EXTRA_BITS - 1:0]                 INPUT_SCALER,       // Float net scaler coming from the input FIFO
  input wire                                                CLK,                // For sync. the adder output
  input wire                                                RESET,              // Accumulator register clear [might be omitted in future]
  input  wire  INITIAL_READ_FLAG,
  output wire [(BIT_WIDTH + EXTRA_BITS)*NUM_NONLIN - 1:0]   NET_D,              // Derivative of the nonlinear dot product value
  output wire [BIT_WIDTH + EXTRA_BITS - 1:0]                ACC_RESULT          // One by one float output from the intermediate buffer
);

  // Internal wires, reg declaration area
  wire [(BIT_WIDTH + EXTRA_BITS)*(NUM_UNKNOWNS+NUM_NONLIN) - 1:0] buffer_weights;       // All the buffers output for the LAYER
  reg  [(BIT_WIDTH + EXTRA_BITS)*(NUM_UNKNOWNS+NUM_NONLIN) - 1:0] delay_buffer_weights;
  wire [(BIT_WIDTH + EXTRA_BITS)*(NUM_UNKNOWNS+NUM_NONLIN) - 1:0] maccs_outputs;        // All the ALUs outputs pre-LUT
  wire [(BIT_WIDTH + EXTRA_BITS)*(NUM_UNKNOWNS+NUM_NONLIN) - 1:0] maccs_outputs_lut;    // All the ALUs outputs post-LUT
  wire                                                            acc_en;               // accumulate enable signal per ALU
  wire [(BIT_WIDTH + EXTRA_BITS)*NUM_NONLIN - 1:0]                net_derivatives;      // the nonlinear layer net derivatives
  wire [(BIT_WIDTH + EXTRA_BITS)*(NUM_UNKNOWNS+NUM_NONLIN) - 1:0] local_buffer_weights;
  genvar s;
 assign local_buffer_weights=(INITIAL_READ_FLAG==1)?buffer_weights:delay_buffer_weights;

  // Internal modules instantiation
  LAYER #(.BIT_WIDTH(BIT_WIDTH), .EXTRA_BITS(EXTRA_BITS), .NUM_NEURONS((NUM_UNKNOWNS+NUM_NONLIN))) layer_core(
	//.WEIGHT_VECTOR(buffer_weights),
	.WEIGHT_VECTOR(local_buffer_weights),
	.INPUT_SCALER(INPUT_SCALER),
	.CLK(CLK), 
	.ACC_EN(acc_en),
	.RESET(RESET),
	.ACC_RESULT(maccs_outputs)
);

  INTERMEDIATE_BUFFER #(.NUM_NEURONS((NUM_UNKNOWNS+NUM_NONLIN)), .BIT_WIDTH(BIT_WIDTH),. EXTRA_BITS(EXTRA_BITS))  intermediate_logic(
    .layer_output(maccs_outputs_lut),
    .inter_en(~acc_en),//INTERMEDIATE_EN),
    .clk(CLK),
    .net_derivative_in(net_derivatives),
    .net_derivative_out(NET_D),
    .shift_res(ACC_RESULT)
  );

  // the accumulators are enabled once the address pointer is no longer pointing to zero
  WEIGHTS_ROM #(.BIT_WIDTH(BIT_WIDTH*(NUM_UNKNOWNS+NUM_NONLIN)), .EXTRA_BITS(EXTRA_BITS*(NUM_UNKNOWNS+NUM_NONLIN)), .DEPTH(NUM_UNKNOWNS+NUM_NONLIN), .FILE_NAME(WEIGHT_FILES)) weight_buff(
    .CLK(CLK),
    .RESET(RESET),
    .ACC_EN(acc_en),
    .MEM_OUT(buffer_weights)
  );
  generate
    for (s = 0; s<(NUM_UNKNOWNS+NUM_NONLIN); s=s+1) begin : LUTs
    // place LUTs for the nonlinear neurons
    if(s >= NUM_UNKNOWNS-1 && s != (NUM_UNKNOWNS+NUM_NONLIN-1)) begin // //{ROM_FILES[((s-NUM_UNKNOWNS+1)*`num_chars_mem+`num_chars_mem)*8:(s-NUM_UNKNOWNS+1)*`num_chars_mem*8]}
      ACTIVATION_LUT #(.BIT_WIDTH(BIT_WIDTH), .EXTRA_BITS(EXTRA_BITS), .FILE_NAME(ROM_FILES)) LUT(
	    .INPUT_SCALER(maccs_outputs[(BIT_WIDTH+EXTRA_BITS)*(s+1)-1: (BIT_WIDTH+EXTRA_BITS)*s]),
	    .CLK(CLK), 
	    .MEM_OUT(maccs_outputs_lut[(BIT_WIDTH+EXTRA_BITS)*(s+1)-1: (BIT_WIDTH+EXTRA_BITS)*s])
    );
	 //{ROM_FILES_D[((s-NUM_UNKNOWNS+1)*`num_chars_mem+`num_chars_mem)*8:(s-NUM_UNKNOWNS+1)*`num_chars_mem*8]}
      ACTIVATION_LUT #(.BIT_WIDTH(BIT_WIDTH), .EXTRA_BITS(EXTRA_BITS), .FILE_NAME(ROM_FILES_D)) LUT_D(
	    .INPUT_SCALER(maccs_outputs[(BIT_WIDTH+EXTRA_BITS)*(s+1)-1: (BIT_WIDTH+EXTRA_BITS)*s]),
	    .CLK(CLK), 
	    .MEM_OUT(net_derivatives[(BIT_WIDTH+EXTRA_BITS)*((s - (NUM_UNKNOWNS-1))+1)-1: (BIT_WIDTH+EXTRA_BITS)*(s - (NUM_UNKNOWNS-1))])
    );
    
    end
    else begin
      // direct connection to the intermediate logic
      assign maccs_outputs_lut[(BIT_WIDTH+EXTRA_BITS)*(s+1)-1: (BIT_WIDTH+EXTRA_BITS)*s] = maccs_outputs[(BIT_WIDTH+EXTRA_BITS)*(s+1)-1: (BIT_WIDTH+EXTRA_BITS)*s];
    end

    end
  endgenerate


always@(posedge CLK)begin
delay_buffer_weights<=buffer_weights;
end
endmodule // NONLINEAR_LAYER
//`endif