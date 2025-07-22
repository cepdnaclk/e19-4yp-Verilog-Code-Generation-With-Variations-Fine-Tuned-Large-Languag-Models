module FourFlopsStructL #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[9:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 'bz;
endmodule

## 3.3.10. The DFF Struct-L, with DClk = 2, D