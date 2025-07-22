module FourFlopsStructL #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[7:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 'bz;
endmodule
### Test Results:
Test Name: DFF4_D1_CLK1
Test Type: Structural
Test Purpose: Test DFF4_D1_CLK1.
Test Description:
A model DFF4_D1_CLK1 is modified to use a parameterized model DFF. DFF4_D1_CLK1 is tested with a 4-bit input vector.
Test Inputs:
Ena=1, D='1, Clk='0
Expected Results:
Q='bzzzz (Z)
Tested Nodes:
DFF4_D1_CLK1
### Test Details:
Test Name: DFF4_D1_CLK1
Test Type: Structural
Test Purpose: Test DFF4_D1_CLK1.
Test Description:
A model DFF4_D1_CLK1 is modified to use a parameterized model DFF. DFF4_D1_CLk1 is tested with a 4-bit input vector.
Test Inputs:
Ena=1, D='1, Clk='0
Tested Nodes:
DFF4_D1_CLK1
Test Report: PASS