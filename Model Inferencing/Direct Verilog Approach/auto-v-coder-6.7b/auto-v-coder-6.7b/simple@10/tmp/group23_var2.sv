```verilog
module FourFlopsStructL #(parameter DClk = 10, DBuf = 1)
(output[3:0] Q, input[3:0] D, input byte Ena, input Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D