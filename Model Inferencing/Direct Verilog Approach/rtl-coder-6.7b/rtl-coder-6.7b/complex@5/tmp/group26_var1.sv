```
module JerkyComparator (output [1:0] AdjustFreq, input  ClockIn, PLLClock, Reset);
reg [1:0] Adjr;
assign AdjustFreq = Adjr;
reg  [1:0] HiCount;
always @(ClockIn, Reset)
if (Reset==1'b1)
begin
    Adjr <= 2'b01;
    HiCount <= 2'b0;
end
else if (PLLClock==1'b1)
    HiCount <= HiCount + 2'b01;
else begin
    case (HiCount)
        2'b00: Adjr <= 2'b11;
        2'b01: Adjr <= 2'b01;
        default: Adjr <= 2'b00;
    endcase
    HiCount <= 2'b0;
end
endmodule
```