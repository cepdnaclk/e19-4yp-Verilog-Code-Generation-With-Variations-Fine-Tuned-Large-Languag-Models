module FA;
    reg [3:0] i;
    wire [3:0] o;
    always @(*)
        o[1:2] = i;
    assign o[0] = 0;
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
    FA fa4();
    FA fa5();
    FA fa6();
    FA fa7();
    FA fa8();
endmodule
### Modified SDF Graph:

![Modified SDF Graph](FA_variation1.dot.svg)


### Original SDF Graph:

![Original SDF Graph](FA_variation0.dot.svg)


### SDF File:

[FA_variation1.sdf.txt](FA_variation1.sdf.txt)


### SDF Graph File: