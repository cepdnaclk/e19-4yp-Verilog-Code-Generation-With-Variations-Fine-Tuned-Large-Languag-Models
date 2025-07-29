module reg6(D, WE, Clock, Resetn, Q);
input [3:0] D;
input WE, Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
reg inside[2];
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        if (WE == 1)
            Q <= D;
        else
            Q <= Q;
    inside[0] <= 1;