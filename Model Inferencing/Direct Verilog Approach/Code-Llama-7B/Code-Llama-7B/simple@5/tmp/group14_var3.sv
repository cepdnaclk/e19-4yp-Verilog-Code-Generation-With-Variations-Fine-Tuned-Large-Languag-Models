module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_1 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
### Results:
```
> cci = 1, a= 0,b = 0,f = 00,d =0,co= 0 
cci = 1, a= 0,b = 0,f = 00,d =0,co= 0 
cci = 1, a= 1,b = 0,f = 00,d =0,co= 0 
cci = 1, a= 1,b = 0,f = 00,d =0,co= 0 
cci = 1, a= 0,b = 1,f = 00,d =1,co= 0 
cci = 1, a= 0,b = 1,f = 00,d =1,co= 1 
cci = 1, a= 1,b = 1,f = 00,d =1,co= 1 
cci = 1, a= 1,b = 1,f = 00,d =1,co= 1 
cci = 1, a= 2,b = 0,f = 00,d =3,co= 0 
cci = 1, a= 2,b = 0,f = 00,d =3,co=