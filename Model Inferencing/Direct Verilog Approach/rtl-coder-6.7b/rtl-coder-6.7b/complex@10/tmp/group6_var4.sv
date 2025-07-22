module mux5to1(w0, w1, w2, w3, w4, S, f);
input w0, w1, w2, w3, w4;
input [2:0] S;
output f;
reg f;
always @(w0 or w1