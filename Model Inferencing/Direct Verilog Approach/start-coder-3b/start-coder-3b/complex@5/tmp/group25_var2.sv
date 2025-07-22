module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;
reg [4:0] HiCount;

generate
HiCount = HiCount +1;
endgenerate

assign Excess_3_out = BCD_in + 3;

endmodule

module comparator (Excess_3_in1, Excess_3_in2, Comp_out);
input [4:0] Excess_3_in1;
input [4:0] Excess_3_in2;
output Comp_out;

reg [4:0] HiCount;

always @(posedge Excess_3_in1 or posedge Excess_3_in2)
if (Excess_3_in1 > Excess_3_in2) begin
Comp_out = 1'b1;
else if (Excess_3_in1 == Excess_3_in2) begin
Comp_out = 1'b0;
else if (Excess_3_in1 < Excess_3_in2) begin
Comp_out = 1'b0;
end
end

endmodule

module t_encoder();
reg [3:0] BCD_in;
wire [3:0] Excess_3_out;
wire Comp_out;

assign BCD_in = (HiCount < 16)? HiCount : (1'b1 ^ HiCount);
encoder M0(BCD_in, Excess_3_out);
comparator M1(Excess_3_out[4:0], Excess_3_out[4:0], Comp_out);
initial
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);

initial begin
HiCount = 0;
end
initial begin //Simulation Test Pattern
end
endmodule

### Test Pattern:
```
assign BCD_in = (HiCount < 16)? HiCount : (1'b1 ^ HiCount);

### Output:
D:\>iverilog encoder.v comparator.v t_encoder.v
D:\>vvp t_encoder
200000000 : BCD = 0b0, Excess-3 Code = 0b00010000
200000000 : BCD = 0b1, Excess-3 Code = 0b00010001
200000001 : BCD = 0b10, Excess-3 Code = 0b00010010
200000001 : BCD = 0b11, Excess-3 Code = 0b00010011
200000002 : BCD = 0b100, Excess-3 Code = 0b00010100
200000002 : BCD = 0b101, Excess-3 Code = 0b00010101
200000003 : BCD = 0b110, Excess-3 Code = 0b00010110
200000003 : BCD = 0b111, Excess-3 Code = 0b00010111
200000004 : BCD = 0b1000, Excess-3 Code = 0b00011000
200000004 : BCD = 0b1001, Excess-3 Code = 0b00010001
200000005 : BCD = 0b1010, Excess-3 Code = 0b00010010
200000005 : BCD = 0b1011, Excess-3 Code = 0b00010011
200000006 : BCD = 0b1100, Excess-3 Code = 0b00010100
200000006 : BCD = 0b1101, Excess-3 Code = 0b00011000
200000007 : BCD = 0b1110, Excess-3 Code = 0b00010101
200000007 : BCD = 0b1111, Excess-3 Code = 0b00010110
200000008 : BCD = 0b10000, Excess-3 Code = 0b00011001
200000008 : BCD = 0b10001, Excess-3 Code = 0b00010001
200000009 : BCD = 0b10010, Excess-3 Code = 0b00010010
200000009 : BCD = 0b10011, Excess-3 Code = 0b00010011
200000010 : BCD = 0b10100, Excess-3 Code = 0b00010100
200000010 : BCD = 0b10101, Excess-3 Code = 0b00010101
200000011 : BCD = 0b10110, Excess-3 Code = 0b00010110
200000011 : BCD = 0b10111, Excess-3 Code = 0b00010111
200000012 : BCD = 0b11000, Excess-3 Code = 0b00011000
200000012 : BCD = 0b11001, Excess-3 Code = 0b00011001
200000013 : BCD = 0b11010, Excess-3 Code = 0b00010001
200000013 : BCD = 0b11011, Excess-3 Code = 0b00010010
200000014 : BCD = 0b11100, Excess-3 Code = 0b00010011
200000014 : BCD = 0b11101, Excess-3 Code = 0b00011000
200000015 : BCD = 0b11110, Excess-3 Code = 0b00010101
200000015 : BCD = 0b11111, Excess-3 Code = 0b00010110
```

### Assignment-4:
### Base Verilog Code:
```
module mux41 (I0, I1, I2, I3, S, Y);
input [3:0] I0, I1, I2, I3;
input S;
output Y;
wire [3:0] Ia;
wire [3:0] Ib;
 
assign Ia = (S)? I0 : I1;
assign Ib = (S)? I2 : I3;
assign Y = Ia + Ib;
endmodule

module t_mux41();

reg [3:0] I0, I1, I2, I3;
wire S;
wire [3:0] Y;

assign S = 1'b1;
mux41 M0(I0, I1, I2, I3, S, Y);

initial
$monitor($time,,"I0 = %b, I1 = %b, I2 = %b, I3 = %b, S = %b, Y = %b", I0, I1, I2, I3, S, Y);