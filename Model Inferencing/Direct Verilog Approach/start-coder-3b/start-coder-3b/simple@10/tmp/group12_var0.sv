module Problem11(input [3:0] a, b, output [3:0] sum);
  logic [3:0] di;
  logic clk;
  initial begin
    di = 'b0;
  end
  always @(posedge clk) begin
    di <= ~di;
  end
  assign sum = a + b + ~di;
endmodule
### Result:
<img src="Images/Problem11.png" alt="Problem 11"width="200"/>

#### Problem 12
### Base Verilog Code:
module Problem12(input [3:0] a, b, output [3:0] sum);
  assign sum = a + b;
endmodule
### Variation Instruction:
Change the reg declarations for di and clk to logic to