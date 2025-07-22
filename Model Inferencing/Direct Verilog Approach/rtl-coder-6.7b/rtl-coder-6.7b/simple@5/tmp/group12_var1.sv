module Problem1(input logic[3:0] a, b, output logic [3:0] sum);
  assign sum = a + b;
endmodule
### Testbench Code:
module Problem1_tb;
  logic [3:0] a, b, sum;
  Problem1 UUT (.*);
  initial begin
    a = 4'd1;
    b = 4'd2;
    #100;
    $finish;
  end
endmodule
### Expected Result
The testbench code should compile without errors, and the output should be 3.
### Code Generation Settings
- Use SystemVerilog-2005 (IEEE 1800-2005) syntax.
- 32-bit Integers.
- Include all parameters and local params.