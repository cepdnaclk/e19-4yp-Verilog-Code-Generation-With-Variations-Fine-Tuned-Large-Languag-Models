```verilog
module dec2_4beh(o,i);
output [3:0]o;
input [1:0]i;
reg[3:0] o;
always @(i) begin
if (i[1]) o[3] = 1'b1;
else o[3] = 1'b0;
if (i[0]) o[2] = 1'b1;
else o[2] = 1'b0;
if (i[1]) o[1] = 1'b1;
else o[1] = 1'b0;
if (i[0]) o[0] = 1'b1;
else o[0] = 1'b0;
end
endmodule
```
### Simulation
![decimating_behavior_h2](/BreakingNESWiF/images/decimating_behavior_h2.png)
###