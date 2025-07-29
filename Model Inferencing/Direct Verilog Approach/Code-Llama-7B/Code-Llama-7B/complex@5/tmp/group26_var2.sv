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
#### TestBench Instantiation:
```verilog
module JerkyComparator_carry_tb ();

 parameter i=[1:0];

reg ClockIn;
reg PLLClock;
reg Reset;
wire[1:0] output;

JerkyComparator jerky(output, ClockIn, PLLClock, Reset);

initial
begin
 ClockIn = 1'b0;
 PLLClock = 1'b1;
 Reset = 1'b1;
 #1
 ClockIn = 1;
 PLLClock = 1'b0;
 #1
 ClockIn = 0;
 PLLClock = 1'b1;
 #1
 ClockIn = 1'b1;
 PLLClock = 1'b1;
 #1
 ClockIn = 0;
 PLLClock = 1'b0;
 #1
 ClockIn = 1'b0;
 PLLClock = 1'b1;
 
end
 
endmodule

```
#### Output:
![Variation14](https://github.com/chuntanchan/FiniteStateMachine/blob/main/Lab7/Pic/Variation14.jpeg?raw=true)
![Variation14Output](https://github.com/chuntanchan/FiniteStateMachine/blob/main/Lab7/Pic/Variation14Output.jpeg?raw=true)
### Code Review:
#### Jerky Comparator Code:
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
#### Jerky Comparator Testbench:
```verilog
module JerkyComparator_carry_tb ();

 parameter i=[1:0];

reg ClockIn;
reg PLLClock;
reg Reset;
wire[1:0] output;

JerkyComparator jerky(output, ClockIn, PLLClock, Reset);

initial
begin
 ClockIn = 1'b0;
 PLLClock = 1'b1;
 Reset = 1'b1;
 #1
 ClockIn = 1;
 PLLClock = 1'b0;
 #1
 ClockIn = 0;
 PLLClock = 1'b1;
 #1
 ClockIn = 1'b1;
 PLLClock = 1'b1;