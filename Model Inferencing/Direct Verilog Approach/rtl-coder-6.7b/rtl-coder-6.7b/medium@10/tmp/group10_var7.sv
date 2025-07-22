module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        Q[13] = D[13];
        Q[12] = D[12];
        Q[11] = D[11];
        Q[10] = D[10];
        Q[9] = D[9];
        Q[8] = D[8];
        Q[7] = D[7];
        Q[6] = D[6];
        Q[5] = D