```verilog
module aoi_gate(o,a1,a2,b1,b2)
input [1:0] ports;
input a1,b1,a2,b2;
output o;
wire o1,o2;
and g1(o1,a1,a2);
and g2(o2,b1,b2);

case(ports)
2'b00: o1 = 1'b0;
2'b01: o1 = 1'b1;
2'b10: o1 = 1'b1;
2'b11: o1 = 1'b0;
endcase

case(ports)
2'b00: o2 = 1'b1;
2'b01: o2 = 1'b0;
2'b10: o2 = 1'b0;
2'b11: o2 = 1'b1;
endcase

nor g3(o,o1,o2);
endmodule
```