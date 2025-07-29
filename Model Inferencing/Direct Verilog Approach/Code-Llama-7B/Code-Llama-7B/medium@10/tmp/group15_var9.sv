`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always @* begin
	ALUout = 8'b0;
	case (mode)
        0: ALUout[3:0] = left[3:0] + right[3:0];
        1: ALUout[3:0] = left[3:0] - right[3:0];
        2: ALUout[3:0] = left[3:0] & right[3:0];
        3: ALUout[3:0] = left[3:0] | right[3:0];
        default: ALUout = 8'bX;
    endcase
    case (mode)
        0: ALUout[7:4] = left[7:4] + right[7:4];
        1: ALUout[7:4] = left[7:4] - right[7:4];
        2: ALUout[7:4] = left[7:4] & right[7:4];
        3: ALUout[7:4] = left[7:4] | right[7:4];
        default: ALUout = 8'bX;
    endcase
end
endmodule`

### Simulation Screenshots
![Simulation Screenshots](simulation-screenshots/simulation-1.png?raw=true "Simulation Screenshot")

### Code Listing For Driver - top.cpp
```C++
#include <systemc.h>
#include "ALU8.h"

SC_MODULE(top)
{
	sc_in<sc_uint<4>> in1, in2;
	sc_in<sc_uint<2>> op;
	sc_out<sc_uint<8>> out;

	sc_signal<bool> signal;

	ALU8 alu8{"alu8"};

	SC_CTOR(top)
	{
		alu8.in1(in1);
		alu8.in2(in2);
		alu8.mode(op);

		alu8.out(out);
	}

	void stimulus()
	{
		in1 = 0;
		in2 = 0;
		op = 0;
		wait(signal);

		in2 = 1;
		wait(signal);

		in1 = 3;
		wait(signal);

		in2 = 4;
		wait(signal);

		in1 = 7;
		wait(signal);

		in2 = 2;
		wait(signal);

		in1 = 1;
		wait(signal);

		in2 = 2;
		wait(signal);
	}

	void watch()
	{
		while (true)
		{
			std::cout << "in1: " << std::hex << (unsigned)in1 << " in2: " << std::hex << (unsigned)in2 << " op: " << std::hex << (unsigned)op << " out: " << std::hex << (unsigned)out << std::endl;
			wait(1, SC_US);
		}
	}
};

int sc_main(int argc, char* argv[]) {
	top top1{"top1"};
	top1.in1(0);
	top1.in2(0);
	top1.op(0);
	top1.out(0);
	top1.signal(0);

	sc_start();
	return 0;
}
```
### Code Listing For Verilog testbench - top.v
```Verilog
module top(input logic [7:0] in1, in2, input logic [1:0] op, output logic [7:0] out);
	logic [1:0] mode;
	ALU8 alu8(.left(in1),.right(in2),.mode(mode),.out(out));

	initial begin
		mode =