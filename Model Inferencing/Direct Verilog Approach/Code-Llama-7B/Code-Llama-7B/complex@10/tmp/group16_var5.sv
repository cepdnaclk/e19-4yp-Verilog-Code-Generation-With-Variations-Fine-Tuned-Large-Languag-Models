module TOP1(input CLK, input RST_X);

  parameter [8*3:0] BASE_ARRAY = {
    32'h0000_0000,
    32'hFFFF_FFF0,
  };

  reg [31:0] x;
  reg [31:0] y;

  always @(posedge CLK) begin
    if (RST_X) begin
      y <= 32'b0;
      x <= 32'b0;
    end else begin
      x <= x + 1;
      if (x inside {BASE_ARRAY}) begin
        y <= x;
      end
    end
  end
endmodule
### Testbench Code:
`timescale 1ns / 1ns

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