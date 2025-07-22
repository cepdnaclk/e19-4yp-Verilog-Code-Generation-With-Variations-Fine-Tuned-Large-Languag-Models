module FiveFlopsStructL #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[7:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 'bz;
endmodule

# Final Report

## FiveFlopStructR.v

### Base Verilog Code:
module FiveFlopsStructR #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.