module FourFlopsStructL #(parameter DClk = 2, DBuf = 1, parameter Rst = 0)
(output[3:0] Q, input[3:0] D, input Ena, Clk, input Rst);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk),.Rst(Rst));
assign #DTot Q = (Ena==1'b1