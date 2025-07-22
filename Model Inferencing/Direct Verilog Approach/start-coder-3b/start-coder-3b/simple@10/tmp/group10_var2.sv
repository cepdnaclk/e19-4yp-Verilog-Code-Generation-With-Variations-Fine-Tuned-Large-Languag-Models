module tst_alu4();
  reg [3:0]a,b; reg[1:0] f; logic [1:0] cci; wire [1:0] d; wire co;
  alu_4 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus with #3 delay
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
### Result:
![image](https://user-images.githubusercontent.com/83641209/117053571-75899e00-ad0b-11eb-982e-852813bc1f6c.png)

The result shows that the d output is logic type and has no conflict with the signal type of d.

## 8. ALU with the input co=4'h1
### Base Verilog Code:
module tst_alu4();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_4 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus with #3 delay
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule