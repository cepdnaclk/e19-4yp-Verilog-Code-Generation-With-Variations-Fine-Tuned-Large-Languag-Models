```verilog
module tb_TOP1;
  reg CLK, RST_X;
  TOP1 uut(.CLK(CLK),.RST_X(RST_X));

  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
  end

  initial begin
    RST_X = 0; #10;
    RST_X = 1;
  end
endmodule
module TOP1 (
        input CLK,
        input RST_X,
        output reg CARRY,
        output reg [0:0] R1,
        output reg [0:0] R2