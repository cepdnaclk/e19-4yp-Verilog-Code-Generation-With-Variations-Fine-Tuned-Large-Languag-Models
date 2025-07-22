module alu_4(output reg [3:0]d, output co, input[3:0]a, input[3:0]b, input[1:0] f,input cci);
  wire[4:0]x; // Declare adder input wire of 5 bits
  assign x = {cci,a} + b; // Multiplex 4-bit adder inputs
  always @(f) case(f)
    2'b00 : begin d = a & b; co = 1'b0; end // Logical AND
    2'b01 : begin d = a | b; co = 1'b0; end // Logical OR
    2'b10 : begin d = x[3:0]; co = x[4]; end // Arithmetic adder
    2'b11 : begin d = a; co = 1'b0; end // Assign input a
    default : begin d = 1; co =1'bz; end // Unknown function
  endcase
endmodule
### Output:
### Verilog code to demonstrate the operation of the ALU, with all inputs and output bits displayed.
### Synthesized Verilog code:
module tst_alu4();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_4 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus with #3 delay
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule