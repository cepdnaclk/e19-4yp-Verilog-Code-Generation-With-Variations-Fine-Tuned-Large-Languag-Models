module dff_p_test();
  reg clk; reg do;
  initial begin
    clk=0; #35 $stop;
  end
  always #3 clk=~clk; // Generate clock
  initial do=`dff_p(0100);
  initial do=`dff_p(0010);
  initial do=`dff_p(0001);
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
endmodule
### Comments:
When procedure-call as the first argument, the output of the function is directly used so the function's output is assigned directly to the procedural assign.
/Chapter 5/tst_dff_p_b.cpp
#include "C:/EDA