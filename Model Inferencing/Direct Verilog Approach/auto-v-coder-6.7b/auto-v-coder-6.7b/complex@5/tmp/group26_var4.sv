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

This `verilog` code is a simple comparator. It starts with the frequency adjustment variable set to 01, and it increases the `HiCount` when a positive edge is detected on the `PLLClock` input. Then, when `HiCount` reaches 00 or 01, the adjustment frequency changes to 00, 11, or 01 respectively. When the `Reset` input goes to 1, the adjustment frequency is set to 01, and `HiCount` is reset to 0. This code checks if the `PLLClock` input is positive and the `Reset` input is low, and if so, it counts and adjusts the frequency accordingly.

You can use this `verilog` block in your testbench code like this:

```verilog
reg reset;
reg[1:0] adjust_freq;
reg pll_clock;

initial begin
    reset = 1'b1;
    pll_clock = 1'b0;
    #50;  //wait for 50 cycles
    reset = 1'b0;
    for (int i = 0; i < 5; i++) begin
        pll_clock = 1'b1;
        #50;