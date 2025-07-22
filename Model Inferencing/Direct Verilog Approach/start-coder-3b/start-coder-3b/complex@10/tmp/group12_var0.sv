```systemverilog
// DFF Alteration
package dffalter;
  logic di, clk, clr, pr;
  always @ (negedge clk) begin
    qb <= q;
    q <= di? ~pr : qb;
  end
end
```
## Module 15
### Original Verilog Code:
```systemverilog
module dffalter_reg(); // DFF Alteration
input wire clk;
input wire di;
input wire clr;
input wire pr;