```verilog
module tst_nor3NMOS();
  reg in1,in2,in3; wire b;
  generate
    for(genvar i = 0; i < 2; i++) begin : \gen_block1
      nmos nn(in1,in2,in3,b[i]);
    end
  endgenerate
  initial begin // Initialize inputs
    in1=1'b0; in2=1'b0; in3=1'b0;
  end
  // Toggle inputs at different rates
  always #2 in1=~in1;
  always #3 in2=~in2;
  always #5 in3=~in3;
  initial $monitor($time, "in1 = %b, in2 = %b, in3 = %b, output = %b ",in1,in2,in3,b);
  initial #24 $stop;
endmodule
```
In the updated code, we use a `generate` block to create multiple NOR gates with different output signals. The loop index i is used with the `for` statement to create 2 NMOS NOR gates. The output of each gate is defined using a `nmos` primitive and `b[i]` for the i-th output. The `\gen_block1 ` escape name is used for the name of the generate block.

Note: The NOR gate in Verilog is a primitive, it could be `nmos` or `pmos`. Each primitive gate has a different delay. In this case, nmos is used for the first NOR gate and pmos for the second NOR gate.
The delay can be changed in the `.lib` file. Each line in the `.lib` file represents a primitive gate with the following details:
```
01 nmos D=1.02 N=1.02 A=0.001000 B=0.0145
```
The first four fields (`01`, `nmos`, `D`, `N`) define the gate type, name, drain-source resistance, and gate-source resistance. The last three fields (`A`, `B`, `C`) define drain