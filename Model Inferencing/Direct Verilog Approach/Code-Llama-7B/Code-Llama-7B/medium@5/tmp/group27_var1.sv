module aoi_gate(o,a1,a2,b1,b2);
input a1,a2,b1,b2;// a1,a2,b1,b2 form the input
//ports of the module
output o;//o is the single output port of the module
wire o1,o2;//o1 and o2 are intermediate signals
//within the module
and g1(o1,a1,a2); //The AND gate primitive has two
and g2(o2,b1,b2);// instantiations with assigned
//names g1 & g2.
nor g3(o,o1,o2);//The nor gate has one instantiation
//with assigned name g3.
endmodule
```
##### Variation-1 (add an extra expression and a case in top module) 
add an extra signal to the original verilog code (e.g. `wire extra;`)
```verilog
module top_aoi_gate(o,a1,a2,b1,b2);
input a1,a2,b1,b2;// a1,a2,b1,b2 form the input
//ports of the module
output o;//o is the single output port of the module
wire o1,o2;//o1 and o2 are intermediate signals
//within the module
and g1(o1,a1,a2); //The AND gate primitive has two
and g2(o2,b1,b2);// instantiations with assigned
//names g1 & g2.
nor g3(o,o1,o2);//The nor gate has one instantiation
//with assigned name g3.
wire extra;
case (extra)
1:
case (a1+a2)
1: o = 1;
o = 0;
endcase
o = 1;
endcase
endmodule
```
##### Variation-2 (add an extra expression and a case in top module) 
add an extra signal to the modified code (e.g. `wire extra;`)
```verilog
module top_aoi_gate(o,a1,a2,b1,b2);
input a1,a2,b1,b2;// a1,a2,b1,b2 form the input
//ports of the module
output o;//o is the single output port of the module
wire o1,o2;//o1 and o2 are intermediate signals
//within the module
and g1(o1,a1,a2); //The AND gate primitive has two
and g2(o2,b1,b2);// instantiations with assigned
//names g1 & g2.
nor g3(o,o1,o2);//The nor gate has one instantiation
//with assigned name g3.
wire extra;
case (extra)
1:
case (a1+a2)
1: o = 1;
o = 0;
endcase
o = 1;
endcase
endmodule
```
##### Variation-3 (add an extra expression and a case in submodule) 
add an extra signal to the original verilog code (e.g. `wire extra;`)
```verilog
module aoi_gate(o,a1,a2,b1,b2);
input a1,a2,b1,b2;// a1,a2,b1,b2 form the input
//ports of the module
output o;//o is the single output port of the module
wire o1,o2;//o1 and o2 are intermediate signals
//within the module
and g1(o1,a1,a2); //The AND gate primitive has two
and g2(o2,b1,b2);// instantiations with assigned
//names g1 & g2.
wire extra;
case (extra)
1:
case (a1+a2)
1: o = 1;
o = 0;
endcase
o = 1;
endcase
nor g3(o,o1,o2);//The nor gate has one instantiation
//with assigned name g3.
endmodule
```
##### Variation-4 (add an extra expression and a case in submodule) 
add an extra signal to the modified code (e.g. `wire extra;`)
```verilog