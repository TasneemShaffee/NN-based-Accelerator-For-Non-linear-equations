/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : Floating point divider GENERATED BY FLOPOCO [name: mat_vect_fdiv_32nibs]
+ Abstract  : The implementation of a floating point multiplier using a pipelined circuit of LATENCY: 12
+ Notes     : 
  - THE MODULE DOES USE THE FLOPOCO FORMAT; but does not require the extra 2 bits of FLOPOCO. The special case of flopoco extra-bits
    are handled by some logic at the module output
  - The <ID> parameter is only used for debugging purposes and also is required by all the other modules containing this one. Its value
    has no effect on the module implementation
  - The <din<i>_WIDTH> parameters specify the width of all the operands. Since we are using a FULL floating point number
    they are set to 32-bits by default
  - The <NUM_STAGE> parameter has no effect on the module specification. For documentation purposes it indicates this instance
    of the multiplier is not pipelined
*/
// File results//SelFunctionTable_r8_F400_uid4.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
// vhd2vl settings:
//  * Verilog Module Declaration Style: 2001

// vhd2vl is Free (libre) Software:
//   Copyright (C) 2001 Vincenzo Liguori - Ocean Logic Pty Ltd
//     http://www.ocean-logic.com
//   Modifications Copyright (C) 2006 Mark Gonzales - PMC Sierra Inc
//   Modifications (C) 2010 Shankar Giri
//   Modifications Copyright (C) 2002-2017 Larry Doolittle
//     http://doolittle.icarus.com/~larry/vhd2vl/
//   Modifications (C) 2017 Rodrigo A. Melo
//
//   vhd2vl comes with ABSOLUTELY NO WARRANTY.  Always check the resulting
//   Verilog for correctness, ideally with a formal verification tool.
//
//   You are welcome to redistribute vhd2vl under certain conditions.
//   See the license (GPLv2) file included with the source for details.

// The result of translation follows.  Its copyright status should be
// considered unchanged from the original VHDL.

//------------------------------------------------------------------------------
//                       SelFunctionTable_r8_F400_uid4
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Maxime Christ, Florent de Dinechin (2015)
//------------------------------------------------------------------------------
// no timescale needed

module SelFunctionTable_r8_F400_uid4(
input wire clk,
input wire rst,
input wire ce,
input wire [6:0] X,
output wire [3:0] Y
);




reg [3:0] TableOut;

  always @(posedge clk) begin
    if(ce == 1'b1) begin
    end
  end

  always @(*) begin
    case(X)
      7'b0000000 : TableOut <= 4'b0000;
      7'b0000001 : TableOut <= 4'b0000;
      7'b0000010 : TableOut <= 4'b0000;
      7'b0000011 : TableOut <= 4'b0000;
      7'b0000100 : TableOut <= 4'b0001;
      7'b0000101 : TableOut <= 4'b0001;
      7'b0000110 : TableOut <= 4'b0001;
      7'b0000111 : TableOut <= 4'b0001;
      7'b0001000 : TableOut <= 4'b0001;
      7'b0001001 : TableOut <= 4'b0001;
      7'b0001010 : TableOut <= 4'b0001;
      7'b0001011 : TableOut <= 4'b0001;
      7'b0001100 : TableOut <= 4'b0010;
      7'b0001101 : TableOut <= 4'b0010;
      7'b0001110 : TableOut <= 4'b0010;
      7'b0001111 : TableOut <= 4'b0010;
      7'b0010000 : TableOut <= 4'b0011;
      7'b0010001 : TableOut <= 4'b0011;
      7'b0010010 : TableOut <= 4'b0010;
      7'b0010011 : TableOut <= 4'b0010;
      7'b0010100 : TableOut <= 4'b0011;
      7'b0010101 : TableOut <= 4'b0011;
      7'b0010110 : TableOut <= 4'b0011;
      7'b0010111 : TableOut <= 4'b0011;
      7'b0011000 : TableOut <= 4'b0100;
      7'b0011001 : TableOut <= 4'b0100;
      7'b0011010 : TableOut <= 4'b0011;
      7'b0011011 : TableOut <= 4'b0011;
      7'b0011100 : TableOut <= 4'b0101;
      7'b0011101 : TableOut <= 4'b0100;
      7'b0011110 : TableOut <= 4'b0100;
      7'b0011111 : TableOut <= 4'b0100;
      7'b0100000 : TableOut <= 4'b0101;
      7'b0100001 : TableOut <= 4'b0101;
      7'b0100010 : TableOut <= 4'b0101;
      7'b0100011 : TableOut <= 4'b0100;
      7'b0100100 : TableOut <= 4'b0110;
      7'b0100101 : TableOut <= 4'b0110;
      7'b0100110 : TableOut <= 4'b0101;
      7'b0100111 : TableOut <= 4'b0101;
      7'b0101000 : TableOut <= 4'b0111;
      7'b0101001 : TableOut <= 4'b0110;
      7'b0101010 : TableOut <= 4'b0110;
      7'b0101011 : TableOut <= 4'b0101;
      7'b0101100 : TableOut <= 4'b0111;
      7'b0101101 : TableOut <= 4'b0111;
      7'b0101110 : TableOut <= 4'b0110;
      7'b0101111 : TableOut <= 4'b0110;
      7'b0110000 : TableOut <= 4'b0111;
      7'b0110001 : TableOut <= 4'b0111;
      7'b0110010 : TableOut <= 4'b0111;
      7'b0110011 : TableOut <= 4'b0110;
      7'b0110100 : TableOut <= 4'b0111;
      7'b0110101 : TableOut <= 4'b0111;
      7'b0110110 : TableOut <= 4'b0111;
      7'b0110111 : TableOut <= 4'b0111;
      7'b0111000 : TableOut <= 4'b0111;
      7'b0111001 : TableOut <= 4'b0111;
      7'b0111010 : TableOut <= 4'b0111;
      7'b0111011 : TableOut <= 4'b0111;
      7'b0111100 : TableOut <= 4'b0111;
      7'b0111101 : TableOut <= 4'b0111;
      7'b0111110 : TableOut <= 4'b0111;
      7'b0111111 : TableOut <= 4'b0111;
      7'b1000000 : TableOut <= 4'b1001;
      7'b1000001 : TableOut <= 4'b1001;
      7'b1000010 : TableOut <= 4'b1001;
      7'b1000011 : TableOut <= 4'b1001;
      7'b1000100 : TableOut <= 4'b1001;
      7'b1000101 : TableOut <= 4'b1001;
      7'b1000110 : TableOut <= 4'b1001;
      7'b1000111 : TableOut <= 4'b1001;
      7'b1001000 : TableOut <= 4'b1001;
      7'b1001001 : TableOut <= 4'b1001;
      7'b1001010 : TableOut <= 4'b1001;
      7'b1001011 : TableOut <= 4'b1001;
      7'b1001100 : TableOut <= 4'b1001;
      7'b1001101 : TableOut <= 4'b1001;
      7'b1001110 : TableOut <= 4'b1001;
      7'b1001111 : TableOut <= 4'b1001;
      7'b1010000 : TableOut <= 4'b1001;
      7'b1010001 : TableOut <= 4'b1001;
      7'b1010010 : TableOut <= 4'b1010;
      7'b1010011 : TableOut <= 4'b1010;
      7'b1010100 : TableOut <= 4'b1001;
      7'b1010101 : TableOut <= 4'b1010;
      7'b1010110 : TableOut <= 4'b1010;
      7'b1010111 : TableOut <= 4'b1010;
      7'b1011000 : TableOut <= 4'b1010;
      7'b1011001 : TableOut <= 4'b1010;
      7'b1011010 : TableOut <= 4'b1011;
      7'b1011011 : TableOut <= 4'b1011;
      7'b1011100 : TableOut <= 4'b1011;
      7'b1011101 : TableOut <= 4'b1011;
      7'b1011110 : TableOut <= 4'b1011;
      7'b1011111 : TableOut <= 4'b1011;
      7'b1100000 : TableOut <= 4'b1011;
      7'b1100001 : TableOut <= 4'b1011;
      7'b1100010 : TableOut <= 4'b1100;
      7'b1100011 : TableOut <= 4'b1100;
      7'b1100100 : TableOut <= 4'b1100;
      7'b1100101 : TableOut <= 4'b1100;
      7'b1100110 : TableOut <= 4'b1100;
      7'b1100111 : TableOut <= 4'b1100;
      7'b1101000 : TableOut <= 4'b1100;
      7'b1101001 : TableOut <= 4'b1101;
      7'b1101010 : TableOut <= 4'b1101;
      7'b1101011 : TableOut <= 4'b1101;
      7'b1101100 : TableOut <= 4'b1101;
      7'b1101101 : TableOut <= 4'b1101;
      7'b1101110 : TableOut <= 4'b1101;
      7'b1101111 : TableOut <= 4'b1101;
      7'b1110000 : TableOut <= 4'b1110;
      7'b1110001 : TableOut <= 4'b1110;
      7'b1110010 : TableOut <= 4'b1110;
      7'b1110011 : TableOut <= 4'b1110;
      7'b1110100 : TableOut <= 4'b1110;
      7'b1110101 : TableOut <= 4'b1110;
      7'b1110110 : TableOut <= 4'b1110;
      7'b1110111 : TableOut <= 4'b1110;
      7'b1111000 : TableOut <= 4'b1111;
      7'b1111001 : TableOut <= 4'b1111;
      7'b1111010 : TableOut <= 4'b1111;
      7'b1111011 : TableOut <= 4'b1111;
      7'b1111100 : TableOut <= 4'b1111;
      7'b1111101 : TableOut <= 4'b1111;
      7'b1111110 : TableOut <= 4'b1111;
      7'b1111111 : TableOut <= 4'b1111;
      default : TableOut <= 4'b0000;
    endcase
  end

  assign Y = TableOut;

endmodule
// File results//mat_vect_fdiv_32nibs.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
// vhd2vl settings:
//  * Verilog Module Declaration Style: 2001

// vhd2vl is Free (libre) Software:
//   Copyright (C) 2001 Vincenzo Liguori - Ocean Logic Pty Ltd
//     http://www.ocean-logic.com
//   Modifications Copyright (C) 2006 Mark Gonzales - PMC Sierra Inc
//   Modifications (C) 2010 Shankar Giri
//   Modifications Copyright (C) 2002-2017 Larry Doolittle
//     http://doolittle.icarus.com/~larry/vhd2vl/
//   Modifications (C) 2017 Rodrigo A. Melo
//
//   vhd2vl comes with ABSOLUTELY NO WARRANTY.  Always check the resulting
//   Verilog for correctness, ideally with a formal verification tool.
//
//   You are welcome to redistribute vhd2vl under certain conditions.
//   See the license (GPLv2) file included with the source for details.

// The result of translation follows.  Its copyright status should be
// considered unchanged from the original VHDL.

//------------------------------------------------------------------------------
//                            mat_vect_fdiv_32nibs
//                           (FPDiv_8_23_F400_uid2)
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Maxime Christ, Florent de Dinechin (2015)
//------------------------------------------------------------------------------
// Pipeline depth: 12 cycles
// no timescale needed

module mat_vect_fdiv_32nibs
#(
  parameter ID = 23,
  parameter NUM_STAGE=13,
  parameter din0_WIDTH=32,
  parameter din1_WIDTH=32,
  parameter dout_WIDTH=32
)(
input wire clk,
input wire reset,
input wire ce,
input wire [8 + 23:0] din0,
input wire [8 + 23:0] din1,
output wire [8 + 23:0] dout
);

// our addition
wire [8 + 23 + 2:0] X;
wire [8 + 23 + 2:0] Y;
wire [8 + 23 + 2:0] R;
wire rst;
// fake assignments to follow the API input format
assign X = {1'b0, |din0, din0};
assign Y = {1'b0, |din1, din1};
assign rst = reset;
// the next assignment must be made for flopoco
assign dout = (R[32]==1'b0) ? 32'b0:R[31:0];
//


wire [23:0] partialFX;
wire [23:0] partialFY;
wire [9:0] expR0; reg [9:0] expR0_d1; reg [9:0] expR0_d2; reg [9:0] expR0_d3; reg [9:0] expR0_d4; reg [9:0] expR0_d5; reg [9:0] expR0_d6; reg [9:0] expR0_d7; reg [9:0] expR0_d8; reg [9:0] expR0_d9; reg [9:0] expR0_d10; reg [9:0] expR0_d11;
wire sR; reg sR_d1; reg sR_d2; reg sR_d3; reg sR_d4; reg sR_d5; reg sR_d6; reg sR_d7; reg sR_d8; reg sR_d9; reg sR_d10; reg sR_d11; reg sR_d12;
wire [3:0] exnXY;
reg [1:0] exnR0; reg [1:0] exnR0_d1; reg [1:0] exnR0_d2; reg [1:0] exnR0_d3; reg [1:0] exnR0_d4; reg [1:0] exnR0_d5; reg [1:0] exnR0_d6; reg [1:0] exnR0_d7; reg [1:0] exnR0_d8; reg [1:0] exnR0_d9; reg [1:0] exnR0_d10; reg [1:0] exnR0_d11; reg [1:0] exnR0_d12;
reg [25:0] fY; reg [25:0] fY_d1; reg [25:0] fY_d2; reg [25:0] fY_d3; reg [25:0] fY_d4; reg [25:0] fY_d5; reg [25:0] fY_d6; reg [25:0] fY_d7; reg [25:0] fY_d8; reg [25:0] fY_d9;
reg [26:0] fX;
wire [28:0] w9; reg [28:0] w9_d1;
wire [6:0] sel9;
wire [3:0] q9; reg [3:0] q9_d1; reg [3:0] q9_d2; reg [3:0] q9_d3; reg [3:0] q9_d4; reg [3:0] q9_d5; reg [3:0] q9_d6; reg [3:0] q9_d7; reg [3:0] q9_d8; reg [3:0] q9_d9;
wire [29:0] w9pad;
reg [29:0] w8fulla;
reg [29:0] fYdec8;
reg [29:0] w8full;
wire [28:0] w8; reg [28:0] w8_d1;
wire [6:0] sel8;
wire [3:0] q8; reg [3:0] q8_d1; reg [3:0] q8_d2; reg [3:0] q8_d3; reg [3:0] q8_d4; reg [3:0] q8_d5; reg [3:0] q8_d6; reg [3:0] q8_d7; reg [3:0] q8_d8;
wire [29:0] w8pad;
reg [29:0] w7fulla;
reg [29:0] fYdec7;
reg [29:0] w7full;
wire [28:0] w7; reg [28:0] w7_d1;
wire [6:0] sel7;
wire [3:0] q7; reg [3:0] q7_d1; reg [3:0] q7_d2; reg [3:0] q7_d3; reg [3:0] q7_d4; reg [3:0] q7_d5; reg [3:0] q7_d6; reg [3:0] q7_d7;
wire [29:0] w7pad;
reg [29:0] w6fulla;
reg [29:0] fYdec6;
reg [29:0] w6full;
wire [28:0] w6; reg [28:0] w6_d1;
wire [6:0] sel6;
wire [3:0] q6; reg [3:0] q6_d1; reg [3:0] q6_d2; reg [3:0] q6_d3; reg [3:0] q6_d4; reg [3:0] q6_d5; reg [3:0] q6_d6;
wire [29:0] w6pad;
reg [29:0] w5fulla;
reg [29:0] fYdec5;
reg [29:0] w5full;
wire [28:0] w5; reg [28:0] w5_d1;
wire [6:0] sel5;
wire [3:0] q5; reg [3:0] q5_d1; reg [3:0] q5_d2; reg [3:0] q5_d3; reg [3:0] q5_d4; reg [3:0] q5_d5;
wire [29:0] w5pad;
reg [29:0] w4fulla;
reg [29:0] fYdec4;
reg [29:0] w4full;
wire [28:0] w4; reg [28:0] w4_d1;
wire [6:0] sel4;
wire [3:0] q4; reg [3:0] q4_d1; reg [3:0] q4_d2; reg [3:0] q4_d3; reg [3:0] q4_d4;
wire [29:0] w4pad;
reg [29:0] w3fulla;
reg [29:0] fYdec3;
reg [29:0] w3full;
wire [28:0] w3; reg [28:0] w3_d1;
wire [6:0] sel3;
wire [3:0] q3; reg [3:0] q3_d1; reg [3:0] q3_d2; reg [3:0] q3_d3;
wire [29:0] w3pad;
reg [29:0] w2fulla;
reg [29:0] fYdec2;
reg [29:0] w2full;
wire [28:0] w2; reg [28:0] w2_d1;
wire [6:0] sel2;
wire [3:0] q2; reg [3:0] q2_d1; reg [3:0] q2_d2;
wire [29:0] w2pad;
reg [29:0] w1fulla;
reg [29:0] fYdec1;
reg [29:0] w1full;
wire [28:0] w1; reg [28:0] w1_d1;
wire [6:0] sel1;
wire [3:0] q1; reg [3:0] q1_d1;
wire [29:0] w1pad;
reg [29:0] w0fulla;
reg [29:0] fYdec0;
reg [29:0] w0full;
wire [28:0] w0; reg [28:0] w0_d1;
wire [3:0] q0;
wire [2:0] qP9;
wire [2:0] qM9;
wire [2:0] qP8;
wire [2:0] qM8;
wire [2:0] qP7;
wire [2:0] qM7;
wire [2:0] qP6;
wire [2:0] qM6;
wire [2:0] qP5;
wire [2:0] qM5;
wire [2:0] qP4;
wire [2:0] qM4;
wire [2:0] qP3;
wire [2:0] qM3;
wire [2:0] qP2;
wire [2:0] qM2;
wire [2:0] qP1;
wire [2:0] qM1;
wire [2:0] qP0;
wire [2:0] qM0;
wire [29:0] qP;
wire [29:0] qM;
wire [29:0] fR0; reg [29:0] fR0_d1;
wire [28:0] fR;
reg [26:0] fRn1; reg [26:0] fRn1_d1;
wire [9:0] expR1; reg [9:0] expR1_d1;
wire round; reg round_d1;
wire [32:0] expfrac;
wire [32:0] expfracR;
wire [1:0] exnR;
reg [1:0] exnRfinal;

  always @(posedge clk) begin
    if(ce == 1'b1) begin
      expR0_d1 <= expR0;
      expR0_d2 <= expR0_d1;
      expR0_d3 <= expR0_d2;
      expR0_d4 <= expR0_d3;
      expR0_d5 <= expR0_d4;
      expR0_d6 <= expR0_d5;
      expR0_d7 <= expR0_d6;
      expR0_d8 <= expR0_d7;
      expR0_d9 <= expR0_d8;
      expR0_d10 <= expR0_d9;
      expR0_d11 <= expR0_d10;
      sR_d1 <= sR;
      sR_d2 <= sR_d1;
      sR_d3 <= sR_d2;
      sR_d4 <= sR_d3;
      sR_d5 <= sR_d4;
      sR_d6 <= sR_d5;
      sR_d7 <= sR_d6;
      sR_d8 <= sR_d7;
      sR_d9 <= sR_d8;
      sR_d10 <= sR_d9;
      sR_d11 <= sR_d10;
      sR_d12 <= sR_d11;
      exnR0_d1 <= exnR0;
      exnR0_d2 <= exnR0_d1;
      exnR0_d3 <= exnR0_d2;
      exnR0_d4 <= exnR0_d3;
      exnR0_d5 <= exnR0_d4;
      exnR0_d6 <= exnR0_d5;
      exnR0_d7 <= exnR0_d6;
      exnR0_d8 <= exnR0_d7;
      exnR0_d9 <= exnR0_d8;
      exnR0_d10 <= exnR0_d9;
      exnR0_d11 <= exnR0_d10;
      exnR0_d12 <= exnR0_d11;
      fY_d1 <= fY;
      fY_d2 <= fY_d1;
      fY_d3 <= fY_d2;
      fY_d4 <= fY_d3;
      fY_d5 <= fY_d4;
      fY_d6 <= fY_d5;
      fY_d7 <= fY_d6;
      fY_d8 <= fY_d7;
      fY_d9 <= fY_d8;
      w9_d1 <= w9;
      q9_d1 <= q9;
      q9_d2 <= q9_d1;
      q9_d3 <= q9_d2;
      q9_d4 <= q9_d3;
      q9_d5 <= q9_d4;
      q9_d6 <= q9_d5;
      q9_d7 <= q9_d6;
      q9_d8 <= q9_d7;
      q9_d9 <= q9_d8;
      w8_d1 <= w8;
      q8_d1 <= q8;
      q8_d2 <= q8_d1;
      q8_d3 <= q8_d2;
      q8_d4 <= q8_d3;
      q8_d5 <= q8_d4;
      q8_d6 <= q8_d5;
      q8_d7 <= q8_d6;
      q8_d8 <= q8_d7;
      w7_d1 <= w7;
      q7_d1 <= q7;
      q7_d2 <= q7_d1;
      q7_d3 <= q7_d2;
      q7_d4 <= q7_d3;
      q7_d5 <= q7_d4;
      q7_d6 <= q7_d5;
      q7_d7 <= q7_d6;
      w6_d1 <= w6;
      q6_d1 <= q6;
      q6_d2 <= q6_d1;
      q6_d3 <= q6_d2;
      q6_d4 <= q6_d3;
      q6_d5 <= q6_d4;
      q6_d6 <= q6_d5;
      w5_d1 <= w5;
      q5_d1 <= q5;
      q5_d2 <= q5_d1;
      q5_d3 <= q5_d2;
      q5_d4 <= q5_d3;
      q5_d5 <= q5_d4;
      w4_d1 <= w4;
      q4_d1 <= q4;
      q4_d2 <= q4_d1;
      q4_d3 <= q4_d2;
      q4_d4 <= q4_d3;
      w3_d1 <= w3;
      q3_d1 <= q3;
      q3_d2 <= q3_d1;
      q3_d3 <= q3_d2;
      w2_d1 <= w2;
      q2_d1 <= q2;
      q2_d2 <= q2_d1;
      w1_d1 <= w1;
      q1_d1 <= q1;
      w0_d1 <= w0;
      fR0_d1 <= fR0;
      fRn1_d1 <= fRn1;
      expR1_d1 <= expR1;
      round_d1 <= round;
    end
  end

  assign partialFX = {1'b1,X[22:0]};
  assign partialFY = {1'b1,Y[22:0]};
  // exponent difference, sign and exception combination computed early, to have less bits to pipeline
  assign expR0 = ({2'b00,X[30:23]}) - ({2'b00,Y[30:23]});
  assign sR = X[31] ^ Y[31];
  // early exception handling 
  assign exnXY = {X[33:32],Y[33:32]};
  always @(*) begin
    case(exnXY)
      4'b0101 : exnR0 <= 2'b01;
  // normal
      4'b0001,4'b0010,4'b0110 : exnR0 <= 2'b00;
  // zero
      4'b0100,4'b1000,4'b1001 : exnR0 <= 2'b10;
  // overflow
      default : exnR0 <= 2'b11;
    endcase
  end

  // NaN
  // Prescaling
  always @(*) begin
    case(partialFY[22:21])
      2'b00 : fY <= ({1'b0,partialFY,1'b0}) + ({partialFY,2'b00});
      2'b01 : fY <= ({2'b00,partialFY}) + ({partialFY,2'b00});
      default : fY <= {partialFY,2'b00};
    endcase
  end

  always @(*) begin
    case(partialFY[22:21])
      2'b00 : fX <= ({2'b00,partialFX,1'b0}) + ({1'b0,partialFX,2'b00});
      2'b01 : fX <= ({3'b000,partialFX}) + ({1'b0,partialFX,2'b00});
      default : fX <= {1'b0,partialFX,2'b00};
    endcase
  end

  assign w9 = {2'b00,fX};
  //--------------Synchro barrier, entering cycle 1----------------
  assign sel9 = {w9_d1[28:24],fY_d1[23:22]};
  SelFunctionTable_r8_F400_uid4 SelFunctionTable9(
      .clk(clk),
    .rst(rst),
    .ce(ce),
    .X(sel9),
    .Y(q9));

  assign w9pad = {w9_d1,1'b0};
  always @(*) begin
    case(q9[1:0])
      2'b01 : w8fulla <= w9pad - ({4'b0000,fY_d1});
      2'b11 : w8fulla <= w9pad + ({4'b0000,fY_d1});
      2'b10 : w8fulla <= w9pad + ({3'b000,fY_d1,1'b0});
      default : w8fulla <= w9pad;
    endcase
  end

  always @(*) begin
    case(q9[3:1])
      3'b001,3'b010,3'b110,3'b101 : fYdec8 <= {2'b00,fY_d1,2'b00};
      3'b011,3'b100 : fYdec8 <= {1'b0,fY_d1,3'b000};
      default : fYdec8 <= 30'b000000000000000000000000000000;
    endcase
  end

  always @(*) begin
    case(q9[3])
      1'b0 : w8full <= w8fulla - fYdec8;
      default : w8full <= w8fulla + fYdec8;
    endcase
  end

  assign w8 = {w8full[26:0],2'b00};
  //--------------Synchro barrier, entering cycle 2----------------
  assign sel8 = {w8_d1[28:24],fY_d2[23:22]};
  SelFunctionTable_r8_F400_uid4 SelFunctionTable8(
      .clk(clk),
    .rst(rst),
    .ce(ce),
    .X(sel8),
    .Y(q8));

  assign w8pad = {w8_d1,1'b0};
  always @(*) begin
    case(q8[1:0])
      2'b01 : w7fulla <= w8pad - ({4'b0000,fY_d2});
      2'b11 : w7fulla <= w8pad + ({4'b0000,fY_d2});
      2'b10 : w7fulla <= w8pad + ({3'b000,fY_d2,1'b0});
      default : w7fulla <= w8pad;
    endcase
  end

  always @(*) begin
    case(q8[3:1])
      3'b001,3'b010,3'b110,3'b101 : fYdec7 <= {2'b00,fY_d2,2'b00};
      3'b011,3'b100 : fYdec7 <= {1'b0,fY_d2,3'b000};
      default : fYdec7 <= 30'b000000000000000000000000000000;
    endcase
  end

  always @(*) begin
    case(q8[3])
      1'b0 : w7full <= w7fulla - fYdec7;
      default : w7full <= w7fulla + fYdec7;
    endcase
  end

  assign w7 = {w7full[26:0],2'b00};
  //--------------Synchro barrier, entering cycle 3----------------
  assign sel7 = {w7_d1[28:24],fY_d3[23:22]};
  SelFunctionTable_r8_F400_uid4 SelFunctionTable7(
      .clk(clk),
    .rst(rst),
    .ce(ce),
    .X(sel7),
    .Y(q7));

  assign w7pad = {w7_d1,1'b0};
  always @(*) begin
    case(q7[1:0])
      2'b01 : w6fulla <= w7pad - ({4'b0000,fY_d3});
      2'b11 : w6fulla <= w7pad + ({4'b0000,fY_d3});
      2'b10 : w6fulla <= w7pad + ({3'b000,fY_d3,1'b0});
      default : w6fulla <= w7pad;
    endcase
  end

  always @(*) begin
    case(q7[3:1])
      3'b001,3'b010,3'b110,3'b101 : fYdec6 <= {2'b00,fY_d3,2'b00};
      3'b011,3'b100 : fYdec6 <= {1'b0,fY_d3,3'b000};
      default : fYdec6 <= 30'b000000000000000000000000000000;
    endcase
  end

  always @(*) begin
    case(q7[3])
      1'b0 : w6full <= w6fulla - fYdec6;
      default : w6full <= w6fulla + fYdec6;
    endcase
  end

  assign w6 = {w6full[26:0],2'b00};
  //--------------Synchro barrier, entering cycle 4----------------
  assign sel6 = {w6_d1[28:24],fY_d4[23:22]};
  SelFunctionTable_r8_F400_uid4 SelFunctionTable6(
      .clk(clk),
    .rst(rst),
    .ce(ce),
    .X(sel6),
    .Y(q6));

  assign w6pad = {w6_d1,1'b0};
  always @(*) begin
    case(q6[1:0])
      2'b01 : w5fulla <= w6pad - ({4'b0000,fY_d4});
      2'b11 : w5fulla <= w6pad + ({4'b0000,fY_d4});
      2'b10 : w5fulla <= w6pad + ({3'b000,fY_d4,1'b0});
      default : w5fulla <= w6pad;
    endcase
  end

  always @(*) begin
    case(q6[3:1])
      3'b001,3'b010,3'b110,3'b101 : fYdec5 <= {2'b00,fY_d4,2'b00};
      3'b011,3'b100 : fYdec5 <= {1'b0,fY_d4,3'b000};
      default : fYdec5 <= 30'b000000000000000000000000000000;
    endcase
  end

  always @(*) begin
    case(q6[3])
      1'b0 : w5full <= w5fulla - fYdec5;
      default : w5full <= w5fulla + fYdec5;
    endcase
  end

  assign w5 = {w5full[26:0],2'b00};
  //--------------Synchro barrier, entering cycle 5----------------
  assign sel5 = {w5_d1[28:24],fY_d5[23:22]};
  SelFunctionTable_r8_F400_uid4 SelFunctionTable5(
      .clk(clk),
    .rst(rst),
    .ce(ce),
    .X(sel5),
    .Y(q5));

  assign w5pad = {w5_d1,1'b0};
  always @(*) begin
    case(q5[1:0])
      2'b01 : w4fulla <= w5pad - ({4'b0000,fY_d5});
      2'b11 : w4fulla <= w5pad + ({4'b0000,fY_d5});
      2'b10 : w4fulla <= w5pad + ({3'b000,fY_d5,1'b0});
      default : w4fulla <= w5pad;
    endcase
  end

  always @(*) begin
    case(q5[3:1])
      3'b001,3'b010,3'b110,3'b101 : fYdec4 <= {2'b00,fY_d5,2'b00};
      3'b011,3'b100 : fYdec4 <= {1'b0,fY_d5,3'b000};
      default : fYdec4 <= 30'b000000000000000000000000000000;
    endcase
  end

  always @(*) begin
    case(q5[3])
      1'b0 : w4full <= w4fulla - fYdec4;
      default : w4full <= w4fulla + fYdec4;
    endcase
  end

  assign w4 = {w4full[26:0],2'b00};
  //--------------Synchro barrier, entering cycle 6----------------
  assign sel4 = {w4_d1[28:24],fY_d6[23:22]};
  SelFunctionTable_r8_F400_uid4 SelFunctionTable4(
      .clk(clk),
    .rst(rst),
    .ce(ce),
    .X(sel4),
    .Y(q4));

  assign w4pad = {w4_d1,1'b0};
  always @(*) begin
    case(q4[1:0])
      2'b01 : w3fulla <= w4pad - ({4'b0000,fY_d6});
      2'b11 : w3fulla <= w4pad + ({4'b0000,fY_d6});
      2'b10 : w3fulla <= w4pad + ({3'b000,fY_d6,1'b0});
      default : w3fulla <= w4pad;
    endcase
  end

  always @(*) begin
    case(q4[3:1])
      3'b001,3'b010,3'b110,3'b101 : fYdec3 <= {2'b00,fY_d6,2'b00};
      3'b011,3'b100 : fYdec3 <= {1'b0,fY_d6,3'b000};
      default : fYdec3 <= 30'b000000000000000000000000000000;
    endcase
  end

  always @(*) begin
    case(q4[3])
      1'b0 : w3full <= w3fulla - fYdec3;
      default : w3full <= w3fulla + fYdec3;
    endcase
  end

  assign w3 = {w3full[26:0],2'b00};
  //--------------Synchro barrier, entering cycle 7----------------
  assign sel3 = {w3_d1[28:24],fY_d7[23:22]};
  SelFunctionTable_r8_F400_uid4 SelFunctionTable3(
      .clk(clk),
    .rst(rst),
    .ce(ce),
    .X(sel3),
    .Y(q3));

  assign w3pad = {w3_d1,1'b0};
  always @(*) begin
    case(q3[1:0])
      2'b01 : w2fulla <= w3pad - ({4'b0000,fY_d7});
      2'b11 : w2fulla <= w3pad + ({4'b0000,fY_d7});
      2'b10 : w2fulla <= w3pad + ({3'b000,fY_d7,1'b0});
      default : w2fulla <= w3pad;
    endcase
  end

  always @(*) begin
    case(q3[3:1])
      3'b001,3'b010,3'b110,3'b101 : fYdec2 <= {2'b00,fY_d7,2'b00};
      3'b011,3'b100 : fYdec2 <= {1'b0,fY_d7,3'b000};
      default : fYdec2 <= 30'b000000000000000000000000000000;
    endcase
  end

  always @(*) begin
    case(q3[3])
      1'b0 : w2full <= w2fulla - fYdec2;
      default : w2full <= w2fulla + fYdec2;
    endcase
  end

  assign w2 = {w2full[26:0],2'b00};
  //--------------Synchro barrier, entering cycle 8----------------
  assign sel2 = {w2_d1[28:24],fY_d8[23:22]};
  SelFunctionTable_r8_F400_uid4 SelFunctionTable2(
      .clk(clk),
    .rst(rst),
    .ce(ce),
    .X(sel2),
    .Y(q2));

  assign w2pad = {w2_d1,1'b0};
  always @(*) begin
    case(q2[1:0])
      2'b01 : w1fulla <= w2pad - ({4'b0000,fY_d8});
      2'b11 : w1fulla <= w2pad + ({4'b0000,fY_d8});
      2'b10 : w1fulla <= w2pad + ({3'b000,fY_d8,1'b0});
      default : w1fulla <= w2pad;
    endcase
  end

  always @(*) begin
    case(q2[3:1])
      3'b001,3'b010,3'b110,3'b101 : fYdec1 <= {2'b00,fY_d8,2'b00};
      3'b011,3'b100 : fYdec1 <= {1'b0,fY_d8,3'b000};
      default : fYdec1 <= 30'b000000000000000000000000000000;
    endcase
  end

  always @(*) begin
    case(q2[3])
      1'b0 : w1full <= w1fulla - fYdec1;
      default : w1full <= w1fulla + fYdec1;
    endcase
  end

  assign w1 = {w1full[26:0],2'b00};
  //--------------Synchro barrier, entering cycle 9----------------
  assign sel1 = {w1_d1[28:24],fY_d9[23:22]};
  SelFunctionTable_r8_F400_uid4 SelFunctionTable1(
      .clk(clk),
    .rst(rst),
    .ce(ce),
    .X(sel1),
    .Y(q1));

  assign w1pad = {w1_d1,1'b0};
  always @(*) begin
    case(q1[1:0])
      2'b01 : w0fulla <= w1pad - ({4'b0000,fY_d9});
      2'b11 : w0fulla <= w1pad + ({4'b0000,fY_d9});
      2'b10 : w0fulla <= w1pad + ({3'b000,fY_d9,1'b0});
      default : w0fulla <= w1pad;
    endcase
  end

  always @(*) begin
    case(q1[3:1])
      3'b001,3'b010,3'b110,3'b101 : fYdec0 <= {2'b00,fY_d9,2'b00};
      3'b011,3'b100 : fYdec0 <= {1'b0,fY_d9,3'b000};
      default : fYdec0 <= 30'b000000000000000000000000000000;
    endcase
  end

  always @(*) begin
    case(q1[3])
      1'b0 : w0full <= w0fulla - fYdec0;
      default : w0full <= w0fulla + fYdec0;
    endcase
  end

  assign w0 = {w0full[26:0],2'b00};
  //--------------Synchro barrier, entering cycle 10----------------
  assign q0[3:0] = w0_d1 == (29'b00000000000000000000000000000) ? 4'b0000 : {w0_d1[28],3'b010};
  assign qP9 = q9_d9[2:0];
  assign qM9 = {q9_d9[3],2'b00};
  assign qP8 = q8_d8[2:0];
  assign qM8 = {q8_d8[3],2'b00};
  assign qP7 = q7_d7[2:0];
  assign qM7 = {q7_d7[3],2'b00};
  assign qP6 = q6_d6[2:0];
  assign qM6 = {q6_d6[3],2'b00};
  assign qP5 = q5_d5[2:0];
  assign qM5 = {q5_d5[3],2'b00};
  assign qP4 = q4_d4[2:0];
  assign qM4 = {q4_d4[3],2'b00};
  assign qP3 = q3_d3[2:0];
  assign qM3 = {q3_d3[3],2'b00};
  assign qP2 = q2_d2[2:0];
  assign qM2 = {q2_d2[3],2'b00};
  assign qP1 = q1_d1[2:0];
  assign qM1 = {q1_d1[3],2'b00};
  assign qP0 = q0[2:0];
  assign qM0 = {q0[3],2'b00};
  assign qP = {qP9,qP8,qP7,qP6,qP5,qP4,qP3,qP2,qP1,qP0};
  assign qM = {qM9[1:0],qM8,qM7,qM6,qM5,qM4,qM3,qM2,qM1,qM0,1'b0};
  assign fR0 = qP - qM;
  //--------------Synchro barrier, entering cycle 11----------------
  assign fR = {fR0_d1[29:2],fR0_d1[0] | fR0_d1[1]};
  // normalisation
  always @(*) begin
    case(fR[27])
      1'b1 : fRn1 <= {fR[27:2],fR[0] | fR[1]};
      default : fRn1 <= fR[26:0];
    endcase
  end

  assign expR1 = expR0_d11 + ({3'b000,6'b111111,fR[27]});
  // add back bias
  assign round = fRn1[2] & (fRn1[0] | fRn1[1] | fRn1[3]);
  // fRn1(0) is the sticky bit
  //--------------Synchro barrier, entering cycle 12----------------
  // final rounding
  assign expfrac = {expR1_d1,fRn1_d1[25:3]};
  assign expfracR = expfrac + ({32'b00000000000000000000000000000000,round_d1});
  assign exnR = expfracR[32] == 1'b1 ? 2'b00 : expfracR[32:31] == 2'b01 ? 2'b10 : 2'b01;
  // 00, normal case
  always @(*) begin
    case(exnR0_d12)
      2'b01 : exnRfinal <= exnR;
  // normal
      default : exnRfinal <= exnR0_d12;
    endcase
  end

  assign R = {exnRfinal,sR_d12,expfracR[30:0]};

endmodule
