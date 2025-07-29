module HexDecoder(decoded_value, hex_digit);
output reg [6:0] decoded_value;
input [3:0] hex_digit;
reg [6:0] decoded_value;

always @ (hex_digit) begin
case (hex_digit) inside
0: decoded_value = 7'b1000000;
1: decoded_value = 7'b1111001;
2: decoded_value = 7'b0100100;
3: decoded_value = 7'b0110000;
4: decoded_value = 7'b0011001;
5: decoded_value = 7'b0010010;
6: decoded_value = 7'b0000010;
7: decoded_value = 7'b1111000;
8: decoded_value = 7'b0000000;
9: decoded_value = 7'b0011000;
10: decoded_value = 7'b0001000;
11: decoded_value = 7'b0000011;
12: decoded_value = 7'b1000110;
13: decoded_value = 7'b0100001;
14: decoded_value = 7'b0000110;
15: decoded_value = 7'b0001110;
default decoded_value = 7'b1111111;
endcase
end
endmodule