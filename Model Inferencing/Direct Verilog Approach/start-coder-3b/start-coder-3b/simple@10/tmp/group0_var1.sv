```SystemVerilog
`timescale 1ns / 1ps
module testbench;
    wire_assign wa(.in(1'b0),.out(1'b1) );
    initial begin
        $dumpfile("wa.vcd");
        $dumpvars(0,wa);
    end
    initial begin
        wa.in = 1'b1;
        $dumpvars(0,wa);
        wa.in = 1'b0;
        $dumpvars(0,wa);
        wa.in = 1'b1;
        $dumpvars(0,wa);
        wa.in = 1'b0;
        $dumpvars(0,wa);
        wa