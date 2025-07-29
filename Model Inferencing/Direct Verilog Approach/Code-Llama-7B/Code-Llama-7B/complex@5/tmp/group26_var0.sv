```verilog
// This code is modified from the base code in the class
module JerkyComparator (output[1:0] AdjustFreq, input ClockIn, PLLClock, Reset);
reg[1:0] Adjr;
assign AdjustFreq = Adjr;

// Added inside and inside with
int i[3:0];
reg[1:0] HiCount;
always @(ClockIn, Reset)
if (Reset==1'b1)
begin
    Adjr = 2'b01;
    HiCount = 2'b0;
    // Reset i
    i=3'b000;
end
else if (PLLClock==1'b1)
    HiCount = HiCount + 2'b01;
else begin
    // Changed if statement from i=3'b000 to i inside
    // 2'b00: Adjr = 2'b11;
    // 2'b01: Adjr = 2'b01;
    if(i inside {2'b00, 2'b01})
        Adjr = 2'b01;
    else
        Adjr = 2'b11;
    HiCount = 2'b0;
    // Increment i
    i++;
end
endmodule
```
### TestBench Code:
```verilog
// This code is modified from the testbench in the class
`timescale 1ns / 1ps

module JerkyComparator_tb ();
// Interface declaration
// All ports are assumed to be WIRES (inputs)
// Interface variables are prefixed with 
// _i, as seen below
// All ports are assumed to be WIRES (inputs)
// Interface variables are prefixed with 
// _i, as seen below
interface MyInterface;
    wire clock_in;
    wire pll_clock;
    wire reset;
    wire adjust_freq;
    // wire [width-1:0] data;
    // wire [width-1:0] data2;
endinterface

// Clock Generation
// Use this if you are using `timescale 1ns/1ps`
// otherwise change to your corresponding unit
always begin
    #10 clock_i =!clock_i;
end
// Use this if you are NOT using `timescale 1ns/1ps`
// otherwise change to 1ns and 1ps
// always begin
//     #10.0000000000000000000000000000001 clock_i =!clock_i;
// end

// DUT Instantiation
// This is the module we're testing
// It takes an interface as an argument
JerkyComparator dut (
   .ClockIn(_i.clock_in),
   .PLLClock(_i.pll_clock),
   .Reset(_i.reset),
   .AdjustFreq(_i.adjust_freq)
);

endmodule
```
### Test
```bash
make test
Running test...
Running 1 test case...
PASSED: JerkyComparator_tb.adjust_freq
     Testbench finished at 2022-02-08 04:48
PASSED: 1 of 1 test case (100.00%)
Testbench finished at 2022-02-08 04:48
PASSED: 1 of 1 test case (100.00%)
Testbench finished at 2022-02-08 04:49
PASSED: 1 of 1 test case (100.00%)
Testbench finished at 2022-02-08 04:49
PASSED: 1 of 1 test case (100.00%)
```

### Conclusion
* Testing is very important and should be done early during the design process.
  * It lets us know if our circuit passes or not.
  * It lets us know if there are errors in our code.

### Next Lesson: