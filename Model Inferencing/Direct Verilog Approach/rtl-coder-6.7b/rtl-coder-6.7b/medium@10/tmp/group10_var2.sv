module reg4(D, Clock, Resetn, Q);
parameter N = 4;
input [N-1:0] D;
input Clock, Resetn;
output [N-1: