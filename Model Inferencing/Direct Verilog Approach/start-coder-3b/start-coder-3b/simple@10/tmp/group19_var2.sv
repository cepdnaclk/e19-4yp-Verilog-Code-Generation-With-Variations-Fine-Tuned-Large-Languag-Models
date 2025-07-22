module dff_inst(D, Clock, Resetn, Q);
input D, Clock, Resetn;
output Q;
integer[1:0] data;
data = {D,Resetn};