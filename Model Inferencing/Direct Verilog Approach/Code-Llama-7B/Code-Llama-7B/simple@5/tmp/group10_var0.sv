``` verilog
module tst_alu4();
  reg [3:0]a,b; reg[1:0] f; reg cci; logic[3:0]d; logic co;
  alu_4 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus with #3 delay
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
```
### Testbench Results:
```
cci = 0, a= 0,b = 0,f = XX,d =0,co= 0
 cci = 0, a= 1,b = 3,f = XX,d =0,co= 0
 cci = 0, a= 2,b = 2,f = XX,d =0,co= 0
 cci = 0, a= 3,b = 1,f = XX,d =0,co= 0
 cci = 0, a= 4,b = 4,f = XX,d =0,co= 0
 cci = 0, a= 5,b = 8,f = XX,d =0,co= 0
 cci = 0, a= 6,b = 9,f = XX,d =0,co= 0
 cci = 0, a= 7,b = 0,f = XX,d =0,co= 0
 cci = 0, a= 8,b = 0,f = XX,d =0,co= 0
 cci = 0, a= 9,b = 1,f = XX,d =0,co= 0
 cci = 0, a= a,b = 3