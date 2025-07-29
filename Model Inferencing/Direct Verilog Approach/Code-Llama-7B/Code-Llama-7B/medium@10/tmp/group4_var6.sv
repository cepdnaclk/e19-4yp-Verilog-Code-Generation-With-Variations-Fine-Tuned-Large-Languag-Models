```verilog
module jk(q,r,s,t,clk,rst); // JK flip-flop with asynchronous reset
  output q,r;
  input rst;
  input clk,s,t;
  supply0 a;
  wire q,r;
  nmos (r, a, s);
  nmos (q, a, t);
  if (clk)
    inside
    case (and(rst,s))
      0: q <= r;
      1: q <= t;
      1'bx: q <= r;
    endcase
    pullup (r);
    pullup (q);
endmodule
//Simulation Results:
```
![](https://github.com/JingweiToo/EE2020_summer/blob/main/week1/img/jk_ff_inside