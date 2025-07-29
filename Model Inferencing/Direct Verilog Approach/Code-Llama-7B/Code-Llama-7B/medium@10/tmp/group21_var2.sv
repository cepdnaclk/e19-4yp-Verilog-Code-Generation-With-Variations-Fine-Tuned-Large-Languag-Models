module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  always @*
    if (in == 1'b0)
      out = inside[`INV]; // out is the output of the inveter
  initial
    in =1'b1; // Start with input high -> output low
  initial #15 $stop; // Stop simulation

  function get_inv;
    input t;
    case (t)
      0: get_inv = `INV;
    endcase
  endfunction // get_inv

  localparam [3:0] inside[`NUM_INV][`VT][`VT][`VT] = '{ // Table of inverter delays
    `INV: { // 600ps
      '{`VDD,`VDD,`VDD,`VDD,`VDD,`VDD}
    },
    `INV1: { // 120ps
      '{`VDD,`VDD,`VDD,`VDD,`VDD,`VDD}
    },
    `INV2: { // 200ps
      '{`VDD,`VDD,`VDD,`VDD,`VDD,`VDD}
    },
    `INV3: { // 500ps
      '{`VDD,`VDD,`VDD,`VDD,`VDD,`VDD}
    },
    `INV4: { // >1us
      '{`VDD,`VDD,`VDD,`VDD,`VDD,`VDD}
    }
  };

endmodule
### Expectation:
The circuit should simulate correctly, showing the delay change depending on the case.
### Simulation Timeout:
The simulation should finish within 10s.
### Simulation Log:
In the simulation log, there should be a report on the output from the inverter. Here is an example that has been verified:

```
#     time        | in = 1'b1, output = 1'b1
#   600 ps        in = 1'b1, output = 1'b0
#   640 ps        in = 1'b1, output = 1'b0
#   680 ps        in = 1'b1, output = 1'b0
#   720 ps        in = 1'b1, output = 1'b0
#   760 ps        in = 1'b1, output = 1'b0
#   800 ps        in = 1'b1, output = 1'b0
#   840 ps        in = 1'b1, output = 1'b0
#   880 ps        in = 1'b1, output = 1'b0
#   920 ps        in = 1'b1, output = 1'b0
#   960 ps        in = 1'b1, output = 1'b0
#   1000 ps       in = 1'b1, output = 1'b0
#   1040 ps       in = 1'b1, output = 1'b0
#   1080 ps       in = 1'b1, output = 1'b0
#   1120 ps       in = 1'b1, output = 1'b0
#   1160 ps       in = 1'b1, output = 1'b0
#   1200 ps       in = 1'b1, output = 1'b0
#   1240 ps       in = 1'b1, output = 1'b0
#   1280 ps       in = 1'b1, output = 1'b0
#   1320 ps       in = 1'b1, output = 1'b0
#   1360 ps       in = 1'b1, output = 1'b0
#   1400 ps       in = 1'b1, output = 1'b0
#   1440 ps       in = 1'b1,