module Problem3(input [3:0] a, b, output [3:0] sum);
  wire [3:0] out;
  dff d0 (.d(out[0]),.clk(clk),.q(sum[0]));
  dff d1 (.d(out[1]),.clk(clk),.q(sum[1]));
  dff d2 (.d(out[2]),.clk(clk),.q(sum[2]));
  dff d3 (.d(out[3]),.clk(clk),.q(sum[3]));
  always @* begin
    out = a + b;
  end
endmodule

### Base Verilog Code:
module Problem4(input [3:0] a, b, output [3:0] sum);
  assign sum = a + b;
endmodule
### Variation Instruction:
Replace the "assign" statements with always blocks and instantiate a "dff" module, replacing the "d" and "q" ports