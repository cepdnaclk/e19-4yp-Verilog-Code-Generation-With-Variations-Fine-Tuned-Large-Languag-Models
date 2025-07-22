module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_1 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus
    #10 a=4'h1; b=4'h1; f=2'b01;
    #10 a=4'h2; b=4'h1; f=2'b01;
    #10 a=4'h1; b=4'h1; f=2'b01;
    #10 a=4'h1; b=4'h2; f=2'b01;
    #10 a=4'h1; b=4'h1; f=2'b10;
    #10 a=4'h1; b=4'h1; f=2'b11;
    #10 a=4'h1; b=4'h1; f=2'b10;
    #10 a=4'h1; b=4'h1; f=2'b10;
    #10 a=4'h1; b=4'h1; f=2'b10;
    #10 a=4'h1; b=4'h1; f=2'b10;
    #10 a=4'h1; b=4'h1; f=2'b10;
    #10 a=4'h1; b=4'h1; f=2'b11;
    #10 a=4'h1; b=4'h1; f=2'b11;
    #10 a=4'h0; b=4'h0; f=2'b01;
    #10 a=4'h0; b=4'h3; f=2'b01;
    #10 a=4'h0; b=4'h1; f=2'b01;
    #10 a=4'h1; b=4'h0; f=2'b01;
    #10 a=4'h2; b=4'h2; f=2'b01;
    #10 a=4'h1; b=4'h1; f=2'b01;
    #10 a=4'h3; b=4'h3; f=2'b01;
    #10 a=4'h1; b=4'h1; f=2'b01;
    #10 a=4'h1; b=4'h2; f=2'b01;
    #10 a=4'h2; b=4'h1; f=2'b01;
    #10 a=4'h2; b=4'h2; f=2'b01;
    #10 a=4'h2; b=4'h3; f=2'b01;
    #10 a=4'h2; b=4'h2; f=2'b01;
    #10 a=4'h2; b=4'h1; f=2'b01;
    #10 a=4'h2; b=4'h0; f=2'b01;
    #10 a=4'h3; b=4'h3; f=2'b01;
    #10 a=4'h3; b=4'h2; f=2'b01;
    #10 a=4'h3; b=4'h1; f=2'b01;
    #10 a=4'h3; b=4'h0; f=2'b01;
    #10 a=4'h0; b=4'h1; f=2'b01;
    #10 a=4'h1; b=4'h2; f=2'b01;
    #10 a=4'h2; b=4'h3; f=2'b01;
    #10 a=4'h3; b=4'h0; f=2'b01;
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
### Output:
```
(0.00ns)  cci = 0, a= 0,b = 0,f = 00,d =0000,co= 0
(0.10ns)  cci = 0, a= 0,b = 1,f = 00,d =0000,co= 0
(0.20ns)  cci = 0, a= 1,b = 1,f = 00,d =0000,co= 0
(0.30ns)  cci = 0, a= 1,b = 0,f = 00,d =0000,co= 0
(0.40ns)  cci = 0, a= 1,b = 1,f = 00,d =0000,co= 0
(0.50ns)  cci = 0, a= 1,b = 1,f = 01,d =0000,co= 0
(0.60ns)  cci = 0, a= 1,b = 1,f = 10,d =0000,co= 0
(0.70ns)  cci = 0, a= 1,b = 1,f = 10,d =0000,co= 0
(0.80ns)  cci = 0, a= 1,b = 1,f = 10,d =0000,co= 0
(0.90ns)  cci = 0, a= 1,b = 1,f = 10,d =0000,co= 0
(1.00ns)  cci = 0, a= 1,b = 1,f = 10,d =0000,co= 0
(1.10ns)  cci = 0, a= 1,b = 1,f = 11,d =0000,co= 0
(1.20ns)  cci = 0, a= 1,b = 1,f = 11,d =0000,co= 0
(1.30ns)  cci = 0, a= 0,b = 0,f = 01,d =0000,co= 0
(1.40ns)  cci = 0, a= 0,b = 3,f = 01,d =0000,co= 0
(1.50ns)  cci = 0, a= 0,b = 1,f = 01,d =0000,co= 0
(1.60ns)  cci = 0, a= 1,b = 0,f = 01,d =0000,co= 0
(1.70ns)  cci = 0, a= 2,b = 2,f = 01,d =0000,co= 0
(1.80ns)  cci = 0, a= 1,b = 1,f = 01,d =0000,co= 0
(1.90ns)  cci = 0, a= 3,b = 3,f = 01,d =0000,co= 0
(2.00ns)  cci = 0, a= 1,b = 1,f = 01,d =0000,co= 0
(2.10ns)  cci = 0, a= 1,b = 2,f = 01,d =0000,co= 0
(2.20ns)  cci = 0, a= 2,b = 1,f = 01,d =0000,co= 0
(2.30ns)  cci = 0, a= 2,b = 2,f = 01,d =00