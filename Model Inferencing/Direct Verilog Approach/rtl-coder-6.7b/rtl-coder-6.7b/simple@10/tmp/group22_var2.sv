### Base Testbench Code:
module top;
par dut1 (.in ({ x1, x2, x3, x4 }),.parity (parity1),.all_ones (all_ones1) );
endmodule
### Testbench Code:
### Reference Output:
Verilog output:
parity1 = 0
all_ones1 = 0

// Code to generate the test vectors
initial begin
  $display("Verilog output:");
  x1 = 'd0;
  x2 = 'd0;
  x3 = 'd0;
  x4 = 'd0;
  ##1;
  $display("parity1 = %0d", parity1);
  $display("all_ones1 = %0d", all_ones1);
  x1 = 'd1;
  x2 = 'd0;
  x3 = 'd0;
  x4 = 'd0;
  ##1;
  $display("parity1 = %0d", parity1);
  $display("all_ones1 = %0d", all_ones1);
  x1 = 'd1;
  x2 = 'd1;
  x3 = 'd0;
  x4 = 'd0;
  ##1;
  $display("parity1 = %0d", parity1);
  $display("all_ones1 = %0d", all_ones1);
  x1 = 'd1;
  x2 = 'd1;
  x3 = 'd1;
  x4 = 'd0;
  ##1;
  $display("parity1 = %0d", parity1);
  $display("all_ones1 = %0d", all_ones1);
  x1 = 'd1;
  x2 = 'd1;
  x3 = 'd1;
  x4 = 'd1;
  ##1;
  $display("parity1 = %0d", parity1);
  $display("all_ones1 = %0d", all_ones1);
  x1 = 'd1;
  x2 = 'd1;
  x3 = 'd1;