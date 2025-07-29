```
// HW Instruction 1: Hex-to-7Seg
module HexTo7Seg (hex, display);
input [3: 0] hex;
output reg [7: 0] display;
parameter
// HW Instruction 2:
S_IDLE = 0, // HW Instruction 3: 
S_1 = 1; // HW Instruction 4: 
S_2 = 2, // HW Instruction 5: 
S_3 = 3, // HW Instruction 6: 
S_4 = 4, // HW Instruction 7: 
S_5 = 5, // HW Instruction 8: 
S_6 = 6, // HW Instruction 9: 
S_7 = 7, // HW Instruction 10: 
S_8 = 8; // HW Instruction 11: 
reg [2: 0] state, next_state;
// HW Instruction 12:
always @ (posedge clock) if (rst) state <= S_IDLE;
else state <= next_state;
// HW Instruction 13:
always @ (state, hex) begin
display = 8'hff;
next_state = S_IDLE;
case (state)
S_IDLE: begin
display = 8'h00;
if (hex!= -1) begin
next_state = S_1;
end
end
// HW Instruction 14:
S_1: begin
display = 8'h00;
if (hex == -1) begin
next_state = S_IDLE;
end
else if (hex == 0) begin
next_state = S_6;
end
else if (hex == 1) begin
next_state = S_8;
end
else if (hex == 2) begin
next_state = S_5;
end
else if (hex == 3) begin
next_state = S_7;
end
else if (hex == 4) begin
next_state = S_3;
end
else if (hex == 5) begin
next_state = S_4;
end
else if (hex