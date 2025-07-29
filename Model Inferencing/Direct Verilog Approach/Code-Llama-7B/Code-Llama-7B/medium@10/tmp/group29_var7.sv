module mux8(D0, D1, D2, D3, D4, D5, D6, D7, Sel, Clock, Q);
input [7:0] D0, D1, D2, D3, D4, D5, D6, D7;
input [2:0] Sel;
input Clock;
output [7:0] Q;
reg [7:0] Q;
int i = 0, j = 0;
always @(posedge