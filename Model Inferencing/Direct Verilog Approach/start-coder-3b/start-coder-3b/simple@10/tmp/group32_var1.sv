Replace the Resetn input with an enum having default and non-default base types to test enum coverage.
#include "testbench_Clock_Prog.h"

#include "verilated.h"
#include "v_Clock_Prog.h"
#include "v_Clock_Prog__Syms.h"

#include <iostream>

class tb_Clock_Prog : public testbench_Clock_Prog
{
    v_Clock_Prog *top;
    v_Clock_Prog__Syms *top_sym_data;
    // Verilator-generated variables
    // Internal signals to the top module
    v_Clock_Prog__Syms v__DOT__TOP____V;

public:
    // Constructor
    tb_Clock_Prog();
    // Destructor
    ~tb_Clock_Prog();

    // Initialize the C++ instance into the Verilator simulation
    void init(int argc, char *argv[]);
    void begin_clock();

};

tb_Clock_Prog::tb_Clock_Prog()
{
    // Construct the instance and its symbols
    top = new v_Clock_Prog;

    // Construct the Verilator simulation
    Verilated::commandArgs(argc, argv);
    Verilated::traceEverOn(true);

    // Initialize the symbols
    // The'verilator' command line flag can be used to override the default 'v' prefix
    top_sym_data = new v_Clock_Prog__Syms(&top, top, "v__DOT__TOP____V");
    top_sym_data->mark_last_level_top();
}

void tb_Clock_Prog::init(int argc, char *argv[])
{
    // Initialize the top-level Verilator design
    top->io_clock = 0;
    top->io_resetn = 0;

    // Initialize the simulation
    Verilated::commandArgs(argc, argv);
    Verilated::debug(0);
    Verilated::traceEverOn(true);
    top->eval();
    top_sym_data->sync_reset();
    top->eval();

    // If the above is undesirable, e.g. when sensitive to clock and reset
    // signal uncertainty, you might want to disable some of them using the
    // `Wno_` prefix (see Verilator manual: https://verific.cadence.com/doc/11.0/html/index.html#command_options)
}

void tb_Clock_Prog::begin_clock()
{
    bool reset_active;

    while (!Verilated::gotFinish()) {
        reset_active = (top->io_resetn == 0);

        if (reset_active && (top->io_clock == 0)) {
            top_sym_data->clk = 1;
            Verilated::delay(1);
            top->eval();
            top_sym_data->eval();
            top_sym_data->clk = 0;
            Verilated::delay(1);
            top->eval();
            top_sym_data->eval();
        } else {
            top_sym_data->clk = 1;
            Verilated::delay(1);
            top->eval();
            top_sym_data->eval();
            top_sym_data->clk = 0;
            Verilated::delay(1);
            top->eval();
            top_sym_data->eval();
        }
    }
}

int main(int argc, char *argv[])
{
    tb_Clock_Prog tb_top;

    // Run the simulation
    tb_top.init(argc, argv);
    tb_top.begin_clock();
}
#ifndef testbench__h
#define testbench__h

#include <systemc>

// User-defined types
enum clk_t {
    CLK_LOW,
    CLK_HIGH
};
enum rst_t {
    RST_ACTIVE
};

struct testbench_Clock_Prog
{
    virtual void io_clock(clk_t clk) = 0;
    virtual void io_resetn(rst_t rst_n) = 0;
};

#endif
#include <systemc.h>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include <stdio.h>
#include <iostream>
#include "v_Clock_Prog.h"

SC_MODULE(Clock_Prog)
{
    // IOs
    sc_in<bool> clk;
    sc_out<bool> rst_n;

    // Constructor
    SC_CTOR(Clock_Prog)
    {
        SC_THREAD(ClockProg);
        reset_signal_is(rst_n, false);
    }

    // Process
    void ClockProg()
    {
        while (true) {
            if (rst_n == 0) {
                sc_stop();
            }
            wait();
        }
    }
};

int sc_main(int argc, char* argv[])
{
    // Verilator simulation
    Verilated::commandArgs(argc, argv);
    Verilated::traceEverOn(true);

    // Declare the module
    v_Clock_Prog u_Clock_Prog("v_Clock_Prog");

    // Connect IOs
    u_Clock_Prog.clk(clk);
    u_Clock_Prog.rst_n(rst_n);

    // Dump the VCD trace
    Verilated::traceEverOn(true);
    VerilatedVcdC *t_Clock_Prog_trace = new VerilatedVcdC;
    u_Clock_Prog.trace(t_Clock_Prog_trace, 99);
    t_Clock_Prog_trace->open("t_Clock_Prog.vcd");
    while (!Verilated::gotFinish()) {
        clk = 1;
        u_Clock_Prog.eval();
        t_Clock_Prog_trace->dump(clk);
        clk = 0;
        u_Clock_Prog.eval();
        t_Clock_Prog_trace->dump(clk);
    }
    t_Clock_Prog_trace->close();

    // Run the simulation
    clk = 1;
    sc_start(100, SC_NS);
    clk = 0;
    sc_start(100, SC_NS);

    // Shutdown
    SC_METHOD_EXIT(Clock_Prog, "Clock_Prog");
    wait();
}
# VHDL testbench

## SystemC
### Base HDL Code:
module Clock_Prog;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Clock_Prog is 
end Clock_Prog;

architecture beh of Clock_Prog is
signal clk : in std_logic;
signal rst_n: in std_logic;
begin
Clock_Prog : process(clk, rst_n)
begin
if rst_n='0' then
wait;
end if;
end process;

-- Run the simulation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.Clock_Prog.all;

entity tb_Clock_Prog is
end tb_Clock_Prog;

architecture arch of tb_Clock_Prog is
begin
Clock_Prog tb: entity work.Clock_Prog;
clk: signal:= '0';
rst_n: signal := '0';

-- Run the simulation
library work;
use work.Clock_Prog.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Clock_Prog is 
end Clock_Prog;

architecture beh of Clock_Prog is
signal clk : in std_logic;
signal rst_n: in std_logic;
begin
Clock_Prog : process(clk, rst_n)
begin
if rst_n='0' then
wait;
end if;
end process;

-- Run the simulation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.Clock_Prog.all;

entity tb_Clock_Prog is
end tb_Clock_Prog;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Clock_Prog is 
end Clock_Prog;

architecture beh of Clock_Prog is
signal clk : in std_logic;
signal rst_n: in std_logic;
begin
Clock_Prog : process(clk, rst_n)
begin
if rst_n='0' then
wait;
end if;
end process;
#include <systemc.h>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include <stdio.h>
#include <iostream>
#include "v_Clock_Prog.h"

SC_MODULE(Clock_Prog)
{
    // IOs
    sc_in<bool> clk;
    sc_out<bool