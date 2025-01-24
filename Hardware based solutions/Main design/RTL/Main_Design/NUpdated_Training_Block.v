/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : New_TrainingBlock.v
+ Abstract  :This block is responsible for training the neural network.
+Notes      :The training block is sequential block.
             Manhattan and Adam blocks are combinational modules to solve 
				 the problem that each module takes two clock cycles to produce correct output.
             However,The result of the output signal whether from Adam 
				 or Manhattan block is saved in register of training block.
*/
module New_Training_block#(
parameter BIT_WIDTH=32,  	//Bit width if the input data 
parameter EXTRA_BIT=2,   	//Extra bit are needed by flpoco
parameter NUMBER_WEIGHTS=1,//Number of weights
parameter NUMBER_NEURONS=1	//Number of neurons
)
(
input wire rst,                                                                                //Reset signal
input wire clk,                                                                                //Clock signal
input wire training_mode,																							  //Training mode signal from Control Unit block
input wire [(BIT_WIDTH+EXTRA_BIT)-1:0]SQUARED_ERROR,                                           //The propagated squared error of last layer
input wire [(BIT_WIDTH+EXTRA_BIT)-1:0] DELTA_WEIGHT,														  //The delta weight
input wire [(BIT_WIDTH+EXTRA_BIT)-1:0] OLD_WEIGHT,															  //The old weigh
input wire ENABLE,                                                                             //enable training block
input wire Finish_First_Manhattan_Iter,                           //signal indicates that first iterations of manhattan have been done
input wire Finish_Second_Manhattan_Iter,                          //signal indicates that second iterations of manhattan have been done and
																						 //adam iterations will be begin
output reg training_done ,                                                                     //Output signal indicates whether traning is done or not
output reg  [(BIT_WIDTH+EXTRA_BIT)-1:0]                                          Best_error,   //Least error has been occured          
output reg [(BIT_WIDTH+EXTRA_BIT)-1:0] MEMORY_UPDATED_WEIGHT,											  //The updated weight
output reg write_en    
	 );
//declaration of local signals
wire adam_signal;                   										//Local signal for activation/deactivation Adam block
wire manhatten_signal;															//Local signal for activation/deactivation Manhattan block
wire Manhattan_Enable;
wire adam_Enable;
wire [(BIT_WIDTH+EXTRA_BIT)-1:0] local_New_eta;							//Having new value of the eta
wire [(BIT_WIDTH+EXTRA_BIT)-1:0] local_UPDATED_WEIGHT_ADAM;			//Having new value of the weight from Adam block
wire [(BIT_WIDTH+EXTRA_BIT)-1:0] local_UPDATED_WEIGHT_MANHATTAN;	//Having new value of the weight from Manhattan block
wire [(BIT_WIDTH+EXTRA_BIT)-1:0] local_MEMORY_UPDATED_WEIGHT; 		//Having new value of the training block
wire [(BIT_WIDTH+EXTRA_BIT)-1:0] local_best_error;						//Having the least error has been occurred
reg  [(BIT_WIDTH+EXTRA_BIT)-1:0] eta;	                           //Learning rate (eta=0.1)
wire local_training_done;														//Having the status of training
wire local_bestweights_flag;
 
// Instantiation of modules
Training_Control
tc_inst(
.rst(rst), 
.clk(clk), 
.training_mode(training_mode), 
.SQUARED_ERROR(SQUARED_ERROR), 
.training_done(local_training_done), 
.adam_signal(adam_signal), 
.manhatten_signal(manhatten_signal)
);
assign adam_Enable=adam_signal;
assign Manhattan_Enable=manhatten_signal;

New_Manhattan#(
BIT_WIDTH,
EXTRA_BIT
)
manhttan_inst
(
.Differentiated_Error(DELTA_WEIGHT),
.Manhattan_Enable(Manhattan_Enable),
.Old_Weights(OLD_WEIGHT),
.eta(eta),
.Updated_Weights(local_UPDATED_WEIGHT_MANHATTAN)
);
//block does adaptive step to eta and update it to new value between transition from one mode to other
Update_Eta #(
BIT_WIDTH,
EXTRA_BIT
)inst_1(
 .rst(rst),
 .Finish_First_Manhattan_Iter(Finish_First_Manhattan_Iter),                        
 .Finish_Second_Manhattan_Iter(Finish_Second_Manhattan_Iter),                          
 .Manhaatan_Enable(Manhattan_Enable),
 .eta(eta),                                   
 .New_eta(local_New_eta)                                      
    );
//Adam updating rule 
Updated_Adam
#(
BIT_WIDTH,
EXTRA_BIT,
NUMBER_WEIGHTS
)
adam_inst
(
    .clk(clk),                     
    .rst(rst),                    
	 .DELTA_WEIGHT(DELTA_WEIGHT), 
	 .ADAM_ENABLE(adam_Enable),  
	 .OLD_WEIGHT(OLD_WEIGHT),
	 .eta(eta),
	 .UPDATED_WEIGHT(local_UPDATED_WEIGHT_ADAM)
    );
	 
//Multiplex between result of Manhattan block and Adam block
Training_Mux
#(
 BIT_WIDTH,
 EXTRA_BIT
)
tm_inst
(
 .MANHATTAN_UPDATED_WEIGHT(local_UPDATED_WEIGHT_MANHATTAN),
 .ADAM_UPDATED_WEIGHT(local_UPDATED_WEIGHT_ADAM),
 .training_mode(training_mode),
 .MEMORY_UPDATED_WEIGHT(local_MEMORY_UPDATED_WEIGHT)
    );
//To detect the best error and save the current roots if the least error is detected 	
ErrorCalculation_2
	 ERRC_inst_1
	 (
	  .clk(clk)                                 ,
     .rst(rst)                                 ,
	  .current_err(SQUARED_ERROR)               ,
     .write_en(local_bestweights_flag)				  ,  
	  .stall_errorCalc(ENABLE),
	  .Best_error(local_best_error )    
	 );
always@(posedge clk or posedge rst) 
begin
if (rst)begin
eta<={2'b01,32'b00111101110011001100110011001101}; //initiates eta =0.1
Best_error<= {2'b01,1'b1,31'b0111111100000000000000000000000}; //initiates best error with value of -1
end
else begin
eta<=local_New_eta;
//Assigning the new values for rest of output ports
if (!ENABLE) begin // if enable is zero then produce the output
MEMORY_UPDATED_WEIGHT<=local_MEMORY_UPDATED_WEIGHT;
training_done<=local_training_done;
write_en<=local_bestweights_flag;
end
else begin
MEMORY_UPDATED_WEIGHT<=34'b0; //to inform to module convert this signal to zero value to not affect the accumulation of macc units in NN layers
end
Best_error<=local_best_error;
end
end
endmodule
