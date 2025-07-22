module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_1 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
  #5 {a,b}={2'b00,a}+{2'b00,b}+1'b0;
  #30 {a,b}={2'b01,a}+{2'b01,b}+1'b0;
  #30 {a,b}={2'b10,a}+{2'b10,b}+1'b0;
  #30 {a,b}={2'b11,a}+{2'b11,b}+1'b0;
  #30 $stop;
  end
  initial $monitor($time, " cci = %b, a= %b,b = %b,f = %b,d =%b,co= %b ",cci,a,b,f,d,co); // Use %b
endmodule
### Results:
![image](https://user-images.githubusercontent.com/89242313/198895072-6718645c-d59b-45c9-8438-0894d9289de2.png)