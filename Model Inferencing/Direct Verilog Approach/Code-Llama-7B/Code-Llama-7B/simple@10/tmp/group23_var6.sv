module FourFlopsStructL #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 'bz;
endmodule
### Simulation Logic:
`timescale 1ns/1ns

module FourFlopsStructLTestbench();
reg D [3:0] = 'b0;
reg Ena;
reg Clk;
wire [3:0] Q;

FourFlopsStructL #(8, 1) flops (.Q(Q),.D(D),.Ena(Ena),.Clk(Clk));

always #5 Clk =!Clk;
initial
begin
    Ena = 'b1;
    D = 'b0;
    #10;
    D = 'b1;
    #20;
    D = 'b0;
    #20;
    D = 'b1;
    #10;
    D = 'b0;
    #20;
    D = 'b1;
    #20;
    D = 'b0;
    #20;
    D = 'b1;
    #20;
    D = 'b0;
    #20;
    D = 'b1;
    #10;
    D = 'b0;
    #20;
    D = 'b1;
    #20;
    D = 'b0;
    #20;
    D = 'b1;
    #30;
    D = 'b0;
    #20;
    D = 'b1;
    #20;
    D = 'b0;
    #20;
    D = 'b1;
    #20;