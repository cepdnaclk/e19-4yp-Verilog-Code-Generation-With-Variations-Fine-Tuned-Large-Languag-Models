package pkg;

import std.logic.*; // Import std logic package of gates
import std.logic.bit.bitop.*; // Import bit operations

interface ha_9;

  `ifdef WITH_RISE_DELAY
    initial begin // Initialise the rise delay
      #delay (1'd1,5'd5) 0;
    end
  `endif

  `ifdef WITH_FALL_DELAY
    initial begin // Initialise the fall delay
      #delay (1'd1,5'd5) 1;
    end
  `endif

  `ifdef WITH_CLK_PACK
    // Packed clock structure
    packed struct tstha_9_clk_struct {
      input clk_a_in;
      input clk_b_in;
      input clk_c_in;
    } clk_in;

    // Packed output structure
    packed struct tstha_9_out_struct {
      output s,ca;
    } `ifdef WITH_RISE_DELAY
      output rise_delayed_s, rise_delayed_ca;
    `endif

    // Packed input structure
    packed struct tstha_9_in_struct {
      input a,b;
    } `ifdef WITH_RISE_DELAY
      input rise_delayed_a, rise_delayed_b;
    `endif

    // Packed signals
    packed {
      bit[3:0] a;
      bit[3:0] b;
    } clk_in_a, clk_in_b;

    // Convert packed struct instances to individual wires
    wire a, b;
    wire rise_delayed_a, rise_delayed_b;

    // Convert bit-vector signals to individual wires
    wire ca;
    wire s;
    wire rise_delayed_s;
    wire rise_delayed_ca;
  `else
    packed struct tstha_9_in_struct {
      input a,b;
    } `ifdef WITH_RISE_DELAY
      input rise_delayed_a, rise_delayed_b;
    `endif

    // Packed signals
    packed {
      bit[3:0] a, b;
    } `ifdef WITH_RISE_DELAY
      input rise_delayed_a, rise_delayed_b;
    `endif

    // Convert packed struct instances to individual wires
    wire a, b;
    wire rise_delayed_a, rise_delayed_b;

    // Convert bit-vector signals to individual wires
    wire ca;
    wire s;
  `endif

  // Output signals
  output s, ca

  `ifdef WITH_RISE_DELAY
    output rise_delayed_s, rise_delayed_ca;
  `endif

  `ifdef WITH_CLK_PACK
    // Instantiate the component in the ha_9 gate
    ha_9 ha_instance(
     .s(s),
     .ca(ca),
     .a(rise_delayed_a),
     .b(rise_delayed_b),
     .clk_in(clk_in)
    );
  `else
    // Instantiate the component in the ha_9 gate
    ha_9 ha_instance(
     .s(s),
     .ca(ca),
     .a(a),
     .b(b)
    );
  `endif

  `ifdef WITH_RISE_DELAY
    initial begin
      #delay (1'd1,5'd5) 0; // Initialise the rise delay
      #delay (1'd1,5'd5) 1; // Initialise the fall delay
      #delay (1'd1,5'd5) 0; // Initialise the rise delay
      #delay (1'd1,5'd5) 1; // Initialise the fall delay
    end
  `endif

endinterface // End interface definition

module ha_9(
  output s,
  output ca,
  input a,
  input b,
  clk_in
);

  // Local variables
  wire a,b;
  wire t,c;
  wire s;
  wire ca;

  // Wire up the 9 bit register
  `ifdef WITH_CLK_PACK
    reg [3:0] r_a,r_b;
    reg [3:0] r_s,r_ca;

    `ifdef WITH_RISE_DELAY
      assign `ifdef WITH_CLK_PACK
        r_a = $bitslice(clk_in.clk_a_in, 0, 4);
        r_b = $bitslice(clk_in.clk_b_in, 0, 4);
        r_s = $bitslice(clk_in.clk_c_in, 0, 4);
        r_ca = $bitslice(clk_in.clk_c_in, 4, 1);
      `else
        assign a = $bitslice(clk_in, 0, 4);
        assign b = $bitslice(clk_in, 4, 4);
        assign s = $bitslice(clk_in, 8, 4);
        assign ca = $bitslice(clk_in, 12, 1);
      `endif
    `else
      assign a = $bitslice(clk_in, 0, 4);
      assign b = $bitslice(clk_in, 4, 4);
      assign s = $bitslice(clk_in, 8, 4);
      assign ca = $bitslice(clk_in, 12, 1);
    `endif
  `else
    assign a = a;
    assign b = b;
    assign s = s;
    assign ca = ca;
  `endif

  // Generate output s and carry output ca
  always @(a,b) begin
    t = a xor b;
    c = a&b;
    s = t xor c;
  end

    // Generate output s and carry output ca
  always @(a,b) begin
    t = a xor b;
    c = a&b;
    ca = c;
    s = t;
  end

  // Assign output signals
  assign s = s;
  assign ca = ca;

  // Assign packed output signals
  `ifdef WITH_RISE_DELAY
    assign rise_delayed_s = s;
    assign rise_delayed_ca = ca;
  `endif

  // Assign packed input signals
  `ifdef WITH_CLK_PACK
    `ifdef WITH_RISE_DELAY
      assign rise_delayed_a = r_a;
      assign rise_delayed_b = r_b;
    `else
      assign a = r_a;
      assign b = r_b;
    `endif

    assign clk_in.clk_a_in = a;
    assign clk_in.clk_b_in = b;
    assign clk_in.clk_c_in = s;
  `endif

  // Assign unpacked input signals
  `ifdef WITH_CLK_PACK
    `ifdef WITH_RISE_DELAY
      assign a = clk_in_a;
      assign b = clk_in_b;
    `else
      assign a = clk_in.a;
      assign b = clk_in.b;
    `endif
  `endif

endmodule
### Modified Testbench:
`ifndef WITH_CLK_PACK

  module tstha_9();
    initial begin
      reg a,b;
      a=0;
      b=0;
      $dumpvars;
    end
    always begin #5 a=1;b=0; #5 a=0;b=1; #5 a=1;b=1; #5 a=0;b=0; end
    initial $monitor($time, " a = %b, b = %b,out carry = %b, outsum = %b ",a,b,ca,s);
    initial #30 $stop;
  endmodule

`else

  module tstha_9();
    reg a,b;
    initial begin
      a=0;
      b=0;
      $dumpvars;
    end
    always begin #5 a=1;b=0; #5 a=0;b=1; #5 a=1;b=1; #5 a=0;b=0; end
    initial $monitor($time, " a = %b, b = %b,out carry = %b, outsum = %b ",a,b,ca,s);
    initial #30 $stop;
  endmodule

`endif

### Gatenames to be used for the test:
ha_9
### Testbench command:
$vlib $(VLOG_WORKER_DIR)
$vlib_compile
$vsim -sv_lib $(VLOG_WORKER_DIR) -c tstha_9
#include <iostream>
#include <string>
#include <sstream>
#include <fstream>
#include "gtest/gtest.h"
#include "gmock/gmock.h"
#include "ha_9.h"

using testing::Eq;
using testing::Gt;
using testing::Neq;

TEST(TestHa9, TestAll_Input) {
  ha_9 ha_test1;
  EXPECT_EQ(ha_test1.run(0, 0), 0);
  EXPECT_EQ(ha_test1.run(0, 1), 1);
  EXPECT_EQ(ha_test1.run(1, 0),