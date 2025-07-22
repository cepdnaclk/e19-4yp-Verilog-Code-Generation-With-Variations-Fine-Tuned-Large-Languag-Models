```
module dffalter_tst(); // Testbench, likely for a DFF named dffalter
reg di,clk,clr,pr;
wire q, qb; // Added qb
// dffalter dff(q,qb,di,clk,clr,pr); // Assumed instantiation of DUT
// instantiate a package named mypkg1.sv that uses a packed array to access bit locations 1 and 0
initial
begin
clr=1'b1;pr=1'b0;clk=1'b0;di=1'b0; // Start with clear asserted
end
always
begin
clr=1'b0; // Deassert clear
end
always # 4 di =~di; // Toggle data
// Async preset
always #16 pr=2'b10; // Assert preset
always #20 pr =1'b0; // Deassert preset
initial $monitor("t=%0d, clk=%b, clr=%b, pr=%b, di=%b, q=%b ", $time,clk,clr,pr,di,q);
initial #46 $stop; // Stop simulation
endmodule
```

### Test Case 8: [dffalter_asyncclear_tst.sv](https://github.com/sambit950700/vlsi-project1/blob/master/testbench/dffalter_asyncclear_tst.sv)
### Description:
Async clear behavior of a DFF with testbench [dffalter_asyncclear_tst.sv](https://github.com/sambit950700/vlsi-project1/blob/master/testbench/dffalter_asyncclear_tst.sv) asserting a reset on a rising edge of clock.

### Base Verilog Code:

```
module dffalter_tst(); // Testbench, likely for a DFF named dffalter
reg di,clk,clr,pr;
wire q, qb; // Added qb
// dffalter dff(q,