module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_1 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
  #1 a=4'h5; b=4'h8;
  #10 a=4'h9; b=4'h5;
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
### New Code
// Verilog Code
// 2-input ALU with 4 select lines
// 0000 = a&b, 0001 = a|b, 0010 = a+b, 0110 = a-b, 1100 = ~a
module alu_1 ( output [3:0]d, output co, input [3:0]a, b, input [1:0] f, cci);
  always @* begin
    co=1'bx; d=4'bx; case ({cci, f})
    4'b0000: {co, d} = a & b;
    4'b0001: {co, d} = a | b;
    4'b0010: {co, d} = a + b;
    4'b0110: {co, d} = a - b;
    4'b1100: {co, d} = ~a;
    default: {co, d} = 4'bx;
    endcase
  end
endmodule
// 4-input ALU with 4 select lines
// 0000 = a&b, 0001 = a|b, 0010 = a+b, 0110 = a-b, 1100 = ~a
module alu_1 ( output [3:0]d, output co, input [3:0]a, b, input [3:0] f, cci);
  always @* begin
    co=1'bx; d=4'bx; case ({cci, f})
    4'b0000: {co, d} = a & b;
    4'b0001: {co, d} = a | b;
    4'b0010: {co, d} = a + b;
    4'b0110: {co, d} = a - b;
    4'b1100: {co, d} = ~a;
    default: {co, d} = 4'bx;
    endcase
  end
endmodule
### New Test Bench Code
// Test Bench
module tst_alu1();
  reg [3:0]a,b; reg[3:0] f; reg cci; wire[3:0]d; wire co;
  alu_1 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=4'b0001; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
  #1 a=4'h5; b=4'h8;
  #10 a=4'h9; b=4'h5;
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %h,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule