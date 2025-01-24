/*
+ Project   : Emulator Graduation Project 2018 ASU-CSE
+ Module    : MEM_WEIGHTS.v
+ Abstract  :Memory to save the best roots or ordinary roots.
+Notes: It saves all the roots at first time in first iteration.
		  Then saving the roots are controller by writting enabled.
        In handles the updating of the number of unknowns only and not the padding values.
*/
module MEM_WEIGHTS#(
parameter DATA_WIDTH   =32, 					//Width of input data
parameter EXTRA_BITS = 2,					   //extra bits are needed for flopoco
parameter NUM_UNKOWNS=1, 	 					//number of unkowns of system equations
parameter ADDRESS_WIDTH=1,  				  	// the bits that needed to determine the number of entries in queue, in this case (4 bits), the queue has 16 entries.    
parameter RAM_DEPTH    =1<<ADDRESS_WIDTH 	//shifting the RAM_DEPTH based on the chosen number of bits to determine the number of queue entries.
)
(
input  wire clk,                                 	//input clock
input  wire rst,                                	//input reset
input  wire [DATA_WIDTH+EXTRA_BITS-1:0]data_in,    // input data for fifo.
input  wire wr_en,                            		//writing enable signal
input wire  rd_en,                           		// reading enable signal
input wire Update_Weight,                          //Signal enabling saving the main weights only not the padding one 
input wire local_initial_read_flag,
output reg Loaded_weight_end,								//signal indicates 
output reg [DATA_WIDTH+EXTRA_BITS-1:0] data_out    //the data that outcomes from queue.
    );
// Internal wires/reg declarations
   reg [ADDRESS_WIDTH-1:0]              wr_pointer;                 				//writting pointer 
   reg [ADDRESS_WIDTH-1:0]    			 rd_pointer;                				// reading pointer 
	reg[DATA_WIDTH+EXTRA_BITS-1:0]       data_ram [0:RAM_DEPTH -1];				//queue to store data.
	reg empty;
   

always @(posedge clk or posedge rst)
begin
if (rst) begin
wr_pointer<=0;
empty<=1;
end
else
begin
//Writing the initial guess in the memory
if (local_initial_read_flag)
begin
//writting pointer 
if(wr_en && (wr_pointer!=(RAM_DEPTH-1)))
begin
data_ram[ wr_pointer ] <= data_in;
wr_pointer<=wr_pointer+1;
empty<=0;
end
else if(wr_en && wr_pointer==(RAM_DEPTH-1))
begin
data_ram[ wr_pointer ] <= data_in;
wr_pointer<=0;
end
end
else begin
if(wr_en && (wr_pointer!=(RAM_DEPTH-1)) && !Update_Weight)
begin
data_ram[ wr_pointer ] <= data_in;
wr_pointer<=wr_pointer+1;
empty<=0;
end

else if(wr_en && wr_pointer==(RAM_DEPTH-1) && !Update_Weight)
begin
data_ram[ wr_pointer ] <= data_in;
wr_pointer<=0;
end

else if (wr_en && (wr_pointer!=(NUM_UNKOWNS-1)) && Update_Weight)
begin
data_ram[ wr_pointer ] <= data_in;
wr_pointer<=wr_pointer+1;
end

else if (wr_en && (wr_pointer==(NUM_UNKOWNS-1)) && Update_Weight) begin
data_ram[ wr_pointer ] <= data_in;
wr_pointer<=0;
end

else
      data_ram[ wr_pointer ] <= data_ram[ wr_pointer ];
end

end

end
//reading pointer points to next reading address
always @(posedge clk or posedge rst)
begin
if (rst) begin
rd_pointer<=0;
Loaded_weight_end<=0;
end
else if(rd_en && !(empty == 1) && (rd_pointer!=(NUM_UNKOWNS-1)) && !Loaded_weight_end) begin
rd_pointer<=rd_pointer+1;
end
else if(rd_en &&  (rd_pointer==NUM_UNKOWNS-1) && !Loaded_weight_end)begin
rd_pointer<=NUM_UNKOWNS;
Loaded_weight_end<=1;
end
else if ( (rd_pointer!=RAM_DEPTH-1) && Loaded_weight_end) begin
rd_pointer<=rd_pointer+1;
end
else if ((rd_pointer==RAM_DEPTH-1) && Loaded_weight_end) begin
rd_pointer<=0;
Loaded_weight_end<=0;
end
end

//reading data from queue.
always @(posedge clk or posedge rst)
begin
if (rst) begin
data_out<=0;
end
else if ((rd_en && !(empty== 1)) || (Loaded_weight_end==1) )
begin
data_out<=data_ram[rd_pointer];
end
else data_out<=data_out;
end


endmodule
