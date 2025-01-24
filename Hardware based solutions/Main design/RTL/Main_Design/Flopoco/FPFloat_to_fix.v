// File result/FP2Fix_8_23M_3_3_S_T_comb_uid2Exponent_difference.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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
//             FP2Fix_8_23M_3_3_S_T_comb_uid2Exponent_difference
//                           (IntAdder_8_f400_uid4)
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
//------------------------------------------------------------------------------
// combinatorial
// no timescale needed

module FP2Fix_8_23M_3_3_S_T_comb_uid2Exponent_difference(
input wire [7:0] X,
input wire [7:0] Y,
input wire Cin,
output wire [7:0] R
);





  //Classical
  assign R = X + Y + Cin;

endmodule
// File result/LeftShifter_24_by_max_9_comb_uid12.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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
//                     LeftShifter_24_by_max_9_comb_uid12
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Bogdan Pasca, Florent de Dinechin (2008-2011)
//------------------------------------------------------------------------------
// combinatorial
// no timescale needed

module LeftShifter_24_by_max_9_comb_uid12(
input wire [23:0] X,
input wire [3:0] S,
output wire [32:0] R
);




wire [23:0] level0;
wire [3:0] ps;
wire [24:0] level1;
wire [26:0] level2;
wire [30:0] level3;
wire [38:0] level4;

  assign level0 = X;
  assign ps = S;
  assign level1 = ps[0] == 1'b1 ? {level0,1'b0} : {1'b0,level0};
  assign level2 = ps[1] == 1'b1 ? {level1,2'b00} : {2'b00,level1};
  assign level3 = ps[2] == 1'b1 ? {level2,4'b0000} : {4'b0000,level2};
  assign level4 = ps[3] == 1'b1 ? {level3,8'b00000000} : {8'b00000000,level3};
  assign R = level4[32:0];

endmodule
// File result/float_to_fix.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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
//                                float_to_fix
//                      (FP2Fix_8_23M_3_3_S_T_comb_uid2)
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Fabrizio Ferrandi (2012)
//------------------------------------------------------------------------------
// combinatorial
// no timescale needed

module FPFloat_to_fix(
input wire [8 + 23 + 2:0] I,
output wire [6:0] O
);




wire [7:0] eA0;
wire [23:0] fA0;
wire [7:0] bias;
wire [7:0] eA1;
wire [3:0] shiftedby;
wire [32:0] fA1;
wire [6:0] fA2;
wire [6:0] fA4;
wire overFl0;
wire notZeroTest;
wire overFl1;
wire eTest;

  assign eA0 = I[30:23];
  assign fA0 = {1'b1,I[22:0]};
  assign bias =  ~8'b01111110;
  FP2Fix_8_23M_3_3_S_T_comb_uid2Exponent_difference Exponent_difference(
      .Cin(1'b1),
    .R(eA1),
    .X(bias),
    .Y(eA0));

  assign shiftedby = eA1[7] == 1'b0 ? eA1[3:0] : 4'b0000;
  LeftShifter_24_by_max_9_comb_uid12 FXP_shifter(
      .R(fA1),
    .S(shiftedby),
    .X(fA0));

  assign fA2 = fA1[27:21];
  assign fA4 = I[31] == 1'b0 ? fA2 :  -(fA2);
  assign overFl0 = I[30:23] > 8'b10000010 ? 1'b1 : I[33];
  assign notZeroTest = fA4 != 7'b0000000 ? 1'b1 : 1'b0;
  assign overFl1 = (fA4[6] ^ I[31]) & notZeroTest;
  assign eTest = overFl0 | overFl1;
  assign O = eTest == 1'b0 ? fA4 : {I[31],{ ~I[31], ~I[31], ~I[31], ~I[31], ~I[31], ~I[31]}};

endmodule
