module Problem2(input [3:0] a, b, output [3:0] sum);
  reg di, clk;
  always_ff @ (posedge clk) begin
    sum <= a + b;
  end
endmodule
### Testbench Code:
module Problem2_tb();
  reg [3:0] a;
  reg [3:0] b;
  wire [3:0] sum;
  Problem2 p2 (.a(a),.b(b),.sum(sum));
  initial begin
    a = 3'b111;
    b = 3'b101;
    clk = 1;
    #10;
    $display("%b + %b = %b", a, b, sum);
  end
endmodule
### Testbench Execution:
-> 111 + 101 = 110

### Base Verilog Code: