module test_FSM();

//module inputs
reg rst;
reg clk;
reg training_mode;
reg [5:0] flag_vectors_comparator;

//outputs
wire training_done;
wire adam_signal;
wire manhatten_signal;

//Initialise reg ports 
initial
begin
clk <= 1'b0 ;
training_mode <= 1'b1;
rst <= 1'b0 ;

end


initial begin 
@(posedge clk);
@(posedge clk);
//case1 ok
//training_mode <= 1'b1;
//flag_vectors_comparator <= 4'b0011;

//case2 ok
//training_mode <= 1'b0;
//flag_vectors_comparator <= 4'b0001;

//case3 ok
training_mode <= 1'b1;
flag_vectors_comparator <= 6'b111111;

end
 
//case1 and 2
//FSM #(.size_of_data(4)) salma1 (
//    .rst(rst),
//    .clk(clk),
//    .training_mode(training_mode),
//    .flag_vectors_comparator(flag_vectors_comparator),
//    .training_done(training_done),
//    .adam_signal(adam_signal),
//    .manhatten_signal(manhatten_signal)
//  );
 

//case3
FSM #(.size_of_data(6)) salma1 (
    .rst(rst),
    .clk(clk),
    .training_mode(training_mode),
    .flag_vectors_comparator(flag_vectors_comparator),
    .training_done(training_done),
    .adam_signal(adam_signal),
    .manhatten_signal(manhatten_signal)
  );

always #10 clk <= ~clk ;

endmodule




