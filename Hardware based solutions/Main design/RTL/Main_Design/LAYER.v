/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : Linear Layer
+ Abstract  : The layer is a wrapper built around the ALU. Each layer has an equivalent number of ALUs as the number of neurons inside it
+ Notes     : 
  - At this point, each neuron has a dedicated hardware unit, but we did not consider the case where too many neurons are needed
  - For the upper problem, maybe the control unit could handle scheduling the weights from different memory locations
  - This layer DOES NOT include any nonlinear function evaluators e.g. LUTs; the current design will define another module
    that encapsulates this linear layer with LUTs
  - In the aforementioned point a more efficient implementation would use linear layers and embed the
    nonlinear luts at the intermediate logic
  - ACC_EN is now made one wire per ALU not shared among all of them
*/

//`ifndef LAYER_
`define LAYER_
`include "definitions.v"
//`ifdef iverilog_comp
//`include "rtl/computation/ALU32_NP.v"
//`endif

module LAYER #(
  parameter NUM_NEURONS = 4,      // Number of synthesized ALUs within this layer
  parameter BIT_WIDTH = 32,       // Floating point size
  parameter EXTRA_BITS = 2)       // Flopoco Floating point extra two bits. CAN ONLY have the values [0 OR 2]
(
  input wire [BIT_WIDTH + EXTRA_BITS - 1:0]                 INPUT_SCALER,       // Float net scaler coming from the input FIFO to all the ALUs
  input wire [(BIT_WIDTH + EXTRA_BITS)*NUM_NEURONS - 1:0]   WEIGHT_VECTOR,      // Weight bus per neuron
  input wire                                                CLK,                // For sync. the adder output
  input wire                                                ACC_EN,             // Enables the adders unit to accumulate the previous values
  input wire                                                RESET,              // Accumulator register clear [might be omitted in future]
  output wire [(BIT_WIDTH + EXTRA_BITS)*NUM_NEURONS - 1:0]  ACC_RESULT          // Sync. multiply-accumulate output
);

  // Internal wires, reg declaration area
  wire [NUM_NEURONS*(BIT_WIDTH+EXTRA_BITS)-1 :0] local_res ;
  genvar s;

  // Internal modules instantiation
  generate
    for (s = 0; s<NUM_NEURONS; s=s+1) begin : neurons
      ALU #(.BIT_WIDTH(BIT_WIDTH), .EXTRA_BITS(EXTRA_BITS)) macc_unit(
      .WEIGHT_SCALER(WEIGHT_VECTOR[(BIT_WIDTH+EXTRA_BITS)*(s+1)-1: (BIT_WIDTH+EXTRA_BITS)*s]),    // Select the current starting idx based on the instance number
      .INPUT_SCALER(INPUT_SCALER[(BIT_WIDTH+EXTRA_BITS)-1: 0]),                                   // All the units receive the same scaler input [broadcasted]
      .CLK(CLK),                                                                                  // All neurons share the same CLK
      .ACC_EN(ACC_EN),                                                                            // All neurons share the same accumulator clearing signal
      .RESET(RESET),                                                                              // Reset is shared among all of them [can be removed in future]
      .ACC_RESULT(ACC_RESULT [(BIT_WIDTH+EXTRA_BITS)*(s+1)-1: (BIT_WIDTH+EXTRA_BITS)*s])          // Accumulator results are indexed similar to weight bus
    );
    end
  endgenerate
endmodule // LAYER
//`endif