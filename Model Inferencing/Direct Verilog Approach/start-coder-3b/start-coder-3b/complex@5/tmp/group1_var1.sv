```
module tst_nor3NMOS();
  reg in1,in2,in3; wire b;
  generate
    \gen_block1 : nor3NMOS nn[3](in1,in2,in3,b) when (in1==1'b0)
  endgenerate // \gen_block1 : nor3NMOS nn[3](in1,in2,in3,b) when (in1==1'b0)
  initial begin // Initialize inputs
    in1=1'b0; in2=1'b0; in3=1'b0;
  end
  // Toggle inputs at different rates
  always #2 in1=~in1;
  always #3 in2=~in2;
  always #5 in3=~in3;
  initial $monitor($time, "in1 = %b, in2 = %b, in3 = %b, output = %b ",in1,in2,in3,b);
  initial #24 $stop; // Stop simulation
endmodule
```
### Simulation Results:
![Simulation Results](https://github.com/VioletRose/Verilog-Code-Snippet/raw/master/Pictures/Simulation/Verilog%2020