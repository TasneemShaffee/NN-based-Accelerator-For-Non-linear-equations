/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : Updated_Adam.v
+ Abstract  :This blocks implements the adam updating rule.
Applying the four equations:
M(t)=beta_1 * M(t-1)+(1-beta_1)*g(t)
V(t)=beta_2 * V(t-1)+(1-beta_2)*g(t)^2
delta_w=-eta * M(t)/(sqrt(V(t))+epson)
W(t+1)=W(t)+delta_w.
*/

module Updated_Adam#(
parameter BIT_WIDTH=32,
parameter EXTRA_BIT=2,
parameter NUMBER_WEIGHTS=1,
parameter NUMBER_NEURONS=1
)
(
    input wire clk,  																	 //clock 
    input wire rst, 																		 //reset
	 input wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BIT)-1:0] DELTA_WEIGHT,  //the back propagated error of ? neuron
	 input wire ADAM_ENABLE,                                              //flag to activate the adam block
	 input wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BIT)-1:0]OLD_WEIGHT,     //the old weight that needs to be updated
	 input wire [(BIT_WIDTH+EXTRA_BIT)-1:0] eta,                          //learning rate 
	 output reg [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BIT)-1:0] UPDATED_WEIGHT //the new updated weight
	 
    );
	 
 //Local parameters 
 localparam beta_1={2'b01,32'b00111111011001100110011001100110};         //first momentum => beta_1=0.9 
 localparam beta_2={2'b01,32'b00111111011111111011111001110111};         //second momentum => beta_2=0.999
 localparam difference_bet1={2'b01,32'b00111101110011001100110011001101};//(1-beta_1)=> 1-0.9=0.1
 localparam difference_bet2={2'b01,32'b00111010100000110001001001101111};//(1-beta2)=>1-0.999=0.001
 localparam epson={2'b01,32'b00110010001010111100110001110111};			 // epson=1E-8
 
 // Local wires and registers
 reg  [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BIT)-1:0] Mass[NUMBER_WEIGHTS-1:0];     //Mass scalar value
 reg  [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BIT)-1:0] Velocity[NUMBER_WEIGHTS-1:0]; //Velocity scalar value
 reg  [BIT_WIDTH-1:0] counter=0;                                               //Counter of the array
 reg  [BIT_WIDTH-1:0] delay_counter=0; 
 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BIT)-1:0] Local_Mul_beta1_Mass;         //Having result of multiplication of Mass * beta_1
 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BIT)-1:0] Local_Mul_beta1_Delta;        //Having result of multiplication of delta weight (propagated error/g(i)) with (1-beta1)
 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BIT)-1:0] Local_Mul_beta2_Velocity;     //Having result of multiplication of Velocity *beta_2 
 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BIT)-1:0] Local_Mul_beta2_Delta;        //Having result of multiplication of (1-beta_2) *g(i)^2
 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BIT)-1:0] Local_Squaring_Delta;         //Having result of squaring delta weight (g(i)^2)
 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BIT)-1:0] Local_New_Mass;               //Having the new updated Mass value
 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BIT)-1:0] Local_New_Velocity;				 //Having the new updated Velocity value
 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BIT)-1:0] Local_Sqrt_Velocity;          //Having result of square root of result of new updated velocity
 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BIT)-1:0] Local_adder_result;           //Having result of epson + sqrt(velocity)
 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BIT)-1:0] Local_div_result;             //Having result of eta*Mass/sqrt(velocity)+epson
 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BIT)-1:0] Local_final_Mul_res;          //Having result of (eta*Mass)
 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BIT)-1:0] Local_final_result;           //Having result of W(i+1)+=new calculated delta weight
 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BIT)-1:0] Zero_Mass_res;
 wire [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BIT)-1:0] Zero_Velocity_res;
 reg [NUMBER_NEURONS*(BIT_WIDTH+EXTRA_BIT)-1:0] Local_eta;                     //Having the negative eta

 //Multiplication beta1 * Mass(t-1)
 FPmul_nonpipe
 mul_bet1(
 .X(Mass[counter]),
 .Y(beta_1),
 .R(Local_Mul_beta1_Mass)
 );
 //assign Zero_Mass_res=(Mass[counter]==0000000000000000000000000000000000)?34'b0000000000000000000000000000000000:Local_Mul_beta1_Mass;
 //Multiplication of g(i)*(1-beta1)
 FPmul_nonpipe
 mul_bet1_delta(
 .X(DELTA_WEIGHT),
 .Y(difference_bet1),
 .R(Local_Mul_beta1_Delta)
 );
 
 //Multiplication of beta2* Velocity
 FPmul_nonpipe
 mul_bet2(
 .X(beta_2),
 .Y(Velocity[counter]),
 .R(Local_Mul_beta2_Velocity)
 );
 
 // squaring el given delta g(i)^2 
 FPsqr
 squaring_delta_inst(
 .X(DELTA_WEIGHT),
 .R(Local_Squaring_Delta)
);

//multiplication of (1-bet2)*g(i)^2
  FPmul_nonpipe
 mul_bet2_delta(
 .X(Local_Squaring_Delta),
 .Y(difference_bet2),
 .R(Local_Mul_beta2_Delta)
 );
 //add M(t)= beta1 * Mass(t-1)+ (1-beta1)*g(i)
 FPAdder_nonpipe 
add_beta1
(
.X(Local_Mul_beta1_Mass),
.Y(Local_Mul_beta1_Delta),
.R(Local_New_Mass)
);

// add bet2*Velocity+(1-beta2)*g(i)^2
FPAdder_nonpipe 
add_beta2
(
.X(Local_Mul_beta2_Velocity),
.Y(Local_Mul_beta2_Delta),
.R(Local_New_Velocity)
);

//calculation of sqrt (velocity)
FPsqrt
sqrt_velocity
(
.X(Local_New_Velocity),
.R(Local_Sqrt_Velocity)
);

// addition of epson +sqrt(velocity)
FPAdder_nonpipe
epson_add
(
.X(epson),
.Y(Local_Sqrt_Velocity),
.R(Local_adder_result)
);

//multiplication of eta * Mass
 FPmul_nonpipe
 mul_eta_mass(
 .X(eta),
 .Y(Local_New_Mass),
 .R(Local_final_Mul_res)
 );
 
// Calculation of eta*Mass/sqrt(velocity)
FPdiv
div_inst
(
.X(Local_final_Mul_res),
.Y(Local_adder_result),
.R(Local_div_result)
);

// add old weight + new calculated delta
FPAdder_nonpipe 
weight_addition
(
.X(OLD_WEIGHT),
.Y(Local_div_result),
.R(Local_final_result)
);

//checking the sign of old eta and update the new one.
always@(*) 
begin
//chceck if eta is negative 
if(eta &(34'b0010000000000000000000000000000000))
begin
//make eta postive (--eta=eta)
Local_eta<={2'b01,1'b0,eta[30:0]};
end
//make eta to be negative (-eta)
else Local_eta<={2'b01,1'b1,eta[30:0]};
end

always @(*)
begin
if (rst)
UPDATED_WEIGHT<=0;
else
begin
if(ADAM_ENABLE)
begin
UPDATED_WEIGHT<=Local_final_result;
end
else 
UPDATED_WEIGHT<=UPDATED_WEIGHT;
end
end
//Internal counter 
always@(posedge clk or posedge rst) 
begin
if (rst)
begin
counter<=0;
delay_counter=0;
end
else begin
if(counter<(NUMBER_WEIGHTS-1)&& ADAM_ENABLE)
begin
counter<=counter+1;
end
else if ((counter>NUMBER_WEIGHTS && ADAM_ENABLE) ||(counter==(NUMBER_WEIGHTS-1)&& ADAM_ENABLE))
counter<=0;
else counter<=counter;
//delay_counter<=counter;
end
end

integer i;
//Assigning Velocity and Mass value
always@(posedge clk or posedge rst) 
begin
if (rst)
begin
//Initalize the Mass and Velocity values
for(i=0;i<NUMBER_WEIGHTS;i=i+1)begin
Mass[i]<={2'b00,32'b00000000000000000000000000000000};
Velocity[i]<={2'b00,32'b00000000000000000000000000000000};
end
end
else begin
if(ADAM_ENABLE)
begin
//Assigning the new values of Mass and velocity
Velocity[counter]<=Local_New_Velocity;
Mass[counter]<=Local_New_Mass;
end
else 
begin
Velocity[counter]<=Velocity[counter];
Mass[counter]<=Mass[counter];
end
end
end
endmodule
