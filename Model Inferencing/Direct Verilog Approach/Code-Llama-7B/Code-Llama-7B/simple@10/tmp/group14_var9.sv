module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  always begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
  alu_1 aa(d,co,a,b,f,cci); // Instantiate ALU
endmodule
### Verilog Code
module alu_1(d,co,a,b,f,cci);
  input[3:0]a,b; input[1:0]f; input cci; output[3:0]d; output co;
  reg d,co;
  wire c1; wire c2; wire c3; wire c4;
  always@(*) co=(cci)? 1'd0: (f[0])? ~(a-b): (f[1])? a+b: 1'd0;
  always@(a or b or f or cci) d=(f[0])?  ~(a-b): (f[1])? a+b: 1'd0;
endmodule

### Test Bench Code:
module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  always begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
  end
  initial $monitor($time, " cci = %b, a= %b,b = %b,f = %b,d =%b,co=