module aoi_gate(o,a1,a2,b1,b2);
input a1,a2,b1,b2;
output o;
wire o1,o2;
and g1(o1,a1,a2);
and g2(o2,b1,b2);
nor g3(o,o1,o2);
case ({a1,a2,b1,b2})
4'b1011:o=a1;
4'b0100:o=b1;
4'b0110:o=b1;
4'b0111:o=b1;
4'b0011:o=a1;
4'b1100:o=b2;
4'b1101:o=b2;
4'b1110:o=b2;
4'b1111:o=b2;
endcase
endmodule