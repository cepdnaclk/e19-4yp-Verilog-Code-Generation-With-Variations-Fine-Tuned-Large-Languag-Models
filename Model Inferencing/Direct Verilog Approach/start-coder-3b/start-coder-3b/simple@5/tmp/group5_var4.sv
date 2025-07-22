module tst_dff_pbeh();
  logic di,clk; logic[1:0] do;
  dff_p d1(do,di,clk); // Instantiate DFF with path delay
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  always #5 di=~di; // Toggle data
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule
/codeblocks/examples/basic_testing/Makefile
#
#
#

all: tst_dff_pbeh

include../../makefiles/verilator_makefile
/codeblocks/examples/basic_testing/tst_dff_pbeh.h
//
//  tst_dff_pbeh.h
//  codeblocks/examples/basic_testing
//
//  Created by  on 12/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifndef codeblocks_examples_basic_testing_tst_dff_pbeh_h
#define codeblocks_examples_basic_testing_tst_dff_pbeh_h

#define time_resolution 1.0e-9
#define time_scale 1.0e9
#define time_units s

#define clk period
#define clk_period 20.0e-6

#endif
/codeblocks/examples/basic_testing/tst_dff_pbeh.cpp
//
//  main.c
//
//  main.c
//  codeblocks/examples/basic_testing
//
//  Created by  on 12/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

//#include "tst_dff_pbeh.h"
#include <iostream>
using namespace std;
#include <verilated.h>

#include "Vtst_dff_pbeh.h"
#include "Vtst_dff_pbeh__Syms.h"

#include "tst_dff_pbeh.h"
#include "test_lib.h"

//
//
//

// Define clock period in seconds and frequency in Hz
// Note that the frequency is used to set the testbench time.
const double clk_period = time_period;

// Verilator includes
#include "verilated.h" // Verilator C++ interface
#include "verilated_vcd_c.h" // Verilator VCD tracing

Vtst_dff_pbeh *vl;

bool test_done = false;

vluint64_t main_time = 123456789; // Current simulation time
// This is a 64-bit integer to reduce wrap over issues and
// allow modulus.  You can also use a double, if you wish.

// main time-advance function
double global_timeadvance() {
    double _rval = 0.0; // Assume nothing happens
    if (!test_done) {
        vl->clk =!vl->clk;
        _rval = clk_period;
    }
    return _rval;
} // end global_timeadvance

// Functions to call before/after every time step
void global_pretimestep() {
    vl->eval(); // Evaluate model
    if (vl->trace()) { // If verilator is tracing signals, do so
        Verilated::traceEverOn(true);
        vl->trace(VcdC::tfp(), 99);
        vl->trace(VcdC::tfp(), 0);
    }
}

void global_posttimestep() {
}

//
//
//

int main(int argc, char **argv, char **env) {
    // Initializing Verilator
    Verilated::commandArgs(argc, argv); // Remember args
    Verilated::traceEverOn(true); // Verilator trace

//    // Initialization of Verilator model
//    Verilated::randReset(2); // Random reset
//    while (!Verilated::gotFinish()) { // Run until finish
//        global_timeadvance();
//        global_pretimestep();
//        global_posttimestep();
//    }

    // Verilator simulation
	vl = new Vtst_dff_pbeh;
    vl->clk = 0;
    vl->eval(); // Evaluate model

//    // Verilator simulation timing
    VL_PRINTF("Testing %s\n", vl->name());
    vl->clk = 1;
    vl->eval(); // Evaluate model

    test_done = 0; // Test is not done yet

    // Initialization of Verilator model
    Verilated::randReset(2); // Random reset

    // Initialize testbench
    while (!Verilated::gotFinish()) {
        // Advance time
        global_timeadvance();
        // Call before time step
        global_pretimestep();
        // Call after time step
        global_posttimestep();

        // Do testbench stuff
        test_dff_pbeh(vl);

        // Finish if test is done
        if (test_done) break;
    }

    // Close any open files and finish
    vl->final(); // Destructor will perform cleanup
    return 0;
}