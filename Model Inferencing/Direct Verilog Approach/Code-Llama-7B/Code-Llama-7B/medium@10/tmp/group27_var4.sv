module aoi_gate(o,a1,a2,b1,b2,a,b,i);
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
case(i)
0: o=1'b0;
1: o=a[i];
2: o=b[i];
3: o=a[i]&b[i];
4: o=a[i]|b[i];
5: case(i)
1:o=a[i]&b[i]&b[i+1];
9:o=a[i]&b[i]&a[i+1];
10:o=a[i]&a[i+2]&b[i];
12:o=a[i]&a[i+2]&b[i+1];
5: o=a[i]|b[i]|b[i+1];
9: o=a[i]|b[i]|a[i+1];
10: o=a[i]|a[i+2]|b[i];
12: o=a[i]|a[i+2]|b[i+1];
endcase
endcase
endmodule

### Observations
The testbench and design are identical to those used in the previous lab. In this case, the input signals a, b, and i are changed to packed arrays and the output is assigned to the out variable.
### Test Results:
![image1](https://user-images.githubusercontent.com/84025301/123340868-07750780-d517-11eb-9351-b1c4226a965e.png)

### Observations
The tests pass for all the cases.

### Reference
For more information, refer to the following: \
[Verilog Tutorial – Case Statement](https://www.allaboutcircuits.com/textbook/digital/chpt-1/verilog-case-statement/) \
[Verilog Tutorial – Arrays](https://www.allaboutcircuits.com/textbook/digital/chpt-7/arrays-and-slices/)

## Part 3: Using XMR-based hierarchical index in case inside a case statement
### Base Verilog Code:
module aoi_gate(o,a1,a2,b1,b2,a,b,i,j);
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
case(i)
0: o=1'b0;
1: o=a[i];
2: o=b[i];
3: o=a[i]&b[i];
4: o=a[i]|b[i];
5: case(i)
1:o=a[i]&b[i]&b[i+1];
9:o=a[i]&b[i]&a[i+1];
10:o=a[i]&a[i+2]&b[i];
12:o=a[i]