module tst_alu4();
  reg [3:0]a,b; reg[1:0] f; reg cci; logic[3:0]d; logic co;
  alu_4 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus with #3 delay
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
### Output:
```
 140   cci = 0, a= 0,b = 0,f = 0,d = 0,co= 0
 170   cci = 0, a= 0,b = 0,f = 0,d = 0,co= 0
 200   cci = 0, a= 0,b = 0,f = 0,d = 0,co= 0
 230   cci = 0, a= 0,b = 0,f = 0,d = 0,co= 0
 260   cci = 0, a= 0,b = 0,f = 0,d = 0,co= 0
 290   cci = 0, a= 0,b = 0,f = 0,d = 0,co= 0
 320   cci = 0, a= 1,b = 1,f = 0,d = 2,co= 0
 350   cci = 0, a= 1,b = 1,f = 0,d = 2,co= 0
 380   cci = 0, a= 1,b = 1,f = 0,d = 2,co= 0
 410   cci = 0, a= 1,b = 3,f = 0,d = 4,co= 0
 440   cci = 0, a= 1