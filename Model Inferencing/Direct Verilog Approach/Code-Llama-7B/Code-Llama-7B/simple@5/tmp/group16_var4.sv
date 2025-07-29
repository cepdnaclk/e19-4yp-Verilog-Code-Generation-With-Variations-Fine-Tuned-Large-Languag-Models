module orfr_tst; // Testbench for OR gate with force/release
  reg [1:0] b,c; wire a;
  initial begin b=2'b00; c=2'b00; #20 $stop; end // Initialize inputs
  always #3