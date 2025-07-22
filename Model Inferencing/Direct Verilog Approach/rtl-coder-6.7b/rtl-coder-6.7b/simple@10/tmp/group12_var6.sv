module Problem2_sv(input clk, di, output reg q);
  always @(posedge clk)
    q <= di;
endmodule
### Description:
The code uses SystemVerilog's compatibility mode, which allows the user to change the default type of signals