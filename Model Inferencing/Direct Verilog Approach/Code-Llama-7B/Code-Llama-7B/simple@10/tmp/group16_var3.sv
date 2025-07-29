module orfr_tst; // Testbench for OR gate with force/release
  reg [1:0] b,c,d; wire [1:0] a;
  initial begin b=2'b0; c=2'b0; #20 $stop; end // Initialize inputs
  always #3 c = ~c; // Toggle input 'c' every 3 time units
  or_fr_rl dd(a,b,c); // Instantiate the module containing force/release
endmodule
```

![](./images/9.png)
![](./images/10.png)
![](./images/11.png)

## **Q1.**
In the following code, the `assign` keywords are commented out. What are the differences between the latch-like functionality of the `always` block and the `assign` statement?

```verilog
module assign_block(in1, in2, out);
    input in1, in2;
    output out;
    assign out = in1 | in2;
    always @* begin out = in1 | in2; end
endmodule
```

## **A1.**
The `assign` statement is latch-like and has the same functional behavior as the `always` block. The `assign` statement does not have any delays because of the lack of combinational logic. `always @*` is a synchronous block that is similar to `always @(in1 or in2)`, but has a much longer combinational delay.

## **Q2.**
Using the following code, write a testbench to test the function of the `assign` statement and the `always @*` block.

```verilog
module assign_block(in1, in2, out);
    input in1, in2;
    output out;
    assign out = in1 | in2;
    always @* begin out = in1 | in2; end
endmodule
```

## **A2.**
```verilog
module tb_or_fr();
    logic [1:0] in1, in2, out;
    assign_block ib(.in1(in1),.in2(in2),.out(out));