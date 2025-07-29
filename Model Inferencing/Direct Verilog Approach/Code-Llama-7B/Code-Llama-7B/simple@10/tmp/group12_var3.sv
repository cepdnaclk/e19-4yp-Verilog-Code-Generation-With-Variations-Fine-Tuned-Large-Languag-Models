module Problem3(input [3:0] a, b, output [3:0] sum);
  logic di, clk;
  logic [3:0] sum, di;
  always @(posedge clk) begin
    $display(sum);
    di = sum;
  end
  assign sum = a + b;
endmodule

### Base Verilog Code:
module Problem4(input [3:0] a, b, output [3:0] sum);
  always @(posedge clk) begin
    $display(sum);
    di = sum;
  end
  assign sum = a + b;
endmodule
### Variation Instruction:
Change the reg declarations for di and clk to logic to