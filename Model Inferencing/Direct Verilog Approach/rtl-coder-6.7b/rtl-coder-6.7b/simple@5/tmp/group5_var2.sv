module dff_p(output reg q, input d, input clk);
  always @(posedge clk) q <= d;
endmodule
### Verilog-2001 (SV) Code:
module dff_p(output logic q, input d, input clk);
  always @(posedge clk) q <= d;
endmodule
### Verilog 2005 Code:
### SV Code
module tst_dff_pbeh();
  logic di,clk; wire do;
  dff_p d1(.*);  // Instantiate DFF with path delay
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  always #5 di=~di; // Toggle data
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule
module dff_p(output logic q, input logic d, input logic clk);
  always @(posedge clk) q <= d;
endmodule