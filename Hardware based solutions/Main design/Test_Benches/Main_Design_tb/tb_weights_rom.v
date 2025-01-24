/*
An initial test bench for the ALU module

Helper modules used
	+ CLK_GEN : for driving the clock
*/

`include "rtl/storage/WEIGHTS_ROM.v"

module CLK_GEN #(
	parameter CLK_PERIOD = 10 )
(
	output reg clk
);
initial begin
	clk<=0;
	forever #(CLK_PERIOD/2) clk<=~clk;
end
endmodule


/*your code here*/
