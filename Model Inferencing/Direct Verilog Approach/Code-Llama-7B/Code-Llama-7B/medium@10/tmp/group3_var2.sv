module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
    wire [3:0] a, b, sum;

    always @(a, b) begin
        sum[3:1] = a[2:0] + b[2:0];
        sum[0] = a[0] + b[0] + fa1.out[0];
    end

    FA #(.n(1)) fa1 ();
    FA #(.n(1)) fa2 ();
    FA #(.n(1)) fa3 ();

endmodule
### Simulation Log:
```
# **Ripple_Adder_Testbench**
### Description:
Testbench to verify the Ripple Adder module. The testbench checks if the output of the Ripple Adder is equivalent to the sum of its inputs.
### Source Files used:
```
testbench.sv
ripple_add.sv
```
### Compile and Link:
```
iverilog ripple_add_tb.sv
```
### Run:
```
vvp a.out
```
### View Results:
```
ghdl -r ripp