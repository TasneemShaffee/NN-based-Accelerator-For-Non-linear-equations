// File results/FPsqrt.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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
//                                   FPsqrt
//                               (FPSqrt_8_23)
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: 
//------------------------------------------------------------------------------
// combinatorial
// no timescale needed

module FPsqrt(
input wire [8 + 23 + 2:0] X,
output wire [8 + 23 + 2:0] R
);




wire [22:0] fracX;
wire [7:0] eRn0;
wire [2:0] xsX;
wire [7:0] eRn1;
wire [26:0] w26;
wire d25;
wire [27:0] x25;
wire [3:0] ds25;
wire [3:0] xh25;
reg [3:0] wh25;
wire [26:0] w25;
wire [0:0] s25;
wire d24;
wire [27:0] x24;
wire [4:0] ds24;
wire [4:0] xh24;
reg [4:0] wh24;
wire [26:0] w24;
wire [1:0] s24;
wire d23;
wire [27:0] x23;
wire [5:0] ds23;
wire [5:0] xh23;
reg [5:0] wh23;
wire [26:0] w23;
wire [2:0] s23;
wire d22;
wire [27:0] x22;
wire [6:0] ds22;
wire [6:0] xh22;
reg [6:0] wh22;
wire [26:0] w22;
wire [3:0] s22;
wire d21;
wire [27:0] x21;
wire [7:0] ds21;
wire [7:0] xh21;
reg [7:0] wh21;
wire [26:0] w21;
wire [4:0] s21;
wire d20;
wire [27:0] x20;
wire [8:0] ds20;
wire [8:0] xh20;
reg [8:0] wh20;
wire [26:0] w20;
wire [5:0] s20;
wire d19;
wire [27:0] x19;
wire [9:0] ds19;
wire [9:0] xh19;
reg [9:0] wh19;
wire [26:0] w19;
wire [6:0] s19;
wire d18;
wire [27:0] x18;
wire [10:0] ds18;
wire [10:0] xh18;
reg [10:0] wh18;
wire [26:0] w18;
wire [7:0] s18;
wire d17;
wire [27:0] x17;
wire [11:0] ds17;
wire [11:0] xh17;
reg [11:0] wh17;
wire [26:0] w17;
wire [8:0] s17;
wire d16;
wire [27:0] x16;
wire [12:0] ds16;
wire [12:0] xh16;
reg [12:0] wh16;
wire [26:0] w16;
wire [9:0] s16;
wire d15;
wire [27:0] x15;
wire [13:0] ds15;
wire [13:0] xh15;
reg [13:0] wh15;
wire [26:0] w15;
wire [10:0] s15;
wire d14;
wire [27:0] x14;
wire [14:0] ds14;
wire [14:0] xh14;
reg [14:0] wh14;
wire [26:0] w14;
wire [11:0] s14;
wire d13;
wire [27:0] x13;
wire [15:0] ds13;
wire [15:0] xh13;
reg [15:0] wh13;
wire [26:0] w13;
wire [12:0] s13;
wire d12;
wire [27:0] x12;
wire [16:0] ds12;
wire [16:0] xh12;
reg [16:0] wh12;
wire [26:0] w12;
wire [13:0] s12;
wire d11;
wire [27:0] x11;
wire [17:0] ds11;
wire [17:0] xh11;
reg [17:0] wh11;
wire [26:0] w11;
wire [14:0] s11;
wire d10;
wire [27:0] x10;
wire [18:0] ds10;
wire [18:0] xh10;
reg [18:0] wh10;
wire [26:0] w10;
wire [15:0] s10;
wire d9;
wire [27:0] x9;
wire [19:0] ds9;
wire [19:0] xh9;
reg [19:0] wh9;
wire [26:0] w9;
wire [16:0] s9;
wire d8;
wire [27:0] x8;
wire [20:0] ds8;
wire [20:0] xh8;
reg [20:0] wh8;
wire [26:0] w8;
wire [17:0] s8;
wire d7;
wire [27:0] x7;
wire [21:0] ds7;
wire [21:0] xh7;
reg [21:0] wh7;
wire [26:0] w7;
wire [18:0] s7;
wire d6;
wire [27:0] x6;
wire [22:0] ds6;
wire [22:0] xh6;
reg [22:0] wh6;
wire [26:0] w6;
wire [19:0] s6;
wire d5;
wire [27:0] x5;
wire [23:0] ds5;
wire [23:0] xh5;
reg [23:0] wh5;
wire [26:0] w5;
wire [20:0] s5;
wire d4;
wire [27:0] x4;
wire [24:0] ds4;
wire [24:0] xh4;
reg [24:0] wh4;
wire [26:0] w4;
wire [21:0] s4;
wire d3;
wire [27:0] x3;
wire [25:0] ds3;
wire [25:0] xh3;
reg [25:0] wh3;
wire [26:0] w3;
wire [22:0] s3;
wire d2;
wire [27:0] x2;
wire [26:0] ds2;
wire [26:0] xh2;
reg [26:0] wh2;
wire [26:0] w2;
wire [23:0] s2;
wire d1;
wire [27:0] x1;
wire [27:0] ds1;
wire [27:0] xh1;
reg [27:0] wh1;
wire [26:0] w1;
wire [24:0] s1;
wire d0;
wire [26:0] fR;
reg [24:0] fRn1;
wire round;
wire [22:0] fRn2;
wire [30:0] Rn2;
reg [2:0] xsR;

  assign fracX = X[22:0];
  // fraction
  assign eRn0 = {1'b0,X[30:24]};
  // exponent
  assign xsX = X[33:31];
  // exception and sign
  assign eRn1 = eRn0 + ({2'b00,6'b111111}) + X[23];
  assign w26 = X[23] == 1'b0 ? {3'b111,fracX,1'b0} : {4'b1101,fracX};
  // Step 25
  assign d25 = w26[26];
  assign x25 = {w26,1'b0};
  assign ds25 = {1'b0, ~d25,d25,1'b1};
  assign xh25 = x25[27:24];
  always @(*) begin
    case(d25)
      1'b0 : wh25 <= xh25 - ds25;
      default : wh25 <= xh25 + ds25;
    endcase
  end

  assign w25 = {wh25[2:0],x25[23:0]};
  assign s25 =  ~d25;
  // Step 24
  assign d24 = w25[26];
  assign x24 = {w25,1'b0};
  assign ds24 = {1'b0,s25, ~d24,d24,1'b1};
  assign xh24 = x24[27:23];
  always @(*) begin
    case(d24)
      1'b0 : wh24 <= xh24 - ds24;
      default : wh24 <= xh24 + ds24;
    endcase
  end

  assign w24 = {wh24[3:0],x24[22:0]};
  assign s24 = {s25, ~d24};
  // Step 23
  assign d23 = w24[26];
  assign x23 = {w24,1'b0};
  assign ds23 = {1'b0,s24, ~d23,d23,1'b1};
  assign xh23 = x23[27:22];
  always @(*) begin
    case(d23)
      1'b0 : wh23 <= xh23 - ds23;
      default : wh23 <= xh23 + ds23;
    endcase
  end

  assign w23 = {wh23[4:0],x23[21:0]};
  assign s23 = {s24, ~d23};
  // Step 22
  assign d22 = w23[26];
  assign x22 = {w23,1'b0};
  assign ds22 = {1'b0,s23, ~d22,d22,1'b1};
  assign xh22 = x22[27:21];
  always @(*) begin
    case(d22)
      1'b0 : wh22 <= xh22 - ds22;
      default : wh22 <= xh22 + ds22;
    endcase
  end

  assign w22 = {wh22[5:0],x22[20:0]};
  assign s22 = {s23, ~d22};
  // Step 21
  assign d21 = w22[26];
  assign x21 = {w22,1'b0};
  assign ds21 = {1'b0,s22, ~d21,d21,1'b1};
  assign xh21 = x21[27:20];
  always @(*) begin
    case(d21)
      1'b0 : wh21 <= xh21 - ds21;
      default : wh21 <= xh21 + ds21;
    endcase
  end

  assign w21 = {wh21[6:0],x21[19:0]};
  assign s21 = {s22, ~d21};
  // Step 20
  assign d20 = w21[26];
  assign x20 = {w21,1'b0};
  assign ds20 = {1'b0,s21, ~d20,d20,1'b1};
  assign xh20 = x20[27:19];
  always @(*) begin
    case(d20)
      1'b0 : wh20 <= xh20 - ds20;
      default : wh20 <= xh20 + ds20;
    endcase
  end

  assign w20 = {wh20[7:0],x20[18:0]};
  assign s20 = {s21, ~d20};
  // Step 19
  assign d19 = w20[26];
  assign x19 = {w20,1'b0};
  assign ds19 = {1'b0,s20, ~d19,d19,1'b1};
  assign xh19 = x19[27:18];
  always @(*) begin
    case(d19)
      1'b0 : wh19 <= xh19 - ds19;
      default : wh19 <= xh19 + ds19;
    endcase
  end

  assign w19 = {wh19[8:0],x19[17:0]};
  assign s19 = {s20, ~d19};
  // Step 18
  assign d18 = w19[26];
  assign x18 = {w19,1'b0};
  assign ds18 = {1'b0,s19, ~d18,d18,1'b1};
  assign xh18 = x18[27:17];
  always @(*) begin
    case(d18)
      1'b0 : wh18 <= xh18 - ds18;
      default : wh18 <= xh18 + ds18;
    endcase
  end

  assign w18 = {wh18[9:0],x18[16:0]};
  assign s18 = {s19, ~d18};
  // Step 17
  assign d17 = w18[26];
  assign x17 = {w18,1'b0};
  assign ds17 = {1'b0,s18, ~d17,d17,1'b1};
  assign xh17 = x17[27:16];
  always @(*) begin
    case(d17)
      1'b0 : wh17 <= xh17 - ds17;
      default : wh17 <= xh17 + ds17;
    endcase
  end

  assign w17 = {wh17[10:0],x17[15:0]};
  assign s17 = {s18, ~d17};
  // Step 16
  assign d16 = w17[26];
  assign x16 = {w17,1'b0};
  assign ds16 = {1'b0,s17, ~d16,d16,1'b1};
  assign xh16 = x16[27:15];
  always @(*) begin
    case(d16)
      1'b0 : wh16 <= xh16 - ds16;
      default : wh16 <= xh16 + ds16;
    endcase
  end

  assign w16 = {wh16[11:0],x16[14:0]};
  assign s16 = {s17, ~d16};
  // Step 15
  assign d15 = w16[26];
  assign x15 = {w16,1'b0};
  assign ds15 = {1'b0,s16, ~d15,d15,1'b1};
  assign xh15 = x15[27:14];
  always @(*) begin
    case(d15)
      1'b0 : wh15 <= xh15 - ds15;
      default : wh15 <= xh15 + ds15;
    endcase
  end

  assign w15 = {wh15[12:0],x15[13:0]};
  assign s15 = {s16, ~d15};
  // Step 14
  assign d14 = w15[26];
  assign x14 = {w15,1'b0};
  assign ds14 = {1'b0,s15, ~d14,d14,1'b1};
  assign xh14 = x14[27:13];
  always @(*) begin
    case(d14)
      1'b0 : wh14 <= xh14 - ds14;
      default : wh14 <= xh14 + ds14;
    endcase
  end

  assign w14 = {wh14[13:0],x14[12:0]};
  assign s14 = {s15, ~d14};
  // Step 13
  assign d13 = w14[26];
  assign x13 = {w14,1'b0};
  assign ds13 = {1'b0,s14, ~d13,d13,1'b1};
  assign xh13 = x13[27:12];
  always @(*) begin
    case(d13)
      1'b0 : wh13 <= xh13 - ds13;
      default : wh13 <= xh13 + ds13;
    endcase
  end

  assign w13 = {wh13[14:0],x13[11:0]};
  assign s13 = {s14, ~d13};
  // Step 12
  assign d12 = w13[26];
  assign x12 = {w13,1'b0};
  assign ds12 = {1'b0,s13, ~d12,d12,1'b1};
  assign xh12 = x12[27:11];
  always @(*) begin
    case(d12)
      1'b0 : wh12 <= xh12 - ds12;
      default : wh12 <= xh12 + ds12;
    endcase
  end

  assign w12 = {wh12[15:0],x12[10:0]};
  assign s12 = {s13, ~d12};
  // Step 11
  assign d11 = w12[26];
  assign x11 = {w12,1'b0};
  assign ds11 = {1'b0,s12, ~d11,d11,1'b1};
  assign xh11 = x11[27:10];
  always @(*) begin
    case(d11)
      1'b0 : wh11 <= xh11 - ds11;
      default : wh11 <= xh11 + ds11;
    endcase
  end

  assign w11 = {wh11[16:0],x11[9:0]};
  assign s11 = {s12, ~d11};
  // Step 10
  assign d10 = w11[26];
  assign x10 = {w11,1'b0};
  assign ds10 = {1'b0,s11, ~d10,d10,1'b1};
  assign xh10 = x10[27:9];
  always @(*) begin
    case(d10)
      1'b0 : wh10 <= xh10 - ds10;
      default : wh10 <= xh10 + ds10;
    endcase
  end

  assign w10 = {wh10[17:0],x10[8:0]};
  assign s10 = {s11, ~d10};
  // Step 9
  assign d9 = w10[26];
  assign x9 = {w10,1'b0};
  assign ds9 = {1'b0,s10, ~d9,d9,1'b1};
  assign xh9 = x9[27:8];
  always @(*) begin
    case(d9)
      1'b0 : wh9 <= xh9 - ds9;
      default : wh9 <= xh9 + ds9;
    endcase
  end

  assign w9 = {wh9[18:0],x9[7:0]};
  assign s9 = {s10, ~d9};
  // Step 8
  assign d8 = w9[26];
  assign x8 = {w9,1'b0};
  assign ds8 = {1'b0,s9, ~d8,d8,1'b1};
  assign xh8 = x8[27:7];
  always @(*) begin
    case(d8)
      1'b0 : wh8 <= xh8 - ds8;
      default : wh8 <= xh8 + ds8;
    endcase
  end

  assign w8 = {wh8[19:0],x8[6:0]};
  assign s8 = {s9, ~d8};
  // Step 7
  assign d7 = w8[26];
  assign x7 = {w8,1'b0};
  assign ds7 = {1'b0,s8, ~d7,d7,1'b1};
  assign xh7 = x7[27:6];
  always @(*) begin
    case(d7)
      1'b0 : wh7 <= xh7 - ds7;
      default : wh7 <= xh7 + ds7;
    endcase
  end

  assign w7 = {wh7[20:0],x7[5:0]};
  assign s7 = {s8, ~d7};
  // Step 6
  assign d6 = w7[26];
  assign x6 = {w7,1'b0};
  assign ds6 = {1'b0,s7, ~d6,d6,1'b1};
  assign xh6 = x6[27:5];
  always @(*) begin
    case(d6)
      1'b0 : wh6 <= xh6 - ds6;
      default : wh6 <= xh6 + ds6;
    endcase
  end

  assign w6 = {wh6[21:0],x6[4:0]};
  assign s6 = {s7, ~d6};
  // Step 5
  assign d5 = w6[26];
  assign x5 = {w6,1'b0};
  assign ds5 = {1'b0,s6, ~d5,d5,1'b1};
  assign xh5 = x5[27:4];
  always @(*) begin
    case(d5)
      1'b0 : wh5 <= xh5 - ds5;
      default : wh5 <= xh5 + ds5;
    endcase
  end

  assign w5 = {wh5[22:0],x5[3:0]};
  assign s5 = {s6, ~d5};
  // Step 4
  assign d4 = w5[26];
  assign x4 = {w5,1'b0};
  assign ds4 = {1'b0,s5, ~d4,d4,1'b1};
  assign xh4 = x4[27:3];
  always @(*) begin
    case(d4)
      1'b0 : wh4 <= xh4 - ds4;
      default : wh4 <= xh4 + ds4;
    endcase
  end

  assign w4 = {wh4[23:0],x4[2:0]};
  assign s4 = {s5, ~d4};
  // Step 3
  assign d3 = w4[26];
  assign x3 = {w4,1'b0};
  assign ds3 = {1'b0,s4, ~d3,d3,1'b1};
  assign xh3 = x3[27:2];
  always @(*) begin
    case(d3)
      1'b0 : wh3 <= xh3 - ds3;
      default : wh3 <= xh3 + ds3;
    endcase
  end

  assign w3 = {wh3[24:0],x3[1:0]};
  assign s3 = {s4, ~d3};
  // Step 2
  assign d2 = w3[26];
  assign x2 = {w3,1'b0};
  assign ds2 = {1'b0,s3, ~d2,d2,1'b1};
  assign xh2 = x2[27:1];
  always @(*) begin
    case(d2)
      1'b0 : wh2 <= xh2 - ds2;
      default : wh2 <= xh2 + ds2;
    endcase
  end

  assign w2 = {wh2[25:0],x2[0:0]};
  assign s2 = {s3, ~d2};
  // Step 1
  assign d1 = w2[26];
  assign x1 = {w2,1'b0};
  assign ds1 = {1'b0,s2, ~d1,d1,1'b1};
  assign xh1 = x1[27:0];
  always @(*) begin
    case(d1)
      1'b0 : wh1 <= xh1 - ds1;
      default : wh1 <= xh1 + ds1;
    endcase
  end

  assign w1 = wh1[26:0];
  assign s1 = {s2, ~d1};
  assign d0 = w1[26];
  assign fR = {s1, ~d0,1'b1};
  // normalisation of the result, removing leading 1
  always @(*) begin
    case(fR[26])
      1'b1 : fRn1 <= {fR[25:2],fR[1] | fR[0]};
      default : fRn1 <= fR[24:0];
    endcase
  end

  assign round = fRn1[1] & (fRn1[2] | fRn1[0]);
  // round  and (lsb or sticky) : that's RN, tie to even
  assign fRn2 = fRn1[24:2] + ({22'b0000000000000000000000,round});
  // rounding sqrt never changes exponents 
  assign Rn2 = {eRn1,fRn2};
  // sign and exception processing
  always @(*) begin
    case(xsX)
      3'b010 : xsR <= 3'b010;
  // normal case
      3'b100 : xsR <= 3'b100;
  // +infty
      3'b000 : xsR <= 3'b000;
  // +0
      3'b001 : xsR <= 3'b001;
  // the infamous sqrt(-0)=-0
      default : xsR <= 3'b110;
    endcase
  end

  // return NaN
  assign R = {xsR,Rn2};

endmodule
