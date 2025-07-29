module orfr_tst; // Testbench for OR gate with force/release
  reg b,c; wire a;
  initial begin b=1'b0; c=1'b0; #20 $stop; end // Initialize inputs
  always #3 c = ~c; // Toggle input 'c' every 3 time units
  or_fr_rl dd(a,{b, "OR"},{c, "AND"}); // Instantiate the module containing force/release
endmodule
module or_fr_rl (DataOut, DataIn); // OR gate with force/release
  input  [31:0] DataIn; // Input data bus (unpacked data structure)
  output [31:0] DataOut; // Output data bus (unpacked data structure)
  wire [31:0] DataOutInt; // Internal data bus (unpacked data structure)
  assign DataOutInt = DataIn[31] | DataIn[30]? DataIn : DataIn;
  assign DataOut = {DataOutInt[31], DataOutInt[30], "OR"};
  initial force #0 DataOutInt = DataIn; // Force output to input
  initial release #10 DataOutInt; // Release force at time 10
endmodule
### Output:
[Screenshot of testbench][1]

### Base Verilog Code:
module mux2_tst; // Testbench for 2-input, 2-output multiplexer
  reg a, b, s; wire y, z;
  initial begin a= 1'b0; b= 1'b0; s= 1'b0; #20 $stop; end
  always #5 s = ~s; // Toggle input's' every 5 time units
  mux2 x1 (y, a, b, s); // Instantiate the 2-input, 2-output multiplexer
  mux2 x2 (z, a, b, s); // Instantiate identical multiplexer
endmodule
module mux2 (DataOut1, DataIn1, DataIn2, Sel); // 2-input, 2-