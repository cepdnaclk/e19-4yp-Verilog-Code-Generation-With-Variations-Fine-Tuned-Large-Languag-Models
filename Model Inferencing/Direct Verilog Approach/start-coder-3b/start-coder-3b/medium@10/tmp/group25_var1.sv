module example7_9(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
always @(posedge Clock)
case (x2)
    0: g = x1 & x3;
#10 $display("x2 = 0");
    1: g = ~x1 & x3;
#10 $display("x2 = 1");
endcase
endmodule
### Simulation Output:
```sh

```
### Base Verilog Code:
module example7_9(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;