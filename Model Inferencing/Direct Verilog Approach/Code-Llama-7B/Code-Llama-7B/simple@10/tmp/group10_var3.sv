module tst_alu4();
  reg [3:0]a,b; reg[1:0] f; reg cci; logic[3:0]d; logic co;
  alu_4 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus with #3 delay
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
### Error Message:
ERROR: [-TR] Port width must match net width. The following ports have mismatched widths:
  port "co" has 1 bits, but connected net "co" has 1 bit(s).

ERROR: [TR] Verilog HDL syntax error at alu_4.v(4) near text: "wire";
  expecting a declaration.

ERROR: [TR] Verilog HDL syntax error at alu_4.v(4) near text: "wire";
  expecting a declaration.

ERROR: [TR] Verilog HDL syntax error at tst_alu4.v(2) near text: "module";
  unexpected end of file.

ERROR: [TR] Verilog HDL syntax error at tst_alu4.v(3) near text: "end";
  expecting "module".

ERROR: [TR] Verilog HDL syntax error at tst_alu4.v(3) near text: "end";
  expecting "module".

ERROR: [TR] Verilog HDL syntax error at tst_alu4.v(3) near text: "end";
  expecting "module".

ERROR: [TR] Verilog HDL syntax error at tst_alu4.v(3) near text: "end";
  expecting "module".

ERROR: [TR] Verilog HDL syntax error at tst_alu