module orfr_tst; // Testbench for OR gate with force/release
  reg [1:0] b,c;
  wire [1:0] a;
  initial begin b=2'b00; c=2'b00; #20 $stop; end // Initialize inputs
  always #3 c = ~c; // Toggle input 'c' every 3 time units
  or_fr_rl dd(a,b,c); // Instantiate the module containing force/release
endmodule