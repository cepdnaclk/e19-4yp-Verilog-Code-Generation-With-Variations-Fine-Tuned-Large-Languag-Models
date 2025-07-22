module FourFlopsStructL #(parameter DClk = 2, DBuf = 1)
(output logic[1:0] Q, input logic[3:0] D, input logic Ena, Clk);
wire[1:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[1:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 'bz;
endmodule
### Result:
![FourFlopsStructL_8V_1H_result.PNG](https://github.com/joshua19881010/CSE225_Project/blob/master/Results/FourFlopsStructL_8V_1H_result.PNG)

### Base Verilog Code:
module FourFlopsStructL #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DT