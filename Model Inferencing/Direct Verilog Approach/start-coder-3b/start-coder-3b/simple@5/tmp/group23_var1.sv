module FourFlopsStructL #(parameter DClk = 2, DBuf = 1)
(output[7:0] Q, input[7:0] D, input[6:0] Ena, Clk);
wire[7:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[7:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = ((Ena==3'b111)||(Ena==3'b110))? QWire : ((Ena==3'b11)||(Ena==3'b10))?