module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_1 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always #10 a=a+1'b1; // Apply stimulus
  always #10 b=b+1'b1; // Apply stimulus
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
Note: 4-bit vectors are tested here, but the ALU can accommodate any number of bits.
### Results from Testing:
cci = 0, a= 0000,b = 0000,f = 00,d =0000,co= 0
cci = 1, a= 0000,b = 0000,f = 00,d =0000,co= 0
cci = 1, a= 0001,b = 0001,f = 00,d =0000,co= 0
cci = 1, a= 0010,b = 0010,f = 00,d =0000,co= 0
cci = 1, a= 0011,b = 0011,f = 00,d =0000,co= 0
cci = 1, a= 0100,b = 0100,f = 00,d =0000,co= 0
cci = 1, a= 0101,b = 0101,f =