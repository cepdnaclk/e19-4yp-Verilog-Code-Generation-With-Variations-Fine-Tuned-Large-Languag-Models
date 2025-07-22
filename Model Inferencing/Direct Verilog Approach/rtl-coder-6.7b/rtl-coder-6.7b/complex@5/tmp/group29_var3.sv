module sevenSegmentDisp(hex, output);
input hex;
output reg[6:0] output;
reg [6:0] const[15:0];
initial begin
const[0] = 7'b100_0000; const[1] = 7'b111_1001; const[2] = 7'b010_0100; const[3] = 7'b011_0000;
const[4] = 7'b001_1001; const[5] = 7'b001_0010; const[6] = 7'b000_0010; const[7] = 7'b111_1000;
const[8] = 7'b000_0000; const[9] = 7'b001_1000; const[10] = 7'b100_0000; const[11] = 7'b100_1000;
const[12] = 7'b100_0100; const[13] = 7'b111_0100; const[14] = 7'b100_1110; const[15] = 7'b010_0001;
end
always @ (*) begin
output = const[hex];
end
endmodule