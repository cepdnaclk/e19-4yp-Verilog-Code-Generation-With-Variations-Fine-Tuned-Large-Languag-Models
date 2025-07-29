class Mealy;
virtual mealy.tb tb;
function new(virtual mealy.tb tb);
this.tb = tb;
endfunction
task drive_clk_resetn();
tb.Clock = 0;
#5ns tb.Clock = 1;
#5ns;
endtask
task drive_inputs(input signed [7:0] w);
#1ns
tb.Resetn = 1;
#2ns
tb.w = w;
@(posedge tb.y);
drive_clk_resetn();
endtask
function drive_outputs();
#2ns
@(posedge tb.Clock);
endfunction
endclass
### Test Case:
`include "mealy.sv"
`define assert(condition, name)\
    if (tb.Clock) begin\
        if (!(condition)) $error("Assertion Failure: %s", name);\
    end
module mealy_testbench;
mealy.tb tb;
Mealy fsm;
initial begin
fsm = new(tb);
fsm.drive_clk_resetn();
`assert(tb.y == 0, "mealy: init")
fsm.drive_inputs(8'b01010101);
`assert(tb.z == 1, "mealy: 1")
fsm.drive_inputs(8'b11111101);
`assert(tb.z == 1, "mealy: 2")
fsm.drive_inputs(8'b00000000);
`assert(tb.z == 0, "mealy: 3")
fsm.drive_inputs(8'b00000000);
`assert(tb.z == 0, "mealy: 4")
fsm.drive_inputs(8'b00000000);
`assert(tb.z == 0, "mealy: 5")
fsm.drive_inputs(8'b00000000);
`assert(tb.z == 0, "mealy: 6")