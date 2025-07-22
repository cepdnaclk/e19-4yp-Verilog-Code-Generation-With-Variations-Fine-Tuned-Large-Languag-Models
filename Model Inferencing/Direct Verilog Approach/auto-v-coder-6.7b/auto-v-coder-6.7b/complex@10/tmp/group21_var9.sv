```verilog
module D_Latch (dout, di, clk, rst_n);
    output [3:0] dout;
    input [3:0] di;
    input clk, rst_n;
    reg [3:0] dout;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) dout <= 4'b0;
        else dout <= di;
    end
endmodule
```
This is a simple 4-bit D-latch with asynchronous reset. It is defined as an array of 4 bits where each bit is either a `1` or `0`. When the reset is `0`, the `dout` is zeroed out. But when the reset is `1`, its value will always equal the value of `di`.

The `posedge clk` or `negedge rst_n` syntax is used to create a positive or negative edge condition. This means that the code will execute whenever the clock edge is positive (`posedge`) or clock edge is negative (`negedge`).

In this design, the latch logic is implemented in the always block. This block is a part of the Verilog code that describes the behavior of the module. The `if` statement checks if the reset is low (`0`). If so, it sets `dout` to `0`. Otherwise, it copies the data input (`di`) into `dout`. This is done every positive clock edge (`posedge clk`). Note that the reset is an active low signal. This means that the reset is `1` when the system should operate normally and `0` when the system should reset.

The behavior of the design can be verified by creating a testbench and checking the output of the D-latch against the input. If the input is the same as the output, that means the D-latch is working correctly. The testbench will be created with a sequence of input values and checking the output value against the input value. 

The D-latch is a basic component in digital logic design and is used to delay the input data by one cycle. It is also used to implement registers or memories in digital systems.

The code is provided