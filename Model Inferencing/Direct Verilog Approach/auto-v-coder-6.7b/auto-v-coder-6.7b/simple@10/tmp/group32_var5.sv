```verilog
`include "VMM_SCM.sv"

// Enum declaration
typedef enum {Reset, Set} State;

// Module with the reset input as an enum
module Clock_Prog (
  input logic clk,
  input State resetn
);

// Module body
initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0, Clock_Prog);

  // reset the block
  resetn = Reset;
  #100;

  resetn = Set;
  #100;

  $finish;
end

endmodule
```
In this modified code, I've added an enum `State` as a reset input to test its coverage. This enum has two possible states, `Reset` and `Set`. The `resetn` input is set to `Reset` for the first 100 time units, then it is set to `Set` for the next 100 time units. After that, it finishes the simulation. This addition will serve as a cover for the enum coverage. Note that `State resetn` is input to the module and is to be mapped to the resetn input pin of the module.

Now the resetn input is replaced with an enum type, thus, testing its full range of values and possible combinations. This is a significant improvement of coverage for this reset input and should be done on all the reset inputs in the module.

Please note that this is an example and may not apply to your specific design. Also, running a simulation model in a real hardware design is highly recommended for complete coverage of your design.

Also, make sure to import the necessary packages or modules to use the `$finish` function, as it's not part of the basic SystemVerilog language.

This is a basic example and may not serve your needs completely, but it provides a solid groundwork for further expansion. Also, please ensure that proper timing is considered in your hardware design. In this example, there is no delay between the state transitions, you may want to adjust it to simulate a more realistic scenario if you are going to test the design in hardware.```verilog
`include "VMM_SCM.sv"

// Enum declaration
typedef enum {Reset,