Here is the modified code for the hex-to-7seg decoder:

```verilog
module hex_to_seg (hex, seg, clock, rst);
input [3: 0] hex;
output reg [6: 0] seg;
input clock, rst;
reg [3: 0] decode_hex[15: 0];
always @ (posedge clock) if (rst) seg <= 7'b1111111;
else begin
    case (hex) inside 
        [0: 9]: seg <= decode_hex[hex];
        default: seg <= 7'b0000000; //turn-off segment if out of range
    endcase
end
initial begin
    decode_hex[0] = 7'b1000000;
    decode_hex[1] = 7'b1111001;
    decode_hex[2] = 7'b0100100;
    decode_hex[3] = 7'b0110000;
    decode_hex[4] = 7'b0011001;
    decode_hex[5] = 7'b0010010;
    decode_hex[6] = 7'b0000010;
    decode_hex[7] = 7'b1111000;
    decode_hex[8] = 7'b0000000;
    decode_hex[9] = 7'b0010000;
    decode_hex[10] = 7'b0001000; // A
    decode_hex[11] = 7'b0000011; // b
    decode_hex[12] = 7'b1000110; // C
    decode_hex[13] = 7'b0100001; // d
    decode_hex[14] = 7'b0000110; // E
    decode_hex[