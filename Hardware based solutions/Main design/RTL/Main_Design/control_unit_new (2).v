/*
+ Project : Emulator Graduation Project 2018 ASU-CSE
+ Module  : Control Unit
+ Abstract: Finite State Machine that controls all signals of the training block and memory enables 
*/

module control_unit_2
#(
 parameter NUM_UNKNOWNS = 2,                  	//num of unknowns
 parameter Best_W_rd_Cycles = 2*NUM_UNKNOWNS,  	//num of cycles for reading weights from best weight mem
 parameter Manh_iter = 1,                     	//num of iterations for manh mode
 parameter Adam_iter = 1,                       // num of iterations for adam mode
 parameter total_iter = 1                       // total num of iterations for manh and adam
)(
    input  wire rst,                      		//if 1 --> reset and initialize  && 0 --> continue
	 input  wire clk,
    input  wire training_done,          			//if 1 --> stop iterations and training because required error achieved
	 
   output reg training_mode,       					// if 1 --> manhattan & 0 --> adam 
   output reg INITIAL_ROM_READ_FLAG,				// 1 --> at the start of the training 
 	output reg WASTED_CYCLE_STALL,   				//if 1 --> stop training and deactivate trainer modules	                                 
	output reg old_weight_rd,      					//enable read old weight from buffer (to update old weight in training block)
	output reg write_training,     					// enable writing in old weights buffer 
	output reg write_enable,       					//for update weights
	output reg first_manh_finished, 					//if 1 --> first iterations for manh has finished
	output reg second_manh_finished,   				// if 1 --> second iterations for manh has finished and start adam
	output reg finished,               				//1-->mode iterations has finished 
	output reg stop                   				//to stop all blocks when iterations of training are done
    );
	 localparam wasted_cycles = 19;//5*NUM_UNKNOWNS -1;  //4*UNknowns wasted from FWD+BWD modules
																		 //and (Unknowns-1) wasted from intermediate logic module
	 reg [1:0] current_state;  
    
	 localparam manh_1st_loop = 2'b00;  //represents first loop state for manhattan 
	 localparam manh_2nd_loop = 2'b01;  //represents second loop state for manhattan
	 localparam    adam       = 2'b10;   //represents adam state 
    //localparam    done       = 2'b11;	 //represents done state 
	 
	 integer outer_counter;         // for total iterations of(Adam & Manhattan)
	 integer rom_read_counter;       //for reading weights from ROM at the starting
	 integer inner_counter;        //for iterations of one mode (manh or adam)
	 integer one_iter_counter;        //for one iteration of manh or adam
	 integer wasted_counter;        //counter for wasted cycles
	 reg wasted_cycle_flag;         //if 1---> wasted cycles mode & 0--> training mode 
	 reg one_iter_flag;         //if 1---> one iteration mode & 0--> one iteration finished 
	 integer read_counter;      //count num of unknowns for reading from memory
	 reg first_finished_flag;         //if 1---->finished_first_manh equal to 1(delay for assignmnet of finished signal
	 reg second_finished_flag;         //if 1---->finished_second_manh equal to 1(delay for assignmnet of finished signal
	 reg change_mode;          //this is flag is used to delay assignment of training mode by one cycle
	 reg finished_flag;      
    integer finished_counter;	 
    //reg write_flag;           //for write signal 
	 


always @(posedge clk or posedge rst) begin 
	 if(rst)  
	    begin
		   training_mode<=1;
			old_weight_rd<=0;
			write_training<=0;
			write_enable<=0;
			first_manh_finished<=0;
			second_manh_finished<=0;
			inner_counter<=0;
			outer_counter<=0;
			one_iter_flag<=1;
	      one_iter_counter<=0;
			current_state<=manh_1st_loop;
			wasted_cycle_flag<=1;
			WASTED_CYCLE_STALL<=1;
			wasted_counter<=-2;        //first wasted cycles is greater than second wasted cycles by 1 clock cycle
			rom_read_counter<=0;
	      INITIAL_ROM_READ_FLAG<=1;
			change_mode<=0;
			stop<=0;
			read_counter<=0;    //
			first_finished_flag<=0;  //
			second_finished_flag<=0;  //
			finished <=0;   //
			finished_flag <=0;   //
			finished_counter<=0;
		 end
	 else begin 
	  if(training_done || outer_counter == total_iter )begin  //iterate till total iterations or training is done then stop 
	    WASTED_CYCLE_STALL<=1;
		 stop<=1;
		 old_weight_rd<=0;  //
		write_training<=0;  //
		write_enable<=0;    //
	  end
	 else begin
	 if(!wasted_cycle_flag)begin //wait for wasted cycles finish then continue iterations
	      if(current_state == manh_1st_loop ) begin
		   	//second_manh_finished<=0;  //
				training_mode<=1;
				if(inner_counter == Manh_iter-1)begin  //stop looping on manh iterations
				  if(one_iter_counter == NUM_UNKNOWNS-1)begin //stop looping on num of unknowns for last iteration
					  first_manh_finished<=1;
					  finished <=1;   //
			        finished_flag <=1;   //
					 current_state<= manh_2nd_loop;
					 inner_counter<=0;
					 one_iter_counter<=0;	
					 wasted_cycle_flag<=1;
					 WASTED_CYCLE_STALL<=1;
				  end
				 else if(one_iter_counter < NUM_UNKNOWNS )begin //loop on num of unknowns for last iteration
					one_iter_counter <= one_iter_counter +1;
				 end
			 end
			else if(inner_counter < Manh_iter)begin //loop on manh iterations
				 if(one_iter_counter == NUM_UNKNOWNS-1)begin //stop looping on num of unknowns for the iteration
				   	inner_counter <= inner_counter+1;
					  one_iter_counter<=0;	
					  WASTED_CYCLE_STALL<=1;
					  wasted_cycle_flag<=1;
				 end
				 else if(one_iter_counter < NUM_UNKNOWNS )begin //loop on num of unknowns
					one_iter_counter <= one_iter_counter +1;
				 end
			 end	 
		   end
			//////////////////////////////////////////////////////////////////////////////////////////////////////
			//coming states conditions as similar as state of manh_1st_loop with different assigning of the signals
            //////////////////////////////////////////////////////////////////////////////////////////////////////
			if(current_state == manh_2nd_loop ) begin
		   	
				training_mode<=1;
					if(inner_counter == Manh_iter-1)begin //stop looping on manh iterations
						  if(one_iter_counter == NUM_UNKNOWNS-2)begin
						     if(Adam_iter == 0)begin
					          outer_counter <= outer_counter+1;
						     end
							end
						  if(one_iter_counter == NUM_UNKNOWNS-1)begin  					 
							 wasted_cycle_flag<=1;
							 WASTED_CYCLE_STALL<=1;
							  second_manh_finished<=1;
							  first_manh_finished<=0;   //
							  finished <=1;   //
			              finished_flag <=1;   //
							   inner_counter<=0; 
							  one_iter_counter<=0;
							 if(Adam_iter == 0)begin
							    current_state<=manh_1st_loop ;
							 end
							 else begin
							    current_state<= adam;
								 training_mode<=0;
							 end	
						  end
						 else if(one_iter_counter < NUM_UNKNOWNS )begin
							one_iter_counter <= one_iter_counter +1;
						 end
				  end
			    else if(inner_counter < Manh_iter)begin
						 if(one_iter_counter == NUM_UNKNOWNS-1)begin
							one_iter_counter<=0;	
							wasted_cycle_flag<=1;
							WASTED_CYCLE_STALL<=1;
							inner_counter <= inner_counter+1;
						 end
						 else if(one_iter_counter < NUM_UNKNOWNS )begin
							one_iter_counter <= one_iter_counter +1;
						 end
			     end	 
		    end
		  
		   if(current_state == adam ) begin
				if(inner_counter == Adam_iter-1)begin 
				  if(one_iter_counter == NUM_UNKNOWNS-2)begin
						 outer_counter <= outer_counter+1;
					end
				  if(one_iter_counter == NUM_UNKNOWNS-1)begin   
                training_mode<=1;
                  finished <=1;   //
			        finished_flag <=1;   //					 
			       wasted_cycle_flag<=1;
					 WASTED_CYCLE_STALL<=1;
					 current_state<= manh_1st_loop;
					 inner_counter<=0;
					 one_iter_counter<=0;	
				  end
				 else if(one_iter_counter < NUM_UNKNOWNS )begin
					one_iter_counter <= one_iter_counter +1;
				 end
			 end
			else if(inner_counter < Adam_iter)begin
				 if(one_iter_counter == NUM_UNKNOWNS-1)begin
					one_iter_counter<=0;	
					inner_counter <= inner_counter+1;
					wasted_cycle_flag<=1;
					WASTED_CYCLE_STALL<=1;
				 end
				 else if(one_iter_counter < NUM_UNKNOWNS )begin
					one_iter_counter <= one_iter_counter +1;
				 end
			 end	 
		  end
		end	
		
		//wasted cycles handling
	 if(wasted_counter == wasted_cycles-2 && wasted_cycle_flag )begin
		 old_weight_rd<=1;
	end
  if(wasted_counter == wasted_cycles-1 && wasted_cycle_flag )begin 
	   wasted_cycle_flag<=0;
		wasted_counter<=0;
		WASTED_CYCLE_STALL<=0;
	 end
    else if(wasted_counter < wasted_cycles && wasted_cycle_flag )begin 
	   wasted_counter <= wasted_counter +1;
	 end
		 
	//ROM	reading handling
   if (rom_read_counter == Best_W_rd_Cycles-1)begin    
		  INITIAL_ROM_READ_FLAG<=0;                     
	  end
	  else if (rom_read_counter < Best_W_rd_Cycles) begin
	     rom_read_counter <= rom_read_counter+1;
	  end
 
  //read and write flags handling for weights
   if(old_weight_rd) begin
		 write_training<=1;
		 write_enable<=1;
	  end
	  else begin
	    write_training<=0;
		 write_enable<=0;
	  end
	  
	  //handling cycles for read enable for unknowns
	  if(read_counter == NUM_UNKNOWNS-1 && old_weight_rd) begin
		 old_weight_rd<=0;
		 read_counter<=0;
	  end
	  else if(read_counter < NUM_UNKNOWNS && old_weight_rd) begin
	    read_counter<=read_counter+1;
	  end
	  
	  //handling finished signal for modes(manh,adam)
	  if (finished_counter == Best_W_rd_Cycles-1 && finished_flag)begin    
		  finished <=0;
		  finished_flag <=0;
		  finished_counter<=0;
	  end
	  else if (finished_counter < Best_W_rd_Cycles && finished_flag) begin
	     finished_counter <= finished_counter+1;
	  end
	  
	  //finished signals 
	   if( second_manh_finished)begin
	     second_manh_finished<=0;
		 end	 
		 
	 end 
  end 
end	

endmodule

