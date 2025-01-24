
`include "definitions.v"
/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : ROM
+ Abstract  : The ROM storing the weights of a single neuron
+ Notes     : 
  -Its implementation almost the same as weights_ROM however the output assignment is combinational. 
*/
module ROM #(
  parameter BIT_WIDTH = 32,               // The floating point size in bits
  parameter EXTRA_BITS = 2,               // Flopoco Floating point extra two bits. CAN ONLY have the values [0 OR 2]
  parameter DEPTH =  4,                   // Memory depth [Number of elements or words in memory]
  parameter MEM_DIR = `MEM_DIR,           // Directory holding all memory files
  parameter PTR_RESET_BASE = 0,           // Counter reset value
  parameter FILE_NAME = "init.txt"    		// The .txt file holding the weights to be stored into the memory IN BINARY REPRESENTATION
)
(
  input wire                                CLK,        // Sync. clock
  input wire                                RESET,      // Resetting the address pointer back to zero [the first weight]
  output wire                               ACC_EN,     // ALU signal for enabling/disabling accumulator based on the current address
  output wire    [BIT_WIDTH + EXTRA_BITS - 1:0] MEM_OUT // The weight participating in the MACC operation
);

  // Internal wires, reg declaration area
  reg [BIT_WIDTH + EXTRA_BITS - 1:0] weight_memory [0:DEPTH-1];       // Memory holding all the neuron weights
  reg [$clog2(DEPTH)-1: 0] address_ptr;                               // Address pointer
  // Internal wires assignment
  assign ACC_EN = address_ptr!=1;
  assign MEM_OUT = weight_memory[address_ptr];
  // Memory filling routine
  /*ANY EXTRA SYNTHESIS FLAGS/COMMANDS SHOULD BE PLACED HERE */
  initial begin
    $readmemb(FILE_NAME, weight_memory);
  end

  // Functional blocks
  always @(posedge CLK or posedge RESET) begin
    if(RESET) begin
      address_ptr <= PTR_RESET_BASE;//0;
    end
    else begin
      if (address_ptr == (DEPTH-1)) begin
        address_ptr <=0;
      end
      else begin
        address_ptr <= address_ptr +1;
      end
    end
  end

endmodule 
