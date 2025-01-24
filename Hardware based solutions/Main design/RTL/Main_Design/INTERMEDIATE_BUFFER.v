/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : Linear Layer
+ Abstract  : It is communication block between layers of NN
+ Notes     : As long as the enable signal is high the module captures the input then it shifts with the NUM_NEURONS times then checks the enable signal
if it's high repeat if low stops.The module sends ack when it captures the input 
*/

`ifndef INTERMEDIATE_BUFFER_
`define INTERMEDIATE_BUFFER_
module INTERMEDIATE_BUFFER #( 
  parameter NUM_NEURONS = 4,      // Number of alus' outputs in the previous layer
  parameter NUM_NONLIN = 1,       // Number of nonlinear modules
  parameter BIT_WIDTH = 32,       // Floating point size
  parameter EXTRA_BITS = 2  		 // Flopoco Floating point extra two bits. CAN ONLY have the values [0 OR 2]
)(
    input wire [NUM_NEURONS*(BIT_WIDTH + EXTRA_BITS) - 1:0] layer_output,
    input  wire inter_en,
    input  wire clk,
    input wire  [(BIT_WIDTH + EXTRA_BITS) - 1:0] error_in,
    input wire [NUM_NONLIN*(BIT_WIDTH+EXTRA_BITS)-1:0] net_derivative_in,
    output wire  [(BIT_WIDTH + EXTRA_BITS) - 1:0] shift_res,
    output reg   [(BIT_WIDTH + EXTRA_BITS) - 1:0] error_out,
    output reg [NUM_NONLIN*(BIT_WIDTH+EXTRA_BITS)-1:0] net_derivative_out =0

);
reg [31:0] counter=0;
reg  [NUM_NEURONS*(BIT_WIDTH + EXTRA_BITS) - 1:0]  buffer = 0;
assign shift_res = buffer[(BIT_WIDTH + EXTRA_BITS) - 1 :0];
always @(posedge clk)
begin
  if (inter_en == 1'b1 /*&& start_shift==1'b0*/) // captures the input and signals to start shifting and outing
  begin
   buffer <= layer_output;
   counter <= 0;
   error_out <= error_in;
   net_derivative_out <= net_derivative_in;
  end
  else begin
    buffer <= buffer>>(BIT_WIDTH + EXTRA_BITS);
    counter <= counter +  1; 
    if (counter == NUM_NEURONS ) // stops shifting when the number of shifts needed done
    begin
      counter <= 0;
    end
  end
end


endmodule
`endif