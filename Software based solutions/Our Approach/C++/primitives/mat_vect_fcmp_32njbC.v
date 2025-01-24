/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : Floating point comparator [name: mat_vect_fcmp_32njbC]
+ Abstract  : The implementation of a floating point less that module which uses a pure combinatorial operation. A single
              output indicates if din0<din1 or not. 
              <dout> is `1` if (din0<din1) and `0` otherwise
+ Notes     : 
  - In the cpp High level code we are ONLY using the < operator for comparing either the error or calculating the sign for manhattan
  - The <ID> parameter is only used for debugging purposes and also is required by all the other modules containing this one. Its value
    has no effect on the module implementation
  - The <din<i>_WIDTH> parameters specify the width of all the operands. Since we are using a FULL floating point number
    they are set to 32-bits by default
  - The <NUM_STAGE> parameter has no effect on the module specification. For documentation purporses it indicates this instance
    of the comparator is not pipelined
  - The input <opcode> is required by the HLS interface. The main reason it is used is because HLS uses a larger circuit for comparison
    since we only need the smaller than implementation in our design, we adjusted the circuit to do this operation with ignoring the opcode
    required logic
  - We explicitly used the verilog less than operator. Since BY DEFAULT the register type is unsigned. IN CASE DEFAULTS ARE CHANGED
    MAKE SURE TO INCLUDE SUCH CASE
*/
module mat_vect_fcmp_32njbC#(
   parameter ID         = 27,           // Required by othre HLS generated modules
   parameter NUM_STAGE  = 1,            // Dummy [Indicates a combinatorial circuit]
   parameter din0_WIDTH = 32,           // Left operand bit width [32-bit for full float]
   parameter din1_WIDTH = 32,           // Right operand bit width [32-bit for full float]
   parameter dout_WIDTH = 1)            // A binary output [0: less than, 1: higher than]
(
  input  wire [din0_WIDTH-1:0] din0,    // Left operand
  input  wire [din1_WIDTH-1:0] din1,    // Right operand
  input  wire [4:0]            opcode,  // IGNORED and only required by the HLS interface
  output reg [dout_WIDTH-1:0] dout      // Binary output set to 1 if (din0<din1)
);
  always @(*) begin
    if(din0[din0_WIDTH-1]==din1[din1_WIDTH-1])                // same sign; use integer comparison [treated as unsigned]
      dout = (din0<din1); 
    else if (din0[din0_WIDTH-1]==0 && din1[din1_WIDTH-1]==1)  // Sign differs check who is negative
      dout = 0;
    else
      dout = 1;
  end
endmodule