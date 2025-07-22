module tst_CMOSsw1_mod();
  reg in,con; wire out;
  CMOSsw1 cmsw(out,in,con); // Instantiate CMOS switch
  initial begin in=1'b0; con=1'b1; end // Start enabled
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
  initial #20 $stop; // Stop simulation
  // To Do: Add function call to see if indexed access result matches a slice range
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
endmodule
### Simulate Code:
./isim -g tst_CMOSsw1_mod
### Test Code:
./test tst_CMOSsw1_mod
/examples/CMOS_Switch/tst_CMOSsw1.cpp
// Timing Simulation of Verilog Code CMOS_Switch
#include <systemc.h>
#include <iostream>
#include "CMOSsw1.h"

// Base Verilog Code:
// module tst_CMOSsw1();
//   reg in,con; wire out;
//   CMOSsw1 cmsw(out,in,con); // Instantiate CMOS switch
//   initial begin in=1'b0; con=1'b1; end // Start enabled
//   always #5 in =~in; // Toggle data
//   always #3 con=~con; // Toggle control
//   initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
//   initial #20 $stop; // Stop simulation
// endmodule

// Variation Instruction:
// Use inside in final block to check if function call result indexed into an array matches a slice range.

// Modified Code:
// To Do: Add function call to see if indexed access result matches a slice range
// module tst_CMOSsw1_mod();
//   reg in,con; wire out;
//   CMOSsw1 cmsw(out,in,con); // Instantiate CMOS switch
//   initial begin in=1'b0; con=1'b1; end // Start enabled
//   always #5 in =~in; // Toggle data
//   always #3 con=~con; // Toggle control
//   initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
//   initial #20 $stop; // Stop simulation
//   // To Do: Add function call to see if indexed access result matches a slice range
//   initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
// endmodule

// Simulate Code:
//./isim -g tst_CMOSsw1_mod
// Test Code:
//./test tst_CMOSsw1_mod

SC_MODULE(tst_CMOSsw1_mod){
  sc_in<bool> clk;
  sc_in<bool> rst;
  sc_in<bool> in;
  sc_in<bool> con;
  sc_out<bool> out;
  sc_signal<bool> out_sig;
  sc_signal<bool> in_sig;
  sc_signal<bool> con_sig;
  CMOSsw1* cmsw;
  sc_trace_file* tf;

  void check_out(){
    std::cout << std::hex << "in " << std::setw(2) << std::setfill('0') << in.read() << " | con " << std::setw(2) << std::setfill('0') << con.read() << " | out " << std::setw(2) << std::setfill('0') << out.read() << std::endl;
  }

  void test_out(){
    std::cout << "in " << std::setw(2) << std::setfill('0') << in.read() << " | con " << std::setw(2) << std::setfill('0') << con.read() << " | out " << std::setw(2) << std::setfill('0') << out_sig.read() << std::endl;
  }

  void test_in(){
    std::cout << "in " << std::setw(2) << std::setfill('0') << in_sig.read() << " | con " << std::setw(2) << std::setfill('0') << con_sig.read() << " | out " << std::setw(2) << std::setfill('0') << out_sig.read() << std::endl;
  }

  void test_con(){
    std::cout << "in " << std::setw(2) << std::setfill('0') << in_sig.read() << " | con " << std::setw(2) << std::setfill('0') << con_sig.read() << " | out " << std::setw(2) << std::setfill('0') << out_sig.read() << std::endl;
  }

  void test_in_sig(){
    std::cout << "in " << std::setw(2) << std::setfill('0') << in_sig.read() << " | con " << std::setw(2) << std::setfill('0') << con_sig.read() << " | out " << std::setw(2) << std::setfill('0') << out_sig.read() << std::endl;
  }

  void test_con_sig(){
    std::cout << "in " << std::setw(2) << std::setfill('0') << in_sig.read() << " | con " << std::setw(2) << std::setfill('0') << con_sig.read() << " | out " << std::setw(2) << std::setfill('0') << out_sig.read() << std::endl;
  }

  void test_out_sig(){
    std::cout << "in " << std::setw(2) << std::setfill('0') << in_sig.read() << " | con " << std::setw(2) << std::setfill('0') << con_sig.read() << " | out " << std::setw(2) << std::setfill('0') << out_sig.read() << std::endl;
  }

  void test_cmsw_out(){
    std::cout << "in " << std::setw(2) << std::setfill('0') << in.read() << " | con " << std::setw(2) << std::setfill('0') << con.read() << " | out " << std::setw(2) << std::setfill('0') << cmsw->out.read() << std::endl;
  }

  void run_test(){
    sc_start(10,SC_NS);
    in.write(0);
    out.write(0);
    sc_start(10,SC_NS);
    in.write(1);
    out.write(0);
    sc_start(10,SC_NS);
    in.write(1);
    out.write(1);
    sc_start(10,SC_NS);
    in.write(0);
    out.write(1);
    sc_start(10,SC_NS);
    in.write(0);
    out.write(0);
    sc_start(10,SC_NS);
    in.write(0);
    out.write(1);
    sc_start(10,SC_NS);
    in.write(1);
    out.write(0);
    sc_start(10,SC_NS);
    in.write(1);
    out.write(1);
    sc_start(10,SC_NS);
    in.write(0);
    out.write(1);
    sc_start(10,SC_NS);
    in.write(0);
    out.write(0);
    sc_start(10,SC_NS);
    in.write(0);
    out.write(1);
    sc_start(10,SC_NS);
    in.write(1);
    out.write(1);
    sc_start(10,SC_NS);
    in.write(1);
    out.write(0);
    sc_start(10,SC_NS);
    in.write(1);
    out.write(0);
    sc_start(10,SC_NS);
    in.write(1);
    out.write(1);
    sc_start(