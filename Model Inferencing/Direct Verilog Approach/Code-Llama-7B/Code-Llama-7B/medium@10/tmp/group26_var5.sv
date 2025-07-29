module example5(x1, x2, x3, f);
input x1, x2, x3;
output f;
reg f;
reg [1:0] a;
always @(x1 or x2 or x3)
    if (x2 == 1)
        a = x1;
    else
        a = x3;
    if (a[0] == 0 && a[1] == 0)
        f = 1;
    else
        f = 0
endmodule
### Testing Variation:
This variation is an extension of example 4, in which an if block is added to test whether part-select of a packed array is inside a fixed constant range.
In the following test, the part-select is always inside a fixed range:
1. run verilog-lint --module example5
2. if reported, run verilog-lint --module example5 --fix
3. run verilog-lint --module example5
### Expected Output:
1. verilog-lint reported:
```
    example5.v:6:12: (style) Replace 'if (x2 == 1)' with 'if (x2)'.
    example5.v:6:12: (style) Replace 'else' with 'else if (x2 == 0)'.
```
2. verilog-lint fixed:
```
    module example5(x1, x2, x3, f);
    input x1, x2, x3;
    output f;
    reg f;
    reg [1:0] a;
    always @(x1 or x2 or x3)
        if (x2)
            a = x1;
        else if (x2 == 0)
            a = x3;
        if (a[0] == 0 && a[1] == 0)
            f = 1;
        else
            f = 0
    endmodule
```
3. verilog-lint reported:
```
    example5.v:10:12: (style) Replace 'if (a[0] == 0 && a[1] == 0)' with 'assign f = a[0] == 0 && a[1] == 0'.
```
### Test Benches
1. Include file that defines a function:
```
`ifdef EXAMPLE5_TB
`include "example5_tb.vh"
`endif
```
2. Test bench that includes the file:
```
`ifdef EXAMPLE5_TB
`include "example5_tb.v"
`endif
```
### File `example5_tb.v`:
```
`ifdef EXAMPLE5_TB
`include "example5_mod.v"

module example5_tb ();
reg x1, x2, x3;
wire f;

example5 example5_i(x1, x2, x3, f);

initial
    begin
        // Test case 1:
        x1 = 0;
        x2 = 1;
        x3 = 0;
        #1
        assert (f == 0)
            else $error("Test case 1 failed!");
        
        // Test case 2:
        x1 = 0;
        x2 = 0;
        x3 = 1;
        #1
        assert (f == 1)
            else $error("Test case 2 failed!");
        
        $finish;
    end
endmodule
`endif
```
### File `example5_tb.vh`:
```
`ifdef EXAMPLE5_TB
`timescale 1ns / 1ps
`endif

`ifdef EX