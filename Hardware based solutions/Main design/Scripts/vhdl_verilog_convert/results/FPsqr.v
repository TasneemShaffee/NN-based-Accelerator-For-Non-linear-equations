// File results/IntSquarer_24_comb_uid4.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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
//                          IntSquarer_24_comb_uid4
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Bogdan Pasca (2009)
//------------------------------------------------------------------------------
// combinatorial
// no timescale needed

module IntSquarer_24_comb_uid4(
input wire [23:0] X,
output wire [47:0] R
);




wire [17:0] x0_16;
wire [17:0] x17_32;
wire [17:0] x17_32_shr;
wire [35:0] p0;
wire [35:0] p1_x2;
wire [35:0] s1;
wire [35:0] p2;
wire [35:0] s2;

  assign x0_16 = {1'b0,X[16:0]};
  assign x17_32 = {2'b00,9'b000000000,X[23:17]};
  assign x17_32_shr = {1'b0,9'b000000000,X[23:17],1'b0};
  assign p0 = x0_16 * x0_16;
  assign p1_x2 = x17_32_shr * x0_16;
  assign s1 = p1_x2 + ({17'b00000000000000000,p0[35:17]});
  assign p2 = x17_32 * x17_32;
  assign s2 = p2 + ({17'b00000000000000000,s1[35:17]});
  assign R = {s2[13:0],s1[16:0],p0[16:0]};

endmodule
// File results/IntAdder_33_f400_uid8.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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
//                           IntAdder_33_f400_uid8
//                    (IntAdderAlternative_33_comb_uid12)
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
//------------------------------------------------------------------------------
// combinatorial
// no timescale needed

module IntAdder_33_f400_uid8(
input wire [32:0] X,
input wire [32:0] Y,
input wire Cin,
output wire [32:0] R
);





  //Alternative
  assign R = X + Y + Cin;

endmodule
// File results/FPsqr.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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
//                                   FPsqr
//                        (FPSquare_8_23_23_comb_uid2)
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Bogdan Pasca (2009)
//------------------------------------------------------------------------------
// combinatorial
// no timescale needed

module FPsqr(
input wire [8 + 23 + 2:0] X,
output wire [8 + 23 + 2:0] R
);




wire [1:0] exc;
wire [7:0] exp;
wire [23:0] frac;
wire [9:0] extExponent;
wire [9:0] negBias;
wire [9:0] extExpPostBiasSub;
wire [47:0] sqrFrac;
wire sticky;
wire guard;
wire fracULP;
wire [9:0] extExp;
wire [22:0] finalFrac;
wire [32:0] concatExpFrac;
wire addCin;
wire [32:0] postRound;
wire [3:0] excConcat;
reg [1:0] excR;

  assign exc = X[33:32];
  assign exp = X[30:23];
  assign frac = {1'b1,X[22:0]};
  assign extExponent = {1'b0,exp,1'b0};
  assign negBias = 10'b1110000000;
  assign extExpPostBiasSub = extExponent + negBias + 1'b1;
  IntSquarer_24_comb_uid4 FractionSquarer(
      .R(sqrFrac),
    .X(frac));

  assign sticky = sqrFrac[21:0] == 22'b0000000000000000000000 ? 1'b0 : 1'b1;
  assign guard = sqrFrac[47] == 1'b0 ? sqrFrac[22] : sqrFrac[23];
  assign fracULP = sqrFrac[47] == 1'b0 ? sqrFrac[23] : sqrFrac[24];
  assign extExp = extExpPostBiasSub + sqrFrac[47];
  assign finalFrac = sqrFrac[47] == 1'b1 ? sqrFrac[46:24] : sqrFrac[45:23];
  assign concatExpFrac = {extExp,finalFrac};
  assign addCin = (guard & sticky) | (fracULP & guard &  ~(sticky));
  IntAdder_33_f400_uid8 Rounding_Instance(
      .Cin(addCin),
    .R(postRound),
    .X(concatExpFrac),
    .Y(33'b000000000000000000000000000000000));

  assign excConcat = {exc,postRound[32:31]};
  always @(*) begin
    case(excConcat)
      4'b0000 : excR <= 2'b00;
      4'b0001 : excR <= 2'b00;
      4'b0010 : excR <= 2'b00;
      4'b0011 : excR <= 2'b00;
      4'b0100 : excR <= 2'b01;
      4'b0101 : excR <= 2'b10;
      4'b0110 : excR <= 2'b00;
      4'b0111 : excR <= 2'b00;
      4'b1000 : excR <= 2'b10;
      4'b1001 : excR <= 2'b10;
      4'b1010 : excR <= 2'b10;
      4'b1011 : excR <= 2'b10;
      4'b1100 : excR <= 2'b11;
      4'b1101 : excR <= 2'b11;
      4'b1110 : excR <= 2'b11;
      4'b1111 : excR <= 2'b11;
      default : excR <= 2'b11;
    endcase
  end

  assign R = {excR,1'b0,postRound[30:23],postRound[22:0]};

endmodule
