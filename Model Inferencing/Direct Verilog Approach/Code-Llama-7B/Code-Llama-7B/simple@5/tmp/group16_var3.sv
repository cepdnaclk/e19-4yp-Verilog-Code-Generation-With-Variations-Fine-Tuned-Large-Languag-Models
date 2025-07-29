module orfr_tst; // Testbench for OR gate with force/release
  reg b,c; wire a;
  initial begin b=1'b0; c=1'b0; #20 $stop; end // Initialize inputs
  always #3 c = ~c; // Toggle input 'c' every 3 time units
  or_fr_rl dd(a,b,c); // Instantiate the module containing force/release
endmodule
module or_fr_rl(DataOut,DataIn);
  parameter WIDTH=2;
  input [WIDTH-1:0] DataIn;
  output [WIDTH-1:0] DataOut;
  wire [WIDTH-1:0][WIDTH-1:0] force; // Force vector
  logic [WIDTH-1:0] r; // Release vector
  assign {r, DataOut} = DataIn;
  assign force[0][0] = DataIn[0][0] | r; // Force vector element
  assign force[0][1] = DataIn[0][1] | r;
  assign force[1][0] = DataIn[1][0] | r;
  assign force[1][1] = DataIn[1][1] | r;
  assign DataOut[0][0] = force[0][0] | force[1][0];
  assign DataOut[0][1] = force[0][1] | force[1