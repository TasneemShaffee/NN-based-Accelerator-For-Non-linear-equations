/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : manhttan.v
+ Abstract  :This module implements Manhattan updating rule.
It applies the rule
W(t+1)=W(t)+eta * sgn(differiated_error)
Notes: There is no update in manhattan if the differeniated error equals to zero.
		 The flopoco library generate ssmall random number when the result of addition equals to zero.This cas was handled to obtain more accurate results.
*/
module New_Manhattan#(
parameter BIT_WIDTH=32,			//Bit width of the input
parameter EXTRA_BIT=2, 			//Extra bits are needed by flopoco 
parameter NUMBER_INSTANCES=1 	//Number of instances of Manhattn block
)(
    
	 input wire [NUMBER_INSTANCES*(BIT_WIDTH+EXTRA_BIT)-1:0] Differentiated_Error, //The calculated error of the result
	 input wire Manhattan_Enable,                                                  //A flag to activate the manhattan block
	 input wire [NUMBER_INSTANCES*(BIT_WIDTH+EXTRA_BIT)-1:0]Old_Weights,           //Loaded old weight from memory
	 input wire [(BIT_WIDTH+EXTRA_BIT)-1:0] eta,                                   //The old value for eta
	 output reg [NUMBER_INSTANCES*(BIT_WIDTH+EXTRA_BIT)-1:0] Updated_Weights       //The new value of weight 
    );
	 
//declaration of local wires/registers/parameters
wire [NUMBER_INSTANCES*(BIT_WIDTH+EXTRA_BIT)-1:0] local_delta ;
wire [NUMBER_INSTANCES*(BIT_WIDTH+EXTRA_BIT)-1:0] local_updated_weights ;
wire [NUMBER_INSTANCES*(BIT_WIDTH+EXTRA_BIT)-1:0] local_eta_equal_weight ;
wire ZERO_DIFF_ERROR;
reg  [NUMBER_INSTANCES*(BIT_WIDTH+EXTRA_BIT)-1:0] output_reg;
wire  [NUMBER_INSTANCES*(BIT_WIDTH+EXTRA_BIT)-1:0] local_epson;
wire  [NUMBER_INSTANCES*(BIT_WIDTH+EXTRA_BIT)-1:0] final_result;

localparam epson={2'b01,32'b00111101110011001100110011001101};//epson=1E-1=0.1
assign ZERO_DIFF_ERROR=( Differentiated_Error=={34{1'b0}})?1:0; //It handles case if the differentiated error is equal to zero then there is no update.

//calculate the new delta => delta=eta*sgn(differenitated_error)	
FPmul_nonpipe mul_inst(
 .X({2'b01,Differentiated_Error[31],31'b0111111100000000000000000000000}),
 .Y(eta),
 .R(local_delta)
);
//Update the olde weight => old_weight=old_weight+delta
FPAdder_nonpipe
adder_inst
(
.X(Old_Weights),
.Y(local_delta),
.R(local_updated_weights )

);
//multiply 
FPmul_nonpipe mul_inst1(
 .X(epson),
 .Y(eta),
 .R(local_epson)
);
//if old_weight= -eta*sgn(error_magnitude) let the output equals zero for more accurate results.
assign local_eta_equal_weight={2'b01,~Old_Weights[31],Old_Weights[30:0]}==local_delta?34'b0:local_updated_weights;

FPAdder_nonpipe
adder_inst1
(
.X(local_epson),
.Y(local_eta_equal_weight),
.R(final_result)

);

//Assign the new values to the output ports
always@(*) 
begin
if (ZERO_DIFF_ERROR && Manhattan_Enable)begin
Updated_Weights<=Old_Weights;
end
else if (Manhattan_Enable && !ZERO_DIFF_ERROR) begin
Updated_Weights<=final_result;
end
end
endmodule
