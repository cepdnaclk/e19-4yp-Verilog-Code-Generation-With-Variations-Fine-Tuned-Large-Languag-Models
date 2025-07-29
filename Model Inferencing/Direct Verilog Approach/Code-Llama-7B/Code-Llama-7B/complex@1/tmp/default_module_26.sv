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


## Testbench:
### Base Testbench:
module JerkyComparator_testbench;
reg ClockIn;
reg PLLClock;
reg Reset;
wire[1:0] AdjustFreq;
JerkyComparator dut (.*);
always begin
	ClockIn = 0;
	PLLClock = 0;
	Reset = 0;
	#20
	Reset = 1;
	#20
	Reset = 0;
end
endmodule
### Variation Testbench:
Use `inside` on `i` and compare with variable array range declared in testbench scope inside the carry testbench.
### Modified Testbench:
module JerkyComparator_testbench;
reg ClockIn;
reg PLLClock;
reg Reset;
wire[1:0] AdjustFreq;
wire[1:0] AdjustFreq_hi = 2'b11;
wire[1:0] AdjustFreq_mi = 2'b01;
wire[1:0] AdjustFreq_lo = 2'b00;
JerkyComparator dut (.*);
always begin