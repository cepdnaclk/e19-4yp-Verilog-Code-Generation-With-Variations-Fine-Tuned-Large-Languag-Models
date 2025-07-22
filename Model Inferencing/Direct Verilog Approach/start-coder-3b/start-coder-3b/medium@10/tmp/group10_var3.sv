module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [1:0] Q;
reg [1:0] Q;
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 2'b00;
    else
        Q <= D[1:0];