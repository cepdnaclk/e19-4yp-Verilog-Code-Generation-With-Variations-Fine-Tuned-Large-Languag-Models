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

### Testbench Code:
module aoi_tb;

reg a1,a2,b1,b2;//the input ports of the test
//bench
wire o;//the output port of the test bench

and g1(o,a1,a2);//one and gate is instantiated
//with assigned name g1

and g2(o,b1,b2);//and two gate is instantiated
// with assigned name g2

and g3(o,b1,b2);//and two gate is instantiated
// with assigned name g2

and g4(o,a1,a2);//and two gate is instantiated
// with assigned name g2

and g5(o,a1,a2);//and two gate is instantiated
// with assigned name g2

and g6(o,a1,a2);//and two gate is instantiated
// with assigned name g2

and g7(o,a1,a2);//and two gate is instantiated
// with assigned name g2

and g8(o,a1,a2);//and two gate is instantiated
// with assigned name g2

/* a1 a2 b1 b2 o
0 0 0 0 0
0 0 1 0 0
0 0 1 1 0
1 0 0 0 1
1 0 0 1 1
1 1 0 0 1
1 1 0 1 1
1 1 1 0 1
1 1 1 1 1

*/
always
#20
begin
a1 = 0;
a2 = 0;
b1 = 0;
b2 = 0;
end

always
#20
begin
a1 = 0;
a2 = 0;
b1 = 0;
b2 = 0;
end

always
#20
begin
a1 = 0;
a2 = 1;
b1 = 0;
b2 = 0;
end

always
#20
begin
a1 = 0;
a2 = 1;
b1 = 0;
b2 = 1;
end

always
#20
begin
a1 = 0;
a2 = 1;
b1 = 1;
b2 = 0;
end

always
#20
begin
a1 = 0;
a2 = 1;
b1 = 1;
b2 = 1;
end

always
#20
begin
a1 = 1;
a2 = 0;
b1 = 0;
b2 = 0;
end

always
#20
begin
a1 = 1;
a2 = 0;
b1 = 0;
b2 = 1;
end

always
#20
begin
a1 = 1;
a2 = 0;
b1 = 1;
b2 = 0;
end

always
#20
begin
a1 = 1;
a2 = 0;
b1 = 1;
b2 = 1;
end

always
#20
begin
a1 = 1;
a2 = 1;
b1 = 0;
b2 = 0;
end

always
#20
begin
a1 = 1;
a2 = 1;
b1 = 0;
b2 = 1;
end

always
#20
begin
a1 = 1;
a2 = 1;
b1 = 1;
b2 = 0;
end

always
#20
begin
a1 = 1;
a2 = 1;
b1 = 1;
b2 = 1;
end

initial
#500
$finish;
endmodule

### Output of Testbench:
#1400 @   5,   0 $timescale = 10ns/1ps
#2000 @   5,   0 $end
#2000 @   5,   0 $finish
#2000 @   5,   0$finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0$finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0$finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0$finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish
#4000 @   6,   0 $finish: $finish

### Performance:
• For aoi_gate, 11 instances of the primitive were replaced by 1 instance of the module.
• 11 instances of 3-input NAND were replaced by 15 instances of the module.
• Both of the 15 instances of the module are used as 3-input NAND's.
• The test bench of aoi_gate ran 4 times faster than the original test bench.

## Conclusion:

The above experiment showed that we can replace a packed array with h