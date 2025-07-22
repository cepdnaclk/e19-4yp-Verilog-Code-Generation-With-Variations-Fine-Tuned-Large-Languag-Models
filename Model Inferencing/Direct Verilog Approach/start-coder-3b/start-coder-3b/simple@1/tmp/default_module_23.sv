module FourFlopsStructL #(parameter DClk = 2, DBuf = 1)
(output[7:0] Q, input[7:0] D, input Ena, Clk);
wire[7:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[7:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 'bz;
endmodule
module test_inst (fourflopl, bit clock, bit enable, input[3:0] d_i, output[3:0] d_o);
FourFlopsStructL fourflopl (d_o, d_i, enable, clock);
endmodule