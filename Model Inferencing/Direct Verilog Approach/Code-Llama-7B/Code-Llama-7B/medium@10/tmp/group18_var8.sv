```
`timescale 1ns/100ps
module maj3_p (input a, b, c, output y);
wire [1:0] im1, im2, im3;
parameter
    tplh1=2, tphl1=4,
    tplh2=3, tphl2=5;
and #(tplh1, tphl1)
    (im1, a, b),
    (im2, b, c),
    (im3, c, a);
always @(*)
    y = im1[0] | im1[1] | im2[0] | im2[1] | im3[0] | im3[1];
endmodule
```
### Simulation Setup:
**top.v**
```
module top();
    logic [1:0] a, b, c, y, d;
wire [1:0] e;
    maj3_p #(.tplh1(2),.tphl1(4),.tplh2(3),.tphl2(5)) dut_p
    (a, b, c, y);
    maj3_p #(.tplh1(2),.tphl1(4),.tplh2(3),.tphl2(5)) dut_p2
    (d, b, c, e);
endmodule
```
**top_test.v**
```
`timescale 1ns/100ps
module top_test;
    logic [1:0] a, b, c, y, d;
wire [1:0] e;
    maj3_p #(.tplh1(2),.tphl1(4),.tplh2(3),.tphl2(5)) dut_p
    (a, b, c, y);
    maj3_p #(.tplh1(2),.tphl1(4),.tplh2(3),.tphl2(5)) dut_p2
    (d, b, c, e);
    initial begin
        a = 0; b = 0; c = 0;
        #1;
        $display("a = %b, b = %b, c = %b, y = %b", a, b, c, y);
        a = 1; b = 0; c = 1;
        #1;
        $display("a = %b, b = %b, c = %b, y = %b", a, b, c, y);
        a = 0; b = 1; c = 0;
        #1;
        $display("a = %b, b = %b, c = %b, y = %b", a, b, c, y);
        a = 1; b = 1; c = 0;
        #1;
        $display("a = %b, b = %b, c = %b, y = %b", a, b, c, y);
        a = 1; b = 0; c = 1;
        #1;
        $display("a = %b, b = %b, c = %b, y = %b", a, b, c, y);
        a = 0; b = 1; c = 1;
        #1;
        $display("a = %b, b = %b, c = %b, y = %b", a, b, c, y);
        a = 1; b = 1; c = 1;
        #1;
        $display("a = %b, b = %b, c = %b, y = %b", a, b, c, y);
        a = 0; b = 0; c = 1;
        #1;
        $display("a = %b, b = %b, c = %b, y = %b", a, b, c, y);
        a = 0; b = 1; c = 1;
        #1;
        $display("a = %b, b = %b, c = %b, y = %b", a, b, c, y);
        a = 1; b = 0; c = 0;
        #1;
        $display("a = %b