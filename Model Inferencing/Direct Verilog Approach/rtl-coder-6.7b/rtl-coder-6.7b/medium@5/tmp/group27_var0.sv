module mux4way1(d, sel, o);
input din[3:0], sel;
output o;
wire d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15;// d0, d1, d2, d3 are intermediate signals
//within the module
assign o = {d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15}[din[0], sel];
endmodule
### Verification:
Run the testbench.
The expected output is as shown:
```
Test_bench:
   module mux4way1(d, sel, o);
input din[3:0], sel;