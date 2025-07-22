module tst_mul_reg1();
  reg[3:0]a,b,result;  reg cci;
  mul_reg1 aa (a,b,result,cci); // Instantiate Multiplier
  initial begin cci=1'b0;  a=4'b0000; b=4'b0000; #30 $stop; end // Initialize & stop
  initial $monitor($time, " cci = %b, a= %b,b = %b,result = %b,cci = %b ",cci,a,b,result,cci); // Use %b
endmodule
### Results:
![mul_reg1.png](images/mul_reg1.png)

## Multi-Bit Registers (8-bit)
### Base Verilog Code:
module tst_mul_reg2();
  reg[7:0]a,b,result;  reg cci;
  mul_reg2 aa (a,b,result,cci); // Instantiate Multiplier
  initial begin cci=1'b0;  a=8'h0; b=8'h0; #30 $stop; end // Initialize & stop
  initial $monitor($time, " cci = %b, a= %h,b = %h,result = %h,cci = %b ",cci,a,b,result,cci); // Use %h
endmodule
### Variation Instruction:
Replace the inputs A and B with 8-bit logic vectors and the output D with 8-bit to test multi-bit combinational logic behavior.
### Modified Code: