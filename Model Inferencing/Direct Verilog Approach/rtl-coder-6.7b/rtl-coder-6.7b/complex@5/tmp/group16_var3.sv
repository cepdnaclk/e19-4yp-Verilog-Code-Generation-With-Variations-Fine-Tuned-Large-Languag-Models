module comparator(
  input logic[31:0] in_x, in_comp,
  output logic out_equal
);
  import compare_pkg::*;
  always_comb begin
    if (in_x inside {COMP}) begin
      out_equal = 1;
    end
    else begin
      out_equal = 0;
    end
  end
endmodule
### Testbench:
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