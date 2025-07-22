```
module orfr_tst; // Testbench for OR gate with force/release
  import pkg::*;
  t x,y;
  initial begin
    x = pkg::t'(0);
    y = pkg::t'(0);
    #5 x = pkg::t'(1); // Force input 'a'
    #5 y = pkg::t'(1); // Force input 'a'
    #20 $stop;
  end
  always #3 x.a = ~x.a; // Toggle input 'a' every 3 time units
  always #5 y.a = ~y.a; // Toggle input 'a' every 5 time units
  or_fr_rl #(.WIDTH($bits(pkg::t))) dd(x.a,y.a); // Instantiate the module containing force/release
endmodule
```