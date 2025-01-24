`timescale 1ns / 1ps

module training_control_tb();
//module inputs
reg rst;
reg clk;
reg training_mode;
reg [33:0] SQUARED_ERROR;
//outputs
wire training_done;
wire adam_signal;
wire manhatten_signal;
//wire [3:0] test1;

initial
begin
	clk<=0;
	forever #5 clk<= ~clk;
end
//always #5 clk <= ~clk ;
initial
begin 
//clk <=0;
#5;
rst=1'b1;
#5;
rst=1'b0;
#5;
//case1 ok

training_mode = 1'b1;
SQUARED_ERROR = 34'b0000000000000000000000000000000011;
#10;
training_mode <= 1'b0;
SQUARED_ERROR <= 34'b1111111111111111111111111111111111;

#10;
//case2 ok
training_mode <= 1'b0;
SQUARED_ERROR <= 34'b0000000000000000000000000000000011;
#10;

//case3 ok
training_mode <= 1'b1;
SQUARED_ERROR <= 34'b1111111111111111111111111111111111;

#10;
training_mode <= 1'b0;
SQUARED_ERROR <= 34'b1111111111111111111111111111111111;

#10;

training_mode <= 1'b0;
SQUARED_ERROR <= 34'b0000000000000000000000000000000000;
#10;

training_mode <= 1'b1;
SQUARED_ERROR <= 34'b0000000000000000000000000000000000;
#10;

end


 FSM2 
//fsm_training_block
    FSM2(
    .rst(rst),
    .clk(clk),
    .training_mode(training_mode),
    .SQUARED_ERROR(SQUARED_ERROR),
    .training_done(training_done),
    .adam_signal(adam_signal),
	 //.test1(test1),
    .manhatten_signal(manhatten_signal)
  );
  

endmodule
