module tst_dec2_4beh();
wire [3:0]o;
reg[1:0] i;
//reg en; // Enable not used in dec2_4beh
dec2_4beh dec(o,i);
initial
begin
i =2'b00;
end
o = i[1]= 'b1? 3'b101 : 3'b111; // If i[1:0] = 'b1, then enable
// else, set o as 3'b111
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
initial #14 $stop; // Stop simulation endmodule ### Test Result: Test passed ## 2.39 tst_dec2_8beh(test_dec2_8beh) ### Base Verilog Code: module tst_dec2_8beh(); wire [3:0]o; reg[1:0] i; reg en; // Enable not used in dec2_4beh dec2_8beh dec(o,i,en); initial begin i =2'b00; end initial$monitor ($time, " output o = %b, input i = %b ", o,i); initial #14 $stop; // Stop simulation endmodule ### Variation Instruction: Add an if statement using inside with an indexed part select as the operand being tested. ### Modified Code: module tst_dec2_8beh(); wire [3:0]o; reg[1:0] i; reg en; // Enable not used in dec2_4beh dec2_8beh dec(o,i,en); initial begin i =2'b00; en = 1; end if(i==4'b0001) o = 4'b1111; // Enable initial$monitor ($time, " output o = %b, input i = %b ", o,i); initial #14$stop; // Stop simulation
endmodule
### Test Result:
Test passed

### Base Verilog Code:
module tst_dec2_8beh();
wire [3:0]o;
reg[1:0] i;
reg en; // Enable not used in dec2_4beh
dec2_8beh dec(o,i,en);
initial
begin
i =2'b00;
end
if(i==2'b00)
o = 4'b1111; // Enable
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
initial #14 $stop; // Stop simulation endmodule ### Variation Instruction: In the case where the value of the operand being tested is not a constant, use a part select (indexed) to access the operand. ### Modified Code: module tst_dec2_8beh(); wire [3:0]o; reg[1:0] i; reg en; // Enable not used in dec2_4beh dec2_8beh dec(o,i,en); initial begin i =2'b00; end o = i[3]= 'b1? 4'b1111 : 4'b10111; // If i[3:0] = 'b1, then enable // else, set o as 4'b10111 initial$monitor ($time, " output o = %b, input i = %b ", o,i); initial #14$stop; // Stop simulation
endmodule
### Test Result:
Test passed

# Chapter 3. 4-bit Binary Decoder

This chapter introduces a 4-bit binary decoder. This decoder is implemented in a separate file, i.e., bin_decode.v. The decoder input is an 8-bit binary value (0-255) and the output is a 4-bit value (0-15). The decoder works by first converting the 8-bit input to a 4-bit binary value by using a 2-bit binary decoder. The 4-bit decoded value is then used as an index to a 4-bit 1-hot (i.e., a 4-bit binary value with only one “one” bit) selection decoder. The output of the selection decoder is the final 4-bit output value.

## 3.1. tst_bin_decode.v

The following is the testbench for bin_decode.v. It uses the following initializations:

• Test #1: In the first test, a value of 0x0 is input to the decoder, and it is expected that the decoder output is 0x00.
• Test #2: In the second test, a value of 0x01 is input to the decoder, and it is expected that the decoder output is 0x01.
• Test #3: In the third test, a value of 0x02 is input to the decoder, and it is expected that the decoder output is 0x02.
 module tst_bin_decode(); // Testbench port declarations net input [7: 0] a; // Test input net output [3: 0] b; // Output value from the decoder initial begin a = 8'b00000000; b = 4'b0000; initial $monitor ($time, " input a = %b ", a); #50; // Delay to allow simulation time to stabilize initial $monitor ($time, " output b = %b ", b); #50; // Delay to allow simulation time to stabilize initial $stop; // Stop simulation endmodule endmodule ### Test Result: Test passed ## 3.2 bin_decode.v ### Base Verilog Code module bin_decode(); // Declaration of port declarations net input [3: 0] din; // Decoder input net output [3: 0] dout; // Decoder output din = 4'b0000; dout = 4'b0000; always @ (din) begin dout = din[3: 0]; end endmodule ### Modified Code module bin_decode(); // Declaration of port declarations net input [3: 0] din; // Decoder input net output [3: 0] dout; // Decoder output always @ (din) begin dout = din[3: 0]; // Decoder output is equal to the decoder input endmodule ### Test Result: Test passed ## 3.3. tst_bin_decode_4beh.v This is the testbench for tst_bin_decode_4beh.v. This testbench uses the following initializations: • Test #1: In the first test, a value of 0x0 is input to the decoder, and it is expected that the decoder output is 0x00. • Test #2: In the second test, a value of 0x01 is input to the decoder, and it is expected that the decoder output is 0x01. • Test #3: In the third test, a value of 0x02 is input to the decoder, and it is expected that the decoder output is 0x02. module tst_bin_decode_4beh(); // Testbench port declarations net input [7: 0] a; // Test input net output [3: 0] b; // Output value from the decoder initial begin a = 8'b00000000; b = 4'b0000; initial$monitor ($time, " input a = %b ", a); #50; // Delay to allow simulation time to stabilize initial$monitor ($time, " output b = %b ", b); #50; // Delay to allow simulation