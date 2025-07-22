module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
logic [1:0] const_array[3:0];
assign const_array = {2'b00, 2'b01, 2'b10, 2'b11};
always @(w0 or w1 or w2 or w3 or S)
    if (~w0 & (S == const_array[0]))
        f = w0;
    else if (~w1 & (S == const_array[1]))
        f = w1;
    else if (~w2 & (S == const_array[2]))
        f = w2;
    else if (~w3 & (S == const_array[3]))
        f = w3;
endmodule
### Testbench:
module testbench;
reg w0, w1, w2, w3;
reg [1:0] S;
wire f;
mux4to1 dut(w0, w1, w2, w3, S, f);
integer i, j;
initial begin
    for (i = 0; i < 2; i++) begin
        w0 = 1'b1;
        w1 = 1'b0;
        w2 = 1'b0;
        w3 = 1'b0;
        S = i;
        #1 us;
    end
    for (i = 0; i < 2; i++) begin
        w0 = 1'b0;
        w1 = 1'b1;
        w2 = 1'b0;
        w3 = 1'b0;
        S = i;
        #1 us;
    end
    for (i = 0; i < 2; i++) begin
        w0 = 1'b0;
        w1 = 1'b0;
        w2 = 1'b1;
        w3 = 1'b0;
        S = i;
        #1 us;
    end
    for (i = 0; i < 2; i++) begin
        w0 = 1'b0;
        w1 = 1'b0;
        w2 = 1'b0;
        w3 = 1'b1;
        S = i;
        #1 us;
    end
end
endmodule
### Notes:
- This approach may not be applicable to some cases. For example, if the inputs are of different widths.
- This approach has been tested on Vivado 2021.1. In this case, a warning message is generated because the multiplexer's sensitivity list is empty.
- The `const_array` constant-packed array is declared at module-scope to avoid the use of `replicate`.
### References:
- [Vivado User Guide - Lattice Edition - 2021.1 - 2021.1 - 2021.1](https://www.xilinx.com/support/documentation/sw_manuals/vivado/2021_1/ug907-vivado-logic-synthesis.pdf#page=220)
- [Verilog Tutorials - Using the `inside` operator in Verilog](https://www.verilogtutor.com/verilog/verilog-tutorial-using-the-inside-operator-in-verilog/)
- [Verilog Tutorials - Multiplexers](https://www.verilogtutor.com/verilog/verilog-tutorial-multiplexers/)