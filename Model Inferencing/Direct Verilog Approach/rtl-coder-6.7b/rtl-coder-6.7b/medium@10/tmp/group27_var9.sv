module aoi_gate(o,a1,a2,b1,b2);
input a1,a2,b1,b2;
//ports of the module
output o;
wire o1,o2;
//o1 and o2 are intermediate signals
//within the module
and g1(o1,a1,a2);
//The AND gate primitive has two
//instantiations with assigned
//names g1 & g2.
nor g3(o,o1,o2);
//The nor gate has one instantiation
//with assigned name g3.
endmodule
### Variation Instruction:
Add a case with inside expression on a packed array accessed with XMR-based hierarchical index.