module tst_alu4();
  reg [3:0]a,b; reg[1:0] f; reg cci; logic[3:0]d; logic co;
  alu_4 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus with #3 delay
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
### Compilation:
iverilog -g2005 -o tst_alu4 tst_alu4.v
### Tested Verilog Codes:
### ALU_4
module alu_4(d,co,a,b,f,cci);
  input [3:0] a,b; input [1:0] f; input cci; output [3:0] d; output co;
  always @(*) begin
    case(f)
      2'b00: d = a + b;
      2'b01: d = a - b;
      2'b10: d = a & b;
      2'b11: d = a | b;
    endcase
    if(cci) d = -d;
  end
  always @(a,b,f,cci) begin
    if(a==4'h0) d=4'h0;
    if(b==4'h0) d=4'h0;