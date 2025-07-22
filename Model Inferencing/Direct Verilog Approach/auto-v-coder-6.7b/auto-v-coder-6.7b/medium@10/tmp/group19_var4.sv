```
module counter (
    input wire clk, rst,
    output wire [3:0] count
);

reg [3:0] count;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 4'b0000;
    end
    else begin
        count <= count + 1;
    end
end

assign count = count;

endmodule
```

The above code is a simple counter module in Verilog with a reset signal. The `assign count = count` line is only used to demonstrate how to make a variable available as an output. This line can be removed if not needed. The main purpose is the counter functionality itself.

Note: The `assign` statement is used to assign a value to a net, register, or variable, and it should be used sparingly. It's generally better to use blocking assignments (`=`) or nonblocking assignments (`<=`) for most assignments in Verilog. This variation is purely illustrative and to show how you can assign the same value to an output wire. It doesn't do anything differently than `count = count;`. If the synthesis tool issues a warning about the `assign` statement, it's a good idea to remove it. The synthesis tool will typically optimize the design using the `<=` operator and the `assign` statement may be unnecessary.