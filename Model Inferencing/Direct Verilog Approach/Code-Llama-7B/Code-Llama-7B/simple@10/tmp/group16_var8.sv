```
module or_fr_rl (
  input wire DataIn.a,
  input wire DataIn.b,
...
  output wire DataOut.out
);
...
endmodule
```
```
module orfr_tst; // Testbench for OR gate with force/release
  reg b,c; wire a;
  initial begin b=1'b0; c=1'b0; #20 $stop; end // Initialize inputs
  always #3 c = ~c; // Toggle input 'c' every 3 time units
  or_fr_rl dd(a,b,c); // Instantiate the module containing force/release
endmodule
```
### Note:

* It is not necessary to change the testbench.
* This type of change is a **good** practice.
* We can use a struct or a class instead of a union or a struct.

### Testbench Code:
```
module orfr_tst; // Testbench for OR gate with force/release
  reg b,c; wire a;
  initial begin b=1'b0; c=1'b0; #20 $stop; end // Initialize inputs
  always #3 c = ~c; // Toggle input 'c' every 3 time units
  or_fr_rl dd(a,b,c); // Instantiate the module containing force/release
endmodule
```

### Base Verilog Code:
```
module or_fr_rl (      // OR gate with force/release
  input wire DataIn.a,
  input wire DataIn.b,
  input wire DataIn.c,
  output wire DataOut.out
);
  DataOut dout;
  always @(posedge a or posedge b or posedge c)
    dout.out = a|b|c;  // OR combination
  assign DataOut.out = dout.out;
endmodule
```
```
module orfr_tst; // Testbench for OR gate with force/release
  reg b,c; wire a;
  initial begin b=1'b0; c=1'b0; #20 $stop; end // Initialize inputs
  always