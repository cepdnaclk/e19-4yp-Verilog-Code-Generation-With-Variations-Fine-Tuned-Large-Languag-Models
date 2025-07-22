module aoi_gate(o,a1,a2,b1,b2);
input a1,a2,b1,b2;
output o;
wire o1,o2;
reg[3:0] v={1,2,3,4};// Variable declaration with initialization
and g1(o1,a1,a2);
and g2(o2,b1,b2);
nor g3(o,o1,o2);
endmodule
### Original Code:
module aoi_gate(o,a1,a2,b1,b2);
input a1,a2,b1,b2;
output o;
wire o1,o2;
and g1(o1,a1,a2);
and g2(o2,b1,b2);
nor g3(o,o1,o2);
endmodule