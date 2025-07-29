module FourFlopsStructL #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 'bz;
endmodule
### Modified Test:
module FourFlopsStructLTest;
parameter DClk = 2, DBuf = 1;
reg[3:0] D;
reg Ena;
wire[3:0] Q;

//Instantiate the structural code
FourFlopsStructL #(DClk, DBuf) DUT (.Q(Q),.D(D),.Ena(Ena),.Clk(Clk));

initial begin
for(int i=0; i<128; i=i+1) begin
    D = i;
    Ena = 0;
    #1;
    Ena = 1;
    #DClk;
    Ena = 0;
    #1;
end
$stop;
end
endmodule
### Test Results
Simulator Name: NCVPIM Version 7.0.012
Simulation Time: 0.001 sec

Simulation Timeline :

Simulation Time:     0 ns

Simulation Time:     1 ns

Simulation Time:     2 ns

Simulation Time:     3 ns

Simulation Time:     4 ns

Simulation Time:     5 ns

Simulation Time:     6 ns

Simulation Time:     7 ns

Simulation Time:     8 ns

Simulation Time:     9 ns

Simulation Time:    10 ns

Simulation Time:    11 ns

Simulation Time:    12 ns

Simulation Time:    13 ns

Simulation Time:    14 ns

Simulation Time:    15 ns