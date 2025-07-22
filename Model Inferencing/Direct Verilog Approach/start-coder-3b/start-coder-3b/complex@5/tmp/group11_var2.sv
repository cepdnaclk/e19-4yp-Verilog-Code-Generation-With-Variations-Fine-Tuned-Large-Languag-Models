module ttst_ttrimux2_1();
// Assuming this tests a tristate 2-to-1 mux called ttrimux2_1
module ttrimux2_1(out, e, i, s);
reg s_i0, s_i1;
reg [0:0] s_if;
reg [1:0] i0, i1;
assign s_if = s; assign s_i0 = s_if[0]; assign s_i1 = s_if[1];
always @(*)
begin
case (s_if)
1'b0:
i0 = 2'b00;
i1 = 2'b00;
2'b00: i0 = 2'b00; i1 = 2'b01;
2'b01: i0 = 2'b00; i1 = 2'b10;
2'b10: i0 = 2'b00; i1 = 2'b11;
2'b11: i0 = 2'b01; i1 = 2'b10;
endcase
end
assign out = i0? (!e) : (i1? (!e) : i);
endmodule
endmodule
generate
assign s_i1 = inside(s,i);
endgenerate
endmodule

As you can see, the generate block was moved outside the `tttrimux2_1` module and into the testbench.  This was the only change that had to be done in the `ttst_ttrimux2_1` module.

### Proposed Solution:
The problem is with the assignment `assign s_i1 = inside(s,i);`.  The function `inside` takes two parameters, `s` and `i`.  The `s` parameter is a bit more difficult to explain because it is a 2-bit value, and I don't think that's the way it is used.  It also looks like `inside` does not take a reference to `s` but rather, the value of `s`.  This is a bug with the Verilog code.  The `inside` function should be changed so that it can be called as either `inside(s,i)` or `inside(i)`, with the `s` parameter omitted.  This should be done in the original Verilog code as well.---
title: "Why is my Verilator simulation wrong?"
categories:
  - Verilog
  - Programming
tags:
  - Verilog
  - Programming
  - Verilator
  - Testbench
  - Simulation
  - Synthesis
last_modified_at: 2022-08-03
toc: true
toc_sticky: true
---

The simulator Verilator is very useful for testing Verilog code.  But it's not always accurate.  Sometimes the simulator will say something is wrong, and other times it says nothing is wrong.  In this post I'll explain why the simulation fails.  This only applies to the simulator Verilator, and not to actual hardware.  If your simulation is wrong, it's because the verilog code is wrong.  But if it's wrong, that doesn't make the simulator wrong or misguided.  If the simulator says nothing is wrong, that just means the simulated circuit matches the behavior of the real circuit.

I'll explain why the simulator is wrong in several parts, each in part 1, 2, and 3.  In part 1 I'll describe a problem where the simulator says nothing is wrong.  In part 2 I'll describe a problem where the simulator says something is wrong.  In part 3 I'll describe a problem where the simulator says nothing is wrong.

## Part 1 - The simulator says nothing is wrong!

In this case the simulator is reporting nothing wrong.  It's possible that the simulator is not working correctly, but it's not possible to tell where the bug is without more information.  I'll explain how to get more information in a later post.  For now let's look at the problem, which is from an example in a book.  I'm going to give the verilog code first, and then explain it, and I'll give the simulation code later.

### Verilog Code
Here is the verilog code that is wrong.  It's an example from [Verilog HDL Design: A Practical Approach to Embedded Systems](https://www.springer.com/gp/book/9781461431299) by, and.

```verilog
module u216(clk, rst, d, q);
        input clk, rst;
        inout d;
        output q;

        reg q2;
        reg q3;
        reg [2:0] q4;

        always @(posedge clk)
                begin
                        if (!rst)
                                begin
                                        q2 <= 0;
                                        q3 <= 0;
                                        q4 <= 0;
                                end

                        else
                                begin
                                        q2 <= ~d;
                                        q3 <= q2;
                                        q4 <= q3;
                                end
                end

        assign q = q4;

endmodule
```

The following is a testbench that instantiates `u216`, connects it to the logic analyzer, and reads the output signal.

```verilog
module tb;

`timescale 1ps/1ps

integer i;
reg clk;
reg rst;
reg d;
wire q;

initial begin
clk = 0;
rst = 0;

`u216 u216_inst(.clk(clk),.rst(rst),.d(d),.q(q));

#10
end

initial begin
for (i=0;i<100;i=i+1) begin
#5 clk = ~clk;
#10 rst = ~rst;
#10 d = ~d;
$display(clk, rst, d, q, #10);
end
$finish;
end

endmodule
```

This testbench instantiates `u216` with four inputs,