module orfr_tst; // Testbench for OR gate with force/release
  reg b,c; wire a;
  initial begin b=1'b0; c=1'b0; #20 $stop; end // Initialize inputs
  always #3 c = ~c; // Toggle input 'c' every 3 time units
  or_fr_rl dd(a,b,c); // Instantiate the module containing force/release
  initial begin
    $display("**************************\
    \n  Structural Port Connection:");
    dd.DataIn.b = 1'b1;
    dd.DataIn.c = 1'b1;
    dd.DataOut.a = 1'b0;
    dd.DataOut.b = 1'b0;
    dd.DataOut.c = 1'b0;
  end

  initial begin
    $display("**************************\
    \n  Behavioral Port Connection:");
    dd.DataIn = '{b:1'b1, c:1'b1};
    dd.DataOut = '{a:1'b0, b:1'b0,