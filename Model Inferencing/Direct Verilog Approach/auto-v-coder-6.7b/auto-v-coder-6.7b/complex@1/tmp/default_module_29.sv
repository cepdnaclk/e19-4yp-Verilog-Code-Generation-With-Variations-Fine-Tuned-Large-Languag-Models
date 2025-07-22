```verilog
module hex_to_7seg (a, seg);
parameter N = 4;
input [N-1: 0] a;
output reg [6: 0] seg;
always @ (a) begin
case (a)
4'h1: seg = 7'b1111001;
4'h2: seg = 7'b0100100;
4'h3: seg = 7'b0110000;
4'h4: seg = 7'b0011001;
4'h5: seg = 7'b0010010;
4'h6: seg = 7'b0000010;
4'h7: seg = 7'b1111000;
4'h8: seg = 7'b0000000;
4'h9: seg = 7'b0010000;
4'ha: seg = 7'b0001000;
4'hb: seg = 7'b0000011;
4'hc: seg = 7'b1000110;
4'hd: seg = 7'b0100001;
4'he: seg = 7'b0000110;
4'hf: seg = 7'b0001110;
default: seg = 7'b1111111;
endcase
end
endmodule
```
In this code, the always block is sensitive to the input `a`. The output `seg` is 7-bit and is updated based on the input `a`. If `a` is not between 0-F, the output is set as no segment is on (i.e., a dash (-) in hexadecimal), which is the common practice in 7-segment display.

Note: The `4'h` prefix in the `case` statement is a binary literal, so the constant 4'h1 will be interpreted as binary 0001.

The `hex_to_7seg` module can be used to convert a