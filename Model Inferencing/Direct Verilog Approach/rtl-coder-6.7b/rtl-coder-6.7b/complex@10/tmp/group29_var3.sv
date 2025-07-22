module decoder (bcd, seg_disp);
input [3: 0] bcd;
output reg [7: 0] seg_disp;
reg [7: 0] d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, dA, dB;
reg [6: 0] seg_disp;
initial begin
d0 = 8'b011_1111;
d1 = 8'b000_0011;
d2 = 8'b101_1011;
d3 = 8'b100_1111;
d4 = 8'b110_0110;
d5 = 8'b110_1101;
d6 = 8'b111_1101;
d7 = 8'b000_0111;
d8 = 8'b111_1111;
d9 = 8'b110_0111;
dA = 8'b111_0111;
dB = 8'b111_0000;
end
always @ (bcd) begin
case (bcd)
0, 1, 2, 3, 4, 5, 6, 7, 8, 9: seg_disp <= d0;
'hA, 'hB, 'hC, 'hD, 'hE, 'hF: seg_disp <= d1;
endcase
end
endmodule

module test_decoder;
reg [3: 0] bcd;
wire [7: 0] seg_disp;
decoder dut (.bcd,.seg_disp);
initial begin
bcd = 4'h0;
#5; bcd = 4'h1;
#5; bcd = 4'h2;
#5; bcd = 4'h3;
#5; bcd = 4'h4;
#5; bcd = 4'h5;
#5; bcd = 4'h6;