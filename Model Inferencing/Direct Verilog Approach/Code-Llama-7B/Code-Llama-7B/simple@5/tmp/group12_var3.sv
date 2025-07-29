module Problem1(input [3:0] a, b, output [3:0] sum);
  logic [3:0] di;
  logic clk;

  assign sum = a + b;

  always_ff @(negedge clk)
    di <= a + b;
endmodule
### Modified C Code:
/*
 * Created on: Dec 1, 2020
 * Author: Jacob
 *
 * Drivers for Problem1 module for use with SystemVerilog
 */

#include <stdint.h>
#include <stdlib.h>

#include "systemc.h"

SC_MODULE(driver) {
  SC_CTOR(driver) {}
  virtual void clock_tick() = 0;
  virtual void reset() = 0;

  void sc_start() {
    reset();
    while (true) {
      for (int i = 0; i < 50; i++) {
        clock_tick();
      }
    }
  }
};

SC_MODULE(driver1) : public driver {
  sc_in<sc_logic> a, b, sum;

  void clock_tick() {
    sc_time delay = sc_time(1, SC_NS);
    a = 0x1;
    b = 0x2;
    sc_start(delay);
    cout << "a = " << a << " b = " << b << " sum = " << sum << endl;

    a = 0x3;
    b = 0x4;
    sc_start(delay);
    cout << "a = " << a << " b = " << b << " sum = " << sum << endl;
  }

  void reset() {}
};

int sc_main(int argc, char *argv[]) {
  driver1 *d1 = new driver1("d1");
  sc_start();
  return 0;
}
### Testbench Code:
module Problem1_tb;
  Problem1 DUT(a, b, sum);
  logic [3:0] a, b, sum;