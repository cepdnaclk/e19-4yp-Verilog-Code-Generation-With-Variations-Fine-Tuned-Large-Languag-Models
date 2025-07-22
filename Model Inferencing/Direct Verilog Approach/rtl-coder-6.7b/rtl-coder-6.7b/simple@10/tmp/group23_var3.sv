module FourFlopsByteIn #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 4'bz;
endmodule
### Compatibility Report:
Testing the base vector input type of logic (original)...
Testing the base vector input type of byte (modified)...
ERROR: Test failed - expected: 0, actual: 1