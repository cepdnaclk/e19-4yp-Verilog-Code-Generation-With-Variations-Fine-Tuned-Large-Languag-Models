module FourFlopsStructL #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 'bz;
endmodule
### Results:
```
An error occurred while compiling module 'DFF'.
Error: Compiler error.

Line 2: Type 'logic' of LHS 'D' is not compatible with RHS 'byte'.
```

This test checks that vector type compatibility is enforced when a vector type is passed as an input. Note that the input type is not checked at definition time, but at use time.