```verilog
module Problem1(input [3:0] a, b, output [3:0] sum);
  assign sum = a + b;
endmodule
```
### Variation Results:
[Problem1.v](https://github.com/fredl900/SystemVerilogExperiments/blob/master/Experiment3/Problem1.v)
```
Testbench successfully compiled.
Running Verilator output file simulation.
Loading system verilog module.

Simulation complete.

Verilator output reports the following warnings:
```
/Experiment2/Problem1.c
#include <systemc.h>

SC_MODULE (Problem1)
{
    sc_in<sc_uint<4>> a;
    sc_in<sc_uint<4>> b;
    sc_out<sc_uint<4>> sum;
    SC_CTOR (Problem1)
    {
        SC_METHOD (adder);
        sensitive << a << b;
    }
    void adder()
    {
        sum.write(a.read() + b.read());
    }
};

int sc_main (int argc, char* argv[])
{
    Problem1 problem("problem");
    sc_trace_file* tf = sc_create_vcd_trace_file("testbench");

    tf->set_time_unit(1, SC_PS);

    sc_signal<sc_uint<4>> a, b, sum;

    problem.a(a);
    problem.b(b);
    problem.sum(sum);

    sc_start(1000, SC_PS);
    a = 5;
    b = 2;
    sc_start(1000, SC_PS);
    tf->dump(0);

    sc_start(1000, SC_PS);
    a = 3;
    b = 1;
    sc_start(1000, SC_PS);
    tf->dump(0);

    sc_start(1000, SC_PS);
    a = 8;
    b = 9;
    sc_start(1000, SC_PS);
    tf->dump(0);

    sc_start(1000, SC_PS);
    a = 9;
    b = 9;
    sc_start(1000, SC_PS);
    tf->dump(0);

    sc_start(1000, SC_PS);
    tf->dump(1);
    tf->write_trace();

    sc_destroy_vcd_trace_file(tf);

    sc_close_vcd_trace_file(tf);

    return 0;
}