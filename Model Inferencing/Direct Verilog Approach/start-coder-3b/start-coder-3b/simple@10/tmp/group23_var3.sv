module FourFlopsStructL #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 'bz;
endmodule
### Generated Behavioral Verilog:
module FourFlopsStructL(output[3:0] Q, input[3:0] D, input Ena, Clk);
reg [1:0] clk_reg[0];
reg [1:0] dreg[0];
initial clk_reg[0] := 0;
initial dreg[0] := 0;
always @(posedge Clk)
begin
clk_reg[0] <= Clk;
end
always @(posedge Clk)
begin
dreg[0] <= D;
end
assign Q = (Ena==1'b1)? dreg[0] : 1'bz;
endmodule
### Generated RTLIL:
module FourFlopsStructL(output[3:0] Q, input[3:0] D, input Ena, Clk);
reg clk_reg[0];
reg dreg[0];
clk_reg = 0;
dreg = 0;
Q = (Ena == 1'b1)? {dreg[2], dreg[1], dreg[0], dreg[1]} : 4'hff;
if (Clk) begin
clk_reg <= Clk;
end
if (Clk) begin
dreg <= D;
end
endmodule
### Generated SMT-LIBv2:
(module FourFlopsStructL
(output Q
(input D Ena Clk)
(declare-fun Q () bv3)
(declare-fun D () bv3)
(declare-fun Ena () Bool)
(declare-fun Clk () Bool)
(declare-fun clk_reg () (Array Int Bool) )
(declare-fun dreg () (Array Int Bool) )
(declare-fun #DTot () Int)
)
(assert (and
(and (bvult #DTot 4)
(= #DTot 2))
(= #DTot 1))
(assert (not (= #DTot 0)))
(assert (not (= #DTot 0)))
(assert (= Q
(ite (and
(= Ena 1)
(ite (bvult #DTot 4)
(ite (bvult #DTot 2)
(ite (bvult #DTot 1)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)
(ite (bvult #DTot 0)