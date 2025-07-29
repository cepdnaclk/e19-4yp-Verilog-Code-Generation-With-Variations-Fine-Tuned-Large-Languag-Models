module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count <= 0;
    else {Count[0], Count[2:1], Count[3]} <= {Count[2:1], Count[3], Count[0]};
end
endmodule
### Result
All tests Passed
```

## <span id="3.3">3.3</span>

```verilog
### Base Ver