module decoder (output reg [6: 0] seg, input [3: 0] x);
reg [3: 0] hex[0: 15];
always @ *
begin
hex[0] = 4'b1000;
hex[1] = 4'b1110;
hex[2] = 4'b0100;
hex[3] = 4'b0000;
hex[4] = 4'b0010;
hex[5] = 4'b0001;
hex[6] = 4'b0000;
hex[7] = 4'b1111;
hex[8] = 4'b0000;
hex[9] = 4'b0000;
hex[10] = 4'b1111;
hex[11] = 4'b1000;
hex[12] = 4'b0110;
hex[13] = 4'b1101;
hex[14] = 4'b0100;
hex[15] = 4'b0010;
if (hex == x) seg = 7'b1000000;
else if (hex == x) seg = 7'b0110000;
else if (hex == x) seg = 7'b0100000;
else if (hex == x) seg = 7'b0000011;
else if (hex == x) seg = 7'b0000100;
else if (hex == x) seg = 7'b0000010;
else if (hex == x) seg = 7'b1100000;
else if (hex == x) seg = 7'b0111000;
end
endmodule
### Replacement Code:
module decoder (output reg [6: 0] seg, input [3: 0] x);
always @ *
begin
if (x == 4'b1000) seg = 7'b1000000;
else if