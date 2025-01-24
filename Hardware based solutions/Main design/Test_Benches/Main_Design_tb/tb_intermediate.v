`include "definitions.v"
//`ifdef iverilog_comp
//`include "rtl/computation/INTERMEDIATE_BUFFER.v"
//`endif
module CLK_GEN #(
	parameter CLK_PERIOD = 2 )
(
	output reg clk
);
initial begin
	clk<=0;
	forever #(CLK_PERIOD/2) clk<=~clk;
end
endmodule


module tb_intermediate;
//////
//stimilus
localparam CLK_PERIOD = 2;
localparam BIT_WIDTH = 32;
localparam EXTRA_BITS = 0;
localparam NUM_NEURONS = 2;

wire clk;
reg inter_en;
wire [(BIT_WIDTH + EXTRA_BITS) - 1:0] shift_res;
wire cap_ack;
reg [NUM_NEURONS*(BIT_WIDTH + EXTRA_BITS) - 1:0] layer_output;
/////////
CLK_GEN clk_generator(.clk(clk));

INTERMEDIATE_BUFFER #( 
   .NUM_NEURONS(NUM_NEURONS),      // Number of alus' outputs in the previous layer
   .BIT_WIDTH(BIT_WIDTH),       // Floating point size
   .EXTRA_BITS(EXTRA_BITS)  // Flopoco Floating point extra two bits. CAN ONLY have the values [0 OR 2]
)inbuffer(
     .layer_output(layer_output),
     .inter_en(inter_en),
     .clk(clk),
     .shift_res(shift_res)
);
///////////
initial
begin
 $dumpfile("a.dump"); 
 $dumpvars;
 $monitor("Input: %h,clock: %b, out: %h, enable: %b,ack: %b", layer_output,clk, shift_res, inter_en, cap_ack);
 #(2*CLK_PERIOD) layer_output = 64'hEEEE_EEEE_AAAA_AAAA; inter_en=1;
 #(1*CLK_PERIOD) inter_en=1;layer_output = 64'hFFFF_FFFF_BBBB_BBBB;
 #(2*CLK_PERIOD) inter_en=0; 
 #(2*CLK_PERIOD)
 $finish;
end
endmodule 