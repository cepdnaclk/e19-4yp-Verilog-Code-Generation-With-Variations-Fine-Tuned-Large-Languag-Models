module ttst_ttrimux2_1();
reg e;
reg [1:0]i; // Should be reg i0, i1; or reg [0:0] i0, i1; or just input wires if MUX takes separate inputs
reg s;
wire out; // Added wire declaration
// ttrimux2_1 mm(out,e,i,s); // Instantiation requires correct MUX definition
initial
begin
e =0; i = 2'b00; s = 1'b0; // Added initial's' value
end
always
begin
end
initial $monitor($time," enable e = %b, s= %b, input i = %b,output out = %b ",e,escape$s,i,out); // Added escape$s in monitor code
initial #48 $stop; endmodule ## 6.2.44 Timing Constraints Timing constraints are optional, but they can help to define the speed of signals, and the accuracy of timing results for a simulation. Syntax of a timing constraint: `time::(event_expression) (event_expression)` Timing events to be checked, and their timing relationships. ### Example: initial @(posedge clk) #100$display("Hey");

## 6.2.45 Timing Analysis

To run a timing analysis (synthesis) of your design, you need to:

• Define a timing network (clock domain) using the timing module (clockdomain) of the clocking library.
• Define path constraints for each signal in your design.
• Run the timing analysis.

For example, you can do the following:

`syn_timing -dclk clk_domain -cclk clk -cdly clk_domain -i <design.tcl>`

• -dclk: Design clock domain.
• -cclk: Clock signal in the clock domain.
• -cdly: Clock domain delay constraint.
• -i: input TCL file.

Check the synthesis report file for the timing results.

## 6.2.46 Timing Profiling

To run a timing profile of a design, you need to:

• Define a timing network (clock domain) using the timing module (clockdomain) of the clocking library.
• Define path constraints for each signal in your design.
• Run the timing profile.

Note

You can’t run a timing profile without running a synthesis first.

For example, you can do the following:

`syn_timing -dclk clk_domain -cclk clk -cdly clk_domain -i <design.tcl>`

• -dclk: Design clock domain.
• -cclk: Clock signal in the clock domain.
• -cdly: Clock domain delay constraint.
• -i: input TCL file.

Check the synthesis report file for the timing results.

## 6.2.47 Timing Summary

To run a timing summary of a design, you need to:

• Define a timing network (clock domain) using the timing module (clockdomain) of the clocking library.
• Define path constraints for each signal in your design.
• Run the timing summary.

For example, you can do the following:

`syn_timing -dclk clk_domain -cclk clk -cdly clk_domain -i <design.tcl>`

• -dclk: Design clock domain.
• -cclk: Clock signal in the clock domain.
• -cdly: Clock domain delay constraint.
• -i: input TCL file.

Check the synthesis report file for the timing results.

## 6.2.48 Timing Analyzer

The timing analyzer is a graphical tool for checking the timing of your design.

The timing analyzer contains three views:

• The Design view displays the timing constraints and signals in your design.
• The Simulation view displays the timing for your design, with the results of a simulation.
• The Library view displays the available timing constraints.

## 6.2.49 Timing Constraints

#### Constraint Types

`#10 @ (clk_domain.i) 10#100 @ (clk_domain.o) 10#100`

 * (clk_domain.i) * 10#100 @ (clk_domain.o) * 10#100

`#10 @ (*) 10#100 @ (*)`

 * @ (*) * 10#100

### Using Constraints

For timing constraints, you can use:

`constraint`

`constraint_delay`

`constraint_event`

`constraint_jitter`

`constraint_non_clock`

`constraint_setup`

`constraint_stable`

`constraint_stretch`

`constraint_transition`

Syntax:

`constraint <constraint_type> <constraint_name> { <constraint_property> = <value> ; <constraint_property> = <value> ;...}`

Constraint types:

`time::(event_expression) (event_expression)`

Clock Domain constraints:

`time::(event_expression) (event_expression)`

### Example:

#### Clock Domain

Assume you have a design with the following code:

module test(clk, reset);
input clk;
input reset;
reg b;

assign h = ~b;

initial
begin
$display("initial block"); b = 1; #10 b = 0; end always@(posedge clk) begin if(reset) then b = 1; end else b = h; end initial #100$display("end block");
endmodule

And the following constraints:

```time::(posedge reset) 100 @ (posedge clk)```

You can run the timing analysis as follows:

`syn_timing -dclk clk_domain -cclk clk -cdly clk_domain -i <design.tcl>`

Note that the timing check stops if the timing is not met.

### Using Constraints with Paths

You can use timing constraints with paths.

Note

It is possible to define a path between two signals, but it can’t be used in a timing constraint.

`path <path_name> (<property>) <property_value> ;`

`path <path_name> (<property>) <property_value> ;`

For example, if you have the following code:

module test(reset);
output reg a;
output reg b;
assign a = ~reset;
assign b = ~reset;

initial
begin
$display("initial block"); b = 1; a = 0; end always@(posedge reset) begin a = b; end initial #100$display("end block");
endmodule

and the following constraints:

```time::(posedge reset) 100@ (posedge a)
path a_to_b a = ~b;
path a_to_b b = ~a;```

You can run the timing analysis as follows:

`syn_timing -dclk clk_domain -cclk clk -cdly clk_domain -i <design.tcl>`

Note that the timing check stops if the timing is not met.

## 6.2.50 Timing Constraints with Constraints File

Timing constraints can be written in a constraints file.

You can define timing constraints in a constraints file to use them as part of the design.

To add timing constraints to a constraints file, you can use the following syntax:

`constraint <constraint_type> <constraint_name> { <constraint_property> = <value> ; <constraint_property> = <value> ;...}`

Where:

• `<constraint_type>` is one of the following:
`time::(event_expression) (event_expression)`
`constraint_event`
`constraint_jitter`
`constraint_setup`
`constraint_non_clock`
`constraint_delay`
• `<constraint_name>` is a name of a timing constraint.
• The property `<constraint_property>` is one of the following:
`time_high: <value>`
`time_low: <value>`
`time_high_to_low: <value>`
`time_low_to_high: <value>`
`time_high_to_low_ratio: <value>`
`time_low_to_high_ratio: <value>`
`time_high_to_low_min: <value>`
`time_low_to_high_min: <value>`
`time_high_to_low_max: <value>`
`time_low_to_high_max: <value>`
`time_high_to_low_strict: <value>`
`time_low_to_high_strict: <value>`
• `<value>` is a time value.

For example, you can define the following timing constraint: