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

This code is a simple Verilog module for a Jerky Comparator. It takes as inputs a ClockIn, PLLClock, and Reset, and outputs the value of AdjustFreq. The logic inside the module is simple: it listens for a reset signal. When it is asserted (1), the module resets the HiCount to 0 and the Adjr to 01. If ClockIn is high (1), it increments the HiCount. When PLLClock goes high, it starts looking at the HiCount. If HiCount is 00, it sets Adjr to 11. If HiCount is 01, it sets Adjr to 01. Otherwise, it sets Adjr to 00. It always resets the HiCount to 0 after the operation. This will be the final output of this module.```verilog
module JerkyComparator (output[1:0] AdjustFreq, input ClockIn, PLLClock, Reset);
reg[1:0] Adjr;
assign AdjustFreq = Adjr;
reg[1:0] HiCount;
always @(ClockIn, Reset)
if (Reset==1'b1)