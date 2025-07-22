module netdelay4(x,y,z);
input x;
output y,z;
wire #(2,1) nn; // Declare wire 'nn' with rise=2, fall=1 delay
wire #(4) op; // Declare wire 'op' with rise=4 delay
wire #(4,2,4,1) op2;
not (nn,x); // Assign NOT(x) to 'nn' (takes effect after rise/fall delay)
not #(7) (op,nn); // Assign NOT(nn) to 'op' (takes effect after rise/fall delay)
not #(5) (op2,op); // Assign NOT(op) to 'op2' (takes effect after rise/fall delay)
assign y=op[1:0]; // Assign 'op' to 'y' (direct assignment)
assign z=op2; // Assign 'op2' to 'z' (direct assignment)
endmodule

## Test Programs

### netdelay1

module netdelay1(x,y);
input x;
output y;
wire #(2,1) nn; // Declare wire 'nn' with rise=2, fall=1 delay
not (nn,x); // Assign NOT(x) to 'nn' (takes effect after rise/fall delay)
assign y=nn; // Assign 'nn' to 'y' (direct assignment)
endmodule

### netdelay2

module netdelay2(x,y,z);
input x;
output y,z;
wire #(2,1) nn; // Declare wire 'nn' with rise=2, fall=1 delay
wire #(4) op; // Declare wire 'op' with rise=4 delay
wire #(4,2,4,1) op2;
not (nn,x); // Assign NOT(x) to 'nn' (takes effect after rise/fall delay)
not #(7) (op,nn); // Assign NOT(nn) to 'op' (takes effect after rise/fall delay)
not #(5) (op2,op); // Assign NOT(op) to 'op2' (takes effect after rise/fall delay)
assign y=op; // Assign 'op' to 'y' (direct assignment)
assign z=op2; // Assign 'op2' to 'z' (direct assignment)
endmodule

### netdelay3

module netdelay3(x,y,z);
input x;
output y,z;
wire #(2,1) nn; // Declare wire 'nn' with rise=2, fall=1 delay
wire #(4) op; // Declare wire 'op' with rise=4 delay
wire #(4,2,4,1) op2;
not (nn,x); // Assign NOT(x) to 'nn' (takes effect after rise/fall delay)
not #(7) (op,nn); // Assign NOT(nn) to 'op' (takes effect after rise/fall delay)
not #(5) (op2,op); // Assign NOT(op) to 'op2' (takes effect after rise/fall delay)
assign y=op[1]; // Assign 'op' to 'y' (direct assignment)
assign z=op2; // Assign 'op2' to 'z' (direct assignment)
endmodule

### netdelay4

module netdelay4(x,y,z);
input x;
output y,z;
wire #(2,1) nn; // Declare wire 'nn' with rise=2, fall=1 delay
wire #(4) op; // Declare wire 'op' with rise=4 delay
wire #(4,2,4,1) op2;
not (nn,x); // Assign NOT(x) to 'nn' (takes effect after rise/fall delay)
not #(7) (op,nn); // Assign NOT(nn) to 'op' (takes effect after rise/fall delay)
not #(5) (op2,op); // Assign NOT(op) to 'op2' (takes effect after rise/fall delay)
assign y=op[1:0]; // Assign 'op' to 'y' (direct assignment)
assign z=op2; // Assign 'op2' to 'z' (direct assignment)
endmodule

## Test Result

![netdelay1.png](./netdelay1.png?raw=true)

![netdelay2.png](./netdelay2.png?raw=true)

![netdelay3.png](./netdelay3.png?raw=true)

![netdelay4.png](./netdelay4.png?raw=true)
/test_bench/netdelay/netdelay.h
#include <verilated.h>
#define ILP 0
#define LP 1
#define HP 2
/test_bench/delays/netdelay_1.cpp
#include <iostream>
#include <verilated.h>
#include "netdelay.h"
using namespace std;

int main(int argc, char **argv)
{
	Verilated::commandArgs(argc, argv); // Add cmdline args to sim

	// instantiate module
	netdelay m;

	// initialize input and output ports
	m->x = 0b1;
	m->clk = 0;
	m->rst = 0;
	m->op = 0;
	m->en = 0;
	cout << "x\t"
		 << "op\t"
		 << "en\t" << endl;

	// time loop
	for (int i = 0; i < 1; ++i)
	{

		m->clk = 0;
		m->eval();
		m->clk = 1;
		m->eval();
		cout << m->x << "\t"
			 << m->op << "\t"
			 << m->en << endl;

		m->rst = 1;
		m->eval();
		m->rst = 0;
		m->eval();
	}

	return 0;
}
/test_bench/logic/logic_2.cpp
#include <iostream>
#include <verilated.h>
#include "logic.h"
using namespace std;

int main(int argc, char **argv)
{
	Verilated::commandArgs(argc, argv); // Add cmdline args to sim

	// instantiate module
	logic m;

	// initialize input and output ports
	m->x = 0b1;
	m->op = 0;
	m->en = 0;
	m->clk = 0;
	m->rst = 0;

	cout << "x\t"
		 << "op\t"