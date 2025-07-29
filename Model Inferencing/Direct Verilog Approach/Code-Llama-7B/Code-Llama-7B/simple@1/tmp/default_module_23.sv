module FourFlopsStructL #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 'bz;
endmodule
### Original Testbench:
module FourFlopsStructL_tester;
initial begin
$dumpfile("FourFlopsStructL_tester.vcd");
$dumpvars(0, FourFlopsStructL_tester);
end
reg Clk;
reg Ena;
reg[3:0] D;
wire[3:0] Q;
reg[2:0] DClk = 2'b10;
reg[2:0] DBuf = 2'b01;
DFF DReg[3:0] (.Q(),.D(D),.Clk(Clk));
FourFlopsStructL #(DClk, DBuf) FloatFlop(.Q(Q),.D(D),.Ena(Ena),.Clk(Clk));
integer i;
initial begin
Clk = 1;
forever #10 Clk =!Clk;
end
initial begin
$monitor("Input: %b  Q: %b", D, Q);
$monitor("Ena: %b  DClk: %0d  DBuf: %0d", Ena, DClk, DBuf);
end
initial begin
#10 Ena = 1'b0;
#10 Ena = 1'b1;
#10 D = 4'hf;
#10 Ena = 1'b0;
#10 Ena = 1'b1;
#10 D = 4'hf;
#10 Ena = 1'b0;
#10 Ena = 1'b