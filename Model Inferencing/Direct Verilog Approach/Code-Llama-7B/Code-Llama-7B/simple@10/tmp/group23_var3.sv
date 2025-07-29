module FourFlopsStructM #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 'bz;
endmodule
### Modified TestBench:
module FourFlopsStructM_tb();
reg[3:0] D;
reg Ena;
reg Clk;
wire[3:0] Q;
FourFlopsStructM #(DClk = 2, DBuf = 1) DUT(.Q(Q),.D(D),.Ena(Ena),.Clk(Clk));
initial begin
$dumpfile("FourFlopsStructM.vcd");
$dumpvars(0, DUT);
end
initial clk=1'b1;
always clk=#5 ~clk;
initial begin
D=4'b0000;
#5;
Ena=1'b1;
#5
D=4'b0001;
#5
D=4'b0010;
#5
D=4'b0011;
#5
D=4'b0100;
#5
D=4'b0101;
#5
D=4'b0110;
#5
D=4'b0111;
#5
D=4'b1000;
#5
D=4'b1001;
#5
D=4'b1010;
#5
D=4'b1011;
#5
D=4'b1100;
#5
D=4'b1101;
#5
D=4'b1110;
#5
D=4'b1111;