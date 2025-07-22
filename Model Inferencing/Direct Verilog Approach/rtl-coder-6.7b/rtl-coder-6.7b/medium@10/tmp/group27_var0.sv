module aoi_gate(o, a, b);
input a;
input b;
output o;
wire o1;
wire o2;
and g1 (o1, a[0], a[1]);
and g2 (o2, b[0], b[1]);
nor g3 (o, o1, o2);
endmodule