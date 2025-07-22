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
and g2(o2,b1,b2);
//The AND gate primitive has two
//instantiations with assigned
//names g1 & g2.
nor g3(o,o1,o2);
//The nor gate has one instantiation
//with assigned name g3.
endmodule

### Testbench Code:

module tb;
wire o;
wire a1,a2,b1,b2;
//inputs of the module
//a1,b2,c1,c2 are inputs, a,b,c are
//intermediate signals
and_gate g1(a1,b1,c1); //Instantiates the and_gate
//module with three inputs a1,b1,c1 and
//assigns the output to a3
and_gate g2(a2,b2,c2);
//Instantiates the and_gate module with
//three inputs a2,b2,c2 and assigns the
//output to a4
wire a3,a4;
//a3 and a4 are intermediate signals.
aoi_gate g3(o,a3,a4,a1,a2);
//Instantiates the aoi_gate module
//with five inputs a3,a4,a1,a2 and assigns
//the output to o
and_gate g0(a,b,c);
//Instantiates the and_gate module with
//three inputs a,b,c and assigns the output
//to a3
wire a,b,c;
//a,b,c are intermediate signals.
//a,b,c are inputs to the and_gate.
//In the testbench, the same signal is
//used for multiple inputs.
and_gate g4(b,c,d);
and_gate g5(c,d,e);
and_gate g6(d,e,f);
nor_gate gn(g,f,e);
//Instantiates the nor_gate module with
//three inputs f,e and g and assigns the
//output to g.
//These modules are not needed, but are
//used to show that the hierarchical index can
//be accessed through the XMR.
endmodule

### Simulation Results:

[email protected]
/work/cse/281/cse281-gdb/lab2/run:

#### a1=1,a2=0,b1=1,b2=1

o=0
[email protected]
/work/cse/281/cse281-gdb/lab2/run:

#### a1=0,a2=0,b1=1,b2=0

o=1
[email protected]
/work/cse/281/cse281-gdb/lab2/run:

#### a1=1,a2=1,b1=1,b2=0

o=1
[email protected]
/work/cse/281/cse281-gdb/lab2/run:

#### a1=1,a2=0,b1=0,b2=0

o=0
[email protected]
/work/cse/281/cse281-gdb/lab2/run:

#### a1=0,a2=0,b1=0,b2=1

o=0
[email protected]
/work/cse/281/cse281-gdb/lab2/run:

#### a1=0,a2=0,b1=0,b2=0

o=1
[email protected]
/work/cse/281/cse281-gdb/lab2/run:

#### a1=0,a2=0,b1=0,b2=0

o=1

## Testbench Code:

module tb;
wire a0,a1,a2,b0,b1,b2;
//a0,b1,b2 are inputs, a1,a2 are
//intermediate signals
and_gate g1(a0,b0,a1);
//Instantiates the and_gate module with
//three inputs a0,b0,a1 and assigns the
//output to a1
and_gate g2(a1,b1,a2);
//Instantiates the and_gate module with
//three inputs a1,b1,a2 and assigns the
//output to a2
wire a3,a4;
//a3 and a4 are intermediate signals.
aoi_gate g3(o,a3,a4,a1,a2);
//Instantiates the aoi_gate module
//with five inputs a3,a4,a1,a2 and assigns
//the output to o
and_gate g0(a,b,c);
//Instantiates the and_gate module with
//three inputs a,b,c and assigns the output
//to a3
wire a,b,c;
//a,b,c are intermediate signals.
//a,b,c are inputs to the and_gate.
//In the testbench, the same signal is
//used for multiple inputs.
and_gate g4(b,c,d);
and_gate g5(c,d,e);
and_gate g6(d,e,f);
nor_gate gn(g,f,e);
//Instantiates the nor_gate module with
//three inputs f,e and g and assigns the
//output to g.
//These modules are not needed, but are
//used to show that the hierarchical index can
//be accessed through the XMR.
endmodule

### Simulation Results:

[email protected]
/work/cse/281/cse281-gdb/lab2/run:

#### a0=1,b0=0,b1=1,b2=1

o=1
[email protected]
/work/cse/281/cse281-gdb/lab2/run:

#### a0=1,b0=1,b1=0,b2=1

o=0
[email protected]
/work/cse/281/cse281-gdb/lab2/run:

#### a0=1,b0=0,b1=1,b2=0

o=1
[email protected]
/work/cse/281/cse281-gdb/lab2/run:

#### a0=1,b0=0,b1=0,b2=0

o=0
[email protected]
/work/cse/281/cse281-gdb/lab2/run:

#### a0=1,b0=1,b1=0,b2=0

o=1
[email protected]
/work/cse/281/cse281-gdb/lab2/run:

#### a0=0,b0=1,b1=1,b2=0

o=0
[email protected]
/work/cse/281/cse281-gdb/lab2/run:

#### a0=1,b0=1,b1=1,b2=1

o=1

## Testbench Code:

module tb;
wire a0,a1,a2,b0,b1,b2;
//a0,b1,b2 are inputs, a1,a2 are
//intermediate signals
and_gate g1(a0,b0,a1);
//Instantiates the and_gate module with
//three inputs a0,b0,a1 and assigns the
//output to a1
and_gate g2(a1,b1,a2);
//Instantiates the and_gate module with
//three inputs a1,b1,a2 and assigns the
//output to a2
wire a3,a4;
//a3 and a4 are intermediate signals.
aoi_gate g3(o,a3,a4,a1,a2);
//Instantiates the