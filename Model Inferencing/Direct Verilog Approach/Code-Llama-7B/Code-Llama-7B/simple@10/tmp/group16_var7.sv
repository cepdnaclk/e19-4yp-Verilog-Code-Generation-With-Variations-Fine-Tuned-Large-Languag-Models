module orfr_tst; // Testbench for OR gate with force/release
  reg b,c; wire a;
  initial begin b=1'b0; c=1'b0; #20 $stop; end // Initialize inputs
  always #3 c = ~c; // Toggle input 'c' every 3 time units
  or_fr_rl dd(a,b,c); // Instantiate the module containing force/release
endmodule
module or_fr_rl(DataIn, DataOut); // Use a structure to hold inputs and outputs
  input [1:0] DataIn; // Now defined as an unpacked structure
  output [1:0] DataOut; // Now defined as an unpacked structure
  assign {DataOut.or_out, DataOut.or_str} = DataIn; // Structure member names are used to read/assig
  always @(DataIn) force DataIn.or_out = DataIn.or_in; // Force is applied only to data element #1
  always @(DataIn) release DataIn.or_str; // Release is applied only to data element #2
endmodule
module tst_or_st;
  logic [1:0] din, dout;
  initial begin din=2'b00; #20 $stop; end // Initialize inputs
  always #3 din = ~din; // Toggle input 'c' every 3 time units
  or_fr_rl or_st(din, dout); // Instantiate the module containing force/release
endmodule
module or_fr_rl(DataIn, DataOut); // Use a structure to hold inputs and outputs
  input [1:0] DataIn; // Now defined as an unpacked structure
  output [1:0] DataOut; // Now defined as an unpacked structure
  assign {DataOut.or_out, DataOut.or_str} = DataIn; // Structure member names are used to read/assig
  always @(DataIn) force {DataIn.or_out, DataIn.or_str} = DataIn; // Use structure element names
  // Also use structure names in this case
  always @(DataIn) release DataIn.