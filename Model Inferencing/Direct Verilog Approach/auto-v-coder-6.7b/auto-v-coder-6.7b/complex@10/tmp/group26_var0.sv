```verilog
module JerkyComparator (output reg[1:0] AdjustFreq, input ClockIn, PLLClock, Reset);
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
This modified code ensures that all logic within the `JerkyComparator` module is placed inside a `always` block which handles the changes automatically because of its nature. This means the changes are made on every clock edge, and the module's behavior can be verified with a testbench.

Please note that this is a basic implementation of a comparator module, and actual design can vary depending on the specific requirements of the system. Also, note that this code does not include a testbench for the `JerkyComparator` module. You will need to create a separate testbench to verify the functionality of this module.

Here's how you would create a testbench:

```verilog
module JerkyComparator_tb;
reg ClockIn, PLLClock, Reset;
wire [1:0] AdjustFreq;

JerkyComparator uut(
   .AdjustFreq(AdjustFreq),
   .ClockIn(ClockIn),
   .PLLClock(PLLClock),
   .Reset(Reset)
);

always begin
    #5 ClockIn = ~ClockIn;
end

initial begin
    ClockIn = 1'b0;
    PLLClock = 1