module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_1 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
### Verilog File for the ALU:
module alu_1(d,co,a,b,f,cci); // 4-bit ALU
  input [3:0] a,b; // Operands
  input [1:0] f; // Operator
  input cci; // Carry in
  output reg [3:0] d; // Result
  output co; // Carry out
  reg [3:0] e; // Extra Bit
  wire [4:0] sum; // 5-bit sum/difference
  assign sum = a + b + cci; // Calculate sum
  assign e = sum[4:1]; // Extract sum
  assign co = sum[4]; // Extract carry out
  always @* begin // Comparator
    case(f)
      2'b00: d = a & b; // And
      2'b01: d = a | b; // Or
      2'b10: d = cci ^ (a ^ b); // Xor
      2'b11: d = e; // Sum
      default: d = 4'hx; // Invalid
    endcase
  end
endmodule
This code will generate a waveform, which is similar to the one given below. The waveform can be analyzed to verify the correct functionality of the ALU.
### Waveform of ALU: