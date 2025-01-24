/*
An initial test bench for the layer module

Helper modules used
	+ CLK_GEN : for driving the clock
*/

`include "definitions.v"
//`ifdef iverilog_comp
//`include "rtl/computation/LAYER.v"
//`endif

`default_nettype none



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


module tb_layer_py;

// Simulation parameters
localparam CLK_PERIOD = 10;
localparam BIT_WIDTH = 32;
localparam EXTRA_BITS = 2;
localparam num_test_cases = 50;
localparam NUM_NEURONS = 40;
localparam max_num_inputs = num_test_cases*10;

localparam weights_start_idx = (BIT_WIDTH + EXTRA_BITS)*NUM_NEURONS + BIT_WIDTH + EXTRA_BITS +1 - 1;
localparam weights_end_idx = weights_start_idx - (BIT_WIDTH + EXTRA_BITS)*NUM_NEURONS + 1;
localparam scaler_x_start_idx = weights_end_idx-1;
integer mem_counter_idx = 0;

wire clk;
reg rst;
reg acc_en; 
wire [(BIT_WIDTH + EXTRA_BITS)*NUM_NEURONS - 1:0] acc_result;


// x = 0
reg [BIT_WIDTH + EXTRA_BITS - 1:0] x = 0;

// w = 0
reg [(BIT_WIDTH + EXTRA_BITS)*NUM_NEURONS - 1:0] w = 0;

// NUM_NEURONS floats for weights + 1 float for input  + 1 acc_clear
reg [(BIT_WIDTH + EXTRA_BITS)*(NUM_NEURONS+1) + 1 - 1:0] test_vector_mem [0:num_test_cases*max_num_inputs-1];
reg [31:0] col_sizes [0:max_num_inputs-1];
reg [(BIT_WIDTH + EXTRA_BITS)*NUM_NEURONS - 1:0] test_results [0:num_test_cases];
integer test_case = 0;
integer col_num = 0;
integer result_file;

CLK_GEN clk_generator(
	.clk(clk)
);

LAYER #(.BIT_WIDTH(BIT_WIDTH), .EXTRA_BITS(EXTRA_BITS), .NUM_NEURONS(NUM_NEURONS)) UUT(
	.WEIGHT_VECTOR(w),
	.INPUT_SCALER(x),
	.CLK(clk), 
	.ACC_EN({40{acc_en}}),
	.RESET(rst),
	.ACC_RESULT(acc_result)
);



initial begin
  // dump the signals for the wave viewer
  $dumpfile("tb/computation/py_scripts/testing.dump");
  $dumpvars;
  // for small simulation 
  //$monitor("Weight: %b, Input: %b, ACC_EN: %b", w, x, acc_en);
  // read the test vector file
  $readmemb("test_vector.txt", test_vector_mem);
  $readmemh("num_inpt.txt", col_sizes);
  // file_id for the test results
  result_file = $fopen("test_results.txt", "w");

  // some random initial state
  #1 rst<=1'bx;
  // weight for some CLK_CYCLES; then reset the accumulator
  #(CLK_PERIOD*3) rst<=1; acc_en = 0;
  #(CLK_PERIOD)rst <= 0;
  
  for (test_case = 0;test_case<num_test_cases ;test_case=test_case+1) begin
	  for (col_num = test_case;col_num<test_case+col_sizes[test_case] ;col_num=col_num+1) begin
      w = test_vector_mem[mem_counter_idx+col_num][weights_start_idx:weights_end_idx]; 
      x = test_vector_mem[mem_counter_idx+col_num][scaler_x_start_idx:1];
      acc_en = test_vector_mem[mem_counter_idx+col_num][0];
      //$display("%b %d", test_vector_mem[mem_counter_idx+col_num], mem_counter_idx+col_num);
      #(CLK_PERIOD);
			
    end
    mem_counter_idx = mem_counter_idx + col_sizes[test_case] - 1;
    test_results[test_case] = acc_result;
  end
	// #(CLK_PERIOD)
	// test_results[test_case] = acc_result[31:0];
	#10;
  for (test_case=0; test_case<num_test_cases; test_case=test_case+1) begin
    $fwrite(result_file, "%b\n", test_results[test_case]);
  end

  $finish;
end

endmodule

