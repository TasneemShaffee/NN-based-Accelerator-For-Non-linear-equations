// File results//SelFunctionTable_r4_comb_uid4.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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
//                       SelFunctionTable_r4_comb_uid4
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Maxime Christ, Florent de Dinechin (2015)
//------------------------------------------------------------------------------
// no timescale needed

module SelFunctionTable_r4_comb_uid4(
input wire [4:0] X,
output wire [2:0] Y
);




reg [2:0] TableOut;

  always @(*) begin
    case(X)
      5'b00000 : TableOut <= 3'b000;
      5'b00001 : TableOut <= 3'b000;
      5'b00010 : TableOut <= 3'b001;
      5'b00011 : TableOut <= 3'b001;
      5'b00100 : TableOut <= 3'b010;
      5'b00101 : TableOut <= 3'b001;
      5'b00110 : TableOut <= 3'b011;
      5'b00111 : TableOut <= 3'b010;
      5'b01000 : TableOut <= 3'b011;
      5'b01001 : TableOut <= 3'b011;
      5'b01010 : TableOut <= 3'b011;
      5'b01011 : TableOut <= 3'b011;
      5'b01100 : TableOut <= 3'b011;
      5'b01101 : TableOut <= 3'b011;
      5'b01110 : TableOut <= 3'b011;
      5'b01111 : TableOut <= 3'b011;
      5'b10000 : TableOut <= 3'b101;
      5'b10001 : TableOut <= 3'b101;
      5'b10010 : TableOut <= 3'b101;
      5'b10011 : TableOut <= 3'b101;
      5'b10100 : TableOut <= 3'b101;
      5'b10101 : TableOut <= 3'b101;
      5'b10110 : TableOut <= 3'b101;
      5'b10111 : TableOut <= 3'b101;
      5'b11000 : TableOut <= 3'b101;
      5'b11001 : TableOut <= 3'b110;
      5'b11010 : TableOut <= 3'b110;
      5'b11011 : TableOut <= 3'b110;
      5'b11100 : TableOut <= 3'b111;
      5'b11101 : TableOut <= 3'b111;
      5'b11110 : TableOut <= 3'b111;
      5'b11111 : TableOut <= 3'b111;
      default : TableOut <= 3'bxxx;
    endcase
  end

  assign Y = TableOut;

endmodule
// File results//FPdiv.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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
//                                   FPdiv
//                           (FPDiv_8_23_comb_uid2)
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Maxime Christ, Florent de Dinechin (2015)
//------------------------------------------------------------------------------
// combinatorial
// no timescale needed

module FPdiv(
input wire [8 + 23 + 2:0] X,
input wire [8 + 23 + 2:0] Y,
output wire [8 + 23 + 2:0] R
);




wire [23:0] fX;
wire [23:0] fY;
wire [9:0] expR0;
wire sR;
wire [3:0] exnXY;
reg [1:0] exnR0;
wire [25:0] fYTimes3;
wire [25:0] w13;
wire [4:0] sel13;
wire [2:0] q13;
reg [26:0] q13D;
wire [26:0] w13pad;
reg [26:0] w12full;
wire [25:0] w12;
wire [4:0] sel12;
wire [2:0] q12;
reg [26:0] q12D;
wire [26:0] w12pad;
reg [26:0] w11full;
wire [25:0] w11;
wire [4:0] sel11;
wire [2:0] q11;
reg [26:0] q11D;
wire [26:0] w11pad;
reg [26:0] w10full;
wire [25:0] w10;
wire [4:0] sel10;
wire [2:0] q10;
reg [26:0] q10D;
wire [26:0] w10pad;
reg [26:0] w9full;
wire [25:0] w9;
wire [4:0] sel9;
wire [2:0] q9;
reg [26:0] q9D;
wire [26:0] w9pad;
reg [26:0] w8full;
wire [25:0] w8;
wire [4:0] sel8;
wire [2:0] q8;
reg [26:0] q8D;
wire [26:0] w8pad;
reg [26:0] w7full;
wire [25:0] w7;
wire [4:0] sel7;
wire [2:0] q7;
reg [26:0] q7D;
wire [26:0] w7pad;
reg [26:0] w6full;
wire [25:0] w6;
wire [4:0] sel6;
wire [2:0] q6;
reg [26:0] q6D;
wire [26:0] w6pad;
reg [26:0] w5full;
wire [25:0] w5;
wire [4:0] sel5;
wire [2:0] q5;
reg [26:0] q5D;
wire [26:0] w5pad;
reg [26:0] w4full;
wire [25:0] w4;
wire [4:0] sel4;
wire [2:0] q4;
reg [26:0] q4D;
wire [26:0] w4pad;
reg [26:0] w3full;
wire [25:0] w3;
wire [4:0] sel3;
wire [2:0] q3;
reg [26:0] q3D;
wire [26:0] w3pad;
reg [26:0] w2full;
wire [25:0] w2;
wire [4:0] sel2;
wire [2:0] q2;
reg [26:0] q2D;
wire [26:0] w2pad;
reg [26:0] w1full;
wire [25:0] w1;
wire [4:0] sel1;
wire [2:0] q1;
reg [26:0] q1D;
wire [26:0] w1pad;
reg [26:0] w0full;
wire [25:0] w0;
wire [2:0] q0;
wire [1:0] qP13;
wire [1:0] qM13;
wire [1:0] qP12;
wire [1:0] qM12;
wire [1:0] qP11;
wire [1:0] qM11;
wire [1:0] qP10;
wire [1:0] qM10;
wire [1:0] qP9;
wire [1:0] qM9;
wire [1:0] qP8;
wire [1:0] qM8;
wire [1:0] qP7;
wire [1:0] qM7;
wire [1:0] qP6;
wire [1:0] qM6;
wire [1:0] qP5;
wire [1:0] qM5;
wire [1:0] qP4;
wire [1:0] qM4;
wire [1:0] qP3;
wire [1:0] qM3;
wire [1:0] qP2;
wire [1:0] qM2;
wire [1:0] qP1;
wire [1:0] qM1;
wire [1:0] qP0;
wire [1:0] qM0;
wire [27:0] qP;
wire [27:0] qM;
wire [27:0] fR0;
wire [26:0] fR;
reg [24:0] fRn1;
wire [9:0] expR1;
wire round;
wire [32:0] expfrac;
wire [32:0] expfracR;
wire [1:0] exnR;
reg [1:0] exnRfinal;

  assign fX = {1'b1,X[22:0]};
  assign fY = {1'b1,Y[22:0]};
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
  // compute 3Y
  assign fYTimes3 = ({2'b00,fY}) + ({1'b0,fY,1'b0});
  assign w13 = {2'b00,fX};
  assign sel13 = {w13[25:22],fY[22]};
  SelFunctionTable_r4_comb_uid4 SelFunctionTable13(
      .X(sel13),
    .Y(q13));

  always @(*) begin
    case(q13)
      3'b001,3'b111 : q13D <= {3'b000,fY};
      3'b010,3'b110 : q13D <= {2'b00,fY,1'b0};
      3'b011,3'b101 : q13D <= {1'b0,fYTimes3};
      default : q13D <= 27'b000000000000000000000000000;
    endcase
  end

  assign w13pad = {w13,1'b0};
  always @(*) begin
    case(q13[2])
      1'b0 : w12full <= w13pad - q13D;
      default : w12full <= w13pad + q13D;
    endcase
  end

  assign w12 = {w12full[24:0],1'b0};
  assign sel12 = {w12[25:22],fY[22]};
  SelFunctionTable_r4_comb_uid4 SelFunctionTable12(
      .X(sel12),
    .Y(q12));

  always @(*) begin
    case(q12)
      3'b001,3'b111 : q12D <= {3'b000,fY};
      3'b010,3'b110 : q12D <= {2'b00,fY,1'b0};
      3'b011,3'b101 : q12D <= {1'b0,fYTimes3};
      default : q12D <= 27'b000000000000000000000000000;
    endcase
  end

  assign w12pad = {w12,1'b0};
  always @(*) begin
    case(q12[2])
      1'b0 : w11full <= w12pad - q12D;
      default : w11full <= w12pad + q12D;
    endcase
  end

  assign w11 = {w11full[24:0],1'b0};
  assign sel11 = {w11[25:22],fY[22]};
  SelFunctionTable_r4_comb_uid4 SelFunctionTable11(
      .X(sel11),
    .Y(q11));

  always @(*) begin
    case(q11)
      3'b001,3'b111 : q11D <= {3'b000,fY};
      3'b010,3'b110 : q11D <= {2'b00,fY,1'b0};
      3'b011,3'b101 : q11D <= {1'b0,fYTimes3};
      default : q11D <= 27'b000000000000000000000000000;
    endcase
  end

  assign w11pad = {w11,1'b0};
  always @(*) begin
    case(q11[2])
      1'b0 : w10full <= w11pad - q11D;
      default : w10full <= w11pad + q11D;
    endcase
  end

  assign w10 = {w10full[24:0],1'b0};
  assign sel10 = {w10[25:22],fY[22]};
  SelFunctionTable_r4_comb_uid4 SelFunctionTable10(
      .X(sel10),
    .Y(q10));

  always @(*) begin
    case(q10)
      3'b001,3'b111 : q10D <= {3'b000,fY};
      3'b010,3'b110 : q10D <= {2'b00,fY,1'b0};
      3'b011,3'b101 : q10D <= {1'b0,fYTimes3};
      default : q10D <= 27'b000000000000000000000000000;
    endcase
  end

  assign w10pad = {w10,1'b0};
  always @(*) begin
    case(q10[2])
      1'b0 : w9full <= w10pad - q10D;
      default : w9full <= w10pad + q10D;
    endcase
  end

  assign w9 = {w9full[24:0],1'b0};
  assign sel9 = {w9[25:22],fY[22]};
  SelFunctionTable_r4_comb_uid4 SelFunctionTable9(
      .X(sel9),
    .Y(q9));

  always @(*) begin
    case(q9)
      3'b001,3'b111 : q9D <= {3'b000,fY};
      3'b010,3'b110 : q9D <= {2'b00,fY,1'b0};
      3'b011,3'b101 : q9D <= {1'b0,fYTimes3};
      default : q9D <= 27'b000000000000000000000000000;
    endcase
  end

  assign w9pad = {w9,1'b0};
  always @(*) begin
    case(q9[2])
      1'b0 : w8full <= w9pad - q9D;
      default : w8full <= w9pad + q9D;
    endcase
  end

  assign w8 = {w8full[24:0],1'b0};
  assign sel8 = {w8[25:22],fY[22]};
  SelFunctionTable_r4_comb_uid4 SelFunctionTable8(
      .X(sel8),
    .Y(q8));

  always @(*) begin
    case(q8)
      3'b001,3'b111 : q8D <= {3'b000,fY};
      3'b010,3'b110 : q8D <= {2'b00,fY,1'b0};
      3'b011,3'b101 : q8D <= {1'b0,fYTimes3};
      default : q8D <= 27'b000000000000000000000000000;
    endcase
  end

  assign w8pad = {w8,1'b0};
  always @(*) begin
    case(q8[2])
      1'b0 : w7full <= w8pad - q8D;
      default : w7full <= w8pad + q8D;
    endcase
  end

  assign w7 = {w7full[24:0],1'b0};
  assign sel7 = {w7[25:22],fY[22]};
  SelFunctionTable_r4_comb_uid4 SelFunctionTable7(
      .X(sel7),
    .Y(q7));

  always @(*) begin
    case(q7)
      3'b001,3'b111 : q7D <= {3'b000,fY};
      3'b010,3'b110 : q7D <= {2'b00,fY,1'b0};
      3'b011,3'b101 : q7D <= {1'b0,fYTimes3};
      default : q7D <= 27'b000000000000000000000000000;
    endcase
  end

  assign w7pad = {w7,1'b0};
  always @(*) begin
    case(q7[2])
      1'b0 : w6full <= w7pad - q7D;
      default : w6full <= w7pad + q7D;
    endcase
  end

  assign w6 = {w6full[24:0],1'b0};
  assign sel6 = {w6[25:22],fY[22]};
  SelFunctionTable_r4_comb_uid4 SelFunctionTable6(
      .X(sel6),
    .Y(q6));

  always @(*) begin
    case(q6)
      3'b001,3'b111 : q6D <= {3'b000,fY};
      3'b010,3'b110 : q6D <= {2'b00,fY,1'b0};
      3'b011,3'b101 : q6D <= {1'b0,fYTimes3};
      default : q6D <= 27'b000000000000000000000000000;
    endcase
  end

  assign w6pad = {w6,1'b0};
  always @(*) begin
    case(q6[2])
      1'b0 : w5full <= w6pad - q6D;
      default : w5full <= w6pad + q6D;
    endcase
  end

  assign w5 = {w5full[24:0],1'b0};
  assign sel5 = {w5[25:22],fY[22]};
  SelFunctionTable_r4_comb_uid4 SelFunctionTable5(
      .X(sel5),
    .Y(q5));

  always @(*) begin
    case(q5)
      3'b001,3'b111 : q5D <= {3'b000,fY};
      3'b010,3'b110 : q5D <= {2'b00,fY,1'b0};
      3'b011,3'b101 : q5D <= {1'b0,fYTimes3};
      default : q5D <= 27'b000000000000000000000000000;
    endcase
  end

  assign w5pad = {w5,1'b0};
  always @(*) begin
    case(q5[2])
      1'b0 : w4full <= w5pad - q5D;
      default : w4full <= w5pad + q5D;
    endcase
  end

  assign w4 = {w4full[24:0],1'b0};
  assign sel4 = {w4[25:22],fY[22]};
  SelFunctionTable_r4_comb_uid4 SelFunctionTable4(
      .X(sel4),
    .Y(q4));

  always @(*) begin
    case(q4)
      3'b001,3'b111 : q4D <= {3'b000,fY};
      3'b010,3'b110 : q4D <= {2'b00,fY,1'b0};
      3'b011,3'b101 : q4D <= {1'b0,fYTimes3};
      default : q4D <= 27'b000000000000000000000000000;
    endcase
  end

  assign w4pad = {w4,1'b0};
  always @(*) begin
    case(q4[2])
      1'b0 : w3full <= w4pad - q4D;
      default : w3full <= w4pad + q4D;
    endcase
  end

  assign w3 = {w3full[24:0],1'b0};
  assign sel3 = {w3[25:22],fY[22]};
  SelFunctionTable_r4_comb_uid4 SelFunctionTable3(
      .X(sel3),
    .Y(q3));

  always @(*) begin
    case(q3)
      3'b001,3'b111 : q3D <= {3'b000,fY};
      3'b010,3'b110 : q3D <= {2'b00,fY,1'b0};
      3'b011,3'b101 : q3D <= {1'b0,fYTimes3};
      default : q3D <= 27'b000000000000000000000000000;
    endcase
  end

  assign w3pad = {w3,1'b0};
  always @(*) begin
    case(q3[2])
      1'b0 : w2full <= w3pad - q3D;
      default : w2full <= w3pad + q3D;
    endcase
  end

  assign w2 = {w2full[24:0],1'b0};
  assign sel2 = {w2[25:22],fY[22]};
  SelFunctionTable_r4_comb_uid4 SelFunctionTable2(
      .X(sel2),
    .Y(q2));

  always @(*) begin
    case(q2)
      3'b001,3'b111 : q2D <= {3'b000,fY};
      3'b010,3'b110 : q2D <= {2'b00,fY,1'b0};
      3'b011,3'b101 : q2D <= {1'b0,fYTimes3};
      default : q2D <= 27'b000000000000000000000000000;
    endcase
  end

  assign w2pad = {w2,1'b0};
  always @(*) begin
    case(q2[2])
      1'b0 : w1full <= w2pad - q2D;
      default : w1full <= w2pad + q2D;
    endcase
  end

  assign w1 = {w1full[24:0],1'b0};
  assign sel1 = {w1[25:22],fY[22]};
  SelFunctionTable_r4_comb_uid4 SelFunctionTable1(
      .X(sel1),
    .Y(q1));

  always @(*) begin
    case(q1)
      3'b001,3'b111 : q1D <= {3'b000,fY};
      3'b010,3'b110 : q1D <= {2'b00,fY,1'b0};
      3'b011,3'b101 : q1D <= {1'b0,fYTimes3};
      default : q1D <= 27'b000000000000000000000000000;
    endcase
  end

  assign w1pad = {w1,1'b0};
  always @(*) begin
    case(q1[2])
      1'b0 : w0full <= w1pad - q1D;
      default : w0full <= w1pad + q1D;
    endcase
  end

  assign w0 = {w0full[24:0],1'b0};
  assign q0[2:0] = w0 == (26'b00000000000000000000000000) ? 3'b000 : {w0[25],2'b10};
  assign qP13 = q13[1:0];
  assign qM13 = {q13[2],1'b0};
  assign qP12 = q12[1:0];
  assign qM12 = {q12[2],1'b0};
  assign qP11 = q11[1:0];
  assign qM11 = {q11[2],1'b0};
  assign qP10 = q10[1:0];
  assign qM10 = {q10[2],1'b0};
  assign qP9 = q9[1:0];
  assign qM9 = {q9[2],1'b0};
  assign qP8 = q8[1:0];
  assign qM8 = {q8[2],1'b0};
  assign qP7 = q7[1:0];
  assign qM7 = {q7[2],1'b0};
  assign qP6 = q6[1:0];
  assign qM6 = {q6[2],1'b0};
  assign qP5 = q5[1:0];
  assign qM5 = {q5[2],1'b0};
  assign qP4 = q4[1:0];
  assign qM4 = {q4[2],1'b0};
  assign qP3 = q3[1:0];
  assign qM3 = {q3[2],1'b0};
  assign qP2 = q2[1:0];
  assign qM2 = {q2[2],1'b0};
  assign qP1 = q1[1:0];
  assign qM1 = {q1[2],1'b0};
  assign qP0 = q0[1:0];
  assign qM0 = {q0[2],1'b0};
  assign qP = {qP13,qP12,qP11,qP10,qP9,qP8,qP7,qP6,qP5,qP4,qP3,qP2,qP1,qP0};
  assign qM = {qM13[0],qM12,qM11,qM10,qM9,qM8,qM7,qM6,qM5,qM4,qM3,qM2,qM1,qM0,1'b0};
  assign fR0 = qP - qM;
  assign fR = fR0[27:1];
  // odd wF
  // normalisation
  always @(*) begin
    case(fR[26])
      1'b1 : fRn1 <= {fR[25:2],fR[1] | fR[0]};
      default : fRn1 <= fR[24:0];
    endcase
  end

  assign expR1 = expR0 + ({3'b000,6'b111111,fR[26]});
  // add back bias
  assign round = fRn1[1] & (fRn1[2] | fRn1[0]);
  // fRn1(0) is the sticky bit
  // final rounding
  assign expfrac = {expR1,fRn1[24:2]};
  assign expfracR = expfrac + ({32'b00000000000000000000000000000000,round});
  assign exnR = expfracR[32] == 1'b1 ? 2'b00 : expfracR[32:31] == 2'b01 ? 2'b10 : 2'b01;
  // 00, normal case
  always @(*) begin
    case(exnR0)
      2'b01 : exnRfinal <= exnR;
  // normal
      default : exnRfinal <= exnR0;
    endcase
  end

  assign R = {exnRfinal,sR,expfracR[30:0]};

 endmodule
