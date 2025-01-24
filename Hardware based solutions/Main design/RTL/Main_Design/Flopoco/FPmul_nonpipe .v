// File teasnem_results/SmallMultTableP3x3r6XuYu_comb_uid8.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//                     SmallMultTableP3x3r6XuYu_comb_uid8
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Florent de Dinechin (2007-2012)
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
// no timescale needed

module SmallMultTableP3x3r6XuYu_comb_uid8(
input wire [5:0] X,
output wire [5:0] Y
);




reg [5:0] TableOut;

  always @(*) begin
    case(X)
      6'b000000 : TableOut <= 6'b000000;
      6'b000001 : TableOut <= 6'b000000;
      6'b000010 : TableOut <= 6'b000000;
      6'b000011 : TableOut <= 6'b000000;
      6'b000100 : TableOut <= 6'b000000;
      6'b000101 : TableOut <= 6'b000000;
      6'b000110 : TableOut <= 6'b000000;
      6'b000111 : TableOut <= 6'b000000;
      6'b001000 : TableOut <= 6'b000000;
      6'b001001 : TableOut <= 6'b000001;
      6'b001010 : TableOut <= 6'b000010;
      6'b001011 : TableOut <= 6'b000011;
      6'b001100 : TableOut <= 6'b000100;
      6'b001101 : TableOut <= 6'b000101;
      6'b001110 : TableOut <= 6'b000110;
      6'b001111 : TableOut <= 6'b000111;
      6'b010000 : TableOut <= 6'b000000;
      6'b010001 : TableOut <= 6'b000010;
      6'b010010 : TableOut <= 6'b000100;
      6'b010011 : TableOut <= 6'b000110;
      6'b010100 : TableOut <= 6'b001000;
      6'b010101 : TableOut <= 6'b001010;
      6'b010110 : TableOut <= 6'b001100;
      6'b010111 : TableOut <= 6'b001110;
      6'b011000 : TableOut <= 6'b000000;
      6'b011001 : TableOut <= 6'b000011;
      6'b011010 : TableOut <= 6'b000110;
      6'b011011 : TableOut <= 6'b001001;
      6'b011100 : TableOut <= 6'b001100;
      6'b011101 : TableOut <= 6'b001111;
      6'b011110 : TableOut <= 6'b010010;
      6'b011111 : TableOut <= 6'b010101;
      6'b100000 : TableOut <= 6'b000000;
      6'b100001 : TableOut <= 6'b000100;
      6'b100010 : TableOut <= 6'b001000;
      6'b100011 : TableOut <= 6'b001100;
      6'b100100 : TableOut <= 6'b010000;
      6'b100101 : TableOut <= 6'b010100;
      6'b100110 : TableOut <= 6'b011000;
      6'b100111 : TableOut <= 6'b011100;
      6'b101000 : TableOut <= 6'b000000;
      6'b101001 : TableOut <= 6'b000101;
      6'b101010 : TableOut <= 6'b001010;
      6'b101011 : TableOut <= 6'b001111;
      6'b101100 : TableOut <= 6'b010100;
      6'b101101 : TableOut <= 6'b011001;
      6'b101110 : TableOut <= 6'b011110;
      6'b101111 : TableOut <= 6'b100011;
      6'b110000 : TableOut <= 6'b000000;
      6'b110001 : TableOut <= 6'b000110;
      6'b110010 : TableOut <= 6'b001100;
      6'b110011 : TableOut <= 6'b010010;
      6'b110100 : TableOut <= 6'b011000;
      6'b110101 : TableOut <= 6'b011110;
      6'b110110 : TableOut <= 6'b100100;
      6'b110111 : TableOut <= 6'b101010;
      6'b111000 : TableOut <= 6'b000000;
      6'b111001 : TableOut <= 6'b000111;
      6'b111010 : TableOut <= 6'b001110;
      6'b111011 : TableOut <= 6'b010101;
      6'b111100 : TableOut <= 6'b011100;
      6'b111101 : TableOut <= 6'b100011;
      6'b111110 : TableOut <= 6'b101010;
      6'b111111 : TableOut <= 6'b110001;
      default : TableOut <= 6'bxxxxxx;
    endcase
  end

  assign Y = TableOut;

endmodule
// File teasnem_results/Compressor_6_3.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//                               Compressor_6_3
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Bogdan Popa, Illyes Kinga, 2012
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
// combinatorial
// no timescale needed

module Compressor_6_3(
input wire [5:0] X0,
output reg [2:0] R
);




wire [5:0] X;

  assign X = X0;
  always @(*) begin
    case(X)
      6'b000000 : R <= 3'b000;
      6'b000001 : R <= 3'b001;
      6'b000010 : R <= 3'b001;
      6'b000011 : R <= 3'b010;
      6'b000100 : R <= 3'b001;
      6'b000101 : R <= 3'b010;
      6'b000110 : R <= 3'b010;
      6'b000111 : R <= 3'b011;
      6'b001000 : R <= 3'b001;
      6'b001001 : R <= 3'b010;
      6'b001010 : R <= 3'b010;
      6'b001011 : R <= 3'b011;
      6'b001100 : R <= 3'b010;
      6'b001101 : R <= 3'b011;
      6'b001110 : R <= 3'b011;
      6'b001111 : R <= 3'b100;
      6'b010000 : R <= 3'b001;
      6'b010001 : R <= 3'b010;
      6'b010010 : R <= 3'b010;
      6'b010011 : R <= 3'b011;
      6'b010100 : R <= 3'b010;
      6'b010101 : R <= 3'b011;
      6'b010110 : R <= 3'b011;
      6'b010111 : R <= 3'b100;
      6'b011000 : R <= 3'b010;
      6'b011001 : R <= 3'b011;
      6'b011010 : R <= 3'b011;
      6'b011011 : R <= 3'b100;
      6'b011100 : R <= 3'b011;
      6'b011101 : R <= 3'b100;
      6'b011110 : R <= 3'b100;
      6'b011111 : R <= 3'b101;
      6'b100000 : R <= 3'b001;
      6'b100001 : R <= 3'b010;
      6'b100010 : R <= 3'b010;
      6'b100011 : R <= 3'b011;
      6'b100100 : R <= 3'b010;
      6'b100101 : R <= 3'b011;
      6'b100110 : R <= 3'b011;
      6'b100111 : R <= 3'b100;
      6'b101000 : R <= 3'b010;
      6'b101001 : R <= 3'b011;
      6'b101010 : R <= 3'b011;
      6'b101011 : R <= 3'b100;
      6'b101100 : R <= 3'b011;
      6'b101101 : R <= 3'b100;
      6'b101110 : R <= 3'b100;
      6'b101111 : R <= 3'b101;
      6'b110000 : R <= 3'b010;
      6'b110001 : R <= 3'b011;
      6'b110010 : R <= 3'b011;
      6'b110011 : R <= 3'b100;
      6'b110100 : R <= 3'b011;
      6'b110101 : R <= 3'b100;
      6'b110110 : R <= 3'b100;
      6'b110111 : R <= 3'b101;
      6'b111000 : R <= 3'b011;
      6'b111001 : R <= 3'b100;
      6'b111010 : R <= 3'b100;
      6'b111011 : R <= 3'b101;
      6'b111100 : R <= 3'b100;
      6'b111101 : R <= 3'b101;
      6'b111110 : R <= 3'b101;
      6'b111111 : R <= 3'b110;
      default : R <= 3'bxxx;
    endcase
  end


endmodule
// File teasnem_results/Compressor_14_3.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//                              Compressor_14_3
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Bogdan Popa, Illyes Kinga, 2012
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
// combinatorial
// no timescale needed

module Compressor_14_3(
input wire [3:0] X0,
input wire [0:0] X1,
output reg [2:0] R
);




wire [4:0] X;

  assign X = {X1,X0};
  always @(*) begin
    case(X)
      5'b00000 : R <= 3'b000;
      5'b00001 : R <= 3'b001;
      5'b00010 : R <= 3'b001;
      5'b00011 : R <= 3'b010;
      5'b00100 : R <= 3'b001;
      5'b00101 : R <= 3'b010;
      5'b00110 : R <= 3'b010;
      5'b00111 : R <= 3'b011;
      5'b01000 : R <= 3'b001;
      5'b01001 : R <= 3'b010;
      5'b01010 : R <= 3'b010;
      5'b01011 : R <= 3'b011;
      5'b01100 : R <= 3'b010;
      5'b01101 : R <= 3'b011;
      5'b01110 : R <= 3'b011;
      5'b01111 : R <= 3'b100;
      5'b10000 : R <= 3'b010;
      5'b10001 : R <= 3'b011;
      5'b10010 : R <= 3'b011;
      5'b10011 : R <= 3'b100;
      5'b10100 : R <= 3'b011;
      5'b10101 : R <= 3'b100;
      5'b10110 : R <= 3'b100;
      5'b10111 : R <= 3'b101;
      5'b11000 : R <= 3'b011;
      5'b11001 : R <= 3'b100;
      5'b11010 : R <= 3'b100;
      5'b11011 : R <= 3'b101;
      5'b11100 : R <= 3'b100;
      5'b11101 : R <= 3'b101;
      5'b11110 : R <= 3'b101;
      5'b11111 : R <= 3'b110;
      default : R <= 3'bxxx;
    endcase
  end


endmodule
// File teasnem_results/Compressor_4_3.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//                               Compressor_4_3
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Bogdan Popa, Illyes Kinga, 2012
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
// combinatorial
// no timescale needed

module Compressor_4_3(
input wire [3:0] X0,
output reg [2:0] R
);




wire [3:0] X;

  assign X = X0;
  always @(*) begin
    case(X)
      4'b0000 : R <= 3'b000;
      4'b0001 : R <= 3'b001;
      4'b0010 : R <= 3'b001;
      4'b0011 : R <= 3'b010;
      4'b0100 : R <= 3'b001;
      4'b0101 : R <= 3'b010;
      4'b0110 : R <= 3'b010;
      4'b0111 : R <= 3'b011;
      4'b1000 : R <= 3'b001;
      4'b1001 : R <= 3'b010;
      4'b1010 : R <= 3'b010;
      4'b1011 : R <= 3'b011;
      4'b1100 : R <= 3'b010;
      4'b1101 : R <= 3'b011;
      4'b1110 : R <= 3'b011;
      4'b1111 : R <= 3'b100;
      default : R <= 3'bxxx;
    endcase
  end


endmodule
// File teasnem_results/Compressor_23_3.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//                              Compressor_23_3
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Bogdan Popa, Illyes Kinga, 2012
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
// combinatorial
// no timescale needed

module Compressor_23_3(
input wire [2:0] X0,
input wire [1:0] X1,
output reg [2:0] R
);




wire [4:0] X;

  assign X = {X1,X0};
  always @(*) begin
    case(X)
      5'b00000 : R <= 3'b000;
      5'b00001 : R <= 3'b001;
      5'b00010 : R <= 3'b001;
      5'b00011 : R <= 3'b010;
      5'b00100 : R <= 3'b001;
      5'b00101 : R <= 3'b010;
      5'b00110 : R <= 3'b010;
      5'b00111 : R <= 3'b011;
      5'b01000 : R <= 3'b010;
      5'b01001 : R <= 3'b011;
      5'b01010 : R <= 3'b011;
      5'b01011 : R <= 3'b100;
      5'b01100 : R <= 3'b011;
      5'b01101 : R <= 3'b100;
      5'b01110 : R <= 3'b100;
      5'b01111 : R <= 3'b101;
      5'b10000 : R <= 3'b010;
      5'b10001 : R <= 3'b011;
      5'b10010 : R <= 3'b011;
      5'b10011 : R <= 3'b100;
      5'b10100 : R <= 3'b011;
      5'b10101 : R <= 3'b100;
      5'b10110 : R <= 3'b100;
      5'b10111 : R <= 3'b101;
      5'b11000 : R <= 3'b100;
      5'b11001 : R <= 3'b101;
      5'b11010 : R <= 3'b101;
      5'b11011 : R <= 3'b110;
      5'b11100 : R <= 3'b101;
      5'b11101 : R <= 3'b110;
      5'b11110 : R <= 3'b110;
      5'b11111 : R <= 3'b111;
      default : R <= 3'bxxx;
    endcase
  end


endmodule
// File teasnem_results/Compressor_13_3.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//                              Compressor_13_3
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Bogdan Popa, Illyes Kinga, 2012
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
// combinatorial
// no timescale needed

module Compressor_13_3(
input wire [2:0] X0,
input wire [0:0] X1,
output reg [2:0] R
);




wire [3:0] X;

  assign X = {X1,X0};
  always @(*) begin
    case(X)
      4'b0000 : R <= 3'b000;
      4'b0001 : R <= 3'b001;
      4'b0010 : R <= 3'b001;
      4'b0011 : R <= 3'b010;
      4'b0100 : R <= 3'b001;
      4'b0101 : R <= 3'b010;
      4'b0110 : R <= 3'b010;
      4'b0111 : R <= 3'b011;
      4'b1000 : R <= 3'b010;
      4'b1001 : R <= 3'b011;
      4'b1010 : R <= 3'b011;
      4'b1011 : R <= 3'b100;
      4'b1100 : R <= 3'b011;
      4'b1101 : R <= 3'b100;
      4'b1110 : R <= 3'b100;
      4'b1111 : R <= 3'b101;
      default : R <= 3'bxxx;
    endcase
  end


endmodule
// File teasnem_results/Compressor_3_2.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//                               Compressor_3_2
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Bogdan Popa, Illyes Kinga, 2012
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
// combinatorial
// no timescale needed

module Compressor_3_2(
input wire [2:0] X0,
output reg [1:0] R
);




wire [2:0] X;

  assign X = X0;
  always @(*) begin
    case(X)
      3'b000 : R <= 2'b00;
      3'b001 : R <= 2'b01;
      3'b010 : R <= 2'b01;
      3'b011 : R <= 2'b10;
      3'b100 : R <= 2'b01;
      3'b101 : R <= 2'b10;
      3'b110 : R <= 2'b10;
      3'b111 : R <= 2'b11;
      default : R <= 2'bxx;
    endcase
  end


endmodule
// File teasnem_results/IntAdder_45_f400_uid405.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//                          IntAdder_45_f400_uid405
//                    (IntAdderAlternative_45_comb_uid409)
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
// combinatorial
// no timescale needed

module IntAdder_45_f400_uid405(
input wire [44:0] X,
input wire [44:0] Y,
input wire Cin,
output wire [44:0] R
);





  //Alternative
  assign R = X + Y + Cin;

endmodule
// File teasnem_results/IntMultiplier_LogicOnly_24_24_48_unsigned_comb_uid4.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//            IntMultiplier_LogicOnly_24_24_48_unsigned_comb_uid4
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Florent de Dinechin, Kinga Illyes, Bogdan Popa, Bogdan Pasca, 2012
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
// combinatorial
// no timescale needed

module IntMultiplier_LogicOnly_24_24_48_unsigned_comb_uid4(
input wire [23:0] X,
input wire [23:0] Y,
output wire [47:0] R
);




wire [23:0] XX_m5;
wire [23:0] YY_m5;
wire [23:0] Xp_m5b0;
wire [23:0] Yp_m5b0;
wire [2:0] x_m5b0_0;
wire [2:0] x_m5b0_1;
wire [2:0] x_m5b0_2;
wire [2:0] x_m5b0_3;
wire [2:0] x_m5b0_4;
wire [2:0] x_m5b0_5;
wire [2:0] x_m5b0_6;
wire [2:0] x_m5b0_7;
wire [2:0] y_m5b0_0;
wire [2:0] y_m5b0_1;
wire [2:0] y_m5b0_2;
wire [2:0] y_m5b0_3;
wire [2:0] y_m5b0_4;
wire [2:0] y_m5b0_5;
wire [2:0] y_m5b0_6;
wire [2:0] y_m5b0_7;
wire [5:0] Y0X0_0_m5;
wire [5:0] PP0X0Y0_m5;
wire heap_bh6_w0_0;
wire heap_bh6_w1_0;
wire heap_bh6_w2_0;
wire heap_bh6_w3_0;
wire heap_bh6_w4_0;
wire heap_bh6_w5_0;
wire [5:0] Y0X1_0_m5;
wire [5:0] PP0X1Y0_m5;
wire heap_bh6_w3_1;
wire heap_bh6_w4_1;
wire heap_bh6_w5_1;
wire heap_bh6_w6_0;
wire heap_bh6_w7_0;
wire heap_bh6_w8_0;
wire [5:0] Y0X2_0_m5;
wire [5:0] PP0X2Y0_m5;
wire heap_bh6_w6_1;
wire heap_bh6_w7_1;
wire heap_bh6_w8_1;
wire heap_bh6_w9_0;
wire heap_bh6_w10_0;
wire heap_bh6_w11_0;
wire [5:0] Y0X3_0_m5;
wire [5:0] PP0X3Y0_m5;
wire heap_bh6_w9_1;
wire heap_bh6_w10_1;
wire heap_bh6_w11_1;
wire heap_bh6_w12_0;
wire heap_bh6_w13_0;
wire heap_bh6_w14_0;
wire [5:0] Y0X4_0_m5;
wire [5:0] PP0X4Y0_m5;
wire heap_bh6_w12_1;
wire heap_bh6_w13_1;
wire heap_bh6_w14_1;
wire heap_bh6_w15_0;
wire heap_bh6_w16_0;
wire heap_bh6_w17_0;
wire [5:0] Y0X5_0_m5;
wire [5:0] PP0X5Y0_m5;
wire heap_bh6_w15_1;
wire heap_bh6_w16_1;
wire heap_bh6_w17_1;
wire heap_bh6_w18_0;
wire heap_bh6_w19_0;
wire heap_bh6_w20_0;
wire [5:0] Y0X6_0_m5;
wire [5:0] PP0X6Y0_m5;
wire heap_bh6_w18_1;
wire heap_bh6_w19_1;
wire heap_bh6_w20_1;
wire heap_bh6_w21_0;
wire heap_bh6_w22_0;
wire heap_bh6_w23_0;
wire [5:0] Y0X7_0_m5;
wire [5:0] PP0X7Y0_m5;
wire heap_bh6_w21_1;
wire heap_bh6_w22_1;
wire heap_bh6_w23_1;
wire heap_bh6_w24_0;
wire heap_bh6_w25_0;
wire heap_bh6_w26_0;
wire [5:0] Y1X0_0_m5;
wire [5:0] PP0X0Y1_m5;
wire heap_bh6_w3_2;
wire heap_bh6_w4_2;
wire heap_bh6_w5_2;
wire heap_bh6_w6_2;
wire heap_bh6_w7_2;
wire heap_bh6_w8_2;
wire [5:0] Y1X1_0_m5;
wire [5:0] PP0X1Y1_m5;
wire heap_bh6_w6_3;
wire heap_bh6_w7_3;
wire heap_bh6_w8_3;
wire heap_bh6_w9_2;
wire heap_bh6_w10_2;
wire heap_bh6_w11_2;
wire [5:0] Y1X2_0_m5;
wire [5:0] PP0X2Y1_m5;
wire heap_bh6_w9_3;
wire heap_bh6_w10_3;
wire heap_bh6_w11_3;
wire heap_bh6_w12_2;
wire heap_bh6_w13_2;
wire heap_bh6_w14_2;
wire [5:0] Y1X3_0_m5;
wire [5:0] PP0X3Y1_m5;
wire heap_bh6_w12_3;
wire heap_bh6_w13_3;
wire heap_bh6_w14_3;
wire heap_bh6_w15_2;
wire heap_bh6_w16_2;
wire heap_bh6_w17_2;
wire [5:0] Y1X4_0_m5;
wire [5:0] PP0X4Y1_m5;
wire heap_bh6_w15_3;
wire heap_bh6_w16_3;
wire heap_bh6_w17_3;
wire heap_bh6_w18_2;
wire heap_bh6_w19_2;
wire heap_bh6_w20_2;
wire [5:0] Y1X5_0_m5;
wire [5:0] PP0X5Y1_m5;
wire heap_bh6_w18_3;
wire heap_bh6_w19_3;
wire heap_bh6_w20_3;
wire heap_bh6_w21_2;
wire heap_bh6_w22_2;
wire heap_bh6_w23_2;
wire [5:0] Y1X6_0_m5;
wire [5:0] PP0X6Y1_m5;
wire heap_bh6_w21_3;
wire heap_bh6_w22_3;
wire heap_bh6_w23_3;
wire heap_bh6_w24_1;
wire heap_bh6_w25_1;
wire heap_bh6_w26_1;
wire [5:0] Y1X7_0_m5;
wire [5:0] PP0X7Y1_m5;
wire heap_bh6_w24_2;
wire heap_bh6_w25_2;
wire heap_bh6_w26_2;
wire heap_bh6_w27_0;
wire heap_bh6_w28_0;
wire heap_bh6_w29_0;
wire [5:0] Y2X0_0_m5;
wire [5:0] PP0X0Y2_m5;
wire heap_bh6_w6_4;
wire heap_bh6_w7_4;
wire heap_bh6_w8_4;
wire heap_bh6_w9_4;
wire heap_bh6_w10_4;
wire heap_bh6_w11_4;
wire [5:0] Y2X1_0_m5;
wire [5:0] PP0X1Y2_m5;
wire heap_bh6_w9_5;
wire heap_bh6_w10_5;
wire heap_bh6_w11_5;
wire heap_bh6_w12_4;
wire heap_bh6_w13_4;
wire heap_bh6_w14_4;
wire [5:0] Y2X2_0_m5;
wire [5:0] PP0X2Y2_m5;
wire heap_bh6_w12_5;
wire heap_bh6_w13_5;
wire heap_bh6_w14_5;
wire heap_bh6_w15_4;
wire heap_bh6_w16_4;
wire heap_bh6_w17_4;
wire [5:0] Y2X3_0_m5;
wire [5:0] PP0X3Y2_m5;
wire heap_bh6_w15_5;
wire heap_bh6_w16_5;
wire heap_bh6_w17_5;
wire heap_bh6_w18_4;
wire heap_bh6_w19_4;
wire heap_bh6_w20_4;
wire [5:0] Y2X4_0_m5;
wire [5:0] PP0X4Y2_m5;
wire heap_bh6_w18_5;
wire heap_bh6_w19_5;
wire heap_bh6_w20_5;
wire heap_bh6_w21_4;
wire heap_bh6_w22_4;
wire heap_bh6_w23_4;
wire [5:0] Y2X5_0_m5;
wire [5:0] PP0X5Y2_m5;
wire heap_bh6_w21_5;
wire heap_bh6_w22_5;
wire heap_bh6_w23_5;
wire heap_bh6_w24_3;
wire heap_bh6_w25_3;
wire heap_bh6_w26_3;
wire [5:0] Y2X6_0_m5;
wire [5:0] PP0X6Y2_m5;
wire heap_bh6_w24_4;
wire heap_bh6_w25_4;
wire heap_bh6_w26_4;
wire heap_bh6_w27_1;
wire heap_bh6_w28_1;
wire heap_bh6_w29_1;
wire [5:0] Y2X7_0_m5;
wire [5:0] PP0X7Y2_m5;
wire heap_bh6_w27_2;
wire heap_bh6_w28_2;
wire heap_bh6_w29_2;
wire heap_bh6_w30_0;
wire heap_bh6_w31_0;
wire heap_bh6_w32_0;
wire [5:0] Y3X0_0_m5;
wire [5:0] PP0X0Y3_m5;
wire heap_bh6_w9_6;
wire heap_bh6_w10_6;
wire heap_bh6_w11_6;
wire heap_bh6_w12_6;
wire heap_bh6_w13_6;
wire heap_bh6_w14_6;
wire [5:0] Y3X1_0_m5;
wire [5:0] PP0X1Y3_m5;
wire heap_bh6_w12_7;
wire heap_bh6_w13_7;
wire heap_bh6_w14_7;
wire heap_bh6_w15_6;
wire heap_bh6_w16_6;
wire heap_bh6_w17_6;
wire [5:0] Y3X2_0_m5;
wire [5:0] PP0X2Y3_m5;
wire heap_bh6_w15_7;
wire heap_bh6_w16_7;
wire heap_bh6_w17_7;
wire heap_bh6_w18_6;
wire heap_bh6_w19_6;
wire heap_bh6_w20_6;
wire [5:0] Y3X3_0_m5;
wire [5:0] PP0X3Y3_m5;
wire heap_bh6_w18_7;
wire heap_bh6_w19_7;
wire heap_bh6_w20_7;
wire heap_bh6_w21_6;
wire heap_bh6_w22_6;
wire heap_bh6_w23_6;
wire [5:0] Y3X4_0_m5;
wire [5:0] PP0X4Y3_m5;
wire heap_bh6_w21_7;
wire heap_bh6_w22_7;
wire heap_bh6_w23_7;
wire heap_bh6_w24_5;
wire heap_bh6_w25_5;
wire heap_bh6_w26_5;
wire [5:0] Y3X5_0_m5;
wire [5:0] PP0X5Y3_m5;
wire heap_bh6_w24_6;
wire heap_bh6_w25_6;
wire heap_bh6_w26_6;
wire heap_bh6_w27_3;
wire heap_bh6_w28_3;
wire heap_bh6_w29_3;
wire [5:0] Y3X6_0_m5;
wire [5:0] PP0X6Y3_m5;
wire heap_bh6_w27_4;
wire heap_bh6_w28_4;
wire heap_bh6_w29_4;
wire heap_bh6_w30_1;
wire heap_bh6_w31_1;
wire heap_bh6_w32_1;
wire [5:0] Y3X7_0_m5;
wire [5:0] PP0X7Y3_m5;
wire heap_bh6_w30_2;
wire heap_bh6_w31_2;
wire heap_bh6_w32_2;
wire heap_bh6_w33_0;
wire heap_bh6_w34_0;
wire heap_bh6_w35_0;
wire [5:0] Y4X0_0_m5;
wire [5:0] PP0X0Y4_m5;
wire heap_bh6_w12_8;
wire heap_bh6_w13_8;
wire heap_bh6_w14_8;
wire heap_bh6_w15_8;
wire heap_bh6_w16_8;
wire heap_bh6_w17_8;
wire [5:0] Y4X1_0_m5;
wire [5:0] PP0X1Y4_m5;
wire heap_bh6_w15_9;
wire heap_bh6_w16_9;
wire heap_bh6_w17_9;
wire heap_bh6_w18_8;
wire heap_bh6_w19_8;
wire heap_bh6_w20_8;
wire [5:0] Y4X2_0_m5;
wire [5:0] PP0X2Y4_m5;
wire heap_bh6_w18_9;
wire heap_bh6_w19_9;
wire heap_bh6_w20_9;
wire heap_bh6_w21_8;
wire heap_bh6_w22_8;
wire heap_bh6_w23_8;
wire [5:0] Y4X3_0_m5;
wire [5:0] PP0X3Y4_m5;
wire heap_bh6_w21_9;
wire heap_bh6_w22_9;
wire heap_bh6_w23_9;
wire heap_bh6_w24_7;
wire heap_bh6_w25_7;
wire heap_bh6_w26_7;
wire [5:0] Y4X4_0_m5;
wire [5:0] PP0X4Y4_m5;
wire heap_bh6_w24_8;
wire heap_bh6_w25_8;
wire heap_bh6_w26_8;
wire heap_bh6_w27_5;
wire heap_bh6_w28_5;
wire heap_bh6_w29_5;
wire [5:0] Y4X5_0_m5;
wire [5:0] PP0X5Y4_m5;
wire heap_bh6_w27_6;
wire heap_bh6_w28_6;
wire heap_bh6_w29_6;
wire heap_bh6_w30_3;
wire heap_bh6_w31_3;
wire heap_bh6_w32_3;
wire [5:0] Y4X6_0_m5;
wire [5:0] PP0X6Y4_m5;
wire heap_bh6_w30_4;
wire heap_bh6_w31_4;
wire heap_bh6_w32_4;
wire heap_bh6_w33_1;
wire heap_bh6_w34_1;
wire heap_bh6_w35_1;
wire [5:0] Y4X7_0_m5;
wire [5:0] PP0X7Y4_m5;
wire heap_bh6_w33_2;
wire heap_bh6_w34_2;
wire heap_bh6_w35_2;
wire heap_bh6_w36_0;
wire heap_bh6_w37_0;
wire heap_bh6_w38_0;
wire [5:0] Y5X0_0_m5;
wire [5:0] PP0X0Y5_m5;
wire heap_bh6_w15_10;
wire heap_bh6_w16_10;
wire heap_bh6_w17_10;
wire heap_bh6_w18_10;
wire heap_bh6_w19_10;
wire heap_bh6_w20_10;
wire [5:0] Y5X1_0_m5;
wire [5:0] PP0X1Y5_m5;
wire heap_bh6_w18_11;
wire heap_bh6_w19_11;
wire heap_bh6_w20_11;
wire heap_bh6_w21_10;
wire heap_bh6_w22_10;
wire heap_bh6_w23_10;
wire [5:0] Y5X2_0_m5;
wire [5:0] PP0X2Y5_m5;
wire heap_bh6_w21_11;
wire heap_bh6_w22_11;
wire heap_bh6_w23_11;
wire heap_bh6_w24_9;
wire heap_bh6_w25_9;
wire heap_bh6_w26_9;
wire [5:0] Y5X3_0_m5;
wire [5:0] PP0X3Y5_m5;
wire heap_bh6_w24_10;
wire heap_bh6_w25_10;
wire heap_bh6_w26_10;
wire heap_bh6_w27_7;
wire heap_bh6_w28_7;
wire heap_bh6_w29_7;
wire [5:0] Y5X4_0_m5;
wire [5:0] PP0X4Y5_m5;
wire heap_bh6_w27_8;
wire heap_bh6_w28_8;
wire heap_bh6_w29_8;
wire heap_bh6_w30_5;
wire heap_bh6_w31_5;
wire heap_bh6_w32_5;
wire [5:0] Y5X5_0_m5;
wire [5:0] PP0X5Y5_m5;
wire heap_bh6_w30_6;
wire heap_bh6_w31_6;
wire heap_bh6_w32_6;
wire heap_bh6_w33_3;
wire heap_bh6_w34_3;
wire heap_bh6_w35_3;
wire [5:0] Y5X6_0_m5;
wire [5:0] PP0X6Y5_m5;
wire heap_bh6_w33_4;
wire heap_bh6_w34_4;
wire heap_bh6_w35_4;
wire heap_bh6_w36_1;
wire heap_bh6_w37_1;
wire heap_bh6_w38_1;
wire [5:0] Y5X7_0_m5;
wire [5:0] PP0X7Y5_m5;
wire heap_bh6_w36_2;
wire heap_bh6_w37_2;
wire heap_bh6_w38_2;
wire heap_bh6_w39_0;
wire heap_bh6_w40_0;
wire heap_bh6_w41_0;
wire [5:0] Y6X0_0_m5;
wire [5:0] PP0X0Y6_m5;
wire heap_bh6_w18_12;
wire heap_bh6_w19_12;
wire heap_bh6_w20_12;
wire heap_bh6_w21_12;
wire heap_bh6_w22_12;
wire heap_bh6_w23_12;
wire [5:0] Y6X1_0_m5;
wire [5:0] PP0X1Y6_m5;
wire heap_bh6_w21_13;
wire heap_bh6_w22_13;
wire heap_bh6_w23_13;
wire heap_bh6_w24_11;
wire heap_bh6_w25_11;
wire heap_bh6_w26_11;
wire [5:0] Y6X2_0_m5;
wire [5:0] PP0X2Y6_m5;
wire heap_bh6_w24_12;
wire heap_bh6_w25_12;
wire heap_bh6_w26_12;
wire heap_bh6_w27_9;
wire heap_bh6_w28_9;
wire heap_bh6_w29_9;
wire [5:0] Y6X3_0_m5;
wire [5:0] PP0X3Y6_m5;
wire heap_bh6_w27_10;
wire heap_bh6_w28_10;
wire heap_bh6_w29_10;
wire heap_bh6_w30_7;
wire heap_bh6_w31_7;
wire heap_bh6_w32_7;
wire [5:0] Y6X4_0_m5;
wire [5:0] PP0X4Y6_m5;
wire heap_bh6_w30_8;
wire heap_bh6_w31_8;
wire heap_bh6_w32_8;
wire heap_bh6_w33_5;
wire heap_bh6_w34_5;
wire heap_bh6_w35_5;
wire [5:0] Y6X5_0_m5;
wire [5:0] PP0X5Y6_m5;
wire heap_bh6_w33_6;
wire heap_bh6_w34_6;
wire heap_bh6_w35_6;
wire heap_bh6_w36_3;
wire heap_bh6_w37_3;
wire heap_bh6_w38_3;
wire [5:0] Y6X6_0_m5;
wire [5:0] PP0X6Y6_m5;
wire heap_bh6_w36_4;
wire heap_bh6_w37_4;
wire heap_bh6_w38_4;
wire heap_bh6_w39_1;
wire heap_bh6_w40_1;
wire heap_bh6_w41_1;
wire [5:0] Y6X7_0_m5;
wire [5:0] PP0X7Y6_m5;
wire heap_bh6_w39_2;
wire heap_bh6_w40_2;
wire heap_bh6_w41_2;
wire heap_bh6_w42_0;
wire heap_bh6_w43_0;
wire heap_bh6_w44_0;
wire [5:0] Y7X0_0_m5;
wire [5:0] PP0X0Y7_m5;
wire heap_bh6_w21_14;
wire heap_bh6_w22_14;
wire heap_bh6_w23_14;
wire heap_bh6_w24_13;
wire heap_bh6_w25_13;
wire heap_bh6_w26_13;
wire [5:0] Y7X1_0_m5;
wire [5:0] PP0X1Y7_m5;
wire heap_bh6_w24_14;
wire heap_bh6_w25_14;
wire heap_bh6_w26_14;
wire heap_bh6_w27_11;
wire heap_bh6_w28_11;
wire heap_bh6_w29_11;
wire [5:0] Y7X2_0_m5;
wire [5:0] PP0X2Y7_m5;
wire heap_bh6_w27_12;
wire heap_bh6_w28_12;
wire heap_bh6_w29_12;
wire heap_bh6_w30_9;
wire heap_bh6_w31_9;
wire heap_bh6_w32_9;
wire [5:0] Y7X3_0_m5;
wire [5:0] PP0X3Y7_m5;
wire heap_bh6_w30_10;
wire heap_bh6_w31_10;
wire heap_bh6_w32_10;
wire heap_bh6_w33_7;
wire heap_bh6_w34_7;
wire heap_bh6_w35_7;
wire [5:0] Y7X4_0_m5;
wire [5:0] PP0X4Y7_m5;
wire heap_bh6_w33_8;
wire heap_bh6_w34_8;
wire heap_bh6_w35_8;
wire heap_bh6_w36_5;
wire heap_bh6_w37_5;
wire heap_bh6_w38_5;
wire [5:0] Y7X5_0_m5;
wire [5:0] PP0X5Y7_m5;
wire heap_bh6_w36_6;
wire heap_bh6_w37_6;
wire heap_bh6_w38_6;
wire heap_bh6_w39_3;
wire heap_bh6_w40_3;
wire heap_bh6_w41_3;
wire [5:0] Y7X6_0_m5;
wire [5:0] PP0X6Y7_m5;
wire heap_bh6_w39_4;
wire heap_bh6_w40_4;
wire heap_bh6_w41_4;
wire heap_bh6_w42_1;
wire heap_bh6_w43_1;
wire heap_bh6_w44_1;
wire [5:0] Y7X7_0_m5;
wire [5:0] PP0X7Y7_m5;
wire heap_bh6_w42_2;
wire heap_bh6_w43_2;
wire heap_bh6_w44_2;
wire heap_bh6_w45_0;
wire heap_bh6_w46_0;
wire heap_bh6_w47_0;
wire [2:0] tempR_bh6_0;
wire [5:0] CompressorIn_bh6_0_0;
wire [2:0] CompressorOut_bh6_0_0;
wire heap_bh6_w9_7;
wire heap_bh6_w10_7;
wire heap_bh6_w11_7;
wire [5:0] CompressorIn_bh6_1_1;
wire [2:0] CompressorOut_bh6_1_1;
wire heap_bh6_w10_8;
wire heap_bh6_w11_8;
wire heap_bh6_w12_9;
wire [5:0] CompressorIn_bh6_2_2;
wire [2:0] CompressorOut_bh6_2_2;
wire heap_bh6_w11_9;
wire heap_bh6_w12_10;
wire heap_bh6_w13_9;
wire [5:0] CompressorIn_bh6_3_3;
wire [2:0] CompressorOut_bh6_3_3;
wire heap_bh6_w12_11;
wire heap_bh6_w13_10;
wire heap_bh6_w14_9;
wire [5:0] CompressorIn_bh6_4_4;
wire [2:0] CompressorOut_bh6_4_4;
wire heap_bh6_w13_11;
wire heap_bh6_w14_10;
wire heap_bh6_w15_11;
wire [5:0] CompressorIn_bh6_5_5;
wire [2:0] CompressorOut_bh6_5_5;
wire heap_bh6_w14_11;
wire heap_bh6_w15_12;
wire heap_bh6_w16_11;
wire [5:0] CompressorIn_bh6_6_6;
wire [2:0] CompressorOut_bh6_6_6;
wire heap_bh6_w15_13;
wire heap_bh6_w16_12;
wire heap_bh6_w17_11;
wire [5:0] CompressorIn_bh6_7_7;
wire [2:0] CompressorOut_bh6_7_7;
wire heap_bh6_w16_13;
wire heap_bh6_w17_12;
wire heap_bh6_w18_13;
wire [5:0] CompressorIn_bh6_8_8;
wire [2:0] CompressorOut_bh6_8_8;
wire heap_bh6_w17_13;
wire heap_bh6_w18_14;
wire heap_bh6_w19_13;
wire [5:0] CompressorIn_bh6_9_9;
wire [2:0] CompressorOut_bh6_9_9;
wire heap_bh6_w18_15;
wire heap_bh6_w19_14;
wire heap_bh6_w20_13;
wire [5:0] CompressorIn_bh6_10_10;
wire [2:0] CompressorOut_bh6_10_10;
wire heap_bh6_w18_16;
wire heap_bh6_w19_15;
wire heap_bh6_w20_14;
wire [5:0] CompressorIn_bh6_11_11;
wire [2:0] CompressorOut_bh6_11_11;
wire heap_bh6_w19_16;
wire heap_bh6_w20_15;
wire heap_bh6_w21_15;
wire [5:0] CompressorIn_bh6_12_12;
wire [2:0] CompressorOut_bh6_12_12;
wire heap_bh6_w19_17;
wire heap_bh6_w20_16;
wire heap_bh6_w21_16;
wire [5:0] CompressorIn_bh6_13_13;
wire [2:0] CompressorOut_bh6_13_13;
wire heap_bh6_w20_17;
wire heap_bh6_w21_17;
wire heap_bh6_w22_15;
wire [5:0] CompressorIn_bh6_14_14;
wire [2:0] CompressorOut_bh6_14_14;
wire heap_bh6_w20_18;
wire heap_bh6_w21_18;
wire heap_bh6_w22_16;
wire [5:0] CompressorIn_bh6_15_15;
wire [2:0] CompressorOut_bh6_15_15;
wire heap_bh6_w21_19;
wire heap_bh6_w22_17;
wire heap_bh6_w23_15;
wire [5:0] CompressorIn_bh6_16_16;
wire [2:0] CompressorOut_bh6_16_16;
wire heap_bh6_w21_20;
wire heap_bh6_w22_18;
wire heap_bh6_w23_16;
wire [5:0] CompressorIn_bh6_17_17;
wire [2:0] CompressorOut_bh6_17_17;
wire heap_bh6_w22_19;
wire heap_bh6_w23_17;
wire heap_bh6_w24_15;
wire [5:0] CompressorIn_bh6_18_18;
wire [2:0] CompressorOut_bh6_18_18;
wire heap_bh6_w22_20;
wire heap_bh6_w23_18;
wire heap_bh6_w24_16;
wire [5:0] CompressorIn_bh6_19_19;
wire [2:0] CompressorOut_bh6_19_19;
wire heap_bh6_w23_19;
wire heap_bh6_w24_17;
wire heap_bh6_w25_15;
wire [5:0] CompressorIn_bh6_20_20;
wire [2:0] CompressorOut_bh6_20_20;
wire heap_bh6_w23_20;
wire heap_bh6_w24_18;
wire heap_bh6_w25_16;
wire [5:0] CompressorIn_bh6_21_21;
wire [2:0] CompressorOut_bh6_21_21;
wire heap_bh6_w24_19;
wire heap_bh6_w25_17;
wire heap_bh6_w26_15;
wire [5:0] CompressorIn_bh6_22_22;
wire [2:0] CompressorOut_bh6_22_22;
wire heap_bh6_w24_20;
wire heap_bh6_w25_18;
wire heap_bh6_w26_16;
wire [5:0] CompressorIn_bh6_23_23;
wire [2:0] CompressorOut_bh6_23_23;
wire heap_bh6_w25_19;
wire heap_bh6_w26_17;
wire heap_bh6_w27_13;
wire [5:0] CompressorIn_bh6_24_24;
wire [2:0] CompressorOut_bh6_24_24;
wire heap_bh6_w25_20;
wire heap_bh6_w26_18;
wire heap_bh6_w27_14;
wire [5:0] CompressorIn_bh6_25_25;
wire [2:0] CompressorOut_bh6_25_25;
wire heap_bh6_w26_19;
wire heap_bh6_w27_15;
wire heap_bh6_w28_13;
wire [5:0] CompressorIn_bh6_26_26;
wire [2:0] CompressorOut_bh6_26_26;
wire heap_bh6_w26_20;
wire heap_bh6_w27_16;
wire heap_bh6_w28_14;
wire [5:0] CompressorIn_bh6_27_27;
wire [2:0] CompressorOut_bh6_27_27;
wire heap_bh6_w27_17;
wire heap_bh6_w28_15;
wire heap_bh6_w29_13;
wire [5:0] CompressorIn_bh6_28_28;
wire [2:0] CompressorOut_bh6_28_28;
wire heap_bh6_w27_18;
wire heap_bh6_w28_16;
wire heap_bh6_w29_14;
wire [5:0] CompressorIn_bh6_29_29;
wire [2:0] CompressorOut_bh6_29_29;
wire heap_bh6_w28_17;
wire heap_bh6_w29_15;
wire heap_bh6_w30_11;
wire [5:0] CompressorIn_bh6_30_30;
wire [2:0] CompressorOut_bh6_30_30;
wire heap_bh6_w28_18;
wire heap_bh6_w29_16;
wire heap_bh6_w30_12;
wire [5:0] CompressorIn_bh6_31_31;
wire [2:0] CompressorOut_bh6_31_31;
wire heap_bh6_w29_17;
wire heap_bh6_w30_13;
wire heap_bh6_w31_11;
wire [5:0] CompressorIn_bh6_32_32;
wire [2:0] CompressorOut_bh6_32_32;
wire heap_bh6_w29_18;
wire heap_bh6_w30_14;
wire heap_bh6_w31_12;
wire [5:0] CompressorIn_bh6_33_33;
wire [2:0] CompressorOut_bh6_33_33;
wire heap_bh6_w30_15;
wire heap_bh6_w31_13;
wire heap_bh6_w32_11;
wire [5:0] CompressorIn_bh6_34_34;
wire [2:0] CompressorOut_bh6_34_34;
wire heap_bh6_w31_14;
wire heap_bh6_w32_12;
wire heap_bh6_w33_9;
wire [5:0] CompressorIn_bh6_35_35;
wire [2:0] CompressorOut_bh6_35_35;
wire heap_bh6_w32_13;
wire heap_bh6_w33_10;
wire heap_bh6_w34_9;
wire [5:0] CompressorIn_bh6_36_36;
wire [2:0] CompressorOut_bh6_36_36;
wire heap_bh6_w33_11;
wire heap_bh6_w34_10;
wire heap_bh6_w35_9;
wire [5:0] CompressorIn_bh6_37_37;
wire [2:0] CompressorOut_bh6_37_37;
wire heap_bh6_w34_11;
wire heap_bh6_w35_10;
wire heap_bh6_w36_7;
wire [5:0] CompressorIn_bh6_38_38;
wire [2:0] CompressorOut_bh6_38_38;
wire heap_bh6_w35_11;
wire heap_bh6_w36_8;
wire heap_bh6_w37_7;
wire [5:0] CompressorIn_bh6_39_39;
wire [2:0] CompressorOut_bh6_39_39;
wire heap_bh6_w36_9;
wire heap_bh6_w37_8;
wire heap_bh6_w38_7;
wire [5:0] CompressorIn_bh6_40_40;
wire [2:0] CompressorOut_bh6_40_40;
wire heap_bh6_w37_9;
wire heap_bh6_w38_8;
wire heap_bh6_w39_5;
wire [5:0] CompressorIn_bh6_41_41;
wire [2:0] CompressorOut_bh6_41_41;
wire heap_bh6_w38_9;
wire heap_bh6_w39_6;
wire heap_bh6_w40_5;
wire [3:0] CompressorIn_bh6_42_42;
wire [0:0] CompressorIn_bh6_42_43;
wire [2:0] CompressorOut_bh6_42_42;
wire heap_bh6_w6_5;
wire heap_bh6_w7_5;
wire heap_bh6_w8_5;
wire [3:0] CompressorIn_bh6_43_44;
wire [0:0] CompressorIn_bh6_43_45;
wire [2:0] CompressorOut_bh6_43_43;
wire heap_bh6_w7_6;
wire heap_bh6_w8_6;
wire heap_bh6_w9_8;
wire [3:0] CompressorIn_bh6_44_46;
wire [0:0] CompressorIn_bh6_44_47;
wire [2:0] CompressorOut_bh6_44_44;
wire heap_bh6_w8_7;
wire heap_bh6_w9_9;
wire heap_bh6_w10_9;
wire [3:0] CompressorIn_bh6_45_48;
wire [0:0] CompressorIn_bh6_45_49;
wire [2:0] CompressorOut_bh6_45_45;
wire heap_bh6_w15_14;
wire heap_bh6_w16_14;
wire heap_bh6_w17_14;
wire [3:0] CompressorIn_bh6_46_50;
wire [0:0] CompressorIn_bh6_46_51;
wire [2:0] CompressorOut_bh6_46_46;
wire heap_bh6_w16_15;
wire heap_bh6_w17_15;
wire heap_bh6_w18_17;
wire [3:0] CompressorIn_bh6_47_52;
wire [0:0] CompressorIn_bh6_47_53;
wire [2:0] CompressorOut_bh6_47_47;
wire heap_bh6_w17_16;
wire heap_bh6_w18_18;
wire heap_bh6_w19_18;
wire [3:0] CompressorIn_bh6_48_54;
wire [0:0] CompressorIn_bh6_48_55;
wire [2:0] CompressorOut_bh6_48_48;
wire heap_bh6_w30_16;
wire heap_bh6_w31_15;
wire heap_bh6_w32_14;
wire [3:0] CompressorIn_bh6_49_56;
wire [0:0] CompressorIn_bh6_49_57;
wire [2:0] CompressorOut_bh6_49_49;
wire heap_bh6_w31_16;
wire heap_bh6_w32_15;
wire heap_bh6_w33_12;
wire [3:0] CompressorIn_bh6_50_58;
wire [0:0] CompressorIn_bh6_50_59;
wire [2:0] CompressorOut_bh6_50_50;
wire heap_bh6_w32_16;
wire heap_bh6_w33_13;
wire heap_bh6_w34_12;
wire [3:0] CompressorIn_bh6_51_60;
wire [0:0] CompressorIn_bh6_51_61;
wire [2:0] CompressorOut_bh6_51_51;
wire heap_bh6_w39_7;
wire heap_bh6_w40_6;
wire heap_bh6_w41_5;
wire [3:0] CompressorIn_bh6_52_62;
wire [0:0] CompressorIn_bh6_52_63;
wire [2:0] CompressorOut_bh6_52_52;
wire heap_bh6_w40_7;
wire heap_bh6_w41_6;
wire heap_bh6_w42_3;
wire [3:0] CompressorIn_bh6_53_64;
wire [0:0] CompressorIn_bh6_53_65;
wire [2:0] CompressorOut_bh6_53_53;
wire heap_bh6_w41_7;
wire heap_bh6_w42_4;
wire heap_bh6_w43_3;
wire [2:0] CompressorIn_bh6_54_66;
wire [1:0] CompressorIn_bh6_54_67;
wire [2:0] CompressorOut_bh6_54_54;
wire heap_bh6_w3_3;
wire heap_bh6_w4_3;
wire heap_bh6_w5_3;
wire [2:0] CompressorIn_bh6_55_68;
wire [1:0] CompressorIn_bh6_55_69;
wire [2:0] CompressorOut_bh6_55_55;
wire heap_bh6_w12_12;
wire heap_bh6_w13_12;
wire heap_bh6_w14_12;
wire [2:0] CompressorIn_bh6_56_70;
wire [1:0] CompressorIn_bh6_56_71;
wire [2:0] CompressorOut_bh6_56_56;
wire heap_bh6_w21_21;
wire heap_bh6_w22_21;
wire heap_bh6_w23_21;
wire [2:0] CompressorIn_bh6_57_72;
wire [1:0] CompressorIn_bh6_57_73;
wire [2:0] CompressorOut_bh6_57_57;
wire heap_bh6_w23_22;
wire heap_bh6_w24_21;
wire heap_bh6_w25_21;
wire [2:0] CompressorIn_bh6_58_74;
wire [1:0] CompressorIn_bh6_58_75;
wire [2:0] CompressorOut_bh6_58_58;
wire heap_bh6_w25_22;
wire heap_bh6_w26_21;
wire heap_bh6_w27_19;
wire [2:0] CompressorIn_bh6_59_76;
wire [1:0] CompressorIn_bh6_59_77;
wire [2:0] CompressorOut_bh6_59_59;
wire heap_bh6_w34_13;
wire heap_bh6_w35_12;
wire heap_bh6_w36_10;
wire [2:0] CompressorIn_bh6_60_78;
wire [1:0] CompressorIn_bh6_60_79;
wire [2:0] CompressorOut_bh6_60_60;
wire heap_bh6_w43_4;
wire heap_bh6_w44_3;
wire heap_bh6_w45_1;
wire [2:0] CompressorIn_bh6_61_80;
wire [0:0] CompressorIn_bh6_61_81;
wire [2:0] CompressorOut_bh6_61_61;
wire heap_bh6_w5_4;
wire heap_bh6_w6_6;
wire heap_bh6_w7_7;
wire [2:0] CompressorIn_bh6_62_82;
wire [0:0] CompressorIn_bh6_62_83;
wire [2:0] CompressorOut_bh6_62_62;
wire heap_bh6_w14_13;
wire heap_bh6_w15_15;
wire heap_bh6_w16_16;
wire tempR_bh6_1;
wire [5:0] CompressorIn_bh6_63_84;
wire [2:0] CompressorOut_bh6_63_63;
wire heap_bh6_w16_17;
wire heap_bh6_w17_17;
wire heap_bh6_w18_19;
wire [5:0] CompressorIn_bh6_64_85;
wire [2:0] CompressorOut_bh6_64_64;
wire heap_bh6_w17_18;
wire heap_bh6_w18_20;
wire heap_bh6_w19_19;
wire [5:0] CompressorIn_bh6_65_86;
wire [2:0] CompressorOut_bh6_65_65;
wire heap_bh6_w18_21;
wire heap_bh6_w19_20;
wire heap_bh6_w20_19;
wire [5:0] CompressorIn_bh6_66_87;
wire [2:0] CompressorOut_bh6_66_66;
wire heap_bh6_w19_21;
wire heap_bh6_w20_20;
wire heap_bh6_w21_22;
wire [5:0] CompressorIn_bh6_67_88;
wire [2:0] CompressorOut_bh6_67_67;
wire heap_bh6_w20_21;
wire heap_bh6_w21_23;
wire heap_bh6_w22_22;
wire [5:0] CompressorIn_bh6_68_89;
wire [2:0] CompressorOut_bh6_68_68;
wire heap_bh6_w21_24;
wire heap_bh6_w22_23;
wire heap_bh6_w23_23;
wire [5:0] CompressorIn_bh6_69_90;
wire [2:0] CompressorOut_bh6_69_69;
wire heap_bh6_w22_24;
wire heap_bh6_w23_24;
wire heap_bh6_w24_22;
wire [5:0] CompressorIn_bh6_70_91;
wire [2:0] CompressorOut_bh6_70_70;
wire heap_bh6_w23_25;
wire heap_bh6_w24_23;
wire heap_bh6_w25_23;
wire [5:0] CompressorIn_bh6_71_92;
wire [2:0] CompressorOut_bh6_71_71;
wire heap_bh6_w24_24;
wire heap_bh6_w25_24;
wire heap_bh6_w26_22;
wire [5:0] CompressorIn_bh6_72_93;
wire [2:0] CompressorOut_bh6_72_72;
wire heap_bh6_w25_25;
wire heap_bh6_w26_23;
wire heap_bh6_w27_20;
wire [5:0] CompressorIn_bh6_73_94;
wire [2:0] CompressorOut_bh6_73_73;
wire heap_bh6_w26_24;
wire heap_bh6_w27_21;
wire heap_bh6_w28_19;
wire [5:0] CompressorIn_bh6_74_95;
wire [2:0] CompressorOut_bh6_74_74;
wire heap_bh6_w27_22;
wire heap_bh6_w28_20;
wire heap_bh6_w29_19;
wire [5:0] CompressorIn_bh6_75_96;
wire [2:0] CompressorOut_bh6_75_75;
wire heap_bh6_w28_21;
wire heap_bh6_w29_20;
wire heap_bh6_w30_17;
wire [5:0] CompressorIn_bh6_76_97;
wire [2:0] CompressorOut_bh6_76_76;
wire heap_bh6_w29_21;
wire heap_bh6_w30_18;
wire heap_bh6_w31_17;
wire [5:0] CompressorIn_bh6_77_98;
wire [2:0] CompressorOut_bh6_77_77;
wire heap_bh6_w30_19;
wire heap_bh6_w31_18;
wire heap_bh6_w32_17;
wire [5:0] CompressorIn_bh6_78_99;
wire [2:0] CompressorOut_bh6_78_78;
wire heap_bh6_w31_19;
wire heap_bh6_w32_18;
wire heap_bh6_w33_14;
wire [5:0] CompressorIn_bh6_79_100;
wire [2:0] CompressorOut_bh6_79_79;
wire heap_bh6_w32_19;
wire heap_bh6_w33_15;
wire heap_bh6_w34_14;
wire [5:0] CompressorIn_bh6_80_101;
wire [2:0] CompressorOut_bh6_80_80;
wire heap_bh6_w33_16;
wire heap_bh6_w34_15;
wire heap_bh6_w35_13;
wire [3:0] CompressorIn_bh6_81_102;
wire [0:0] CompressorIn_bh6_81_103;
wire [2:0] CompressorOut_bh6_81_81;
wire heap_bh6_w10_10;
wire heap_bh6_w11_10;
wire heap_bh6_w12_13;
wire [3:0] CompressorIn_bh6_82_104;
wire [0:0] CompressorIn_bh6_82_105;
wire [2:0] CompressorOut_bh6_82_82;
wire heap_bh6_w12_14;
wire heap_bh6_w13_13;
wire heap_bh6_w14_14;
wire [3:0] CompressorIn_bh6_83_106;
wire [0:0] CompressorIn_bh6_83_107;
wire [2:0] CompressorOut_bh6_83_83;
wire heap_bh6_w13_14;
wire heap_bh6_w14_15;
wire heap_bh6_w15_16;
wire [3:0] CompressorIn_bh6_84_108;
wire [0:0] CompressorIn_bh6_84_109;
wire [2:0] CompressorOut_bh6_84_84;
wire heap_bh6_w14_16;
wire heap_bh6_w15_17;
wire heap_bh6_w16_18;
wire [3:0] CompressorIn_bh6_85_110;
wire [0:0] CompressorIn_bh6_85_111;
wire [2:0] CompressorOut_bh6_85_85;
wire heap_bh6_w34_16;
wire heap_bh6_w35_14;
wire heap_bh6_w36_11;
wire [3:0] CompressorIn_bh6_86_112;
wire [0:0] CompressorIn_bh6_86_113;
wire [2:0] CompressorOut_bh6_86_86;
wire heap_bh6_w35_15;
wire heap_bh6_w36_12;
wire heap_bh6_w37_10;
wire [3:0] CompressorIn_bh6_87_114;
wire [0:0] CompressorIn_bh6_87_115;
wire [2:0] CompressorOut_bh6_87_87;
wire heap_bh6_w36_13;
wire heap_bh6_w37_11;
wire heap_bh6_w38_10;
wire [3:0] CompressorIn_bh6_88_116;
wire [0:0] CompressorIn_bh6_88_117;
wire [2:0] CompressorOut_bh6_88_88;
wire heap_bh6_w38_11;
wire heap_bh6_w39_8;
wire heap_bh6_w40_8;
wire [3:0] CompressorIn_bh6_89_118;
wire [0:0] CompressorIn_bh6_89_119;
wire [2:0] CompressorOut_bh6_89_89;
wire heap_bh6_w42_5;
wire heap_bh6_w43_5;
wire heap_bh6_w44_4;
wire [3:0] CompressorIn_bh6_90_120;
wire [2:0] CompressorOut_bh6_90_90;
wire heap_bh6_w15_18;
wire heap_bh6_w16_19;
wire heap_bh6_w17_19;
wire [2:0] CompressorIn_bh6_91_121;
wire [1:0] CompressorIn_bh6_91_122;
wire [2:0] CompressorOut_bh6_91_91;
wire heap_bh6_w7_8;
wire heap_bh6_w8_8;
wire heap_bh6_w9_10;
wire [2:0] CompressorIn_bh6_92_123;
wire [1:0] CompressorIn_bh6_92_124;
wire [2:0] CompressorOut_bh6_92_92;
wire heap_bh6_w39_9;
wire heap_bh6_w40_9;
wire heap_bh6_w41_8;
wire [2:0] CompressorIn_bh6_93_125;
wire [1:0] CompressorOut_bh6_93_93;
wire heap_bh6_w9_11;
wire heap_bh6_w10_11;
wire [2:0] CompressorIn_bh6_94_126;
wire [1:0] CompressorOut_bh6_94_94;
wire heap_bh6_w11_11;
wire heap_bh6_w12_15;
wire [2:0] CompressorIn_bh6_95_127;
wire [1:0] CompressorOut_bh6_95_95;
wire heap_bh6_w37_12;
wire heap_bh6_w38_12;
wire [2:0] CompressorIn_bh6_96_128;
wire [1:0] CompressorOut_bh6_96_96;
wire heap_bh6_w41_9;
wire heap_bh6_w42_6;
wire [3:0] CompressorIn_bh6_97_129;
wire [0:0] CompressorIn_bh6_97_130;
wire [2:0] CompressorOut_bh6_97_97;
wire heap_bh6_w19_22;
wire heap_bh6_w20_22;
wire heap_bh6_w21_25;
wire [3:0] CompressorIn_bh6_98_131;
wire [0:0] CompressorIn_bh6_98_132;
wire [2:0] CompressorOut_bh6_98_98;
wire heap_bh6_w21_26;
wire heap_bh6_w22_25;
wire heap_bh6_w23_26;
wire [3:0] CompressorIn_bh6_99_133;
wire [0:0] CompressorIn_bh6_99_134;
wire [2:0] CompressorOut_bh6_99_99;
wire heap_bh6_w22_26;
wire heap_bh6_w23_27;
wire heap_bh6_w24_25;
wire [3:0] CompressorIn_bh6_100_135;
wire [0:0] CompressorIn_bh6_100_136;
wire [2:0] CompressorOut_bh6_100_100;
wire heap_bh6_w23_28;
wire heap_bh6_w24_26;
wire heap_bh6_w25_26;
wire [3:0] CompressorIn_bh6_101_137;
wire [0:0] CompressorIn_bh6_101_138;
wire [2:0] CompressorOut_bh6_101_101;
wire heap_bh6_w24_27;
wire heap_bh6_w25_27;
wire heap_bh6_w26_25;
wire [3:0] CompressorIn_bh6_102_139;
wire [0:0] CompressorIn_bh6_102_140;
wire [2:0] CompressorOut_bh6_102_102;
wire heap_bh6_w25_28;
wire heap_bh6_w26_26;
wire heap_bh6_w27_23;
wire [3:0] CompressorIn_bh6_103_141;
wire [0:0] CompressorIn_bh6_103_142;
wire [2:0] CompressorOut_bh6_103_103;
wire heap_bh6_w26_27;
wire heap_bh6_w27_24;
wire heap_bh6_w28_22;
wire [3:0] CompressorIn_bh6_104_143;
wire [0:0] CompressorIn_bh6_104_144;
wire [2:0] CompressorOut_bh6_104_104;
wire heap_bh6_w27_25;
wire heap_bh6_w28_23;
wire heap_bh6_w29_22;
wire [3:0] CompressorIn_bh6_105_145;
wire [0:0] CompressorIn_bh6_105_146;
wire [2:0] CompressorOut_bh6_105_105;
wire heap_bh6_w29_23;
wire heap_bh6_w30_20;
wire heap_bh6_w31_20;
wire [3:0] CompressorIn_bh6_106_147;
wire [0:0] CompressorIn_bh6_106_148;
wire [2:0] CompressorOut_bh6_106_106;
wire heap_bh6_w33_17;
wire heap_bh6_w34_17;
wire heap_bh6_w35_16;
wire [2:0] CompressorIn_bh6_107_149;
wire [1:0] CompressorIn_bh6_107_150;
wire [2:0] CompressorOut_bh6_107_107;
wire heap_bh6_w12_16;
wire heap_bh6_w13_15;
wire heap_bh6_w14_17;
wire [2:0] CompressorIn_bh6_108_151;
wire [1:0] CompressorIn_bh6_108_152;
wire [2:0] CompressorOut_bh6_108_108;
wire heap_bh6_w14_18;
wire heap_bh6_w15_19;
wire heap_bh6_w16_20;
wire [2:0] CompressorIn_bh6_109_153;
wire [1:0] CompressorIn_bh6_109_154;
wire [2:0] CompressorOut_bh6_109_109;
wire heap_bh6_w16_21;
wire heap_bh6_w17_20;
wire heap_bh6_w18_22;
wire [2:0] CompressorIn_bh6_110_155;
wire [1:0] CompressorIn_bh6_110_156;
wire [2:0] CompressorOut_bh6_110_110;
wire heap_bh6_w30_21;
wire heap_bh6_w31_21;
wire heap_bh6_w32_20;
wire [2:0] CompressorIn_bh6_111_157;
wire [1:0] CompressorIn_bh6_111_158;
wire [2:0] CompressorOut_bh6_111_111;
wire heap_bh6_w34_18;
wire heap_bh6_w35_17;
wire heap_bh6_w36_14;
wire [2:0] CompressorIn_bh6_112_159;
wire [1:0] CompressorIn_bh6_112_160;
wire [2:0] CompressorOut_bh6_112_112;
wire heap_bh6_w36_15;
wire heap_bh6_w37_13;
wire heap_bh6_w38_13;
wire [2:0] CompressorIn_bh6_113_161;
wire [1:0] CompressorIn_bh6_113_162;
wire [2:0] CompressorOut_bh6_113_113;
wire heap_bh6_w38_14;
wire heap_bh6_w39_10;
wire heap_bh6_w40_10;
wire [2:0] CompressorIn_bh6_114_163;
wire [1:0] CompressorIn_bh6_114_164;
wire [2:0] CompressorOut_bh6_114_114;
wire heap_bh6_w40_11;
wire heap_bh6_w41_10;
wire heap_bh6_w42_7;
wire [2:0] CompressorIn_bh6_115_165;
wire [1:0] CompressorIn_bh6_115_166;
wire [2:0] CompressorOut_bh6_115_115;
wire heap_bh6_w44_5;
wire heap_bh6_w45_2;
wire heap_bh6_w46_1;
wire [2:0] CompressorIn_bh6_116_167;
wire [1:0] CompressorOut_bh6_116_116;
wire heap_bh6_w18_23;
wire heap_bh6_w19_23;
wire [2:0] CompressorIn_bh6_117_168;
wire [1:0] CompressorOut_bh6_117_117;
wire heap_bh6_w20_23;
wire heap_bh6_w21_27;
wire [2:0] CompressorIn_bh6_118_169;
wire [1:0] CompressorOut_bh6_118_118;
wire heap_bh6_w28_24;
wire heap_bh6_w29_24;
wire [2:0] CompressorIn_bh6_119_170;
wire [1:0] CompressorOut_bh6_119_119;
wire heap_bh6_w32_21;
wire heap_bh6_w33_18;
wire [2:0] CompressorIn_bh6_120_171;
wire [1:0] CompressorIn_bh6_120_172;
wire [2:0] CompressorOut_bh6_120_120;
wire heap_bh6_w21_28;
wire heap_bh6_w22_27;
wire heap_bh6_w23_29;
wire [2:0] CompressorIn_bh6_121_173;
wire [1:0] CompressorIn_bh6_121_174;
wire [2:0] CompressorOut_bh6_121_121;
wire heap_bh6_w23_30;
wire heap_bh6_w24_28;
wire heap_bh6_w25_29;
wire [2:0] CompressorIn_bh6_122_175;
wire [1:0] CompressorIn_bh6_122_176;
wire [2:0] CompressorOut_bh6_122_122;
wire heap_bh6_w25_30;
wire heap_bh6_w26_28;
wire heap_bh6_w27_26;
wire [2:0] CompressorIn_bh6_123_177;
wire [1:0] CompressorIn_bh6_123_178;
wire [2:0] CompressorOut_bh6_123_123;
wire heap_bh6_w27_27;
wire heap_bh6_w28_25;
wire heap_bh6_w29_25;
wire [2:0] CompressorIn_bh6_124_179;
wire [1:0] CompressorIn_bh6_124_180;
wire [2:0] CompressorOut_bh6_124_124;
wire heap_bh6_w29_26;
wire heap_bh6_w30_22;
wire heap_bh6_w31_22;
wire [2:0] CompressorIn_bh6_125_181;
wire [1:0] CompressorIn_bh6_125_182;
wire [2:0] CompressorOut_bh6_125_125;
wire heap_bh6_w31_23;
wire heap_bh6_w32_22;
wire heap_bh6_w33_19;
wire [2:0] CompressorIn_bh6_126_183;
wire [1:0] CompressorIn_bh6_126_184;
wire [2:0] CompressorOut_bh6_126_126;
wire heap_bh6_w35_18;
wire heap_bh6_w36_16;
wire heap_bh6_w37_14;
wire [2:0] CompressorIn_bh6_127_185;
wire [1:0] CompressorIn_bh6_127_186;
wire [2:0] CompressorOut_bh6_127_127;
wire heap_bh6_w42_8;
wire heap_bh6_w43_6;
wire heap_bh6_w44_6;
wire [2:0] CompressorIn_bh6_128_187;
wire [1:0] CompressorIn_bh6_128_188;
wire [2:0] CompressorOut_bh6_128_128;
wire heap_bh6_w33_20;
wire heap_bh6_w34_19;
wire heap_bh6_w35_19;
wire [2:0] CompressorIn_bh6_129_189;
wire [1:0] CompressorIn_bh6_129_190;
wire [2:0] CompressorOut_bh6_129_129;
wire heap_bh6_w37_15;
wire heap_bh6_w38_15;
wire heap_bh6_w39_11;
wire [44:0] finalAdderIn0_bh6;
wire [44:0] finalAdderIn1_bh6;
wire finalAdderCin_bh6;
wire [44:0] finalAdderOut_bh6;
wire [48:0] CompressionResult6;  //attribute rom_extract: string;
//attribute rom_style: string;
//attribute rom_extract of SmallMultTableP3x3r6XuYu_comb_uid8: component is "yes";
//attribute rom_style of SmallMultTableP3x3r6XuYu_comb_uid8: component is "distributed";

  assign XX_m5 = X;
  assign YY_m5 = Y;
  // code generated by IntMultiplier::buildHeapLogicOnly()
  // buildheaplogiconly called for lsbX=0 lsbY=0 msbX=24 msbY=24
  assign Xp_m5b0 = {XX_m5[23:0]};
  assign Yp_m5b0 = {YY_m5[23:0]};
  assign x_m5b0_0 = Xp_m5b0[2:0];
  assign x_m5b0_1 = Xp_m5b0[5:3];
  assign x_m5b0_2 = Xp_m5b0[8:6];
  assign x_m5b0_3 = Xp_m5b0[11:9];
  assign x_m5b0_4 = Xp_m5b0[14:12];
  assign x_m5b0_5 = Xp_m5b0[17:15];
  assign x_m5b0_6 = Xp_m5b0[20:18];
  assign x_m5b0_7 = Xp_m5b0[23:21];
  assign y_m5b0_0 = Yp_m5b0[2:0];
  assign y_m5b0_1 = Yp_m5b0[5:3];
  assign y_m5b0_2 = Yp_m5b0[8:6];
  assign y_m5b0_3 = Yp_m5b0[11:9];
  assign y_m5b0_4 = Yp_m5b0[14:12];
  assign y_m5b0_5 = Yp_m5b0[17:15];
  assign y_m5b0_6 = Yp_m5b0[20:18];
  assign y_m5b0_7 = Yp_m5b0[23:21];
  // Partial product row number 0
  assign Y0X0_0_m5 = {y_m5b0_0,x_m5b0_0};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X0Y0_Tbl(
      .X(Y0X0_0_m5),
    .Y(PP0X0Y0_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w0_0 = PP0X0Y0_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w1_0 = PP0X0Y0_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w2_0 = PP0X0Y0_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w3_0 = PP0X0Y0_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w4_0 = PP0X0Y0_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w5_0 = PP0X0Y0_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y0X1_0_m5 = {y_m5b0_0,x_m5b0_1};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X1Y0_Tbl(
      .X(Y0X1_0_m5),
    .Y(PP0X1Y0_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w3_1 = PP0X1Y0_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w4_1 = PP0X1Y0_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w5_1 = PP0X1Y0_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w6_0 = PP0X1Y0_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w7_0 = PP0X1Y0_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w8_0 = PP0X1Y0_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y0X2_0_m5 = {y_m5b0_0,x_m5b0_2};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X2Y0_Tbl(
      .X(Y0X2_0_m5),
    .Y(PP0X2Y0_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w6_1 = PP0X2Y0_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w7_1 = PP0X2Y0_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w8_1 = PP0X2Y0_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w9_0 = PP0X2Y0_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w10_0 = PP0X2Y0_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w11_0 = PP0X2Y0_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y0X3_0_m5 = {y_m5b0_0,x_m5b0_3};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X3Y0_Tbl(
      .X(Y0X3_0_m5),
    .Y(PP0X3Y0_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w9_1 = PP0X3Y0_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w10_1 = PP0X3Y0_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w11_1 = PP0X3Y0_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w12_0 = PP0X3Y0_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w13_0 = PP0X3Y0_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w14_0 = PP0X3Y0_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y0X4_0_m5 = {y_m5b0_0,x_m5b0_4};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X4Y0_Tbl(
      .X(Y0X4_0_m5),
    .Y(PP0X4Y0_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w12_1 = PP0X4Y0_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w13_1 = PP0X4Y0_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w14_1 = PP0X4Y0_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w15_0 = PP0X4Y0_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w16_0 = PP0X4Y0_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w17_0 = PP0X4Y0_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y0X5_0_m5 = {y_m5b0_0,x_m5b0_5};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X5Y0_Tbl(
      .X(Y0X5_0_m5),
    .Y(PP0X5Y0_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w15_1 = PP0X5Y0_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w16_1 = PP0X5Y0_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w17_1 = PP0X5Y0_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w18_0 = PP0X5Y0_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w19_0 = PP0X5Y0_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w20_0 = PP0X5Y0_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y0X6_0_m5 = {y_m5b0_0,x_m5b0_6};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X6Y0_Tbl(
      .X(Y0X6_0_m5),
    .Y(PP0X6Y0_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w18_1 = PP0X6Y0_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w19_1 = PP0X6Y0_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w20_1 = PP0X6Y0_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w21_0 = PP0X6Y0_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w22_0 = PP0X6Y0_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w23_0 = PP0X6Y0_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y0X7_0_m5 = {y_m5b0_0,x_m5b0_7};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X7Y0_Tbl(
      .X(Y0X7_0_m5),
    .Y(PP0X7Y0_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w21_1 = PP0X7Y0_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w22_1 = PP0X7Y0_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w23_1 = PP0X7Y0_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w24_0 = PP0X7Y0_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w25_0 = PP0X7Y0_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w26_0 = PP0X7Y0_m5[5];
  // cycle= 0 cp= 5.9176e-10
  // Partial product row number 1
  assign Y1X0_0_m5 = {y_m5b0_1,x_m5b0_0};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X0Y1_Tbl(
      .X(Y1X0_0_m5),
    .Y(PP0X0Y1_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w3_2 = PP0X0Y1_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w4_2 = PP0X0Y1_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w5_2 = PP0X0Y1_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w6_2 = PP0X0Y1_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w7_2 = PP0X0Y1_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w8_2 = PP0X0Y1_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y1X1_0_m5 = {y_m5b0_1,x_m5b0_1};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X1Y1_Tbl(
      .X(Y1X1_0_m5),
    .Y(PP0X1Y1_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w6_3 = PP0X1Y1_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w7_3 = PP0X1Y1_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w8_3 = PP0X1Y1_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w9_2 = PP0X1Y1_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w10_2 = PP0X1Y1_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w11_2 = PP0X1Y1_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y1X2_0_m5 = {y_m5b0_1,x_m5b0_2};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X2Y1_Tbl(
      .X(Y1X2_0_m5),
    .Y(PP0X2Y1_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w9_3 = PP0X2Y1_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w10_3 = PP0X2Y1_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w11_3 = PP0X2Y1_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w12_2 = PP0X2Y1_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w13_2 = PP0X2Y1_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w14_2 = PP0X2Y1_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y1X3_0_m5 = {y_m5b0_1,x_m5b0_3};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X3Y1_Tbl(
      .X(Y1X3_0_m5),
    .Y(PP0X3Y1_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w12_3 = PP0X3Y1_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w13_3 = PP0X3Y1_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w14_3 = PP0X3Y1_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w15_2 = PP0X3Y1_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w16_2 = PP0X3Y1_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w17_2 = PP0X3Y1_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y1X4_0_m5 = {y_m5b0_1,x_m5b0_4};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X4Y1_Tbl(
      .X(Y1X4_0_m5),
    .Y(PP0X4Y1_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w15_3 = PP0X4Y1_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w16_3 = PP0X4Y1_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w17_3 = PP0X4Y1_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w18_2 = PP0X4Y1_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w19_2 = PP0X4Y1_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w20_2 = PP0X4Y1_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y1X5_0_m5 = {y_m5b0_1,x_m5b0_5};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X5Y1_Tbl(
      .X(Y1X5_0_m5),
    .Y(PP0X5Y1_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w18_3 = PP0X5Y1_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w19_3 = PP0X5Y1_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w20_3 = PP0X5Y1_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w21_2 = PP0X5Y1_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w22_2 = PP0X5Y1_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w23_2 = PP0X5Y1_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y1X6_0_m5 = {y_m5b0_1,x_m5b0_6};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X6Y1_Tbl(
      .X(Y1X6_0_m5),
    .Y(PP0X6Y1_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w21_3 = PP0X6Y1_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w22_3 = PP0X6Y1_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w23_3 = PP0X6Y1_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w24_1 = PP0X6Y1_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w25_1 = PP0X6Y1_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w26_1 = PP0X6Y1_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y1X7_0_m5 = {y_m5b0_1,x_m5b0_7};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X7Y1_Tbl(
      .X(Y1X7_0_m5),
    .Y(PP0X7Y1_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w24_2 = PP0X7Y1_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w25_2 = PP0X7Y1_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w26_2 = PP0X7Y1_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w27_0 = PP0X7Y1_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w28_0 = PP0X7Y1_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w29_0 = PP0X7Y1_m5[5];
  // cycle= 0 cp= 5.9176e-10
  // Partial product row number 2
  assign Y2X0_0_m5 = {y_m5b0_2,x_m5b0_0};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X0Y2_Tbl(
      .X(Y2X0_0_m5),
    .Y(PP0X0Y2_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w6_4 = PP0X0Y2_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w7_4 = PP0X0Y2_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w8_4 = PP0X0Y2_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w9_4 = PP0X0Y2_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w10_4 = PP0X0Y2_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w11_4 = PP0X0Y2_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y2X1_0_m5 = {y_m5b0_2,x_m5b0_1};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X1Y2_Tbl(
      .X(Y2X1_0_m5),
    .Y(PP0X1Y2_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w9_5 = PP0X1Y2_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w10_5 = PP0X1Y2_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w11_5 = PP0X1Y2_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w12_4 = PP0X1Y2_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w13_4 = PP0X1Y2_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w14_4 = PP0X1Y2_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y2X2_0_m5 = {y_m5b0_2,x_m5b0_2};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X2Y2_Tbl(
      .X(Y2X2_0_m5),
    .Y(PP0X2Y2_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w12_5 = PP0X2Y2_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w13_5 = PP0X2Y2_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w14_5 = PP0X2Y2_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w15_4 = PP0X2Y2_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w16_4 = PP0X2Y2_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w17_4 = PP0X2Y2_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y2X3_0_m5 = {y_m5b0_2,x_m5b0_3};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X3Y2_Tbl(
      .X(Y2X3_0_m5),
    .Y(PP0X3Y2_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w15_5 = PP0X3Y2_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w16_5 = PP0X3Y2_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w17_5 = PP0X3Y2_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w18_4 = PP0X3Y2_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w19_4 = PP0X3Y2_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w20_4 = PP0X3Y2_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y2X4_0_m5 = {y_m5b0_2,x_m5b0_4};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X4Y2_Tbl(
      .X(Y2X4_0_m5),
    .Y(PP0X4Y2_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w18_5 = PP0X4Y2_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w19_5 = PP0X4Y2_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w20_5 = PP0X4Y2_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w21_4 = PP0X4Y2_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w22_4 = PP0X4Y2_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w23_4 = PP0X4Y2_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y2X5_0_m5 = {y_m5b0_2,x_m5b0_5};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X5Y2_Tbl(
      .X(Y2X5_0_m5),
    .Y(PP0X5Y2_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w21_5 = PP0X5Y2_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w22_5 = PP0X5Y2_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w23_5 = PP0X5Y2_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w24_3 = PP0X5Y2_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w25_3 = PP0X5Y2_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w26_3 = PP0X5Y2_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y2X6_0_m5 = {y_m5b0_2,x_m5b0_6};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X6Y2_Tbl(
      .X(Y2X6_0_m5),
    .Y(PP0X6Y2_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w24_4 = PP0X6Y2_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w25_4 = PP0X6Y2_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w26_4 = PP0X6Y2_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w27_1 = PP0X6Y2_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w28_1 = PP0X6Y2_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w29_1 = PP0X6Y2_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y2X7_0_m5 = {y_m5b0_2,x_m5b0_7};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X7Y2_Tbl(
      .X(Y2X7_0_m5),
    .Y(PP0X7Y2_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w27_2 = PP0X7Y2_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w28_2 = PP0X7Y2_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w29_2 = PP0X7Y2_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w30_0 = PP0X7Y2_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w31_0 = PP0X7Y2_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w32_0 = PP0X7Y2_m5[5];
  // cycle= 0 cp= 5.9176e-10
  // Partial product row number 3
  assign Y3X0_0_m5 = {y_m5b0_3,x_m5b0_0};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X0Y3_Tbl(
      .X(Y3X0_0_m5),
    .Y(PP0X0Y3_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w9_6 = PP0X0Y3_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w10_6 = PP0X0Y3_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w11_6 = PP0X0Y3_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w12_6 = PP0X0Y3_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w13_6 = PP0X0Y3_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w14_6 = PP0X0Y3_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y3X1_0_m5 = {y_m5b0_3,x_m5b0_1};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X1Y3_Tbl(
      .X(Y3X1_0_m5),
    .Y(PP0X1Y3_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w12_7 = PP0X1Y3_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w13_7 = PP0X1Y3_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w14_7 = PP0X1Y3_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w15_6 = PP0X1Y3_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w16_6 = PP0X1Y3_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w17_6 = PP0X1Y3_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y3X2_0_m5 = {y_m5b0_3,x_m5b0_2};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X2Y3_Tbl(
      .X(Y3X2_0_m5),
    .Y(PP0X2Y3_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w15_7 = PP0X2Y3_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w16_7 = PP0X2Y3_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w17_7 = PP0X2Y3_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w18_6 = PP0X2Y3_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w19_6 = PP0X2Y3_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w20_6 = PP0X2Y3_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y3X3_0_m5 = {y_m5b0_3,x_m5b0_3};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X3Y3_Tbl(
      .X(Y3X3_0_m5),
    .Y(PP0X3Y3_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w18_7 = PP0X3Y3_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w19_7 = PP0X3Y3_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w20_7 = PP0X3Y3_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w21_6 = PP0X3Y3_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w22_6 = PP0X3Y3_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w23_6 = PP0X3Y3_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y3X4_0_m5 = {y_m5b0_3,x_m5b0_4};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X4Y3_Tbl(
      .X(Y3X4_0_m5),
    .Y(PP0X4Y3_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w21_7 = PP0X4Y3_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w22_7 = PP0X4Y3_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w23_7 = PP0X4Y3_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w24_5 = PP0X4Y3_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w25_5 = PP0X4Y3_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w26_5 = PP0X4Y3_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y3X5_0_m5 = {y_m5b0_3,x_m5b0_5};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X5Y3_Tbl(
      .X(Y3X5_0_m5),
    .Y(PP0X5Y3_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w24_6 = PP0X5Y3_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w25_6 = PP0X5Y3_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w26_6 = PP0X5Y3_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w27_3 = PP0X5Y3_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w28_3 = PP0X5Y3_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w29_3 = PP0X5Y3_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y3X6_0_m5 = {y_m5b0_3,x_m5b0_6};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X6Y3_Tbl(
      .X(Y3X6_0_m5),
    .Y(PP0X6Y3_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w27_4 = PP0X6Y3_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w28_4 = PP0X6Y3_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w29_4 = PP0X6Y3_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w30_1 = PP0X6Y3_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w31_1 = PP0X6Y3_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w32_1 = PP0X6Y3_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y3X7_0_m5 = {y_m5b0_3,x_m5b0_7};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X7Y3_Tbl(
      .X(Y3X7_0_m5),
    .Y(PP0X7Y3_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w30_2 = PP0X7Y3_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w31_2 = PP0X7Y3_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w32_2 = PP0X7Y3_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w33_0 = PP0X7Y3_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w34_0 = PP0X7Y3_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w35_0 = PP0X7Y3_m5[5];
  // cycle= 0 cp= 5.9176e-10
  // Partial product row number 4
  assign Y4X0_0_m5 = {y_m5b0_4,x_m5b0_0};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X0Y4_Tbl(
      .X(Y4X0_0_m5),
    .Y(PP0X0Y4_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w12_8 = PP0X0Y4_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w13_8 = PP0X0Y4_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w14_8 = PP0X0Y4_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w15_8 = PP0X0Y4_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w16_8 = PP0X0Y4_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w17_8 = PP0X0Y4_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y4X1_0_m5 = {y_m5b0_4,x_m5b0_1};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X1Y4_Tbl(
      .X(Y4X1_0_m5),
    .Y(PP0X1Y4_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w15_9 = PP0X1Y4_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w16_9 = PP0X1Y4_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w17_9 = PP0X1Y4_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w18_8 = PP0X1Y4_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w19_8 = PP0X1Y4_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w20_8 = PP0X1Y4_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y4X2_0_m5 = {y_m5b0_4,x_m5b0_2};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X2Y4_Tbl(
      .X(Y4X2_0_m5),
    .Y(PP0X2Y4_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w18_9 = PP0X2Y4_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w19_9 = PP0X2Y4_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w20_9 = PP0X2Y4_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w21_8 = PP0X2Y4_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w22_8 = PP0X2Y4_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w23_8 = PP0X2Y4_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y4X3_0_m5 = {y_m5b0_4,x_m5b0_3};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X3Y4_Tbl(
      .X(Y4X3_0_m5),
    .Y(PP0X3Y4_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w21_9 = PP0X3Y4_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w22_9 = PP0X3Y4_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w23_9 = PP0X3Y4_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w24_7 = PP0X3Y4_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w25_7 = PP0X3Y4_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w26_7 = PP0X3Y4_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y4X4_0_m5 = {y_m5b0_4,x_m5b0_4};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X4Y4_Tbl(
      .X(Y4X4_0_m5),
    .Y(PP0X4Y4_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w24_8 = PP0X4Y4_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w25_8 = PP0X4Y4_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w26_8 = PP0X4Y4_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w27_5 = PP0X4Y4_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w28_5 = PP0X4Y4_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w29_5 = PP0X4Y4_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y4X5_0_m5 = {y_m5b0_4,x_m5b0_5};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X5Y4_Tbl(
      .X(Y4X5_0_m5),
    .Y(PP0X5Y4_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w27_6 = PP0X5Y4_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w28_6 = PP0X5Y4_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w29_6 = PP0X5Y4_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w30_3 = PP0X5Y4_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w31_3 = PP0X5Y4_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w32_3 = PP0X5Y4_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y4X6_0_m5 = {y_m5b0_4,x_m5b0_6};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X6Y4_Tbl(
      .X(Y4X6_0_m5),
    .Y(PP0X6Y4_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w30_4 = PP0X6Y4_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w31_4 = PP0X6Y4_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w32_4 = PP0X6Y4_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w33_1 = PP0X6Y4_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w34_1 = PP0X6Y4_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w35_1 = PP0X6Y4_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y4X7_0_m5 = {y_m5b0_4,x_m5b0_7};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X7Y4_Tbl(
      .X(Y4X7_0_m5),
    .Y(PP0X7Y4_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w33_2 = PP0X7Y4_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w34_2 = PP0X7Y4_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w35_2 = PP0X7Y4_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w36_0 = PP0X7Y4_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w37_0 = PP0X7Y4_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w38_0 = PP0X7Y4_m5[5];
  // cycle= 0 cp= 5.9176e-10
  // Partial product row number 5
  assign Y5X0_0_m5 = {y_m5b0_5,x_m5b0_0};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X0Y5_Tbl(
      .X(Y5X0_0_m5),
    .Y(PP0X0Y5_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w15_10 = PP0X0Y5_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w16_10 = PP0X0Y5_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w17_10 = PP0X0Y5_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w18_10 = PP0X0Y5_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w19_10 = PP0X0Y5_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w20_10 = PP0X0Y5_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y5X1_0_m5 = {y_m5b0_5,x_m5b0_1};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X1Y5_Tbl(
      .X(Y5X1_0_m5),
    .Y(PP0X1Y5_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w18_11 = PP0X1Y5_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w19_11 = PP0X1Y5_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w20_11 = PP0X1Y5_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w21_10 = PP0X1Y5_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w22_10 = PP0X1Y5_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w23_10 = PP0X1Y5_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y5X2_0_m5 = {y_m5b0_5,x_m5b0_2};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X2Y5_Tbl(
      .X(Y5X2_0_m5),
    .Y(PP0X2Y5_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w21_11 = PP0X2Y5_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w22_11 = PP0X2Y5_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w23_11 = PP0X2Y5_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w24_9 = PP0X2Y5_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w25_9 = PP0X2Y5_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w26_9 = PP0X2Y5_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y5X3_0_m5 = {y_m5b0_5,x_m5b0_3};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X3Y5_Tbl(
      .X(Y5X3_0_m5),
    .Y(PP0X3Y5_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w24_10 = PP0X3Y5_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w25_10 = PP0X3Y5_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w26_10 = PP0X3Y5_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w27_7 = PP0X3Y5_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w28_7 = PP0X3Y5_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w29_7 = PP0X3Y5_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y5X4_0_m5 = {y_m5b0_5,x_m5b0_4};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X4Y5_Tbl(
      .X(Y5X4_0_m5),
    .Y(PP0X4Y5_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w27_8 = PP0X4Y5_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w28_8 = PP0X4Y5_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w29_8 = PP0X4Y5_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w30_5 = PP0X4Y5_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w31_5 = PP0X4Y5_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w32_5 = PP0X4Y5_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y5X5_0_m5 = {y_m5b0_5,x_m5b0_5};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X5Y5_Tbl(
      .X(Y5X5_0_m5),
    .Y(PP0X5Y5_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w30_6 = PP0X5Y5_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w31_6 = PP0X5Y5_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w32_6 = PP0X5Y5_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w33_3 = PP0X5Y5_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w34_3 = PP0X5Y5_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w35_3 = PP0X5Y5_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y5X6_0_m5 = {y_m5b0_5,x_m5b0_6};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X6Y5_Tbl(
      .X(Y5X6_0_m5),
    .Y(PP0X6Y5_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w33_4 = PP0X6Y5_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w34_4 = PP0X6Y5_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w35_4 = PP0X6Y5_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w36_1 = PP0X6Y5_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w37_1 = PP0X6Y5_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w38_1 = PP0X6Y5_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y5X7_0_m5 = {y_m5b0_5,x_m5b0_7};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X7Y5_Tbl(
      .X(Y5X7_0_m5),
    .Y(PP0X7Y5_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w36_2 = PP0X7Y5_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w37_2 = PP0X7Y5_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w38_2 = PP0X7Y5_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w39_0 = PP0X7Y5_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w40_0 = PP0X7Y5_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w41_0 = PP0X7Y5_m5[5];
  // cycle= 0 cp= 5.9176e-10
  // Partial product row number 6
  assign Y6X0_0_m5 = {y_m5b0_6,x_m5b0_0};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X0Y6_Tbl(
      .X(Y6X0_0_m5),
    .Y(PP0X0Y6_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w18_12 = PP0X0Y6_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w19_12 = PP0X0Y6_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w20_12 = PP0X0Y6_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w21_12 = PP0X0Y6_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w22_12 = PP0X0Y6_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w23_12 = PP0X0Y6_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y6X1_0_m5 = {y_m5b0_6,x_m5b0_1};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X1Y6_Tbl(
      .X(Y6X1_0_m5),
    .Y(PP0X1Y6_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w21_13 = PP0X1Y6_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w22_13 = PP0X1Y6_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w23_13 = PP0X1Y6_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w24_11 = PP0X1Y6_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w25_11 = PP0X1Y6_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w26_11 = PP0X1Y6_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y6X2_0_m5 = {y_m5b0_6,x_m5b0_2};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X2Y6_Tbl(
      .X(Y6X2_0_m5),
    .Y(PP0X2Y6_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w24_12 = PP0X2Y6_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w25_12 = PP0X2Y6_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w26_12 = PP0X2Y6_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w27_9 = PP0X2Y6_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w28_9 = PP0X2Y6_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w29_9 = PP0X2Y6_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y6X3_0_m5 = {y_m5b0_6,x_m5b0_3};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X3Y6_Tbl(
      .X(Y6X3_0_m5),
    .Y(PP0X3Y6_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w27_10 = PP0X3Y6_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w28_10 = PP0X3Y6_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w29_10 = PP0X3Y6_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w30_7 = PP0X3Y6_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w31_7 = PP0X3Y6_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w32_7 = PP0X3Y6_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y6X4_0_m5 = {y_m5b0_6,x_m5b0_4};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X4Y6_Tbl(
      .X(Y6X4_0_m5),
    .Y(PP0X4Y6_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w30_8 = PP0X4Y6_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w31_8 = PP0X4Y6_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w32_8 = PP0X4Y6_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w33_5 = PP0X4Y6_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w34_5 = PP0X4Y6_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w35_5 = PP0X4Y6_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y6X5_0_m5 = {y_m5b0_6,x_m5b0_5};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X5Y6_Tbl(
      .X(Y6X5_0_m5),
    .Y(PP0X5Y6_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w33_6 = PP0X5Y6_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w34_6 = PP0X5Y6_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w35_6 = PP0X5Y6_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w36_3 = PP0X5Y6_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w37_3 = PP0X5Y6_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w38_3 = PP0X5Y6_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y6X6_0_m5 = {y_m5b0_6,x_m5b0_6};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X6Y6_Tbl(
      .X(Y6X6_0_m5),
    .Y(PP0X6Y6_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w36_4 = PP0X6Y6_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w37_4 = PP0X6Y6_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w38_4 = PP0X6Y6_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w39_1 = PP0X6Y6_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w40_1 = PP0X6Y6_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w41_1 = PP0X6Y6_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y6X7_0_m5 = {y_m5b0_6,x_m5b0_7};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X7Y6_Tbl(
      .X(Y6X7_0_m5),
    .Y(PP0X7Y6_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w39_2 = PP0X7Y6_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w40_2 = PP0X7Y6_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w41_2 = PP0X7Y6_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w42_0 = PP0X7Y6_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w43_0 = PP0X7Y6_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w44_0 = PP0X7Y6_m5[5];
  // cycle= 0 cp= 5.9176e-10
  // Partial product row number 7
  assign Y7X0_0_m5 = {y_m5b0_7,x_m5b0_0};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X0Y7_Tbl(
      .X(Y7X0_0_m5),
    .Y(PP0X0Y7_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w21_14 = PP0X0Y7_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w22_14 = PP0X0Y7_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w23_14 = PP0X0Y7_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w24_13 = PP0X0Y7_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w25_13 = PP0X0Y7_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w26_13 = PP0X0Y7_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y7X1_0_m5 = {y_m5b0_7,x_m5b0_1};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X1Y7_Tbl(
      .X(Y7X1_0_m5),
    .Y(PP0X1Y7_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w24_14 = PP0X1Y7_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w25_14 = PP0X1Y7_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w26_14 = PP0X1Y7_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w27_11 = PP0X1Y7_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w28_11 = PP0X1Y7_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w29_11 = PP0X1Y7_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y7X2_0_m5 = {y_m5b0_7,x_m5b0_2};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X2Y7_Tbl(
      .X(Y7X2_0_m5),
    .Y(PP0X2Y7_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w27_12 = PP0X2Y7_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w28_12 = PP0X2Y7_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w29_12 = PP0X2Y7_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w30_9 = PP0X2Y7_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w31_9 = PP0X2Y7_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w32_9 = PP0X2Y7_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y7X3_0_m5 = {y_m5b0_7,x_m5b0_3};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X3Y7_Tbl(
      .X(Y7X3_0_m5),
    .Y(PP0X3Y7_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w30_10 = PP0X3Y7_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w31_10 = PP0X3Y7_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w32_10 = PP0X3Y7_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w33_7 = PP0X3Y7_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w34_7 = PP0X3Y7_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w35_7 = PP0X3Y7_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y7X4_0_m5 = {y_m5b0_7,x_m5b0_4};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X4Y7_Tbl(
      .X(Y7X4_0_m5),
    .Y(PP0X4Y7_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w33_8 = PP0X4Y7_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w34_8 = PP0X4Y7_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w35_8 = PP0X4Y7_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w36_5 = PP0X4Y7_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w37_5 = PP0X4Y7_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w38_5 = PP0X4Y7_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y7X5_0_m5 = {y_m5b0_7,x_m5b0_5};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X5Y7_Tbl(
      .X(Y7X5_0_m5),
    .Y(PP0X5Y7_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w36_6 = PP0X5Y7_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w37_6 = PP0X5Y7_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w38_6 = PP0X5Y7_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w39_3 = PP0X5Y7_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w40_3 = PP0X5Y7_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w41_3 = PP0X5Y7_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y7X6_0_m5 = {y_m5b0_7,x_m5b0_6};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X6Y7_Tbl(
      .X(Y7X6_0_m5),
    .Y(PP0X6Y7_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w39_4 = PP0X6Y7_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w40_4 = PP0X6Y7_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w41_4 = PP0X6Y7_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w42_1 = PP0X6Y7_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w43_1 = PP0X6Y7_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w44_1 = PP0X6Y7_m5[5];
  // cycle= 0 cp= 5.9176e-10
  assign Y7X7_0_m5 = {y_m5b0_7,x_m5b0_7};
  SmallMultTableP3x3r6XuYu_comb_uid8 PP_m5_0X7Y7_Tbl(
      .X(Y7X7_0_m5),
    .Y(PP0X7Y7_m5));

  // Adding the relevant bits to the heap of bits
  assign heap_bh6_w42_2 = PP0X7Y7_m5[0];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w43_2 = PP0X7Y7_m5[1];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w44_2 = PP0X7Y7_m5[2];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w45_0 = PP0X7Y7_m5[3];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w46_0 = PP0X7Y7_m5[4];
  // cycle= 0 cp= 5.9176e-10
  assign heap_bh6_w47_0 = PP0X7Y7_m5[5];
  // cycle= 0 cp= 5.9176e-10
  // Beginning of code generated by BitHeap::generateCompressorVHDL
  // code generated by BitHeap::generateSupertileVHDL()
  // Adding the constant bits
  // All the constant bits are zero, nothing to add
  assign tempR_bh6_0 = {heap_bh6_w2_0,heap_bh6_w1_0,heap_bh6_w0_0};
  // already compressed
  assign CompressorIn_bh6_0_0 = {heap_bh6_w9_6,heap_bh6_w9_5,heap_bh6_w9_4,heap_bh6_w9_3,heap_bh6_w9_2,heap_bh6_w9_1};
  Compressor_6_3 Compressor_bh6_0(
      .R(CompressorOut_bh6_0_0),
    .X0(CompressorIn_bh6_0_0));

  assign heap_bh6_w9_7 = CompressorOut_bh6_0_0[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w10_7 = CompressorOut_bh6_0_0[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w11_7 = CompressorOut_bh6_0_0[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_1_1 = {heap_bh6_w10_6,heap_bh6_w10_5,heap_bh6_w10_4,heap_bh6_w10_3,heap_bh6_w10_2,heap_bh6_w10_1};
  Compressor_6_3 Compressor_bh6_1(
      .R(CompressorOut_bh6_1_1),
    .X0(CompressorIn_bh6_1_1));

  assign heap_bh6_w10_8 = CompressorOut_bh6_1_1[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w11_8 = CompressorOut_bh6_1_1[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w12_9 = CompressorOut_bh6_1_1[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_2_2 = {heap_bh6_w11_6,heap_bh6_w11_5,heap_bh6_w11_4,heap_bh6_w11_3,heap_bh6_w11_2,heap_bh6_w11_1};
  Compressor_6_3 Compressor_bh6_2(
      .R(CompressorOut_bh6_2_2),
    .X0(CompressorIn_bh6_2_2));

  assign heap_bh6_w11_9 = CompressorOut_bh6_2_2[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w12_10 = CompressorOut_bh6_2_2[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w13_9 = CompressorOut_bh6_2_2[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_3_3 = {heap_bh6_w12_8,heap_bh6_w12_7,heap_bh6_w12_6,heap_bh6_w12_5,heap_bh6_w12_4,heap_bh6_w12_3};
  Compressor_6_3 Compressor_bh6_3(
      .R(CompressorOut_bh6_3_3),
    .X0(CompressorIn_bh6_3_3));

  assign heap_bh6_w12_11 = CompressorOut_bh6_3_3[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w13_10 = CompressorOut_bh6_3_3[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w14_9 = CompressorOut_bh6_3_3[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_4_4 = {heap_bh6_w13_8,heap_bh6_w13_7,heap_bh6_w13_6,heap_bh6_w13_5,heap_bh6_w13_4,heap_bh6_w13_3};
  Compressor_6_3 Compressor_bh6_4(
      .R(CompressorOut_bh6_4_4),
    .X0(CompressorIn_bh6_4_4));

  assign heap_bh6_w13_11 = CompressorOut_bh6_4_4[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w14_10 = CompressorOut_bh6_4_4[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w15_11 = CompressorOut_bh6_4_4[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_5_5 = {heap_bh6_w14_8,heap_bh6_w14_7,heap_bh6_w14_6,heap_bh6_w14_5,heap_bh6_w14_4,heap_bh6_w14_3};
  Compressor_6_3 Compressor_bh6_5(
      .R(CompressorOut_bh6_5_5),
    .X0(CompressorIn_bh6_5_5));

  assign heap_bh6_w14_11 = CompressorOut_bh6_5_5[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w15_12 = CompressorOut_bh6_5_5[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w16_11 = CompressorOut_bh6_5_5[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_6_6 = {heap_bh6_w15_10,heap_bh6_w15_9,heap_bh6_w15_8,heap_bh6_w15_7,heap_bh6_w15_6,heap_bh6_w15_5};
  Compressor_6_3 Compressor_bh6_6(
      .R(CompressorOut_bh6_6_6),
    .X0(CompressorIn_bh6_6_6));

  assign heap_bh6_w15_13 = CompressorOut_bh6_6_6[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w16_12 = CompressorOut_bh6_6_6[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w17_11 = CompressorOut_bh6_6_6[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_7_7 = {heap_bh6_w16_10,heap_bh6_w16_9,heap_bh6_w16_8,heap_bh6_w16_7,heap_bh6_w16_6,heap_bh6_w16_5};
  Compressor_6_3 Compressor_bh6_7(
      .R(CompressorOut_bh6_7_7),
    .X0(CompressorIn_bh6_7_7));

  assign heap_bh6_w16_13 = CompressorOut_bh6_7_7[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w17_12 = CompressorOut_bh6_7_7[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w18_13 = CompressorOut_bh6_7_7[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_8_8 = {heap_bh6_w17_10,heap_bh6_w17_9,heap_bh6_w17_8,heap_bh6_w17_7,heap_bh6_w17_6,heap_bh6_w17_5};
  Compressor_6_3 Compressor_bh6_8(
      .R(CompressorOut_bh6_8_8),
    .X0(CompressorIn_bh6_8_8));

  assign heap_bh6_w17_13 = CompressorOut_bh6_8_8[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w18_14 = CompressorOut_bh6_8_8[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w19_13 = CompressorOut_bh6_8_8[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_9_9 = {heap_bh6_w18_12,heap_bh6_w18_11,heap_bh6_w18_10,heap_bh6_w18_9,heap_bh6_w18_8,heap_bh6_w18_7};
  Compressor_6_3 Compressor_bh6_9(
      .R(CompressorOut_bh6_9_9),
    .X0(CompressorIn_bh6_9_9));

  assign heap_bh6_w18_15 = CompressorOut_bh6_9_9[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w19_14 = CompressorOut_bh6_9_9[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w20_13 = CompressorOut_bh6_9_9[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_10_10 = {heap_bh6_w18_6,heap_bh6_w18_5,heap_bh6_w18_4,heap_bh6_w18_3,heap_bh6_w18_2,heap_bh6_w18_1};
  Compressor_6_3 Compressor_bh6_10(
      .R(CompressorOut_bh6_10_10),
    .X0(CompressorIn_bh6_10_10));

  assign heap_bh6_w18_16 = CompressorOut_bh6_10_10[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w19_15 = CompressorOut_bh6_10_10[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w20_14 = CompressorOut_bh6_10_10[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_11_11 = {heap_bh6_w19_12,heap_bh6_w19_11,heap_bh6_w19_10,heap_bh6_w19_9,heap_bh6_w19_8,heap_bh6_w19_7};
  Compressor_6_3 Compressor_bh6_11(
      .R(CompressorOut_bh6_11_11),
    .X0(CompressorIn_bh6_11_11));

  assign heap_bh6_w19_16 = CompressorOut_bh6_11_11[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w20_15 = CompressorOut_bh6_11_11[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w21_15 = CompressorOut_bh6_11_11[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_12_12 = {heap_bh6_w19_6,heap_bh6_w19_5,heap_bh6_w19_4,heap_bh6_w19_3,heap_bh6_w19_2,heap_bh6_w19_1};
  Compressor_6_3 Compressor_bh6_12(
      .R(CompressorOut_bh6_12_12),
    .X0(CompressorIn_bh6_12_12));

  assign heap_bh6_w19_17 = CompressorOut_bh6_12_12[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w20_16 = CompressorOut_bh6_12_12[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w21_16 = CompressorOut_bh6_12_12[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_13_13 = {heap_bh6_w20_12,heap_bh6_w20_11,heap_bh6_w20_10,heap_bh6_w20_9,heap_bh6_w20_8,heap_bh6_w20_7};
  Compressor_6_3 Compressor_bh6_13(
      .R(CompressorOut_bh6_13_13),
    .X0(CompressorIn_bh6_13_13));

  assign heap_bh6_w20_17 = CompressorOut_bh6_13_13[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w21_17 = CompressorOut_bh6_13_13[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w22_15 = CompressorOut_bh6_13_13[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_14_14 = {heap_bh6_w20_6,heap_bh6_w20_5,heap_bh6_w20_4,heap_bh6_w20_3,heap_bh6_w20_2,heap_bh6_w20_1};
  Compressor_6_3 Compressor_bh6_14(
      .R(CompressorOut_bh6_14_14),
    .X0(CompressorIn_bh6_14_14));

  assign heap_bh6_w20_18 = CompressorOut_bh6_14_14[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w21_18 = CompressorOut_bh6_14_14[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w22_16 = CompressorOut_bh6_14_14[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_15_15 = {heap_bh6_w21_14,heap_bh6_w21_13,heap_bh6_w21_12,heap_bh6_w21_11,heap_bh6_w21_10,heap_bh6_w21_9};
  Compressor_6_3 Compressor_bh6_15(
      .R(CompressorOut_bh6_15_15),
    .X0(CompressorIn_bh6_15_15));

  assign heap_bh6_w21_19 = CompressorOut_bh6_15_15[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w22_17 = CompressorOut_bh6_15_15[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w23_15 = CompressorOut_bh6_15_15[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_16_16 = {heap_bh6_w21_8,heap_bh6_w21_7,heap_bh6_w21_6,heap_bh6_w21_5,heap_bh6_w21_4,heap_bh6_w21_3};
  Compressor_6_3 Compressor_bh6_16(
      .R(CompressorOut_bh6_16_16),
    .X0(CompressorIn_bh6_16_16));

  assign heap_bh6_w21_20 = CompressorOut_bh6_16_16[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w22_18 = CompressorOut_bh6_16_16[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w23_16 = CompressorOut_bh6_16_16[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_17_17 = {heap_bh6_w22_14,heap_bh6_w22_13,heap_bh6_w22_12,heap_bh6_w22_11,heap_bh6_w22_10,heap_bh6_w22_9};
  Compressor_6_3 Compressor_bh6_17(
      .R(CompressorOut_bh6_17_17),
    .X0(CompressorIn_bh6_17_17));

  assign heap_bh6_w22_19 = CompressorOut_bh6_17_17[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w23_17 = CompressorOut_bh6_17_17[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w24_15 = CompressorOut_bh6_17_17[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_18_18 = {heap_bh6_w22_8,heap_bh6_w22_7,heap_bh6_w22_6,heap_bh6_w22_5,heap_bh6_w22_4,heap_bh6_w22_3};
  Compressor_6_3 Compressor_bh6_18(
      .R(CompressorOut_bh6_18_18),
    .X0(CompressorIn_bh6_18_18));

  assign heap_bh6_w22_20 = CompressorOut_bh6_18_18[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w23_18 = CompressorOut_bh6_18_18[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w24_16 = CompressorOut_bh6_18_18[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_19_19 = {heap_bh6_w23_14,heap_bh6_w23_13,heap_bh6_w23_12,heap_bh6_w23_11,heap_bh6_w23_10,heap_bh6_w23_9};
  Compressor_6_3 Compressor_bh6_19(
      .R(CompressorOut_bh6_19_19),
    .X0(CompressorIn_bh6_19_19));

  assign heap_bh6_w23_19 = CompressorOut_bh6_19_19[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w24_17 = CompressorOut_bh6_19_19[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w25_15 = CompressorOut_bh6_19_19[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_20_20 = {heap_bh6_w23_8,heap_bh6_w23_7,heap_bh6_w23_6,heap_bh6_w23_5,heap_bh6_w23_4,heap_bh6_w23_3};
  Compressor_6_3 Compressor_bh6_20(
      .R(CompressorOut_bh6_20_20),
    .X0(CompressorIn_bh6_20_20));

  assign heap_bh6_w23_20 = CompressorOut_bh6_20_20[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w24_18 = CompressorOut_bh6_20_20[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w25_16 = CompressorOut_bh6_20_20[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_21_21 = {heap_bh6_w24_14,heap_bh6_w24_13,heap_bh6_w24_12,heap_bh6_w24_11,heap_bh6_w24_10,heap_bh6_w24_9};
  Compressor_6_3 Compressor_bh6_21(
      .R(CompressorOut_bh6_21_21),
    .X0(CompressorIn_bh6_21_21));

  assign heap_bh6_w24_19 = CompressorOut_bh6_21_21[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w25_17 = CompressorOut_bh6_21_21[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w26_15 = CompressorOut_bh6_21_21[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_22_22 = {heap_bh6_w24_8,heap_bh6_w24_7,heap_bh6_w24_6,heap_bh6_w24_5,heap_bh6_w24_4,heap_bh6_w24_3};
  Compressor_6_3 Compressor_bh6_22(
      .R(CompressorOut_bh6_22_22),
    .X0(CompressorIn_bh6_22_22));

  assign heap_bh6_w24_20 = CompressorOut_bh6_22_22[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w25_18 = CompressorOut_bh6_22_22[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w26_16 = CompressorOut_bh6_22_22[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_23_23 = {heap_bh6_w25_14,heap_bh6_w25_13,heap_bh6_w25_12,heap_bh6_w25_11,heap_bh6_w25_10,heap_bh6_w25_9};
  Compressor_6_3 Compressor_bh6_23(
      .R(CompressorOut_bh6_23_23),
    .X0(CompressorIn_bh6_23_23));

  assign heap_bh6_w25_19 = CompressorOut_bh6_23_23[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w26_17 = CompressorOut_bh6_23_23[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w27_13 = CompressorOut_bh6_23_23[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_24_24 = {heap_bh6_w25_8,heap_bh6_w25_7,heap_bh6_w25_6,heap_bh6_w25_5,heap_bh6_w25_4,heap_bh6_w25_3};
  Compressor_6_3 Compressor_bh6_24(
      .R(CompressorOut_bh6_24_24),
    .X0(CompressorIn_bh6_24_24));

  assign heap_bh6_w25_20 = CompressorOut_bh6_24_24[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w26_18 = CompressorOut_bh6_24_24[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w27_14 = CompressorOut_bh6_24_24[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_25_25 = {heap_bh6_w26_14,heap_bh6_w26_13,heap_bh6_w26_12,heap_bh6_w26_11,heap_bh6_w26_10,heap_bh6_w26_9};
  Compressor_6_3 Compressor_bh6_25(
      .R(CompressorOut_bh6_25_25),
    .X0(CompressorIn_bh6_25_25));

  assign heap_bh6_w26_19 = CompressorOut_bh6_25_25[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w27_15 = CompressorOut_bh6_25_25[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w28_13 = CompressorOut_bh6_25_25[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_26_26 = {heap_bh6_w26_8,heap_bh6_w26_7,heap_bh6_w26_6,heap_bh6_w26_5,heap_bh6_w26_4,heap_bh6_w26_3};
  Compressor_6_3 Compressor_bh6_26(
      .R(CompressorOut_bh6_26_26),
    .X0(CompressorIn_bh6_26_26));

  assign heap_bh6_w26_20 = CompressorOut_bh6_26_26[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w27_16 = CompressorOut_bh6_26_26[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w28_14 = CompressorOut_bh6_26_26[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_27_27 = {heap_bh6_w27_12,heap_bh6_w27_11,heap_bh6_w27_10,heap_bh6_w27_9,heap_bh6_w27_8,heap_bh6_w27_7};
  Compressor_6_3 Compressor_bh6_27(
      .R(CompressorOut_bh6_27_27),
    .X0(CompressorIn_bh6_27_27));

  assign heap_bh6_w27_17 = CompressorOut_bh6_27_27[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w28_15 = CompressorOut_bh6_27_27[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w29_13 = CompressorOut_bh6_27_27[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_28_28 = {heap_bh6_w27_6,heap_bh6_w27_5,heap_bh6_w27_4,heap_bh6_w27_3,heap_bh6_w27_2,heap_bh6_w27_1};
  Compressor_6_3 Compressor_bh6_28(
      .R(CompressorOut_bh6_28_28),
    .X0(CompressorIn_bh6_28_28));

  assign heap_bh6_w27_18 = CompressorOut_bh6_28_28[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w28_16 = CompressorOut_bh6_28_28[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w29_14 = CompressorOut_bh6_28_28[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_29_29 = {heap_bh6_w28_12,heap_bh6_w28_11,heap_bh6_w28_10,heap_bh6_w28_9,heap_bh6_w28_8,heap_bh6_w28_7};
  Compressor_6_3 Compressor_bh6_29(
      .R(CompressorOut_bh6_29_29),
    .X0(CompressorIn_bh6_29_29));

  assign heap_bh6_w28_17 = CompressorOut_bh6_29_29[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w29_15 = CompressorOut_bh6_29_29[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w30_11 = CompressorOut_bh6_29_29[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_30_30 = {heap_bh6_w28_6,heap_bh6_w28_5,heap_bh6_w28_4,heap_bh6_w28_3,heap_bh6_w28_2,heap_bh6_w28_1};
  Compressor_6_3 Compressor_bh6_30(
      .R(CompressorOut_bh6_30_30),
    .X0(CompressorIn_bh6_30_30));

  assign heap_bh6_w28_18 = CompressorOut_bh6_30_30[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w29_16 = CompressorOut_bh6_30_30[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w30_12 = CompressorOut_bh6_30_30[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_31_31 = {heap_bh6_w29_12,heap_bh6_w29_11,heap_bh6_w29_10,heap_bh6_w29_9,heap_bh6_w29_8,heap_bh6_w29_7};
  Compressor_6_3 Compressor_bh6_31(
      .R(CompressorOut_bh6_31_31),
    .X0(CompressorIn_bh6_31_31));

  assign heap_bh6_w29_17 = CompressorOut_bh6_31_31[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w30_13 = CompressorOut_bh6_31_31[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w31_11 = CompressorOut_bh6_31_31[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_32_32 = {heap_bh6_w29_6,heap_bh6_w29_5,heap_bh6_w29_4,heap_bh6_w29_3,heap_bh6_w29_2,heap_bh6_w29_1};
  Compressor_6_3 Compressor_bh6_32(
      .R(CompressorOut_bh6_32_32),
    .X0(CompressorIn_bh6_32_32));

  assign heap_bh6_w29_18 = CompressorOut_bh6_32_32[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w30_14 = CompressorOut_bh6_32_32[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w31_12 = CompressorOut_bh6_32_32[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_33_33 = {heap_bh6_w30_10,heap_bh6_w30_9,heap_bh6_w30_8,heap_bh6_w30_7,heap_bh6_w30_6,heap_bh6_w30_5};
  Compressor_6_3 Compressor_bh6_33(
      .R(CompressorOut_bh6_33_33),
    .X0(CompressorIn_bh6_33_33));

  assign heap_bh6_w30_15 = CompressorOut_bh6_33_33[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w31_13 = CompressorOut_bh6_33_33[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w32_11 = CompressorOut_bh6_33_33[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_34_34 = {heap_bh6_w31_10,heap_bh6_w31_9,heap_bh6_w31_8,heap_bh6_w31_7,heap_bh6_w31_6,heap_bh6_w31_5};
  Compressor_6_3 Compressor_bh6_34(
      .R(CompressorOut_bh6_34_34),
    .X0(CompressorIn_bh6_34_34));

  assign heap_bh6_w31_14 = CompressorOut_bh6_34_34[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w32_12 = CompressorOut_bh6_34_34[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w33_9 = CompressorOut_bh6_34_34[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_35_35 = {heap_bh6_w32_10,heap_bh6_w32_9,heap_bh6_w32_8,heap_bh6_w32_7,heap_bh6_w32_6,heap_bh6_w32_5};
  Compressor_6_3 Compressor_bh6_35(
      .R(CompressorOut_bh6_35_35),
    .X0(CompressorIn_bh6_35_35));

  assign heap_bh6_w32_13 = CompressorOut_bh6_35_35[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w33_10 = CompressorOut_bh6_35_35[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w34_9 = CompressorOut_bh6_35_35[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_36_36 = {heap_bh6_w33_8,heap_bh6_w33_7,heap_bh6_w33_6,heap_bh6_w33_5,heap_bh6_w33_4,heap_bh6_w33_3};
  Compressor_6_3 Compressor_bh6_36(
      .R(CompressorOut_bh6_36_36),
    .X0(CompressorIn_bh6_36_36));

  assign heap_bh6_w33_11 = CompressorOut_bh6_36_36[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w34_10 = CompressorOut_bh6_36_36[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w35_9 = CompressorOut_bh6_36_36[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_37_37 = {heap_bh6_w34_8,heap_bh6_w34_7,heap_bh6_w34_6,heap_bh6_w34_5,heap_bh6_w34_4,heap_bh6_w34_3};
  Compressor_6_3 Compressor_bh6_37(
      .R(CompressorOut_bh6_37_37),
    .X0(CompressorIn_bh6_37_37));

  assign heap_bh6_w34_11 = CompressorOut_bh6_37_37[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w35_10 = CompressorOut_bh6_37_37[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w36_7 = CompressorOut_bh6_37_37[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_38_38 = {heap_bh6_w35_8,heap_bh6_w35_7,heap_bh6_w35_6,heap_bh6_w35_5,heap_bh6_w35_4,heap_bh6_w35_3};
  Compressor_6_3 Compressor_bh6_38(
      .R(CompressorOut_bh6_38_38),
    .X0(CompressorIn_bh6_38_38));

  assign heap_bh6_w35_11 = CompressorOut_bh6_38_38[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w36_8 = CompressorOut_bh6_38_38[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w37_7 = CompressorOut_bh6_38_38[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_39_39 = {heap_bh6_w36_6,heap_bh6_w36_5,heap_bh6_w36_4,heap_bh6_w36_3,heap_bh6_w36_2,heap_bh6_w36_1};
  Compressor_6_3 Compressor_bh6_39(
      .R(CompressorOut_bh6_39_39),
    .X0(CompressorIn_bh6_39_39));

  assign heap_bh6_w36_9 = CompressorOut_bh6_39_39[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w37_8 = CompressorOut_bh6_39_39[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w38_7 = CompressorOut_bh6_39_39[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_40_40 = {heap_bh6_w37_6,heap_bh6_w37_5,heap_bh6_w37_4,heap_bh6_w37_3,heap_bh6_w37_2,heap_bh6_w37_1};
  Compressor_6_3 Compressor_bh6_40(
      .R(CompressorOut_bh6_40_40),
    .X0(CompressorIn_bh6_40_40));

  assign heap_bh6_w37_9 = CompressorOut_bh6_40_40[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w38_8 = CompressorOut_bh6_40_40[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w39_5 = CompressorOut_bh6_40_40[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_41_41 = {heap_bh6_w38_6,heap_bh6_w38_5,heap_bh6_w38_4,heap_bh6_w38_3,heap_bh6_w38_2,heap_bh6_w38_1};
  Compressor_6_3 Compressor_bh6_41(
      .R(CompressorOut_bh6_41_41),
    .X0(CompressorIn_bh6_41_41));

  assign heap_bh6_w38_9 = CompressorOut_bh6_41_41[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w39_6 = CompressorOut_bh6_41_41[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w40_5 = CompressorOut_bh6_41_41[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_42_42 = {heap_bh6_w6_4,heap_bh6_w6_3,heap_bh6_w6_2,heap_bh6_w6_1};
  assign CompressorIn_bh6_42_43[0] = heap_bh6_w7_4;
  Compressor_14_3 Compressor_bh6_42(
      .R(CompressorOut_bh6_42_42),
    .X0(CompressorIn_bh6_42_42),
    .X1(CompressorIn_bh6_42_43));

  assign heap_bh6_w6_5 = CompressorOut_bh6_42_42[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w7_5 = CompressorOut_bh6_42_42[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w8_5 = CompressorOut_bh6_42_42[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_43_44 = {heap_bh6_w7_3,heap_bh6_w7_2,heap_bh6_w7_1,heap_bh6_w7_0};
  assign CompressorIn_bh6_43_45[0] = heap_bh6_w8_4;
  Compressor_14_3 Compressor_bh6_43(
      .R(CompressorOut_bh6_43_43),
    .X0(CompressorIn_bh6_43_44),
    .X1(CompressorIn_bh6_43_45));

  assign heap_bh6_w7_6 = CompressorOut_bh6_43_43[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w8_6 = CompressorOut_bh6_43_43[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w9_8 = CompressorOut_bh6_43_43[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_44_46 = {heap_bh6_w8_3,heap_bh6_w8_2,heap_bh6_w8_1,heap_bh6_w8_0};
  assign CompressorIn_bh6_44_47[0] = heap_bh6_w9_0;
  Compressor_14_3 Compressor_bh6_44(
      .R(CompressorOut_bh6_44_44),
    .X0(CompressorIn_bh6_44_46),
    .X1(CompressorIn_bh6_44_47));

  assign heap_bh6_w8_7 = CompressorOut_bh6_44_44[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w9_9 = CompressorOut_bh6_44_44[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w10_9 = CompressorOut_bh6_44_44[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_45_48 = {heap_bh6_w15_4,heap_bh6_w15_3,heap_bh6_w15_2,heap_bh6_w15_1};
  assign CompressorIn_bh6_45_49[0] = heap_bh6_w16_4;
  Compressor_14_3 Compressor_bh6_45(
      .R(CompressorOut_bh6_45_45),
    .X0(CompressorIn_bh6_45_48),
    .X1(CompressorIn_bh6_45_49));

  assign heap_bh6_w15_14 = CompressorOut_bh6_45_45[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w16_14 = CompressorOut_bh6_45_45[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w17_14 = CompressorOut_bh6_45_45[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_46_50 = {heap_bh6_w16_3,heap_bh6_w16_2,heap_bh6_w16_1,heap_bh6_w16_0};
  assign CompressorIn_bh6_46_51[0] = heap_bh6_w17_4;
  Compressor_14_3 Compressor_bh6_46(
      .R(CompressorOut_bh6_46_46),
    .X0(CompressorIn_bh6_46_50),
    .X1(CompressorIn_bh6_46_51));

  assign heap_bh6_w16_15 = CompressorOut_bh6_46_46[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w17_15 = CompressorOut_bh6_46_46[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w18_17 = CompressorOut_bh6_46_46[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_47_52 = {heap_bh6_w17_3,heap_bh6_w17_2,heap_bh6_w17_1,heap_bh6_w17_0};
  assign CompressorIn_bh6_47_53[0] = heap_bh6_w18_0;
  Compressor_14_3 Compressor_bh6_47(
      .R(CompressorOut_bh6_47_47),
    .X0(CompressorIn_bh6_47_52),
    .X1(CompressorIn_bh6_47_53));

  assign heap_bh6_w17_16 = CompressorOut_bh6_47_47[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w18_18 = CompressorOut_bh6_47_47[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w19_18 = CompressorOut_bh6_47_47[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_48_54 = {heap_bh6_w30_4,heap_bh6_w30_3,heap_bh6_w30_2,heap_bh6_w30_1};
  assign CompressorIn_bh6_48_55[0] = heap_bh6_w31_4;
  Compressor_14_3 Compressor_bh6_48(
      .R(CompressorOut_bh6_48_48),
    .X0(CompressorIn_bh6_48_54),
    .X1(CompressorIn_bh6_48_55));

  assign heap_bh6_w30_16 = CompressorOut_bh6_48_48[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w31_15 = CompressorOut_bh6_48_48[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w32_14 = CompressorOut_bh6_48_48[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_49_56 = {heap_bh6_w31_3,heap_bh6_w31_2,heap_bh6_w31_1,heap_bh6_w31_0};
  assign CompressorIn_bh6_49_57[0] = heap_bh6_w32_4;
  Compressor_14_3 Compressor_bh6_49(
      .R(CompressorOut_bh6_49_49),
    .X0(CompressorIn_bh6_49_56),
    .X1(CompressorIn_bh6_49_57));

  assign heap_bh6_w31_16 = CompressorOut_bh6_49_49[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w32_15 = CompressorOut_bh6_49_49[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w33_12 = CompressorOut_bh6_49_49[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_50_58 = {heap_bh6_w32_3,heap_bh6_w32_2,heap_bh6_w32_1,heap_bh6_w32_0};
  assign CompressorIn_bh6_50_59[0] = heap_bh6_w33_2;
  Compressor_14_3 Compressor_bh6_50(
      .R(CompressorOut_bh6_50_50),
    .X0(CompressorIn_bh6_50_58),
    .X1(CompressorIn_bh6_50_59));

  assign heap_bh6_w32_16 = CompressorOut_bh6_50_50[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w33_13 = CompressorOut_bh6_50_50[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w34_12 = CompressorOut_bh6_50_50[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_51_60 = {heap_bh6_w39_4,heap_bh6_w39_3,heap_bh6_w39_2,heap_bh6_w39_1};
  assign CompressorIn_bh6_51_61[0] = heap_bh6_w40_4;
  Compressor_14_3 Compressor_bh6_51(
      .R(CompressorOut_bh6_51_51),
    .X0(CompressorIn_bh6_51_60),
    .X1(CompressorIn_bh6_51_61));

  assign heap_bh6_w39_7 = CompressorOut_bh6_51_51[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w40_6 = CompressorOut_bh6_51_51[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w41_5 = CompressorOut_bh6_51_51[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_52_62 = {heap_bh6_w40_3,heap_bh6_w40_2,heap_bh6_w40_1,heap_bh6_w40_0};
  assign CompressorIn_bh6_52_63[0] = heap_bh6_w41_4;
  Compressor_14_3 Compressor_bh6_52(
      .R(CompressorOut_bh6_52_52),
    .X0(CompressorIn_bh6_52_62),
    .X1(CompressorIn_bh6_52_63));

  assign heap_bh6_w40_7 = CompressorOut_bh6_52_52[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w41_6 = CompressorOut_bh6_52_52[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w42_3 = CompressorOut_bh6_52_52[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_53_64 = {heap_bh6_w41_3,heap_bh6_w41_2,heap_bh6_w41_1,heap_bh6_w41_0};
  assign CompressorIn_bh6_53_65[0] = heap_bh6_w42_2;
  Compressor_14_3 Compressor_bh6_53(
      .R(CompressorOut_bh6_53_53),
    .X0(CompressorIn_bh6_53_64),
    .X1(CompressorIn_bh6_53_65));

  assign heap_bh6_w41_7 = CompressorOut_bh6_53_53[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w42_4 = CompressorOut_bh6_53_53[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w43_3 = CompressorOut_bh6_53_53[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_54_66 = {heap_bh6_w3_2,heap_bh6_w3_1,heap_bh6_w3_0};
  assign CompressorIn_bh6_54_67 = {heap_bh6_w4_2,heap_bh6_w4_1};
  Compressor_23_3 Compressor_bh6_54(
      .R(CompressorOut_bh6_54_54),
    .X0(CompressorIn_bh6_54_66),
    .X1(CompressorIn_bh6_54_67));

  assign heap_bh6_w3_3 = CompressorOut_bh6_54_54[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w4_3 = CompressorOut_bh6_54_54[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w5_3 = CompressorOut_bh6_54_54[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_55_68 = {heap_bh6_w12_2,heap_bh6_w12_1,heap_bh6_w12_0};
  assign CompressorIn_bh6_55_69 = {heap_bh6_w13_2,heap_bh6_w13_1};
  Compressor_23_3 Compressor_bh6_55(
      .R(CompressorOut_bh6_55_55),
    .X0(CompressorIn_bh6_55_68),
    .X1(CompressorIn_bh6_55_69));

  assign heap_bh6_w12_12 = CompressorOut_bh6_55_55[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w13_12 = CompressorOut_bh6_55_55[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w14_12 = CompressorOut_bh6_55_55[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_56_70 = {heap_bh6_w21_2,heap_bh6_w21_1,heap_bh6_w21_0};
  assign CompressorIn_bh6_56_71 = {heap_bh6_w22_2,heap_bh6_w22_1};
  Compressor_23_3 Compressor_bh6_56(
      .R(CompressorOut_bh6_56_56),
    .X0(CompressorIn_bh6_56_70),
    .X1(CompressorIn_bh6_56_71));

  assign heap_bh6_w21_21 = CompressorOut_bh6_56_56[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w22_21 = CompressorOut_bh6_56_56[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w23_21 = CompressorOut_bh6_56_56[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_57_72 = {heap_bh6_w23_2,heap_bh6_w23_1,heap_bh6_w23_0};
  assign CompressorIn_bh6_57_73 = {heap_bh6_w24_2,heap_bh6_w24_1};
  Compressor_23_3 Compressor_bh6_57(
      .R(CompressorOut_bh6_57_57),
    .X0(CompressorIn_bh6_57_72),
    .X1(CompressorIn_bh6_57_73));

  assign heap_bh6_w23_22 = CompressorOut_bh6_57_57[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w24_21 = CompressorOut_bh6_57_57[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w25_21 = CompressorOut_bh6_57_57[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_58_74 = {heap_bh6_w25_2,heap_bh6_w25_1,heap_bh6_w25_0};
  assign CompressorIn_bh6_58_75 = {heap_bh6_w26_2,heap_bh6_w26_1};
  Compressor_23_3 Compressor_bh6_58(
      .R(CompressorOut_bh6_58_58),
    .X0(CompressorIn_bh6_58_74),
    .X1(CompressorIn_bh6_58_75));

  assign heap_bh6_w25_22 = CompressorOut_bh6_58_58[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w26_21 = CompressorOut_bh6_58_58[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w27_19 = CompressorOut_bh6_58_58[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_59_76 = {heap_bh6_w34_2,heap_bh6_w34_1,heap_bh6_w34_0};
  assign CompressorIn_bh6_59_77 = {heap_bh6_w35_2,heap_bh6_w35_1};
  Compressor_23_3 Compressor_bh6_59(
      .R(CompressorOut_bh6_59_59),
    .X0(CompressorIn_bh6_59_76),
    .X1(CompressorIn_bh6_59_77));

  assign heap_bh6_w34_13 = CompressorOut_bh6_59_59[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w35_12 = CompressorOut_bh6_59_59[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w36_10 = CompressorOut_bh6_59_59[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_60_78 = {heap_bh6_w43_2,heap_bh6_w43_1,heap_bh6_w43_0};
  assign CompressorIn_bh6_60_79 = {heap_bh6_w44_2,heap_bh6_w44_1};
  Compressor_23_3 Compressor_bh6_60(
      .R(CompressorOut_bh6_60_60),
    .X0(CompressorIn_bh6_60_78),
    .X1(CompressorIn_bh6_60_79));

  assign heap_bh6_w43_4 = CompressorOut_bh6_60_60[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w44_3 = CompressorOut_bh6_60_60[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w45_1 = CompressorOut_bh6_60_60[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_61_80 = {heap_bh6_w5_2,heap_bh6_w5_1,heap_bh6_w5_0};
  assign CompressorIn_bh6_61_81[0] = heap_bh6_w6_0;
  Compressor_13_3 Compressor_bh6_61(
      .R(CompressorOut_bh6_61_61),
    .X0(CompressorIn_bh6_61_80),
    .X1(CompressorIn_bh6_61_81));

  assign heap_bh6_w5_4 = CompressorOut_bh6_61_61[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w6_6 = CompressorOut_bh6_61_61[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w7_7 = CompressorOut_bh6_61_61[2];
  // cycle= 0 cp= 1.12248e-09
  assign CompressorIn_bh6_62_82 = {heap_bh6_w14_2,heap_bh6_w14_1,heap_bh6_w14_0};
  assign CompressorIn_bh6_62_83[0] = heap_bh6_w15_0;
  Compressor_13_3 Compressor_bh6_62(
      .R(CompressorOut_bh6_62_62),
    .X0(CompressorIn_bh6_62_82),
    .X1(CompressorIn_bh6_62_83));

  assign heap_bh6_w14_13 = CompressorOut_bh6_62_62[0];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w15_15 = CompressorOut_bh6_62_62[1];
  // cycle= 0 cp= 1.12248e-09
  assign heap_bh6_w16_16 = CompressorOut_bh6_62_62[2];
  // cycle= 0 cp= 1.12248e-09
  assign tempR_bh6_1 = heap_bh6_w3_3;
  // already compressed
  assign CompressorIn_bh6_63_84 = {heap_bh6_w16_16,heap_bh6_w16_15,heap_bh6_w16_14,heap_bh6_w16_13,heap_bh6_w16_12,heap_bh6_w16_11};
  Compressor_6_3 Compressor_bh6_63(
      .R(CompressorOut_bh6_63_63),
    .X0(CompressorIn_bh6_63_84));

  assign heap_bh6_w16_17 = CompressorOut_bh6_63_63[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w17_17 = CompressorOut_bh6_63_63[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w18_19 = CompressorOut_bh6_63_63[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_64_85 = {heap_bh6_w17_16,heap_bh6_w17_15,heap_bh6_w17_14,heap_bh6_w17_13,heap_bh6_w17_12,heap_bh6_w17_11};
  Compressor_6_3 Compressor_bh6_64(
      .R(CompressorOut_bh6_64_64),
    .X0(CompressorIn_bh6_64_85));

  assign heap_bh6_w17_18 = CompressorOut_bh6_64_64[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w18_20 = CompressorOut_bh6_64_64[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w19_19 = CompressorOut_bh6_64_64[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_65_86 = {heap_bh6_w18_18,heap_bh6_w18_17,heap_bh6_w18_16,heap_bh6_w18_15,heap_bh6_w18_14,heap_bh6_w18_13};
  Compressor_6_3 Compressor_bh6_65(
      .R(CompressorOut_bh6_65_65),
    .X0(CompressorIn_bh6_65_86));

  assign heap_bh6_w18_21 = CompressorOut_bh6_65_65[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w19_20 = CompressorOut_bh6_65_65[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w20_19 = CompressorOut_bh6_65_65[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_66_87 = {heap_bh6_w19_0,heap_bh6_w19_18,heap_bh6_w19_17,heap_bh6_w19_16,heap_bh6_w19_15,heap_bh6_w19_14};
  Compressor_6_3 Compressor_bh6_66(
      .R(CompressorOut_bh6_66_66),
    .X0(CompressorIn_bh6_66_87));

  assign heap_bh6_w19_21 = CompressorOut_bh6_66_66[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w20_20 = CompressorOut_bh6_66_66[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w21_22 = CompressorOut_bh6_66_66[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_67_88 = {heap_bh6_w20_0,heap_bh6_w20_18,heap_bh6_w20_17,heap_bh6_w20_16,heap_bh6_w20_15,heap_bh6_w20_14};
  Compressor_6_3 Compressor_bh6_67(
      .R(CompressorOut_bh6_67_67),
    .X0(CompressorIn_bh6_67_88));

  assign heap_bh6_w20_21 = CompressorOut_bh6_67_67[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w21_23 = CompressorOut_bh6_67_67[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w22_22 = CompressorOut_bh6_67_67[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_68_89 = {heap_bh6_w21_21,heap_bh6_w21_20,heap_bh6_w21_19,heap_bh6_w21_18,heap_bh6_w21_17,heap_bh6_w21_16};
  Compressor_6_3 Compressor_bh6_68(
      .R(CompressorOut_bh6_68_68),
    .X0(CompressorIn_bh6_68_89));

  assign heap_bh6_w21_24 = CompressorOut_bh6_68_68[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w22_23 = CompressorOut_bh6_68_68[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w23_23 = CompressorOut_bh6_68_68[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_69_90 = {heap_bh6_w22_0,heap_bh6_w22_21,heap_bh6_w22_20,heap_bh6_w22_19,heap_bh6_w22_18,heap_bh6_w22_17};
  Compressor_6_3 Compressor_bh6_69(
      .R(CompressorOut_bh6_69_69),
    .X0(CompressorIn_bh6_69_90));

  assign heap_bh6_w22_24 = CompressorOut_bh6_69_69[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w23_24 = CompressorOut_bh6_69_69[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w24_22 = CompressorOut_bh6_69_69[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_70_91 = {heap_bh6_w23_22,heap_bh6_w23_21,heap_bh6_w23_20,heap_bh6_w23_19,heap_bh6_w23_18,heap_bh6_w23_17};
  Compressor_6_3 Compressor_bh6_70(
      .R(CompressorOut_bh6_70_70),
    .X0(CompressorIn_bh6_70_91));

  assign heap_bh6_w23_25 = CompressorOut_bh6_70_70[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w24_23 = CompressorOut_bh6_70_70[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w25_23 = CompressorOut_bh6_70_70[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_71_92 = {heap_bh6_w24_0,heap_bh6_w24_21,heap_bh6_w24_20,heap_bh6_w24_19,heap_bh6_w24_18,heap_bh6_w24_17};
  Compressor_6_3 Compressor_bh6_71(
      .R(CompressorOut_bh6_71_71),
    .X0(CompressorIn_bh6_71_92));

  assign heap_bh6_w24_24 = CompressorOut_bh6_71_71[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w25_24 = CompressorOut_bh6_71_71[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w26_22 = CompressorOut_bh6_71_71[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_72_93 = {heap_bh6_w25_22,heap_bh6_w25_21,heap_bh6_w25_20,heap_bh6_w25_19,heap_bh6_w25_18,heap_bh6_w25_17};
  Compressor_6_3 Compressor_bh6_72(
      .R(CompressorOut_bh6_72_72),
    .X0(CompressorIn_bh6_72_93));

  assign heap_bh6_w25_25 = CompressorOut_bh6_72_72[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w26_23 = CompressorOut_bh6_72_72[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w27_20 = CompressorOut_bh6_72_72[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_73_94 = {heap_bh6_w26_0,heap_bh6_w26_21,heap_bh6_w26_20,heap_bh6_w26_19,heap_bh6_w26_18,heap_bh6_w26_17};
  Compressor_6_3 Compressor_bh6_73(
      .R(CompressorOut_bh6_73_73),
    .X0(CompressorIn_bh6_73_94));

  assign heap_bh6_w26_24 = CompressorOut_bh6_73_73[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w27_21 = CompressorOut_bh6_73_73[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w28_19 = CompressorOut_bh6_73_73[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_74_95 = {heap_bh6_w27_0,heap_bh6_w27_19,heap_bh6_w27_18,heap_bh6_w27_17,heap_bh6_w27_16,heap_bh6_w27_15};
  Compressor_6_3 Compressor_bh6_74(
      .R(CompressorOut_bh6_74_74),
    .X0(CompressorIn_bh6_74_95));

  assign heap_bh6_w27_22 = CompressorOut_bh6_74_74[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w28_20 = CompressorOut_bh6_74_74[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w29_19 = CompressorOut_bh6_74_74[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_75_96 = {heap_bh6_w28_0,heap_bh6_w28_18,heap_bh6_w28_17,heap_bh6_w28_16,heap_bh6_w28_15,heap_bh6_w28_14};
  Compressor_6_3 Compressor_bh6_75(
      .R(CompressorOut_bh6_75_75),
    .X0(CompressorIn_bh6_75_96));

  assign heap_bh6_w28_21 = CompressorOut_bh6_75_75[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w29_20 = CompressorOut_bh6_75_75[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w30_17 = CompressorOut_bh6_75_75[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_76_97 = {heap_bh6_w29_0,heap_bh6_w29_18,heap_bh6_w29_17,heap_bh6_w29_16,heap_bh6_w29_15,heap_bh6_w29_14};
  Compressor_6_3 Compressor_bh6_76(
      .R(CompressorOut_bh6_76_76),
    .X0(CompressorIn_bh6_76_97));

  assign heap_bh6_w29_21 = CompressorOut_bh6_76_76[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w30_18 = CompressorOut_bh6_76_76[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w31_17 = CompressorOut_bh6_76_76[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_77_98 = {heap_bh6_w30_0,heap_bh6_w30_16,heap_bh6_w30_15,heap_bh6_w30_14,heap_bh6_w30_13,heap_bh6_w30_12};
  Compressor_6_3 Compressor_bh6_77(
      .R(CompressorOut_bh6_77_77),
    .X0(CompressorIn_bh6_77_98));

  assign heap_bh6_w30_19 = CompressorOut_bh6_77_77[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w31_18 = CompressorOut_bh6_77_77[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w32_17 = CompressorOut_bh6_77_77[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_78_99 = {heap_bh6_w31_16,heap_bh6_w31_15,heap_bh6_w31_14,heap_bh6_w31_13,heap_bh6_w31_12,heap_bh6_w31_11};
  Compressor_6_3 Compressor_bh6_78(
      .R(CompressorOut_bh6_78_78),
    .X0(CompressorIn_bh6_78_99));

  assign heap_bh6_w31_19 = CompressorOut_bh6_78_78[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w32_18 = CompressorOut_bh6_78_78[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w33_14 = CompressorOut_bh6_78_78[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_79_100 = {heap_bh6_w32_16,heap_bh6_w32_15,heap_bh6_w32_14,heap_bh6_w32_13,heap_bh6_w32_12,heap_bh6_w32_11};
  Compressor_6_3 Compressor_bh6_79(
      .R(CompressorOut_bh6_79_79),
    .X0(CompressorIn_bh6_79_100));

  assign heap_bh6_w32_19 = CompressorOut_bh6_79_79[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w33_15 = CompressorOut_bh6_79_79[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w34_14 = CompressorOut_bh6_79_79[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_80_101 = {heap_bh6_w33_1,heap_bh6_w33_0,heap_bh6_w33_13,heap_bh6_w33_12,heap_bh6_w33_11,heap_bh6_w33_10};
  Compressor_6_3 Compressor_bh6_80(
      .R(CompressorOut_bh6_80_80),
    .X0(CompressorIn_bh6_80_101));

  assign heap_bh6_w33_16 = CompressorOut_bh6_80_80[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w34_15 = CompressorOut_bh6_80_80[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w35_13 = CompressorOut_bh6_80_80[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_81_102 = {heap_bh6_w10_0,heap_bh6_w10_9,heap_bh6_w10_8,heap_bh6_w10_7};
  assign CompressorIn_bh6_81_103[0] = heap_bh6_w11_0;
  Compressor_14_3 Compressor_bh6_81(
      .R(CompressorOut_bh6_81_81),
    .X0(CompressorIn_bh6_81_102),
    .X1(CompressorIn_bh6_81_103));

  assign heap_bh6_w10_10 = CompressorOut_bh6_81_81[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w11_10 = CompressorOut_bh6_81_81[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w12_13 = CompressorOut_bh6_81_81[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_82_104 = {heap_bh6_w12_12,heap_bh6_w12_11,heap_bh6_w12_10,heap_bh6_w12_9};
  assign CompressorIn_bh6_82_105[0] = heap_bh6_w13_0;
  Compressor_14_3 Compressor_bh6_82(
      .R(CompressorOut_bh6_82_82),
    .X0(CompressorIn_bh6_82_104),
    .X1(CompressorIn_bh6_82_105));

  assign heap_bh6_w12_14 = CompressorOut_bh6_82_82[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w13_13 = CompressorOut_bh6_82_82[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w14_14 = CompressorOut_bh6_82_82[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_83_106 = {heap_bh6_w13_12,heap_bh6_w13_11,heap_bh6_w13_10,heap_bh6_w13_9};
  assign CompressorIn_bh6_83_107[0] = heap_bh6_w14_13;
  Compressor_14_3 Compressor_bh6_83(
      .R(CompressorOut_bh6_83_83),
    .X0(CompressorIn_bh6_83_106),
    .X1(CompressorIn_bh6_83_107));

  assign heap_bh6_w13_14 = CompressorOut_bh6_83_83[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w14_15 = CompressorOut_bh6_83_83[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w15_16 = CompressorOut_bh6_83_83[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_84_108 = {heap_bh6_w14_12,heap_bh6_w14_11,heap_bh6_w14_10,heap_bh6_w14_9};
  assign CompressorIn_bh6_84_109[0] = heap_bh6_w15_15;
  Compressor_14_3 Compressor_bh6_84(
      .R(CompressorOut_bh6_84_84),
    .X0(CompressorIn_bh6_84_108),
    .X1(CompressorIn_bh6_84_109));

  assign heap_bh6_w14_16 = CompressorOut_bh6_84_84[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w15_17 = CompressorOut_bh6_84_84[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w16_18 = CompressorOut_bh6_84_84[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_85_110 = {heap_bh6_w34_13,heap_bh6_w34_12,heap_bh6_w34_11,heap_bh6_w34_10};
  assign CompressorIn_bh6_85_111[0] = heap_bh6_w35_0;
  Compressor_14_3 Compressor_bh6_85(
      .R(CompressorOut_bh6_85_85),
    .X0(CompressorIn_bh6_85_110),
    .X1(CompressorIn_bh6_85_111));

  assign heap_bh6_w34_16 = CompressorOut_bh6_85_85[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w35_14 = CompressorOut_bh6_85_85[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w36_11 = CompressorOut_bh6_85_85[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_86_112 = {heap_bh6_w35_12,heap_bh6_w35_11,heap_bh6_w35_10,heap_bh6_w35_9};
  assign CompressorIn_bh6_86_113[0] = heap_bh6_w36_0;
  Compressor_14_3 Compressor_bh6_86(
      .R(CompressorOut_bh6_86_86),
    .X0(CompressorIn_bh6_86_112),
    .X1(CompressorIn_bh6_86_113));

  assign heap_bh6_w35_15 = CompressorOut_bh6_86_86[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w36_12 = CompressorOut_bh6_86_86[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w37_10 = CompressorOut_bh6_86_86[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_87_114 = {heap_bh6_w36_10,heap_bh6_w36_9,heap_bh6_w36_8,heap_bh6_w36_7};
  assign CompressorIn_bh6_87_115[0] = heap_bh6_w37_0;
  Compressor_14_3 Compressor_bh6_87(
      .R(CompressorOut_bh6_87_87),
    .X0(CompressorIn_bh6_87_114),
    .X1(CompressorIn_bh6_87_115));

  assign heap_bh6_w36_13 = CompressorOut_bh6_87_87[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w37_11 = CompressorOut_bh6_87_87[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w38_10 = CompressorOut_bh6_87_87[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_88_116 = {heap_bh6_w38_0,heap_bh6_w38_9,heap_bh6_w38_8,heap_bh6_w38_7};
  assign CompressorIn_bh6_88_117[0] = heap_bh6_w39_0;
  Compressor_14_3 Compressor_bh6_88(
      .R(CompressorOut_bh6_88_88),
    .X0(CompressorIn_bh6_88_116),
    .X1(CompressorIn_bh6_88_117));

  assign heap_bh6_w38_11 = CompressorOut_bh6_88_88[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w39_8 = CompressorOut_bh6_88_88[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w40_8 = CompressorOut_bh6_88_88[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_89_118 = {heap_bh6_w42_1,heap_bh6_w42_0,heap_bh6_w42_4,heap_bh6_w42_3};
  assign CompressorIn_bh6_89_119[0] = heap_bh6_w43_4;
  Compressor_14_3 Compressor_bh6_89(
      .R(CompressorOut_bh6_89_89),
    .X0(CompressorIn_bh6_89_118),
    .X1(CompressorIn_bh6_89_119));

  assign heap_bh6_w42_5 = CompressorOut_bh6_89_89[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w43_5 = CompressorOut_bh6_89_89[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w44_4 = CompressorOut_bh6_89_89[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_90_120 = {heap_bh6_w15_14,heap_bh6_w15_13,heap_bh6_w15_12,heap_bh6_w15_11};
  Compressor_4_3 Compressor_bh6_90(
      .R(CompressorOut_bh6_90_90),
    .X0(CompressorIn_bh6_90_120));

  assign heap_bh6_w15_18 = CompressorOut_bh6_90_90[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w16_19 = CompressorOut_bh6_90_90[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w17_19 = CompressorOut_bh6_90_90[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_91_121 = {heap_bh6_w7_7,heap_bh6_w7_6,heap_bh6_w7_5};
  assign CompressorIn_bh6_91_122 = {heap_bh6_w8_7,heap_bh6_w8_6};
  Compressor_23_3 Compressor_bh6_91(
      .R(CompressorOut_bh6_91_91),
    .X0(CompressorIn_bh6_91_121),
    .X1(CompressorIn_bh6_91_122));

  assign heap_bh6_w7_8 = CompressorOut_bh6_91_91[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w8_8 = CompressorOut_bh6_91_91[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w9_10 = CompressorOut_bh6_91_91[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_92_123 = {heap_bh6_w39_7,heap_bh6_w39_6,heap_bh6_w39_5};
  assign CompressorIn_bh6_92_124 = {heap_bh6_w40_7,heap_bh6_w40_6};
  Compressor_23_3 Compressor_bh6_92(
      .R(CompressorOut_bh6_92_92),
    .X0(CompressorIn_bh6_92_123),
    .X1(CompressorIn_bh6_92_124));

  assign heap_bh6_w39_9 = CompressorOut_bh6_92_92[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w40_9 = CompressorOut_bh6_92_92[1];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w41_8 = CompressorOut_bh6_92_92[2];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_93_125 = {heap_bh6_w9_9,heap_bh6_w9_8,heap_bh6_w9_7};
  Compressor_3_2 Compressor_bh6_93(
      .R(CompressorOut_bh6_93_93),
    .X0(CompressorIn_bh6_93_125));

  assign heap_bh6_w9_11 = CompressorOut_bh6_93_93[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w10_11 = CompressorOut_bh6_93_93[1];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_94_126 = {heap_bh6_w11_9,heap_bh6_w11_8,heap_bh6_w11_7};
  Compressor_3_2 Compressor_bh6_94(
      .R(CompressorOut_bh6_94_94),
    .X0(CompressorIn_bh6_94_126));

  assign heap_bh6_w11_11 = CompressorOut_bh6_94_94[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w12_15 = CompressorOut_bh6_94_94[1];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_95_127 = {heap_bh6_w37_9,heap_bh6_w37_8,heap_bh6_w37_7};
  Compressor_3_2 Compressor_bh6_95(
      .R(CompressorOut_bh6_95_95),
    .X0(CompressorIn_bh6_95_127));

  assign heap_bh6_w37_12 = CompressorOut_bh6_95_95[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w38_12 = CompressorOut_bh6_95_95[1];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_96_128 = {heap_bh6_w41_7,heap_bh6_w41_6,heap_bh6_w41_5};
  Compressor_3_2 Compressor_bh6_96(
      .R(CompressorOut_bh6_96_96),
    .X0(CompressorIn_bh6_96_128));

  assign heap_bh6_w41_9 = CompressorOut_bh6_96_96[0];
  // cycle= 0 cp= 1.6532e-09
  assign heap_bh6_w42_6 = CompressorOut_bh6_96_96[1];
  // cycle= 0 cp= 1.6532e-09
  assign CompressorIn_bh6_97_129 = {heap_bh6_w19_13,heap_bh6_w19_21,heap_bh6_w19_20,heap_bh6_w19_19};
  assign CompressorIn_bh6_97_130[0] = heap_bh6_w20_13;
  Compressor_14_3 Compressor_bh6_97(
      .R(CompressorOut_bh6_97_97),
    .X0(CompressorIn_bh6_97_129),
    .X1(CompressorIn_bh6_97_130));

  assign heap_bh6_w19_22 = CompressorOut_bh6_97_97[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w20_22 = CompressorOut_bh6_97_97[1];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w21_25 = CompressorOut_bh6_97_97[2];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_98_131 = {heap_bh6_w21_15,heap_bh6_w21_24,heap_bh6_w21_23,heap_bh6_w21_22};
  assign CompressorIn_bh6_98_132[0] = heap_bh6_w22_16;
  Compressor_14_3 Compressor_bh6_98(
      .R(CompressorOut_bh6_98_98),
    .X0(CompressorIn_bh6_98_131),
    .X1(CompressorIn_bh6_98_132));

  assign heap_bh6_w21_26 = CompressorOut_bh6_98_98[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w22_25 = CompressorOut_bh6_98_98[1];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w23_26 = CompressorOut_bh6_98_98[2];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_99_133 = {heap_bh6_w22_15,heap_bh6_w22_24,heap_bh6_w22_23,heap_bh6_w22_22};
  assign CompressorIn_bh6_99_134[0] = heap_bh6_w23_16;
  Compressor_14_3 Compressor_bh6_99(
      .R(CompressorOut_bh6_99_99),
    .X0(CompressorIn_bh6_99_133),
    .X1(CompressorIn_bh6_99_134));

  assign heap_bh6_w22_26 = CompressorOut_bh6_99_99[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w23_27 = CompressorOut_bh6_99_99[1];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w24_25 = CompressorOut_bh6_99_99[2];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_100_135 = {heap_bh6_w23_15,heap_bh6_w23_25,heap_bh6_w23_24,heap_bh6_w23_23};
  assign CompressorIn_bh6_100_136[0] = heap_bh6_w24_16;
  Compressor_14_3 Compressor_bh6_100(
      .R(CompressorOut_bh6_100_100),
    .X0(CompressorIn_bh6_100_135),
    .X1(CompressorIn_bh6_100_136));

  assign heap_bh6_w23_28 = CompressorOut_bh6_100_100[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w24_26 = CompressorOut_bh6_100_100[1];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w25_26 = CompressorOut_bh6_100_100[2];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_101_137 = {heap_bh6_w24_15,heap_bh6_w24_24,heap_bh6_w24_23,heap_bh6_w24_22};
  assign CompressorIn_bh6_101_138[0] = heap_bh6_w25_16;
  Compressor_14_3 Compressor_bh6_101(
      .R(CompressorOut_bh6_101_101),
    .X0(CompressorIn_bh6_101_137),
    .X1(CompressorIn_bh6_101_138));

  assign heap_bh6_w24_27 = CompressorOut_bh6_101_101[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w25_27 = CompressorOut_bh6_101_101[1];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w26_25 = CompressorOut_bh6_101_101[2];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_102_139 = {heap_bh6_w25_15,heap_bh6_w25_25,heap_bh6_w25_24,heap_bh6_w25_23};
  assign CompressorIn_bh6_102_140[0] = heap_bh6_w26_16;
  Compressor_14_3 Compressor_bh6_102(
      .R(CompressorOut_bh6_102_102),
    .X0(CompressorIn_bh6_102_139),
    .X1(CompressorIn_bh6_102_140));

  assign heap_bh6_w25_28 = CompressorOut_bh6_102_102[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w26_26 = CompressorOut_bh6_102_102[1];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w27_23 = CompressorOut_bh6_102_102[2];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_103_141 = {heap_bh6_w26_15,heap_bh6_w26_24,heap_bh6_w26_23,heap_bh6_w26_22};
  assign CompressorIn_bh6_103_142[0] = heap_bh6_w27_14;
  Compressor_14_3 Compressor_bh6_103(
      .R(CompressorOut_bh6_103_103),
    .X0(CompressorIn_bh6_103_141),
    .X1(CompressorIn_bh6_103_142));

  assign heap_bh6_w26_27 = CompressorOut_bh6_103_103[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w27_24 = CompressorOut_bh6_103_103[1];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w28_22 = CompressorOut_bh6_103_103[2];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_104_143 = {heap_bh6_w27_13,heap_bh6_w27_22,heap_bh6_w27_21,heap_bh6_w27_20};
  assign CompressorIn_bh6_104_144[0] = heap_bh6_w28_13;
  Compressor_14_3 Compressor_bh6_104(
      .R(CompressorOut_bh6_104_104),
    .X0(CompressorIn_bh6_104_143),
    .X1(CompressorIn_bh6_104_144));

  assign heap_bh6_w27_25 = CompressorOut_bh6_104_104[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w28_23 = CompressorOut_bh6_104_104[1];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w29_22 = CompressorOut_bh6_104_104[2];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_105_145 = {heap_bh6_w29_13,heap_bh6_w29_21,heap_bh6_w29_20,heap_bh6_w29_19};
  assign CompressorIn_bh6_105_146[0] = heap_bh6_w30_11;
  Compressor_14_3 Compressor_bh6_105(
      .R(CompressorOut_bh6_105_105),
    .X0(CompressorIn_bh6_105_145),
    .X1(CompressorIn_bh6_105_146));

  assign heap_bh6_w29_23 = CompressorOut_bh6_105_105[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w30_20 = CompressorOut_bh6_105_105[1];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w31_20 = CompressorOut_bh6_105_105[2];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_106_147 = {heap_bh6_w33_9,heap_bh6_w33_16,heap_bh6_w33_15,heap_bh6_w33_14};
  assign CompressorIn_bh6_106_148[0] = heap_bh6_w34_9;
  Compressor_14_3 Compressor_bh6_106(
      .R(CompressorOut_bh6_106_106),
    .X0(CompressorIn_bh6_106_147),
    .X1(CompressorIn_bh6_106_148));

  assign heap_bh6_w33_17 = CompressorOut_bh6_106_106[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w34_17 = CompressorOut_bh6_106_106[1];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w35_16 = CompressorOut_bh6_106_106[2];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_107_149 = {heap_bh6_w12_15,heap_bh6_w12_14,heap_bh6_w12_13};
  assign CompressorIn_bh6_107_150 = {heap_bh6_w13_14,heap_bh6_w13_13};
  Compressor_23_3 Compressor_bh6_107(
      .R(CompressorOut_bh6_107_107),
    .X0(CompressorIn_bh6_107_149),
    .X1(CompressorIn_bh6_107_150));

  assign heap_bh6_w12_16 = CompressorOut_bh6_107_107[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w13_15 = CompressorOut_bh6_107_107[1];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w14_17 = CompressorOut_bh6_107_107[2];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_108_151 = {heap_bh6_w14_16,heap_bh6_w14_15,heap_bh6_w14_14};
  assign CompressorIn_bh6_108_152 = {heap_bh6_w15_18,heap_bh6_w15_17};
  Compressor_23_3 Compressor_bh6_108(
      .R(CompressorOut_bh6_108_108),
    .X0(CompressorIn_bh6_108_151),
    .X1(CompressorIn_bh6_108_152));

  assign heap_bh6_w14_18 = CompressorOut_bh6_108_108[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w15_19 = CompressorOut_bh6_108_108[1];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w16_20 = CompressorOut_bh6_108_108[2];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_109_153 = {heap_bh6_w16_19,heap_bh6_w16_18,heap_bh6_w16_17};
  assign CompressorIn_bh6_109_154 = {heap_bh6_w17_19,heap_bh6_w17_18};
  Compressor_23_3 Compressor_bh6_109(
      .R(CompressorOut_bh6_109_109),
    .X0(CompressorIn_bh6_109_153),
    .X1(CompressorIn_bh6_109_154));

  assign heap_bh6_w16_21 = CompressorOut_bh6_109_109[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w17_20 = CompressorOut_bh6_109_109[1];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w18_22 = CompressorOut_bh6_109_109[2];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_110_155 = {heap_bh6_w30_19,heap_bh6_w30_18,heap_bh6_w30_17};
  assign CompressorIn_bh6_110_156 = {heap_bh6_w31_19,heap_bh6_w31_18};
  Compressor_23_3 Compressor_bh6_110(
      .R(CompressorOut_bh6_110_110),
    .X0(CompressorIn_bh6_110_155),
    .X1(CompressorIn_bh6_110_156));

  assign heap_bh6_w30_21 = CompressorOut_bh6_110_110[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w31_21 = CompressorOut_bh6_110_110[1];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w32_20 = CompressorOut_bh6_110_110[2];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_111_157 = {heap_bh6_w34_16,heap_bh6_w34_15,heap_bh6_w34_14};
  assign CompressorIn_bh6_111_158 = {heap_bh6_w35_15,heap_bh6_w35_14};
  Compressor_23_3 Compressor_bh6_111(
      .R(CompressorOut_bh6_111_111),
    .X0(CompressorIn_bh6_111_157),
    .X1(CompressorIn_bh6_111_158));

  assign heap_bh6_w34_18 = CompressorOut_bh6_111_111[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w35_17 = CompressorOut_bh6_111_111[1];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w36_14 = CompressorOut_bh6_111_111[2];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_112_159 = {heap_bh6_w36_13,heap_bh6_w36_12,heap_bh6_w36_11};
  assign CompressorIn_bh6_112_160 = {heap_bh6_w37_12,heap_bh6_w37_11};
  Compressor_23_3 Compressor_bh6_112(
      .R(CompressorOut_bh6_112_112),
    .X0(CompressorIn_bh6_112_159),
    .X1(CompressorIn_bh6_112_160));

  assign heap_bh6_w36_15 = CompressorOut_bh6_112_112[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w37_13 = CompressorOut_bh6_112_112[1];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w38_13 = CompressorOut_bh6_112_112[2];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_113_161 = {heap_bh6_w38_12,heap_bh6_w38_11,heap_bh6_w38_10};
  assign CompressorIn_bh6_113_162 = {heap_bh6_w39_9,heap_bh6_w39_8};
  Compressor_23_3 Compressor_bh6_113(
      .R(CompressorOut_bh6_113_113),
    .X0(CompressorIn_bh6_113_161),
    .X1(CompressorIn_bh6_113_162));

  assign heap_bh6_w38_14 = CompressorOut_bh6_113_113[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w39_10 = CompressorOut_bh6_113_113[1];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w40_10 = CompressorOut_bh6_113_113[2];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_114_163 = {heap_bh6_w40_5,heap_bh6_w40_9,heap_bh6_w40_8};
  assign CompressorIn_bh6_114_164 = {heap_bh6_w41_9,heap_bh6_w41_8};
  Compressor_23_3 Compressor_bh6_114(
      .R(CompressorOut_bh6_114_114),
    .X0(CompressorIn_bh6_114_163),
    .X1(CompressorIn_bh6_114_164));

  assign heap_bh6_w40_11 = CompressorOut_bh6_114_114[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w41_10 = CompressorOut_bh6_114_114[1];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w42_7 = CompressorOut_bh6_114_114[2];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_115_165 = {heap_bh6_w44_0,heap_bh6_w44_3,heap_bh6_w44_4};
  assign CompressorIn_bh6_115_166 = {heap_bh6_w45_0,heap_bh6_w45_1};
  Compressor_23_3 Compressor_bh6_115(
      .R(CompressorOut_bh6_115_115),
    .X0(CompressorIn_bh6_115_165),
    .X1(CompressorIn_bh6_115_166));

  assign heap_bh6_w44_5 = CompressorOut_bh6_115_115[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w45_2 = CompressorOut_bh6_115_115[1];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w46_1 = CompressorOut_bh6_115_115[2];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_116_167 = {heap_bh6_w18_21,heap_bh6_w18_20,heap_bh6_w18_19};
  Compressor_3_2 Compressor_bh6_116(
      .R(CompressorOut_bh6_116_116),
    .X0(CompressorIn_bh6_116_167));

  assign heap_bh6_w18_23 = CompressorOut_bh6_116_116[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w19_23 = CompressorOut_bh6_116_116[1];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_117_168 = {heap_bh6_w20_21,heap_bh6_w20_20,heap_bh6_w20_19};
  Compressor_3_2 Compressor_bh6_117(
      .R(CompressorOut_bh6_117_117),
    .X0(CompressorIn_bh6_117_168));

  assign heap_bh6_w20_23 = CompressorOut_bh6_117_117[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w21_27 = CompressorOut_bh6_117_117[1];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_118_169 = {heap_bh6_w28_21,heap_bh6_w28_20,heap_bh6_w28_19};
  Compressor_3_2 Compressor_bh6_118(
      .R(CompressorOut_bh6_118_118),
    .X0(CompressorIn_bh6_118_169));

  assign heap_bh6_w28_24 = CompressorOut_bh6_118_118[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w29_24 = CompressorOut_bh6_118_118[1];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_119_170 = {heap_bh6_w32_19,heap_bh6_w32_18,heap_bh6_w32_17};
  Compressor_3_2 Compressor_bh6_119(
      .R(CompressorOut_bh6_119_119),
    .X0(CompressorIn_bh6_119_170));

  assign heap_bh6_w32_21 = CompressorOut_bh6_119_119[0];
  // cycle= 0 cp= 2.18392e-09
  assign heap_bh6_w33_18 = CompressorOut_bh6_119_119[1];
  // cycle= 0 cp= 2.18392e-09
  assign CompressorIn_bh6_120_171 = {heap_bh6_w21_27,heap_bh6_w21_26,heap_bh6_w21_25};
  assign CompressorIn_bh6_120_172 = {heap_bh6_w22_26,heap_bh6_w22_25};
  Compressor_23_3 Compressor_bh6_120(
      .R(CompressorOut_bh6_120_120),
    .X0(CompressorIn_bh6_120_171),
    .X1(CompressorIn_bh6_120_172));

  assign heap_bh6_w21_28 = CompressorOut_bh6_120_120[0];
  // cycle= 0 cp= 2.71464e-09
  assign heap_bh6_w22_27 = CompressorOut_bh6_120_120[1];
  // cycle= 0 cp= 2.71464e-09
  assign heap_bh6_w23_29 = CompressorOut_bh6_120_120[2];
  // cycle= 0 cp= 2.71464e-09
  assign CompressorIn_bh6_121_173 = {heap_bh6_w23_28,heap_bh6_w23_27,heap_bh6_w23_26};
  assign CompressorIn_bh6_121_174 = {heap_bh6_w24_27,heap_bh6_w24_26};
  Compressor_23_3 Compressor_bh6_121(
      .R(CompressorOut_bh6_121_121),
    .X0(CompressorIn_bh6_121_173),
    .X1(CompressorIn_bh6_121_174));

  assign heap_bh6_w23_30 = CompressorOut_bh6_121_121[0];
  // cycle= 0 cp= 2.71464e-09
  assign heap_bh6_w24_28 = CompressorOut_bh6_121_121[1];
  // cycle= 0 cp= 2.71464e-09
  assign heap_bh6_w25_29 = CompressorOut_bh6_121_121[2];
  // cycle= 0 cp= 2.71464e-09
  assign CompressorIn_bh6_122_175 = {heap_bh6_w25_28,heap_bh6_w25_27,heap_bh6_w25_26};
  assign CompressorIn_bh6_122_176 = {heap_bh6_w26_27,heap_bh6_w26_26};
  Compressor_23_3 Compressor_bh6_122(
      .R(CompressorOut_bh6_122_122),
    .X0(CompressorIn_bh6_122_175),
    .X1(CompressorIn_bh6_122_176));

  assign heap_bh6_w25_30 = CompressorOut_bh6_122_122[0];
  // cycle= 0 cp= 2.71464e-09
  assign heap_bh6_w26_28 = CompressorOut_bh6_122_122[1];
  // cycle= 0 cp= 2.71464e-09
  assign heap_bh6_w27_26 = CompressorOut_bh6_122_122[2];
  // cycle= 0 cp= 2.71464e-09
  assign CompressorIn_bh6_123_177 = {heap_bh6_w27_25,heap_bh6_w27_24,heap_bh6_w27_23};
  assign CompressorIn_bh6_123_178 = {heap_bh6_w28_24,heap_bh6_w28_23};
  Compressor_23_3 Compressor_bh6_123(
      .R(CompressorOut_bh6_123_123),
    .X0(CompressorIn_bh6_123_177),
    .X1(CompressorIn_bh6_123_178));

  assign heap_bh6_w27_27 = CompressorOut_bh6_123_123[0];
  // cycle= 0 cp= 2.71464e-09
  assign heap_bh6_w28_25 = CompressorOut_bh6_123_123[1];
  // cycle= 0 cp= 2.71464e-09
  assign heap_bh6_w29_25 = CompressorOut_bh6_123_123[2];
  // cycle= 0 cp= 2.71464e-09
  assign CompressorIn_bh6_124_179 = {heap_bh6_w29_24,heap_bh6_w29_23,heap_bh6_w29_22};
  assign CompressorIn_bh6_124_180 = {heap_bh6_w30_21,heap_bh6_w30_20};
  Compressor_23_3 Compressor_bh6_124(
      .R(CompressorOut_bh6_124_124),
    .X0(CompressorIn_bh6_124_179),
    .X1(CompressorIn_bh6_124_180));

  assign heap_bh6_w29_26 = CompressorOut_bh6_124_124[0];
  // cycle= 0 cp= 2.71464e-09
  assign heap_bh6_w30_22 = CompressorOut_bh6_124_124[1];
  // cycle= 0 cp= 2.71464e-09
  assign heap_bh6_w31_22 = CompressorOut_bh6_124_124[2];
  // cycle= 0 cp= 2.71464e-09
  assign CompressorIn_bh6_125_181 = {heap_bh6_w31_17,heap_bh6_w31_21,heap_bh6_w31_20};
  assign CompressorIn_bh6_125_182 = {heap_bh6_w32_21,heap_bh6_w32_20};
  Compressor_23_3 Compressor_bh6_125(
      .R(CompressorOut_bh6_125_125),
    .X0(CompressorIn_bh6_125_181),
    .X1(CompressorIn_bh6_125_182));

  assign heap_bh6_w31_23 = CompressorOut_bh6_125_125[0];
  // cycle= 0 cp= 2.71464e-09
  assign heap_bh6_w32_22 = CompressorOut_bh6_125_125[1];
  // cycle= 0 cp= 2.71464e-09
  assign heap_bh6_w33_19 = CompressorOut_bh6_125_125[2];
  // cycle= 0 cp= 2.71464e-09
  assign CompressorIn_bh6_126_183 = {heap_bh6_w35_13,heap_bh6_w35_17,heap_bh6_w35_16};
  assign CompressorIn_bh6_126_184 = {heap_bh6_w36_15,heap_bh6_w36_14};
  Compressor_23_3 Compressor_bh6_126(
      .R(CompressorOut_bh6_126_126),
    .X0(CompressorIn_bh6_126_183),
    .X1(CompressorIn_bh6_126_184));

  assign heap_bh6_w35_18 = CompressorOut_bh6_126_126[0];
  // cycle= 0 cp= 2.71464e-09
  assign heap_bh6_w36_16 = CompressorOut_bh6_126_126[1];
  // cycle= 0 cp= 2.71464e-09
  assign heap_bh6_w37_14 = CompressorOut_bh6_126_126[2];
  // cycle= 0 cp= 2.71464e-09
  assign CompressorIn_bh6_127_185 = {heap_bh6_w42_6,heap_bh6_w42_5,heap_bh6_w42_7};
  assign CompressorIn_bh6_127_186 = {heap_bh6_w43_3,heap_bh6_w43_5};
  Compressor_23_3 Compressor_bh6_127(
      .R(CompressorOut_bh6_127_127),
    .X0(CompressorIn_bh6_127_185),
    .X1(CompressorIn_bh6_127_186));

  assign heap_bh6_w42_8 = CompressorOut_bh6_127_127[0];
  // cycle= 0 cp= 2.71464e-09
  assign heap_bh6_w43_6 = CompressorOut_bh6_127_127[1];
  // cycle= 0 cp= 2.71464e-09
  assign heap_bh6_w44_6 = CompressorOut_bh6_127_127[2];
  // cycle= 0 cp= 2.71464e-09
  assign CompressorIn_bh6_128_187 = {heap_bh6_w33_18,heap_bh6_w33_17,heap_bh6_w33_19};
  assign CompressorIn_bh6_128_188 = {heap_bh6_w34_18,heap_bh6_w34_17};
  Compressor_23_3 Compressor_bh6_128(
      .R(CompressorOut_bh6_128_128),
    .X0(CompressorIn_bh6_128_187),
    .X1(CompressorIn_bh6_128_188));

  assign heap_bh6_w33_20 = CompressorOut_bh6_128_128[0];
  // cycle= 0 cp= 3.24536e-09
  assign heap_bh6_w34_19 = CompressorOut_bh6_128_128[1];
  // cycle= 0 cp= 3.24536e-09
  assign heap_bh6_w35_19 = CompressorOut_bh6_128_128[2];
  // cycle= 0 cp= 3.24536e-09
  assign CompressorIn_bh6_129_189 = {heap_bh6_w37_10,heap_bh6_w37_13,heap_bh6_w37_14};
  assign CompressorIn_bh6_129_190 = {heap_bh6_w38_14,heap_bh6_w38_13};
  Compressor_23_3 Compressor_bh6_129(
      .R(CompressorOut_bh6_129_129),
    .X0(CompressorIn_bh6_129_189),
    .X1(CompressorIn_bh6_129_190));

  assign heap_bh6_w37_15 = CompressorOut_bh6_129_129[0];
  // cycle= 0 cp= 3.24536e-09
  assign heap_bh6_w38_15 = CompressorOut_bh6_129_129[1];
  // cycle= 0 cp= 3.24536e-09
  assign heap_bh6_w39_11 = CompressorOut_bh6_129_129[2];
  // cycle= 0 cp= 3.24536e-09
  assign finalAdderIn0_bh6 = {1'b0,heap_bh6_w47_0,heap_bh6_w46_0,heap_bh6_w45_2,heap_bh6_w44_5,heap_bh6_w43_6,heap_bh6_w42_8,heap_bh6_w41_10,heap_bh6_w40_11,heap_bh6_w39_10,heap_bh6_w38_15,heap_bh6_w37_15,heap_bh6_w36_16,heap_bh6_w35_18,heap_bh6_w34_19,heap_bh6_w33_20,heap_bh6_w32_22,heap_bh6_w31_23,heap_bh6_w30_22,heap_bh6_w29_26,heap_bh6_w28_22,heap_bh6_w27_27,heap_bh6_w26_25,heap_bh6_w25_30,heap_bh6_w24_25,heap_bh6_w23_30,heap_bh6_w22_27,heap_bh6_w21_28,heap_bh6_w20_23,heap_bh6_w19_23,heap_bh6_w18_23,heap_bh6_w17_17,heap_bh6_w16_21,heap_bh6_w15_16,heap_bh6_w14_18,heap_bh6_w13_15,heap_bh6_w12_16,heap_bh6_w11_11,heap_bh6_w10_11,heap_bh6_w9_11,heap_bh6_w8_5,heap_bh6_w7_8,heap_bh6_w6_6,heap_bh6_w5_4,heap_bh6_w4_0};
  assign finalAdderIn1_bh6 = {1'b0,1'b0,heap_bh6_w46_1,1'b0,heap_bh6_w44_6,1'b0,1'b0,1'b0,heap_bh6_w40_10,heap_bh6_w39_11,1'b0,1'b0,1'b0,heap_bh6_w35_19,1'b0,1'b0,1'b0,heap_bh6_w31_22,1'b0,heap_bh6_w29_25,heap_bh6_w28_25,heap_bh6_w27_26,heap_bh6_w26_28,heap_bh6_w25_29,heap_bh6_w24_28,heap_bh6_w23_29,1'b0,1'b0,heap_bh6_w20_22,heap_bh6_w19_22,heap_bh6_w18_22,heap_bh6_w17_20,heap_bh6_w16_20,heap_bh6_w15_19,heap_bh6_w14_17,1'b0,1'b0,heap_bh6_w11_10,heap_bh6_w10_10,heap_bh6_w9_10,heap_bh6_w8_8,1'b0,heap_bh6_w6_5,heap_bh6_w5_3,heap_bh6_w4_3};
  assign finalAdderCin_bh6 = 1'b0;
  IntAdder_45_f400_uid405 Adder_final6_0(
      .Cin(finalAdderCin_bh6),
    .R(finalAdderOut_bh6),
    .X(finalAdderIn0_bh6),
    .Y(finalAdderIn1_bh6));

  // concatenate all the compressed chunks
  assign CompressionResult6 = {finalAdderOut_bh6,tempR_bh6_1,tempR_bh6_0};
  // End of code generated by BitHeap::generateCompressorVHDL
  assign R = CompressionResult6[47:0];

endmodule
// File teasnem_results/IntAdder_33_f400_uid415.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//                          IntAdder_33_f400_uid415
//                     (IntAdderClassical_33_comb_uid417)
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
// combinatorial
// no timescale needed

module IntAdder_33_f400_uid415(
input wire [32:0] X,
input wire [32:0] Y,
input wire Cin,
output wire [32:0] R
);





  //Classical
  assign R = X + Y + Cin;

endmodule
// File teasnem_results/FPmul_nonpipe.vhdl translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//                               FPmul_nonpipe
//                     (FPMult_8_23_8_23_8_23_comb_uid2)
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Bogdan Pasca, Florent de Dinechin 2008-2011
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
// combinatorial
// no timescale needed

module FPmul_nonpipe(
input wire [8 + 23 + 2:0] X,
input wire [8 + 23 + 2:0] Y,
output wire [8 + 23 + 2:0] R
);




wire sign;
wire [7:0] expX;
wire [7:0] expY;
wire [9:0] expSumPreSub;
wire [9:0] bias;
wire [9:0] expSum;
wire [23:0] sigX;
wire [23:0] sigY;
wire [47:0] sigProd;
wire [3:0] excSel;
reg [1:0] exc;
wire norm;
wire [9:0] expPostNorm;
wire [47:0] sigProdExt;
wire [32:0] expSig;
wire sticky;
wire guard;
wire round;
wire [32:0] expSigPostRound;
reg [1:0] excPostNorm;
reg [1:0] finalExc;

  assign sign = X[31] ^ Y[31];
  assign expX = X[30:23];
  assign expY = Y[30:23];
  assign expSumPreSub = ({2'b00,expX}) + ({2'b00,expY});
  assign bias = 10'b0001111111;
  assign expSum = expSumPreSub - bias;
  assign sigX = {1'b1,X[22:0]};
  assign sigY = {1'b1,Y[22:0]};
  IntMultiplier_LogicOnly_24_24_48_unsigned_comb_uid4 SignificandMultiplication(
      .R(sigProd),
    .X(sigX),
    .Y(sigY));

  assign excSel = {X[33:32],Y[33:32]};
  always @(*) begin
    case(excSel)
      4'b0000,4'b0001,4'b0100 : exc <= 2'b00;
      4'b0101 : exc <= 2'b01;
      4'b0110,4'b1001,4'b1010 : exc <= 2'b10;
      default : exc <= 2'b11;
    endcase
  end

  assign norm = sigProd[47];
  // exponent update
  assign expPostNorm = expSum + ({9'b000000000,norm});
  // significand normalization shift
  assign sigProdExt = norm == 1'b1 ? {sigProd[46:0],1'b0} : {sigProd[45:0],2'b00};
  assign expSig = {expPostNorm,sigProdExt[47:25]};
  assign sticky = sigProdExt[24];
  assign guard = sigProdExt[23:0] == 24'b000000000000000000000000 ? 1'b0 : 1'b1;
  assign round = sticky & ((guard &  ~(sigProdExt[25])) | (sigProdExt[25]));
  IntAdder_33_f400_uid415 RoundingAdder(
      .Cin(round),
    .R(expSigPostRound),
    .X(expSig),
    .Y(33'b000000000000000000000000000000000));

  always @(*) begin
    case(expSigPostRound[32:31])
      2'b00 : excPostNorm <= 2'b01;
      2'b01 : excPostNorm <= 2'b10;
      2'b11,2'b10 : excPostNorm <= 2'b00;
      default : excPostNorm <= 2'b11;
    endcase
  end

  always @(*) begin
    case(exc)
      2'b11,2'b10,2'b00 : finalExc <= exc;
      default : finalExc <= excPostNorm;
    endcase
  end

  assign R = {finalExc,sign,expSigPostRound[30:0]};

endmodule
