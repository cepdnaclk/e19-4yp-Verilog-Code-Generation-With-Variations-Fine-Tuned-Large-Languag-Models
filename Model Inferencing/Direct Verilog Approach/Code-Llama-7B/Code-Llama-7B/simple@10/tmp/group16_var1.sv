module orfr_tst; // Testbench for OR gate with force/release
 struct {bit y, z; string s;} a;
 struct {bit y, z; string s;} b;
 struct {bit y, z; string s;} c;
 wire y;
//  reg b,c;
 wire z;
  initial begin b.y=1'b0; b.z='0; b.s="111"; #20 $stop; end // Initialize inputs b
  always #3 c.z = ~c.z; // Toggle input 'c' every 3 time units
  or_fr_rl #(.width(2)) dd(.DataIn(b),.DataOut(c),.DataOut2(a)); // Instantiate the module containing