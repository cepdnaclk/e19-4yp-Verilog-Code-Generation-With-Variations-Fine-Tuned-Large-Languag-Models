module Problem8(input [3:0] a, b, output [3:0] diff);
  reg [4:0] x;
  reg [4:0] y;
  reg [4:0] z;
  assign x = a;
  assign y = b;
  assign z = a - b;
  assign diff = z;
endmodule
### Example Run:
*./modelsim.sh
* vlog -f input.f
* vsim -c DUT input.sv -l run.log
* add wave -radix 2 -r -position insertpoint  -format -scale 1000 -height 100 sim:/DUT/*
* run 100 ns
* quit -f
### Code Analyzer Output:
![Problem8 Code Analyzer Output](problem_8.png)
### Passed: