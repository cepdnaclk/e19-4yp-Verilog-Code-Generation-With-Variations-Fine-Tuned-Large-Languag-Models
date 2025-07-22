```
module aoi_gate(o,a1,a2,b1,b2,sel);
input a1,a2,b1,b2;
input [1:0] sel;
output o;
wire o1,o2,o3,o4;
and g1(o1,a1,a2); 
and g2(o2,b1,b2);
nor g3(o3,o1,o2);

always @(*) begin
	case(sel)
		2'b00: o = o3;
		2'b01: o = o2;
		2'b10: o = o1;