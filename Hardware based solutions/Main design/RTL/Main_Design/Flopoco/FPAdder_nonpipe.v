// File behery_results/RightShifter_24_by_max_26_comb_uid4.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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
//                    RightShifter_24_by_max_26_comb_uid4
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Bogdan Pasca, Florent de Dinechin (2008-2011)
//------------------------------------------------------------------------------
// combinatorial
// no timescale needed

module RightShifter_24_by_max_26_comb_uid4(
input wire [23:0] X,
input wire [4:0] S,
output wire [49:0] R
);




wire [23:0] level0;
wire [4:0] ps;
wire [24:0] level1;
wire [26:0] level2;
wire [30:0] level3;
wire [38:0] level4;
wire [54:0] level5;

  assign level0 = X;
  assign ps = S;
  assign level1 = ps[0] == 1'b1 ? {1'b0,level0} : {level0,1'b0};
  assign level2 = ps[1] == 1'b1 ? {2'b00,level1} : {level1,2'b00};
  assign level3 = ps[2] == 1'b1 ? {4'b0000,level2} : {level2,4'b0000};
  assign level4 = ps[3] == 1'b1 ? {8'b00000000,level3} : {level3,8'b00000000};
  assign level5 = ps[4] == 1'b1 ? {16'b0000000000000000,level4} : {level4,16'b0000000000000000};
  assign R = level5[54:5];

endmodule
// File behery_results/IntAdder_27_f400_uid8.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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
//                           IntAdder_27_f400_uid8
//                     (IntAdderClassical_27_comb_uid10)
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
//------------------------------------------------------------------------------
// combinatorial
// no timescale needed

module IntAdder_27_f400_uid8(
input wire [26:0] X,
input wire [26:0] Y,
input wire Cin,
output wire [26:0] R
);





  //Classical
  assign R = X + Y + Cin;

endmodule
// File behery_results/LZCShifter_28_to_28_counting_32_comb_uid16.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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
//                 LZCShifter_28_to_28_counting_32_comb_uid16
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Florent de Dinechin, Bogdan Pasca (2007)
//------------------------------------------------------------------------------
// combinatorial
// no timescale needed

module LZCShifter_28_to_28_counting_32_comb_uid16(
input wire [27:0] I,
output wire [4:0] Count,
output wire [27:0] O
);




wire [27:0] level5;
wire count4;
wire [27:0] level4;
wire count3;
wire [27:0] level3;
wire count2;
wire [27:0] level2;
wire count1;
wire [27:0] level1;
wire count0;
wire [27:0] level0;
wire [4:0] sCount;

  assign level5 = I;
  assign count4 = level5[27:12] == (16'b0000000000000000) ? 1'b1 : 1'b0;
  assign level4 = count4 == 1'b0 ? level5[27:0] : {level5[11:0],16'b0000000000000000};
  assign count3 = level4[27:20] == (8'b00000000) ? 1'b1 : 1'b0;
  assign level3 = count3 == 1'b0 ? level4[27:0] : {level4[19:0],8'b00000000};
  assign count2 = level3[27:24] == (4'b0000) ? 1'b1 : 1'b0;
  assign level2 = count2 == 1'b0 ? level3[27:0] : {level3[23:0],4'b0000};
  assign count1 = level2[27:26] == (2'b00) ? 1'b1 : 1'b0;
  assign level1 = count1 == 1'b0 ? level2[27:0] : {level2[25:0],2'b00};
  assign count0 = level1[27:27] == (1'b0) ? 1'b1 : 1'b0;
  assign level0 = count0 == 1'b0 ? level1[27:0] : {level1[26:0],1'b0};
  assign O = level0;
  assign sCount = {count4,count3,count2,count1,count0};
  assign Count = sCount;

endmodule
// File behery_results/IntAdder_34_f400_uid20.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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
//                           IntAdder_34_f400_uid20
//                     (IntAdderClassical_34_comb_uid22)
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
//------------------------------------------------------------------------------
// combinatorial
// no timescale needed

module IntAdder_34_f400_uid20(
input wire [33:0] X,
input wire [33:0] Y,
input wire Cin,
output wire [33:0] R
);





  //Classical
  assign R = X + Y + Cin;

endmodule
// File behery_results/FPAdder_nonpipe.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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
//                              FPAdder_nonpipe
//                           (FPAdd_8_23_comb_uid2)
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Bogdan Pasca, Florent de Dinechin (2010)
//------------------------------------------------------------------------------
// combinatorial
// no timescale needed

module FPAdder_nonpipe(
input wire [8 + 23 + 2:0] X,
input wire [8 + 23 + 2:0] Y,
output wire [8 + 23 + 2:0] R
);




wire [32:0] excExpFracX;
wire [32:0] excExpFracY;
wire [8:0] eXmeY;
wire [8:0] eYmeX;
wire swap;
wire [33:0] newX;
wire [33:0] newY;
wire [7:0] expX;
wire [1:0] excX;
wire [1:0] excY;
wire signX;
wire signY;
wire EffSub;
wire [5:0] sXsYExnXY;
wire [3:0] sdExnXY;
wire [23:0] fracY;
reg [1:0] excRt;
wire signR;
wire [8:0] expDiff;
wire shiftedOut;
wire [4:0] shiftVal;
wire [49:0] shiftedFracY;
wire sticky;
wire [26:0] fracYfar;
wire [26:0] EffSubVector;
wire [26:0] fracYfarXorOp;
wire [26:0] fracXfar;
wire cInAddFar;
wire [26:0] fracAddResult;
wire [27:0] fracGRS;
wire [9:0] extendedExpInc;
wire [4:0] nZerosNew;
wire [27:0] shiftedFrac;
wire [9:0] updatedExp;
wire eqdiffsign;
wire [33:0] expFrac;
wire stk;
wire rnd;
wire grd;
wire lsb;
wire addToRoundBit;
wire [33:0] RoundedExpFrac;
wire [1:0] upExc;
wire [22:0] fracR;
wire [7:0] expR;
wire [3:0] exExpExc;
reg [1:0] excRt2;
wire [1:0] excR;
wire signR2;
wire [33:0] computedR;

  // Exponent difference and swap  --
  assign excExpFracX = {X[33:32],X[30:0]};
  assign excExpFracY = {Y[33:32],Y[30:0]};
  assign eXmeY = ({1'b0,X[30:23]}) - ({1'b0,Y[30:23]});
  assign eYmeX = ({1'b0,Y[30:23]}) - ({1'b0,X[30:23]});
  assign swap = excExpFracX >= excExpFracY ? 1'b0 : 1'b1;
  assign newX = swap == 1'b0 ? X : Y;
  assign newY = swap == 1'b0 ? Y : X;
  assign expX = newX[30:23];
  assign excX = newX[33:32];
  assign excY = newY[33:32];
  assign signX = newX[31];
  assign signY = newY[31];
  assign EffSub = signX ^ signY;
  assign sXsYExnXY = {signX,signY,excX,excY};
  assign sdExnXY = {excX,excY};
  assign fracY = excY == 2'b00 ? 24'b000000000000000000000000 : {1'b1,newY[22:0]};
  always @(*) begin
    case(sXsYExnXY)
      6'b000000,6'b010000,6'b100000,6'b110000 : excRt <= 2'b00;
      6'b000101,6'b010101,6'b100101,6'b110101,6'b000100,6'b010100,6'b100100,6'b110100,6'b000001,6'b010001,6'b100001,6'b110001 : excRt <= 2'b01;
      6'b111010,6'b001010,6'b001000,6'b011000,6'b101000,6'b111000,6'b000010,6'b010010,6'b100010,6'b110010,6'b001001,6'b011001,6'b101001,6'b111001,6'b000110,6'b010110,6'b100110,6'b110110 : excRt <= 2'b10;
      default : excRt <= 2'b11;
    endcase
  end

  assign signR = (sXsYExnXY == 6'b100000 || sXsYExnXY == 6'b010000) ? 1'b0 : signX;
  assign expDiff = swap == 1'b0 ? eXmeY : eYmeX;
  assign shiftedOut = (expDiff > 25) ? 1'b1 : 1'b0;
  assign shiftVal = shiftedOut == 1'b0 ? expDiff[4:0] : 5'b11010;
  RightShifter_24_by_max_26_comb_uid4 RightShifterComponent(
      .R(shiftedFracY),
    .S(shiftVal),
    .X(fracY));

  assign sticky = (shiftedFracY[23:0] == 24'b000000000000000000000000) ? 1'b0 : 1'b1;
  assign fracYfar = {1'b0,shiftedFracY[49:24]};
  assign EffSubVector = {EffSub,EffSub,EffSub,EffSub,EffSub,EffSub,EffSub,EffSub,EffSub,EffSub,EffSub,EffSub,EffSub,EffSub,EffSub,EffSub,EffSub,EffSub,EffSub,EffSub,EffSub,EffSub,EffSub,EffSub,EffSub,EffSub,EffSub};
  assign fracYfarXorOp = fracYfar ^ EffSubVector;
  assign fracXfar = {2'b01,newX[22:0],2'b00};
  assign cInAddFar = EffSub &  ~sticky;
  IntAdder_27_f400_uid8 fracAdder(
      .Cin(cInAddFar),
    .R(fracAddResult),
    .X(fracXfar),
    .Y(fracYfarXorOp));

  assign fracGRS = {fracAddResult,sticky};
  assign extendedExpInc = ({2'b00,expX}) + 1'b1;
  LZCShifter_28_to_28_counting_32_comb_uid16 LZC_component(
      .Count(nZerosNew),
    .I(fracGRS),
    .O(shiftedFrac));

  assign updatedExp = extendedExpInc - ({5'b00000,nZerosNew});
  assign eqdiffsign = nZerosNew == 5'b11111 ? 1'b1 : 1'b0;
  assign expFrac = {updatedExp,shiftedFrac[26:3]};
  assign stk = shiftedFrac[1] | shiftedFrac[0];
  assign rnd = shiftedFrac[2];
  assign grd = shiftedFrac[3];
  assign lsb = shiftedFrac[4];
  assign addToRoundBit = (lsb == 1'b0 && grd == 1'b1 && rnd == 1'b0 && stk == 1'b0) ? 1'b0 : 1'b1;
  IntAdder_34_f400_uid20 roundingAdder(
      .Cin(addToRoundBit),
    .R(RoundedExpFrac),
    .X(expFrac),
    .Y(34'b0000000000000000000000000000000000));

  assign upExc = RoundedExpFrac[33:32];
  assign fracR = RoundedExpFrac[23:1];
  assign expR = RoundedExpFrac[31:24];
  assign exExpExc = {upExc,excRt};
  always @(*) begin
    case(exExpExc)
      4'b0000,4'b0100,4'b1000,4'b1100,4'b1001,4'b1101 : excRt2 <= 2'b00;
      4'b0001 : excRt2 <= 2'b01;
      4'b0010,4'b0110,4'b1010,4'b1110,4'b0101 : excRt2 <= 2'b10;
      default : excRt2 <= 2'b11;
    endcase
  end

  assign excR = (eqdiffsign == 1'b1 && EffSub == 1'b1 && !(excRt == 2'b11)) ? 2'b00 : excRt2;
  assign signR2 = (eqdiffsign == 1'b1 && EffSub == 1'b1) ? 1'b0 : signR;
  assign computedR = {excR,signR2,expR,fracR};
  assign R = computedR;

endmodule
