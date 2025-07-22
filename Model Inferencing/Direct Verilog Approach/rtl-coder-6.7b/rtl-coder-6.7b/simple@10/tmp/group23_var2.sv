module FourFlopsStructL #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 4'bz;
endmodule
### Expected Result:

### Generated Testbench:
module FourFlopsStructL_testbench();
parameter DClk = 2, DBuf = 1;
localparam DTot = DBuf + DClk;
reg [3:0] D;
wire [3:0] Q;
reg Ena, Clk;
FourFlopsStructL #(DClk, DBuf) dut(.Q(Q),.D(D),.Ena(Ena),.Clk(Clk));
integer i;
initial
begin
Clk = 1;
Ena = 0;
D = 4'b0;
$monitor("%t %b %b %b %b", $time, Ena, D, Q, Clk);
$dumpfile("FourFlopsStructL_testbench.vcd");
$dumpvars(0, FourFlopsStructL_testbench);
//test 1
Ena = 1;
D = 4'b1010;
#(DClk/2);
D = 4'b1010;
#(DTot/4);
D = 4'b1010;
#(DClk/2);
#(DClk/2);
D = 4'b1010;
#(DTot/4);
D = 4'b1010;
#(DClk/2);
#(DClk/2);
D = 4'b1010;
#(DTot/4);
D = 4'b1010;
#(DClk/2);
#(DClk/2);
#(DCl