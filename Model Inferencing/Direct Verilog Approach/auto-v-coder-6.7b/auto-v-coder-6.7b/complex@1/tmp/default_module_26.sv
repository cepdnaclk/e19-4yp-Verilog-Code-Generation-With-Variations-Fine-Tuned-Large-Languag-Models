```verilog
module JerkyComparator (output[1:0] AdjustFreq, input ClockIn, PLLClock, Reset);
reg[1:0] Adjr;
assign AdjustFreq = Adjr;
reg[1:0] HiCount;
always @(ClockIn, Reset)
if (Reset==1'b1)
begin
    Adjr = 2'b01;
    HiCount = 2'b0;
end
else if (PLLClock==1'b1)
    HiCount = HiCount + 2'b01;
else begin
    case (HiCount)
        2'b00: Adjr = 2'b11;
        2'b01: Adjr = 2'b01;
        default: Adjr = 2'b00;
    endcase
    HiCount = 2'b0;
end
endmodule
```

In this example, we are using a simple comparator to adjust the frequency. It has an input signal `ClockIn` and `PLLClock` which are used to decide when to adjust the frequency. If `Reset` is asserted, it resets the frequency adjustment to the lowest setting. Otherwise, if `PLLClock` is asserted, it increments `HiCount`. If `HiCount` is 2'b00, it sets `Adjr` to 2'b11, if it's 2'b01, it sets `Adjr` to 2'b01, and otherwise, it sets `Adjr` to 2'b00. Finally, it resets `HiCount` to 2'b0.```verilog
module JerkyComparator (output[1:0] AdjustFreq, input ClockIn, PLLClock, Reset);
reg[1:0] Adjr;
assign AdjustFreq = Adjr;
reg[1:0] HiCount;
always @(ClockIn, Reset)
if (Reset==1'b1)
begin
    Adjr = 2'b01;
    HiCount =