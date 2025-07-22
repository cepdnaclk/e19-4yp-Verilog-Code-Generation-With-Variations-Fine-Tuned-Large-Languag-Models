`timescale 1ns/100ps
module maj3_p (input a, b, c, output y);
wire im1, im2, im3;
parameter
    tplh1=2, tphl1=4,
    tplh2=3, tphl2=5;
and #(tplh1, tphl1)
    (im1, a, b),
    (im2, b, c),
    (im3, c, a);
or #(tplh2, tphl2) (y, $getwire(im1), $getwire(im2), $getwire(im3));
endmodule
### Verilog Code:
module testbench ();
parameter NUM_INPUTS = 3;
parameter NUM_OUTPUTS = 1;
bit [NUM_INPUTS-1:0] inputs;
bit [NUM_OUTPUTS-1:0] outputs;
`include "$filepath_dut/maj3_p.v"
`include "$filepath_dut/maj3_p_tb.v"
endmodule
### Variation Instruction:
Modify always block to include inside expression on an operand resulting from function-call return array.