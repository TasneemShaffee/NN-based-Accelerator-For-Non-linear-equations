/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : Floating point to fixed point convert
+ Abstract  : Required for using floating point as address in the LUT
+ Notes     : 
  - Combinatorial circuit
  - Bit width used to specify BOTH LUT input and LUT output, since the LUT input is constant for all the
    ALUs within a single layer
  - The final version is scalable and does not suffer range inaccuracies unlike FLOPOCO module
  - The 'case' statement can be replaced by an if; it is here since multiple case statement existed in the old code
    but this is not the case now so it can be replaced
*/

`default_nettype none

module FLOAT2FIX #(
  parameter BIT_WIDTH = 32,           // Bit width used for input float and LUT content
  parameter EXTRA_BITS = 2,           // Flopoco Floating point extra two bits. CAN ONLY have the values [0 OR 2]
  parameter WE = 8,                   // Floating point exponent number of bits
  parameter WF = 23,                  // Floating point mantissa number of bits
  parameter MSB = 4,                  // Fixed point left most significant weight  [+ve value]
  parameter LSB = -5)                 // Fixed point right most significant weight [-ve value]
(
  input wire  [BIT_WIDTH + EXTRA_BITS - 1:0] INPUT_SCALER,    // Float coming from the input FIFO to be evaluated 
  output reg [MSB - LSB:0]                   LUT_ADDRESS      // Value of LUT address
);

  // Internal wires, reg declaration area
  wire signed [WE-1:0] actual_exp;                  // Should represent the actual exponent value after subtracting the base
  wire signed [WE-1:0] fp_current_exp;              // The exponent stored in the FP number
  wire [WF-1:0] fp_current_mantissa;                // The mantissa stored in the FP number
  wire signed [WF-1+MSB+1:0] full_fixedpoint_val;   // The full fixed point value before shifting
  wire sign_bit;                                    // Floating point input +ve or -ve sign bit
  wire overflow_exp;                                // Flag for overflow
  wire underflow_exp;                               // Flag for underflow
  wire _special_case1;                              // Flag for approximating malformed range [-0.8, -0.5]
  reg [WF-1+MSB+1:0] full_fixedpoint_val_shifted;   // The full fixed point value after shifting
  reg [WE-2:0] base = (2<<(WE-2))-1;                // A constant holding the exponent base for the IEEE floating point representation
  //reg [$clog2(MSB-LSB+1)-1:0] shift_amount;         // Shift amount for the mantissa
  reg [4-1:0] shift_amount;
  reg _two_subtract;                                // Internal -1 subtracting flag

  // Internal wires assignment
  assign fp_current_exp = INPUT_SCALER[BIT_WIDTH - 2:BIT_WIDTH - WE-1];
  assign fp_current_mantissa = INPUT_SCALER[BIT_WIDTH - WE-2:0];
  assign sign_bit = INPUT_SCALER[BIT_WIDTH-1];
  assign full_fixedpoint_val = {{MSB{sign_bit&1'b0}}, 1'b1, fp_current_mantissa};
  assign actual_exp = fp_current_exp - base;

  // ---- conditions ----
  assign overflow_exp = (actual_exp > (MSB-LSB+1));                 // exponent value is much bigger than what the register can hold
  assign underflow_exp = (actual_exp < -(MSB-LSB+1));               // exponent value is very negative [other shift direction] that register cant hold
  assign _special_case1 = (&actual_exp == 1'b0 && sign_bit==1);     // zero base special case


  // Functional blocks
  always @(*) begin

    // Determine when to subtract 1 after the twos complement
    if (_special_case1||underflow_exp||overflow_exp)   // we dont have to do this for the case of zero exponent
      _two_subtract = 0;
    else
      _two_subtract = 1;

    case ({overflow_exp, underflow_exp})
      2'b10: begin                          // Overflow happened
        full_fixedpoint_val_shifted = {1'b0, {(WF-1+MSB+1){1'b1}}};
        shift_amount = 0;                   // Just to avoid latch effect
      end
      2'b01: begin
        full_fixedpoint_val_shifted = 0;
        shift_amount = 0;
      end
      default: begin                        // Normal scenario
        if (actual_exp[WE-1] == 0) begin    // Positive exponent; must shift left
          shift_amount = actual_exp;
          full_fixedpoint_val_shifted = (full_fixedpoint_val)<<shift_amount;
        end
        else begin                          // Negative exponent; must shift right
          shift_amount = -(actual_exp);
          full_fixedpoint_val_shifted = (full_fixedpoint_val)>>shift_amount;
        end
      end
    endcase

    // Handle the correct output based on the sign
    if(sign_bit)
      LUT_ADDRESS = -(full_fixedpoint_val_shifted[WF-1+MSB+1:WF-1+MSB+1-(MSB-LSB)])-(1&_two_subtract);
    else
      LUT_ADDRESS = full_fixedpoint_val_shifted[WF-1+MSB+1:WF-1+MSB+1-(MSB-LSB)];

  end

endmodule // FLOAT2FIX
