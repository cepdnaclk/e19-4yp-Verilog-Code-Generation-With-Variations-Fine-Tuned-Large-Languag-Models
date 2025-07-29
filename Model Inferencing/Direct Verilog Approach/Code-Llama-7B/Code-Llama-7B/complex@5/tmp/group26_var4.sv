```
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
        inside {2'b00, 2'b10}: Adjr = 2'b11;
        inside {2'b01, 2'b11}: Adjr = 2'b01;
        default: Adjr = 2'b00;
    endcase
    HiCount = 2'b0;
end
endmodule
```
### Testbench Code:
```
module JerkyComparatorTestbench;
timeunit 1ns;
timeprecision 100ps;
// declare the input and output signals
reg ClockIn, PLLClock, Reset;
wire[1:0] AdjustFreq;
// instantiate the unit under verification (UUT)
JerkyComparator UUT (AdjustFreq, ClockIn, PLLClock, Reset);
// next statement specifies the format to be used for reporting results (breadcrumbs)
$displayb;
initial begin
// initialize input data
    ClockIn = 1'b0;
    PLLClock = 1'b0;
    Reset = 1'b0;
    repeat (2) #5 ClockIn = ~ClockIn;
    repeat (3) #20 ClockIn = ~ClockIn;
    Reset = 1'b1;
    repeat (2) #5 ClockIn = ~ClockIn;
    repeat (3) #20 ClockIn = ~ClockIn;
    Reset = 1'b0;
    repeat (2) #5 ClockIn = ~ClockIn;
    repeat (3) #20 ClockIn = ~ClockIn;
    Reset = 1'b1;
    repeat (2) #5 ClockIn = ~ClockIn;
    repeat (3) #20 ClockIn = ~ClockIn;
    Reset = 1'b0;
    repeat (2) #5 ClockIn = ~ClockIn;
    repeat (3) #20 ClockIn = ~ClockIn;
    Reset = 1'b1;
    repeat (2) #5 ClockIn = ~ClockIn;
    repeat (3) #20 ClockIn = ~ClockIn;
    Reset = 1'b0;
    repeat (2) #5 ClockIn = ~ClockIn;
    repeat (3) #20 ClockIn = ~ClockIn;
    Reset = 1'b1;
    repeat (2) #5 ClockIn = ~ClockIn;
    repeat (3) #20 ClockIn = ~ClockIn;
    Reset = 1'b0;
    repeat (2) #5 ClockIn = ~ClockIn;
    repeat (3) #20 ClockIn = ~ClockIn;
    Reset = 1'b1;
    repeat (2) #5 ClockIn = ~ClockIn;
    repeat (3) #20 ClockIn = ~ClockIn;
    Reset = 1'b0;
    repeat (2) #5 ClockIn = ~ClockIn;
    repeat (3) #20 ClockIn = ~ClockIn;
    Reset = 1'b1;
    repeat (2) #5 ClockIn = ~ClockIn;
    repeat (3) #20 ClockIn = ~ClockIn;
    Reset = 1'b0;
    repeat (2) #5 ClockIn = ~ClockIn;
    repeat (3) #20 ClockIn = ~ClockIn;
    Reset = 1'b1;