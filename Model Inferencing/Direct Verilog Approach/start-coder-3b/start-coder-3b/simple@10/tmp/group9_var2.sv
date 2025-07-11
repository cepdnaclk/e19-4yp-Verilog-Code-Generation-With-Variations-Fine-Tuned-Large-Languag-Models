module Problem5_tb;
  reg [3:0] a, b;
  reg [3:0] diff;
  
  initial begin
    a = 4'b0010;
    b = 4'b0100;
    
    #100;
    $dumpfile("Problem5_tb.vcd");
    $dumpvars;
  end
  
  initial begin
    #100000;
  end
endmodule

Module Problem5_tb

// Generated by Verilator 3.9.6
// Verilator is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.
// Verilator requires maximum redistribution limitations under both the Verilator Public License and the GNU General Public License.  See the files COPYING.VL and COPYING.GPL for details.
// There is NO WARRANTY, to the extent permitted by law.  Type "verilator --help" for more information.
// Date: Mon Nov  2 10:59:47 MST 2020
// Compiler flags:  +0
// Module name    : Problem5_tb

// Include any architecture specific header files you need here.
// e.g. #include <VYourModule.h>
#include "VProblem5_tb.h"
#include <verilated_vcd_c.h>

#include <iostream>

// Define the verilated module name.
VL_MODULE(Problem5_tb) {
  // Define the top level instance.
  VProblem5_tb* top = new VProblem5_tb;

#ifndef VL_DPI_IN_COMPILE
  // Set up tracing.
  Verilated::traceEverOn(true);
  VerilatedVcdC* Tfp = new VerilatedVcdC;
  top->trace(Tfp, 99);
  Tfp->open("Problem5_tb.vcd");
#endif

  // Do any other initializations.
#ifdef VL_DPI_IN_COMPILE
  printf("running init_dpi\n");
#endif

#ifdef VL_DPI_IN_COMPILE
  // Set up the DPI function from C++.
  // Call the C++ function "do_dpi" exported from the DPI library.
  // This function does not take arguments and does not return a value.
  void (*do_dpi)() = (void (*)())dpi_import_symbol("do_dpi");
  do_dpi();
#endif

  // Generate an initial value for the DPI function from C++.
  // Call the C++ function "get_dpi" exported from the DPI library.
  // This function returns a string value and takes a pointer to a char buffer.
  char buf[1024];
  void (*get_dpi)(char*) = (void (*)(char*))dpi_import_symbol("get_dpi");
  get_dpi(buf);

  // Execute the simulation for duration ns.
  // Do this by reading all of the time units.
  while (Verilated::gotFinish() == false) {
    top->eval();
  }

  // Close the VCD trace file and, if present, dump the trace to a file.
  Tfp->close();
  if (Verilated::gotFinish()) exit(1);
}

// main