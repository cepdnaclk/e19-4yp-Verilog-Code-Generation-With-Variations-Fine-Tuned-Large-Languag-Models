module bcu(s,b1, b2, b3, b4, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12);
input s, b1, b2, b3, b4, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12;
output s1, s2, s3, s4;
case (s)
s == 0:
assign s1 = b1 & b3 & b4 & g1 & g4 & g5 & g8;
assign s2 = b1 & b2 & b3 & b4 & g1 & g2 & g3 & g6 & g7 & g9 & g10 & g11 & g12;
assign s3 = b1 & b2 & b3 &