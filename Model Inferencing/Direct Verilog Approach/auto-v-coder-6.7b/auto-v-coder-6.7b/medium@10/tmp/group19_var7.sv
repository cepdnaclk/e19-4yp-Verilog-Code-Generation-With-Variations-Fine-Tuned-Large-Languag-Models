```verilog
module counter_test (
    input wire clk, rst,
    output wire [3:0] count
);

reg [3:0] count_reg;
wire [3:0] count_wire;

always @(posedge clk or posedge rst) begin
    if (rst) count_reg <= 4'b0000;
    else count_reg <= count_reg + 1;
end

assign count = count_wire;

initial begin
    count_wire = count_reg;
end

endmodule
```
This module will behave the same as the original counter module, except the output is not combinational, but now it's an array slice of the internal register, which means you can test it in the same way. The `initial` block is used to force a value of the output wire, which can then be tested using a Verilog testbench. This is mostly useful for simulation and verifying the functionality of a design without actually needing the hardware to be clocked and reset. Please note that this is not a typical usage of the `initial` block in Verilog, but can be used here for testing purposes.