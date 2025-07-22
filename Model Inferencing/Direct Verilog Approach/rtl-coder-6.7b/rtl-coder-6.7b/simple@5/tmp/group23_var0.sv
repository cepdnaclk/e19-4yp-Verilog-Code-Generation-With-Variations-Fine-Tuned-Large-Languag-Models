module FourFlopsStructL #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : byte'('bz);
endmodule
### Error Message:
File "FourFlopsStructL.v" line 22: Vector size must be a compile-time constant. Replaced with constant of 4.

### Error Location:
Error found at <FourFlopsStructL> on line 22:
	input[3:0] D