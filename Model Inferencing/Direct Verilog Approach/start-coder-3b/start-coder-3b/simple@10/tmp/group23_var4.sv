module DFFStructL_Byte2Logic_ByteSel #(parameter DBits = 2)(
input Clk, input byte D, input byte[1:0] S,
output byte Q);
wire QWire;
localparam DTot = 1;
DFF DReg (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = QWire;
endmodule
### Analysis:
All passes.

## DFFStructL_Byte2Logic_ByteSel_