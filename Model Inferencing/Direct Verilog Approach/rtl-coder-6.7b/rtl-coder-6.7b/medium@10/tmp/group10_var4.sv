module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
integer i;
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        assign Q[i] = D;
endmodule