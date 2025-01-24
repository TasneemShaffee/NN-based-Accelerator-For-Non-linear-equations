`timescale 1ns / 1ps

module MEM#(
parameter DATA_WIDTH   =32, //Width of input data
parameter EXTRA_BITS = 2,
parameter ADDRESS_WIDTH=1, // the bits that needed to determine the number of entries in queue, in this case (4 bits), the queue has 16 entries.    
parameter RAM_DEPTH    =1<<ADDRESS_WIDTH //shifting the RAM_DEPTH based on the chosen number of bits to determine the number of queue entries.
)
(
input  wire clk,                                 	//input clock
input  wire rst,                                	//input reset
input  wire [DATA_WIDTH+EXTRA_BITS-1:0]data_in,    // input data for fifo.
input  wire wr_en,                            		//writing enable signal
input wire  rd_en,                           		// reading enable signal
output reg [DATA_WIDTH+EXTRA_BITS-1:0] data_out    //the data that outcomes from queue.
    );
// Internal wires/reg declarations
   reg [ADDRESS_WIDTH-1:0]    wr_pointer;                 	//writting pointer 
   reg [ADDRESS_WIDTH-1:0]    rd_pointer;                	// reading pointer 
	reg[DATA_WIDTH+EXTRA_BITS-1:0]       data_ram [0:RAM_DEPTH -1];		//queue to store data.
	reg empty;

//writing pointer points to next writting address
always @(posedge clk or posedge rst)
begin
if (rst)
wr_pointer<=0;
else
begin
if(wr_en && (wr_pointer!=(RAM_DEPTH-1) ))
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
else
      data_ram[ wr_pointer ] <= data_ram[ wr_pointer ];
end
end

//reading pointer points to next reading address
always @(posedge clk or posedge rst)
begin
if (rst) begin
rd_pointer<=0;
empty<=1;
end
else if(rd_en && !(empty == 1) && (rd_pointer!=(RAM_DEPTH-1))) begin
rd_pointer<=rd_pointer+1;

end
else if(rd_en &&  (rd_pointer==RAM_DEPTH-1) )begin
rd_pointer<=0;
end
end

//reading data from queue.
always @(posedge clk or posedge rst)
begin
if (rst) begin
data_out<=0;
end
else if (rd_en && !(empty== 1))
begin
data_out<=data_ram[rd_pointer];
end
else data_out<=data_out;
end
endmodule


