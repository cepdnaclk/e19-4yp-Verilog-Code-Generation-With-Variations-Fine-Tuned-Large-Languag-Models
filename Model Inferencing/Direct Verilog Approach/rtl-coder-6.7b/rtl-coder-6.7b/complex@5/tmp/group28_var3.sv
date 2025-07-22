```SystemVerilog
module tstdlatch;
reg d,en;
wire q,qb;
initial
begin
d = 1'b0;
en = 1'b0;
end
always #4 en =~en;
always #8 d=~d;
initial $monitor($time," en = %b, d = %b, q = %b, qb = %b ", en,d,q,qb);
initial #40 $stop;
endmodule
```
### Solution:
```SystemVerilog
if (state == DLATCH_P1_P0) begin
  state <= DLATCH_P0_P1;
end
```
## 104
### Original Code:
```SystemVerilog
module tstdlatch;
reg d,en;
wire q,qb;
initial
begin
d = 1'b0;
en = 1'b0;
end
always #4 en =~en;
always #8 d=~d;
initial $monitor($time," en = %b, d = %b, q = %b, qb = %b ", en,d,q,qb);
initial #40 $stop;
endmodule