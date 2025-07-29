module FourFlopsStructM #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 'bz;
endmodule
### Testbench Code:
module FourFlopsStructTest;
  timeunit 1ns;
  timeprecision 1ns;

  localparam ClkPeriod = 10;
  logic mClk, mEna, mD;
  logic [3:0] mQ;
  // instantiate the module
  FourFlopsStructL #(
   .DClk(2),
   .DBuf(1)
  ) dut (
   .Q(mQ),
   .D(mD),
   .Ena(mEna),
   .Clk(mClk)
  );

  initial begin
    mClk = 0;
  end

  initial begin
    mD = 1'b1;
  end

  initial begin
    mEna = 1'b1;
  end

  initial begin
    #10 mClk = 1'b1;
    #20;
    mEna = 1'b0;
    #10 mClk = 1'b0;
    #20;
    $finish;
  end

  always begin
    #ClkPeriod mClk = ~mClk;
  end

endmodule
### Original Error Message:
# ** Error: (vlog-13079) Verilog HDL Unstructured.v:8: syntax error near "parameter".
# ** Error: (vlog-13205) Verilog HDL Unstructured.v:16: design unit "FourFlopsStructL" is not synthesizable.