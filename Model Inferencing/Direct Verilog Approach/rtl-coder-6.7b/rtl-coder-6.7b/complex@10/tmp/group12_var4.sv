module dffalter_tst();
reg di,clk,clr,pr;
wire q, qb;
// dffalter dff(q,qb,di,clk,clr,pr);
initial
begin
clr=1'b1;pr=1'b0;clk=1'b0;di=1'b0;
end
always
begin
clr=1'b0;
end
always # 4 di =~di;
initial #46 $stop;
endmodule
module dffalter_tst();
reg di,clk,clr,pr;
wire q, qb;
// dffalter dff(q,qb,di,clk,clr,pr);
initial
begin
clr=1'b1;pr=1'b0;clk=1'b0;di=1'b0;
end
always
begin
clr=1'b0;
end
initial #46 $stop;
endmodule
### Verification Code:
`inside` operator using `di` and a packed array slice declared in a package to validate async preset behavior.
```systemverilog
`include "src/dffalter_tst.sv"
```