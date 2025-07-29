module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_1 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  initial begin // Apply stimulus
  end
  always #10 a=a+2; always #10 b=b+3; // Apply stimulus
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
#### The Testbench Has Been Modified! Testbench Screenshot:
<img src=https://i0.wp.com/imgur.com/UiKKQM9.png?resize=500%2C500>
### Observation:
- The operation result now gets reflected properly.
## 1.4.2 ALU - 2-Input Adder
### Exercise Description:
- The ALU has a 1-bit sum function that adds the 4-bit inputs A and B and outputs the sum to a 4-bit wire. When F = 0, the output function is simply the sum of A and B. When F = 1, the function becomes A+1.
- The addition operation is a 6-bit full adder.
- The carry-out wire from the full adder is the carry-in to the next full adder. The carry in is enabled at the most significant end of the adder. When F = 0, the carry-in goes directly to the MSB adder. When F = 1, the carry-in goes to the MSB adder and then to the adder above it.
The 1-bit carry-in is inverted when F = 1, so that the carry-in can be the same as the carry-