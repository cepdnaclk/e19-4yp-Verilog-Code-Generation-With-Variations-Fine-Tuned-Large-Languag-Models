module orfr_tst; // Testbench for OR gate with task-based force/release
  reg b,c; wire a;
  initial begin b=1'b0; c=1'b0; #20 $stop; end // Initialize inputs
  always #3 c = ~c; // Toggle input 'c' every 3 time units
  or_fr_rl dd(a,b,c); // Instantiate the module containing force/release
endmodule
module or_fr_rl(DataOut, DataIn);
  output DataOut; // DataOut and DataIn are unpacked structures
  input DataIn;
  always_comb DataOut.z = DataIn.x | DataIn.y; // Use 'always_comb'
endmodule
task force_release(dataout, dat