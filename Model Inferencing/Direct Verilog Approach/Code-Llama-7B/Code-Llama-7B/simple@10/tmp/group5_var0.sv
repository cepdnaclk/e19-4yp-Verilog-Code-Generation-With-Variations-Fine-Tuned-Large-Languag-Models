module tst_dff_pbeh (logic di,clk, do);
  logic do; wire do;
  dff_p d1(do,di,clk);
  initial begin clk=0; di=1'b0; #35 $stop; end
  always #3 clk=~clk;
  always #5 di=~di;
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule
### Comment:
Due to the use of non-blocking assignment, the order of assignments in the initial block is changed, leading to
a simulation failure with the base code. The change to an implicit reg type fixes this issue.
### Simulation Results:
```log
sim:/tst_dff_pbeh/inst.d1 B=1 #10
sim:/tst_dff_pbeh/inst.d1 Q=x
sim:/tst_dff_pbeh/inst.d1 CLK=1 #20
sim:/tst_dff_pbeh/inst.d1 Q=x
sim:/tst_dff_pbeh/inst.d1 CLK=0 #30
sim:/tst_dff_pbeh/inst.d1 Q=0
sim:/tst_dff_pbeh/inst.d1 CLK=1 #35
sim:/tst_dff_pbeh/inst.d1 Q=0
sim:/tst_dff_pbeh/inst.d1 CLK=0 #60
sim:/tst_dff_pbeh/inst.d1 Q=0
sim:/tst_dff_pbeh/inst.d1 CLK=1 #65
sim:/tst_dff_pbeh/inst.d1 Q=1
sim:/tst_dff_pbeh/inst.d1 CLK=0 #80
sim:/tst_dff_pbeh/inst.d1 Q=1
sim:/tst_dff_pbeh/inst.d1 CLK=1 #85
sim:/t