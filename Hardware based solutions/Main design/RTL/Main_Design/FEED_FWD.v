/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : FEED_FWD.v
+ Abstract  : The forward pass logic implementation
+ Notes     : 

*/

/*
* Make sure to un-comment the include section if using an external compiler e.g. iverilog
*/
//`include "rtl/computation/LAYER.v"
//`include "rtl/computation/ACTIVATION_LUT.v"
//`include "rtl/storage/WEIGHTS_ROM.v"
//`include "rtl/storage/REG_BANK.v"

`default_nettype none

module FEED_FWD #(
  parameter BIT_WIDTH = 32,             // The floating point size in bits [MUST MATCH THE PREVIOUS LAYER BIT_WIDTH]
  parameter EXTRA_BITS = 2,             // Flopoco Floating point extra two bits. CAN ONLY have the values [0 OR 2]
  parameter LAYER1_NEURONS =  3,        // Number of neurons at the nonlinear layer
  parameter LAYER2_NEURONS = 2          // Number of neurons at the linear last layer
)
(
  input wire                                                  CLK,          // Sync. clock
  input wire                                                  WRITE_EN,     // Write enable coming from the control signal
  input wire                                                  ACC_EN,       // Accumulators enable signal for both layers
  output wire [(BIT_WIDTH + EXTRA_BITS)*LAYER2_NEURONS - 1:0] FWD_OUT       // The weight participating in the MACC operation
);

  // Internal wires assignment
  /*Not parameterized yet, MUST BE A GENERIC CODE*/
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] layer1_input;                         // Scaler layer1 input
  wire [BIT_WIDTH + EXTRA_BITS - 1:0] layer2_input;                         // Scaler layer2 input
  wire [(BIT_WIDTH + EXTRA_BITS)*LAYER1_NEURONS - 1:0] layer_1outputs;      // Vector layer1 accumulators output
  wire [(BIT_WIDTH + EXTRA_BITS)*LAYER2_NEURONS - 1:0] layer_2outputs;      // Vector layer1 accumulators output

  wire [(BIT_WIDTH + EXTRA_BITS)-1:0] neuron1_weights;
  wire [(BIT_WIDTH + EXTRA_BITS)-1:0] neuron2_weights;
  wire [(BIT_WIDTH + EXTRA_BITS)-1:0] neuron3_weights;
  wire [(BIT_WIDTH + EXTRA_BITS)-1:0] neuron4_weights;
  wire [(BIT_WIDTH + EXTRA_BITS)-1:0] neuron5_weights;
  wire [(BIT_WIDTH + EXTRA_BITS)-1:0] exp_lut_out;
  
  // Module instantiation
  /*sam7ony ya gma3a 3al code l 7aker da*/
  WEIGHTS_ROM #(.BIT_WIDTH(BIT_WIDTH), .EXTRA_BITS(EXTRA_BITS), .DEPTH(LAYER1_NEURONS)) layer1_neuron1(
    .CLK(CLK),
    .MEM_OUT(neuron1_weights)
  );

  WEIGHTS_ROM #(.BIT_WIDTH(BIT_WIDTH), .EXTRA_BITS(EXTRA_BITS), .DEPTH(LAYER1_NEURONS)) layer1_neuron2(
    .CLK(CLK),
    .MEM_OUT(neuron2_weights)
  );

  WEIGHTS_ROM #(.BIT_WIDTH(BIT_WIDTH), .EXTRA_BITS(EXTRA_BITS), .DEPTH(LAYER1_NEURONS)) layer1_neuron3(
    .CLK(CLK),
    .MEM_OUT(neuron3_weights)
  );

  WEIGHTS_ROM #(.BIT_WIDTH(BIT_WIDTH), .EXTRA_BITS(EXTRA_BITS), .DEPTH(LAYER1_NEURONS)) layer2_neuron1(
    .CLK(CLK),
    .MEM_OUT(neuron4_weights)
  );

  WEIGHTS_ROM #(.BIT_WIDTH(BIT_WIDTH), .EXTRA_BITS(EXTRA_BITS), .DEPTH(LAYER1_NEURONS)) layer2_neuron2(
    .CLK(CLK),
    .MEM_OUT(neuron5_weights)
  );


  LAYER #(.BIT_WIDTH(BIT_WIDTH), .EXTRA_BITS(EXTRA_BITS), .NUM_NEURONS(LAYER1_NEURONS)) nonlinear_layer(
    .INPUT_SCALER(layer1_input),
    .WEIGHT_VECTOR({neuron1_weights, neuron2_weights, neuron3_weights}),
    .CLK(CLK),
    .ACC_EN(ACC_EN),
    .ACC_RESULT(layer_1outputs)
  );

  ACTIVATION_LUT #(.BIT_WIDTH(BIT_WIDTH), .EXTRA_BITS(EXTRA_BITS), .DEPTH(LAYER1_NEURONS)) exp_lut(
    .INPUT_SCALER(layer_1outputs[33:0]),
    .CLK(CLK),
    .MEM_OUT(exp_lut_out)
  );


  REG_BANK #(.BIT_WIDTH(BIT_WIDTH), .EXTRA_BITS(EXTRA_BITS), .DEPTH(LAYER1_NEURONS)) layer1_output_buffer(
    .PREV_LAYER_ACC_RESULT({layer_1outputs[(BIT_WIDTH + EXTRA_BITS)*LAYER1_NEURONS - 1:34], exp_lut_out}),
    .CLK(CLK),
    .MEM_OUT(layer2_input)
  );

  LAYER #(.BIT_WIDTH(BIT_WIDTH), .EXTRA_BITS(EXTRA_BITS), .NUM_NEURONS(LAYER2_NEURONS)) linear_layer(
    .INPUT_SCALER(layer2_input),
    .WEIGHT_VECTOR({neuron4_weights, neuron5_weights}),
    .CLK(CLK), 
    .ACC_EN(ACC_EN),
    .ACC_RESULT(FWD_OUT)
  );

endmodule // FEED_FWD