/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : ErrorCalculation_2.v
+ Abstract  :This block is responsible for detecting the best error during the training.
+Notes      :Once during the trianing the current error is detected that is the best or least error till now 
             thus this module generates signal to enable the best weights memory to store the best roots. 
*/
module ErrorCalculation_2#(
parameter ELEMENT_WIDTH = 32,
parameter Extra = 2,
parameter Num_Unknowns = 2,
parameter Num_Unknown_Per_Batch = 1
 )
(
    input  wire                                                               clk                    ,
    input  wire                                                               rst                    ,
	 input  wire     [(ELEMENT_WIDTH+Extra) -1:0]                           current_err               , 
	 output reg  [(ELEMENT_WIDTH+Extra) -1:0]                              Best_error             		,
	 output reg                                                            write_en              		,
	 input   wire                                                        stall_errorCalc
 );
 
 /*
 This block check current-error == best error or not 
 and if true,set write_en by 1 to save these weights in best weights memory.
 */
integer count;
integer flag; 
always@(posedge clk  or posedge rst)
	begin
	 if (rst) 
	  begin
		  write_en <= 1'b0;
		  flag <= 0;
		  count <= 0;
			Best_error <= {2'b01,1'b1,31'b0111111100000000000000000000000} ; // best_error = -1 (32 bits)
	  end
		else begin
		  
		  if(~write_en)begin
			if ((current_err < Best_error && current_err[31] == 0) || (Best_error == {2'b01,1'b1,31'b0111111100000000000000000000000} && current_err[31] == 0)) 
			begin
				Best_error <= current_err;
				write_en <= 1;
		  end  
			end
			else begin
					if(count < (Num_Unknowns - 1)) begin
						  count <= count + 1;
						  end
					else if( count == (Num_Unknowns - 1 )) begin
						  count <= 0;
						  write_en <= 0;
						  end	
							end
							end
							end

endmodule


	

	
