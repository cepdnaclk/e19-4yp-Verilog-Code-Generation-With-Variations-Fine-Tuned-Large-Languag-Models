module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_1 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
   #1 a = 4'h6; b = 4'h3; 
   #1 a = 4'h1; b = 4'h2; 
   #1 a = 4'h8; b = 4'h4; 
   #1 a = 4'h7; b = 4'h1; 
   #1 a = 4'h2; b = 4'h1; 
   #1 a = 4'hA; b = 4'h2; 
   #1 a = 4'h1; b = 4'h2; 
   #1 a = 4'h1; b = 4'h2; 
   #1 a = 4'h1; b = 4'h0; 
   #1 a = 4'hF; b = 4'hF; 
   #1 a = 4'hF; b = 4'hF; 
   #1 a = 4'h9; b = 4'h9; 
   #1 a = 4'h9; b = 4'h9; 
   #1 a = 4'hF; b = 4'hF; 
   #1 a = 4'h8; b = 4'h0; 
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
### Variation Instruction:
Add