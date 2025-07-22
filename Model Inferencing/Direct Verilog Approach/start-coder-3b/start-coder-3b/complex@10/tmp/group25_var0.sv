module BCD_decoder (BCD_in, SEV_out);
input [1:0] BCD_in;
output [6:0] SEV_out;
wire [4:0] SEV_in;
// Add the reset signal
reg SEV_out_reset;
assign SEV_in = SW_case[BCD_in];
assign SEV_out = SEV_in[4:0];
initial
// Initialize the SEV_out_reset to zero
SEV_out_reset = 0;
// Reset the output signal to zero
assign SEV_out = 0000_0000_0000;
// Use the case statement to create the decoder
case (BCD_in)
1'b0: begin
SEV_out_reset = 1;
SEV_out = 0000_0000_0000;
end
1'b1: begin
SEV_out_reset = 1;
SEV_out = 0000_0000_0000;
end
1'b10: begin
SEV_out_reset = 1;
SEV_out = 0000_0111_0000;
end
1'b100: begin
SEV_out_reset = 1;
SEV_out = 0000_0111_0000;
end
1'b1000: begin
SEV_out_reset = 1;
SEV_out = 0000_0111_0000;
end
1'b10000: begin
SEV_out_reset = 1;
SEV_out = 0000_1111_0000;
end
1'b100000: begin
SEV_out_reset = 1;
SEV_out = 0000_1111_0000;
end
1'b1000000: begin
SEV_out_reset = 1;
SEV_out = 0000_1111_0000;
end
default: begin
SEV_out_reset = 1;
SEV_out = 0000_0000_0000;
end
endcase
// Use a generate block to output the reset value
generate
if (SEV_out_reset)
SEV_out = 0000_0000_0000;
endgenerate
endmodule

module t_BCD_decoder();
reg [1:0] BCD_in;
wire [6:0] SEV_out;
BCD_decoder M1(BCD_in, SEV_out);
initial
$monitor($time,,"BCD = %b, 7-SEG code = %b", BCD_in, SEV_out);
initial begin

// 5. Test Pattern
// 1111,1010,1100,1000,0101,0010,0111,0000
$readmemb("BCD_code.txt", BCD_in);
// 11111111111111111111, 01000001100100001011, 00000000011011110100, 00000000001100100110, 00000000000101111100, 00000000000010101101, 00000000000001010010, 00000000000000000000
initial end
endmodule
### Results:
![Results](./Pictures/ex4.png)

### Problem 4: 7-SEG Decoder and Decoder Adder
### Base Verilog Code:
1. **7-SEG Decoder:**
```
module BCD_decoder (BCD_in, SEV_out);
input [1:0] BCD_in;
output [6:0] SEV_out;
wire [4:0] SEV_in;
// Add the reset signal
reg SEV_out_reset;
assign SEV_in = SW_case[BCD_in];