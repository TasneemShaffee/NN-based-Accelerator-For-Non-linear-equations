/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : ALU
+ Abstract  : The implementation of matrix-vector dot product by multiply-accumulate process
+ Notes     : 
  - Clearing accumulator is done by disabling the [ACC_EN] signal, this DOES NOT require an extra cycle to take effect
  - Setting the parameter [EXTRA_BITS] to 0 will instantiate the adder and multiplier and set the extra bits
    of their inputs to `2'b01` assuming that the coming value is not a special value.
*/

`default_nettype none
/*
* Make sure to un-comment the include section if using an external compiler e.g. iverilog
*/
// ALU flopoco primitives directory. Should be changed whenever the flopoco primitives are changed
`include "definitions.v"
/*
`ifdef iverilog_comp
`include "rtl/flopoco/FPmul_nonpipe.v"    // using the non-pipelined 32-bit FLOPOCO multiplier
`include "rtl/flopoco/FPAdder_nonpipe.v"  // using the non-pipelined 32-bit FLOPOCO adder
`endif
*/
module ALU #(
  parameter BIT_WIDTH = 32,       // The floating point size in bits
  parameter EXTRA_BITS = 2)       // Flopoco Floating point extra two bits. CAN ONLY have the values [0 OR 2]
(
  input wire [BIT_WIDTH + EXTRA_BITS - 1:0] WEIGHT_SCALER,      // Float weight scaler coming from the weight ROM
  input wire [BIT_WIDTH + EXTRA_BITS - 1:0] INPUT_SCALER,       // Float net scaler coming from the input FIFO
  input wire                                CLK,                // For sync. the adder output
  input wire                                ACC_EN,             // Enables the adder unit to accumulate the previous value
  input wire                                RESET,              // Accumulator register clear [might be omitted in future]
  output reg [BIT_WIDTH + EXTRA_BITS - 1:0] ACC_RESULT          // Sync. multiply-accumulate output. Activated when HIGH
);
	
  // Internal wires, reg declaration area
	reg  [BIT_WIDTH + EXTRA_BITS - 1:0] accumulator;
	wire [BIT_WIDTH + 2 - 1:0] acc_rhs;
	wire [BIT_WIDTH + 2 - 1:0] adder_out;
	wire [BIT_WIDTH + 2 - 1:0] mul_out;

  // Internal wires assignment
	assign acc_rhs = {1'b0, ACC_EN&(~RESET)&ACC_RESULT[BIT_WIDTH], ACC_RESULT[BIT_WIDTH + 2 - 3:0]};
  
  // local parameters
	localparam m = 1&&(~EXTRA_BITS[1]);			// Local multiplicative constant for handling the case of no extra bits
  
  // Internal modules instantiation
  //  + multiplication unit
	FPmul_nonpipe MULTIPLIER_UNIT(
		.X({{m{2'b01}}, {~m{WEIGHT_SCALER[BIT_WIDTH + EXTRA_BITS - 1 : BIT_WIDTH + EXTRA_BITS - 2]}}, WEIGHT_SCALER[BIT_WIDTH -1 : 0]}),
		.Y({{m{2'b01}}, {~m{INPUT_SCALER[BIT_WIDTH + EXTRA_BITS - 1 : BIT_WIDTH + EXTRA_BITS - 2]}}, INPUT_SCALER[BIT_WIDTH -1 : 0]}),
		.R({mul_out})
		);

  //  + Accumulator unit
	FPAdder_nonpipe ACC_UNIT(
		.X(mul_out),
		.Y(acc_rhs),
		.R(adder_out)
		);

  // Functional blocks
	always @(posedge CLK) begin
		if (RESET) begin
			ACC_RESULT <= 0;
		end
		else begin
			ACC_RESULT <= adder_out;
		end
	end

endmodule // ALU
