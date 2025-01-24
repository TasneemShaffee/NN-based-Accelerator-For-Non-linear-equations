/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : ACTIVATION_LUT
+ Abstract  : The implementation of non linear activation function using a look up table
+ Notes     : 
  - It uses the FPGA memory pre-loaded with the specific non-linear activation values
  - Make sure parameters matches the generated memory file [depth, bit size and extra bits if included]
  - The current implementation is using the Flopoco FP2FIX module for converting the floating point representation
    to fixed point for accessing the memory.
  - Sample based LUT is implemented which is limited to the fixed point size as an address
*/


//`include "rtl/computation/FPFloat_to_fix.v"
//`ifndef ACTIVATION_LUT_
//`define ACTIVATION_LUT_
`include "definitions.v"
//`ifdef iverilog_comp
//`include "rtl/storage/FLOAT2FIX.v"
//`include "definitions.v"
//`endif

`default_nettype none

module ACTIVATION_LUT #(
  parameter BIT_WIDTH     = 32,         // The floating point size in bits
  parameter BIT_WIDTH_O   = 32,         // The floating point size in bits for the ROM content
  parameter EXTRA_BITS    = 2,          // Flopoco Floating point extra two bits. CAN ONLY have the values [0 OR 2]
  parameter ADDRESS_BITS  = 10,         // Memory depth [Number of elements or words in memory]
  parameter MEM_DIR = `MEM_DIR,         // Directory having the memory files
  parameter FILE_NAME = "EXP.mem"   	 // The .txt file holding the generated LUT based approximation
)
(
  input wire [BIT_WIDTH + EXTRA_BITS - 1:0]      INPUT_SCALER,   // Floating point input value
  input wire                                CLK,            // Sync. clock
  output reg [BIT_WIDTH + EXTRA_BITS - 1:0] MEM_OUT         // The value of the neuron after applying this nonlinear activation function
);

  // Internal wires, reg assignment and declaration
  wire [ADDRESS_BITS -1:0] lut_address;
  reg [BIT_WIDTH_O + EXTRA_BITS - 1:0] lut_memory [0:2**ADDRESS_BITS-1]; 

  // local parameters
	localparam m = 1&&(~EXTRA_BITS[1]);			// Local multiplicative constant for handling the case of no extra bits

  //Module instantiation
    FLOAT2FIX address_convert(
    .INPUT_SCALER(({{m{2'b01}}, {~m{INPUT_SCALER[BIT_WIDTH + EXTRA_BITS - 1 : BIT_WIDTH + EXTRA_BITS - 2]}}, INPUT_SCALER[BIT_WIDTH -1 : 0]})),
    .LUT_ADDRESS(lut_address)
  );
  
  // Memory filling routine
  /*ANY EXTRA SYNTHESIS FLAGS/COMMANDS SHOULD BE PLACED HERE */
  initial begin
   // $readmemb({MEM_DIR, FILE_NAME[`num_chars_mem*8-1:0]}, lut_memory);
	$readmemb("EXP.mem", lut_memory);
  end
  
  // Functional blocks
  always @(*) begin
    MEM_OUT <= lut_memory[lut_address];   // Sync. output driven by the fp2fix output
  end

endmodule // ACTIVATION_LUT
//`endif