```verilog
module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) begin
        Count <= 0;
        Count[0] <= 'd1; // procedural assignment
    end
    else begin
        Count <= Count + 1;
        Count[0] <= 'd2; // procedural assignment
    end
end
endmodule
```
In this version, the value of the first bit of the `Count` register is set to 1 whenever `Reset` is active and set to 2 whenever `Reset` is inactive. The `Count` register maintains its value on every clock cycle, incrementing when `Reset` is inactive. Therefore, the first bit of `Count` will continuously alternate between 1 and 2.