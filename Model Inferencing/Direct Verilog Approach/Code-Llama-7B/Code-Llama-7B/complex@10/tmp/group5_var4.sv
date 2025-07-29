module mealy(Clock, Resetn, w, z);
input Clock, Resetn, w;
output z;
reg y, Y, z;
parameter A = 0, B = 1;
class svclass;
parameter N = 2, K = 8;
bit [N - 1 : 0] lut [0 : 2 ** K - 1] = {B, A, A, B, B, A, A, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B, A, A, B, B