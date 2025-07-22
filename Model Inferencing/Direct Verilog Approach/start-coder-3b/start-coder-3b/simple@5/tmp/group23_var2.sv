module FourFlopsStructL #(parameter DClk = 2, parameter DBuf = 2)
(output[7:0] Q, input[8:0] D, input Ena, Clk);
localparam DTot = DBuf + DClk;
DFF DReg[7:0] (.Q(D[DTot-1]),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? D[DTot-1] : 'bz;
endmodule

#### Result:

As can be