```
module tst_alu4();
  reg [3:0]a,b; reg[1:0] f; reg cci; logic[3:0]d; logic co;
  alu_4 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus with #3 delay
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
```
### Expected Output:
```
cci = 1'b0, a= 0'h0,b = 0'h0,f = 0'b0,d =0'h0,co= 0'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b0,d =0'h0,co= 0'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b0,d =0'h0,co= 0'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b0,d =0'h0,co= 0'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b0,d =0'h0,co= 0'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b0,d =0'h0,co= 0'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h0,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1110,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1111,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1110,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1111,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1110,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1111,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1110,co= 0'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1111,co= 0'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1110,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1111,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1110,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1111,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1110,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1111,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1110,co= 0'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1111,co= 0'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1110,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1111,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1110,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1111,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1110,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1111,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1110,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1111,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1110,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1111,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1110,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1111,co= 1'b0 
cci = 1'b1, a= 0'h0,b = 0'h0,f = 0'b1,d =4'h1110,co= 1'b0 
cci =