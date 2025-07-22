module reg7(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
dynamic [3:0] dynamic_D;
always @(*)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        Q <= dynamic_D[4];
endmodule