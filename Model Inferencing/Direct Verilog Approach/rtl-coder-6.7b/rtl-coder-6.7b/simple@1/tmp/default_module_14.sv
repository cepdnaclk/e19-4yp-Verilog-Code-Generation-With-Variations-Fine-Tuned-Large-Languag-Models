module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_1 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule

### Verilog Code:
module alu_1(output logic[3:0] d, output logic co, input logic[3:0] a, input logic[3:0] b, input logic[1:0] f, input logic co);
always @(a,b,f,co) // On change of A,B,F or CCI
case (f) // Decode function code
  2'b00: begin d = a+b+cci; co = d[4]; end
  2'b01: begin d = a-b-cci; co = 0; end
  2'b10: begin d = a^b; co = 0; end
  2'b11: begin d = ~a; co = 0; end
endcase
endmodule