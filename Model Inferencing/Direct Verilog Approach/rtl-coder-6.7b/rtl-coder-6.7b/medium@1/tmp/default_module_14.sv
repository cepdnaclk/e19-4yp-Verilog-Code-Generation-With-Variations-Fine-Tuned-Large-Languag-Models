module mux24 (
input wire[23:0] in,
input wire[4:0] s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
case (s)
5'b00000: y = in[0];
5'b00001: y = in[1];
5'b00010: y = in[2];
5'b00011: y = in[3];
5'b00100: y = in[4];
5'b00101: y = in[5];
5'b00110: y = in[6];
5'b00111: y = in[7];
5'b01000: y = in[8];
5'b01001: y = in[