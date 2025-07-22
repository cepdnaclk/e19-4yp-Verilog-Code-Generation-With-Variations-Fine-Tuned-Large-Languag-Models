module tst_dff_pbeh();
  logic di,clk; logic [1:0]do;
  dff_p d1(do,di,clk); // Instantiate DFF with path delay
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  always #5 di=~di; // Toggle data
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule
### Compile:
```
cd verilog
>iverilog -o tst_dff_pbeh tst_dff_pbeh.v
>vvp tst_dff_pbeh
```
##### Simulation:
```
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=1 do=1
clk=1 di=1 do=0
clk=0 di=1 do=1
clk=1 di=1 do=0
clk=0 di=1 do=1
clk=1 di=1 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=1 do=1
clk=1 di=1 do=0
clk=0 di=1 do=1
clk=1 di=1 do=0
clk=0 di=1 do=1
clk=1 di=1 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0
clk=1 di=0 do=0
clk=0 di=0 do=0 (0ns)
clk=1 di=0 do=0 (12ns)
clk=0 di=0 do=0 (24ns)
clk=1 di=0 do=0 (36ns)
clk=0 di=0 do=0 (48ns)
clk=1 di=0 do=0 (60ns)
clk=0 di=1 do=1 (72ns)
clk=1 di=1 do=0 (84ns)
clk=0 di=1 do=1 (96ns)
clk=1 di=1 do=0 (108ns)
clk=0 di=1 do=1 (120ns)
clk=1 di=1 do=0 (132ns)
clk=0 di=0 do=0 (144ns)
clk=1 di=0 do=0 (156ns)
clk=0 di=0 do=0 (168ns)
clk=1 di=0 do=0 (180ns)
clk=0 di=0 do=0 (192ns)
clk=1 di=0 do=0 (204ns)
clk=0 di=0 do=0 (216ns)
clk=1 di=0 do=0 (228ns)
clk=0 di=0 do=0 (240ns)
clk=1 di=0 do=0 (252ns)
clk=0 di=0 do=0 (264ns)
clk=1 di=0 do=0 (276ns)
clk=0 di=0 do=0 (288ns)
clk=1 di=0 do=0 (300ns)
clk=0 di=0 do=0 (312ns)
clk=1 di=0 do=0 (324ns)
clk=0 di=0 do=0 (336ns)
clk=1 di=0 do=0 (348ns)
clk=0 di=0 do=0 (360ns)
clk=1 di=0 do=0 (372ns)
clk=0 di=0 do=0 (384ns)
clk=1 di=0 do=0 (396ns)
clk=0 di=0 do=0 (408ns)
clk=1 di=0 do=0 (420ns)
clk=0 di=0 do=0 (432ns)
clk=1 di=0 do=0 (444ns)
clk=0 di=0 do=0 (456ns)
clk=1 di=0 do=0 (468ns)
clk=0 di=0 do=0 (480ns)
clk=1 di=0 do=0 (492ns)
clk=0 di=0 do=0 (504ns)
clk=1 di=0 do=0 (516ns)
clk=0 di=0 do=0 (528ns)
clk=1 di=0 do=0 (540ns)
clk=0 di=0 do=0 (552ns)
clk=1 di=0 do=0 (564ns)
clk=0 di=0 do=0 (576ns)
clk=1 di=0 do=0 (588ns)
clk=0 di=0 do=0 (600ns)
clk=1 di=0 do=0 (612ns)
clk=0 di=0 do=0 (624ns)
clk=1 di=0 do=0 (636ns)
clk=0 di=0 do=0 (648ns)
clk=1 di=0 do=0 (660ns)
clk=0 di=0 do=0 (672ns)
clk=1 di=0 do=0 (684ns)
clk=0 di=0 do=0 (696ns)
clk=1 di=0 do=0 (708ns)
clk=0 di=0 do=0 (720ns)
clk=1 di=0 do=0 (732ns)
clk=0 di=0 do=0 (744ns)
clk=1 di=0 do=0 (756ns)
clk=0 di=0 do=0 (768ns)
clk=1 di=