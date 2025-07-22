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
or #(tplh2, tphl2) (y, im1, im2, im3);
endmodule
`/vlog_bench/benchmarks/Bench/Bench-6/Bench-6/Bench-6.md
## Modified Code

`timescale 1ns/100ps
module Bench-6 (output y);
wire a, b, c, d, e, f, g;
and #(2,2) (a, b, c);
and #(3,3) (b, c, d);
and #(4,4) (c, d, e);
and #(5,5) (d, e, f);
and #(6,6) (e, f, g);
or #(6,6) (y, a, b, c, d, e, f, g);
endmodule`

## New Circuit

![Bench-6 Circuit](Bench-6-circuit.png)

## Original Verilog Code and Variation Instruction:
`timescale 1ns/100ps
module Bench-6 (output y);
wire a, b, c, d, e, f, g;
and #(2,2) (a, b, c);
and #(3,3) (b, c, d);
and #(4,4) (c, d, e);
and #(5,5) (d, e, f);
and #(6,6) (e, f, g);
or #(6,6) (y, a, b, c, d, e, f, g);
endmodule`

## Modified Verilog Code:
`timescale 1ns/100ps
module Bench-6 (output y);
wire a, b, c, d, e, f, g;
and #(2,2) (a, b, c);
and #(3,3) (b, c, d);
and #(4,4) (c, d, e);
and #(5,5) (d, e, f);
and #(6,6) (e, f, g);
or #(6,6) (y, a, b, c, d, e, f, g);
endmodule`

### Verilog Code:
`timescale 1ns/100ps
module Bench-6 (output y);
wire a, b, c, d, e, f, g;
and #(2,2) (a, b, c);
and #(3,3) (b, c, d);
and #(4,4) (c, d, e);
and #(5,5) (d, e, f);
and #(6,6) (e, f, g);
or #(6,6) (y, a, b, c, d, e, f, g);
endmodule`/vlog_bench/benchmarks/Bench/Bench-4/Bench-4/Bench-4.md
## Modified Code

`timescale 1ns/100ps
module Bench-4 (output y);
wire a, b, c, d;
and #(4,4) (a, b, c, d);
or #(2,2) (y, a, b);
endmodule`

## New Circuit

![Bench-4 Circuit](Bench-4-circuit.png)

## Original Verilog Code and Variation Instruction:
`timescale 1ns/100ps
module Bench-4 (output y);
wire a, b, c, d;
and #(4,4) (a, b, c, d);
or #(2,2) (y, a, b);
endmodule`

## Modified Verilog Code:
`timescale 1ns/100ps
module Bench-4 (output y);
wire a, b, c, d;
and #(4,4) (a, b, c, d);
or #(2,2) (y, a, b);
endmodule`

### Verilog Code:
`timescale 1ns/100ps
module Bench-4 (output y);
wire a, b, c, d;
and #(4,4) (a, b, c, d);
or #(2,2) (y, a, b);
endmodule`/vlog_bench/benchmarks/Bench/Bench-3/Bench-3/Bench-3.md
## Modified Code

`timescale 1ns/100ps
module Bench-3 (input a, b, output y);
and #(2,2) (y, a, b);
endmodule`

## New Circuit

![Bench-3 Circuit](Bench-3-circuit.png)

## Original Verilog Code and Variation Instruction:
`timescale 1ns/100ps
module Bench-3 (input a, b, output y);
and #(2,2) (y, a, b);
endmodule`

## Modified Verilog Code:
`timescale 1ns/100ps
module Bench-3 (input a, b, output y);
and #(2,2) (y, a, b);
endmodule`

### Verilog Code:
`timescale 1ns/100ps
module Bench-3 (input a, b, output y);
and #(2,2) (y, a, b);
endmodule`/vlog_bench/benchmarks/Bench/Bench-2/Bench-2/Bench-2.md
## Modified Code

`timescale 1ns/100ps
module Bench-2 (output y);
not #(4,4) (y, y, y, y);
endmodule`

## New Circuit

![Bench-2 Circuit](Bench-2-circuit.png)

## Original Verilog Code and Variation Instruction:
`timescale 1ns/100ps
module Bench-2 (output y);
not #(4,4) (y, y, y, y);
endmodule`

## Modified Verilog Code:
`timescale 1ns/100ps
module Bench-2 (output y);
not #(4,4) (y, y, y, y);
endmodule`

### Verilog Code:
`timescale 1ns/100ps
module Bench-2 (output y);
not #(4,4) (y, y, y, y);
endmodule`/vlog_bench/benchmarks/Bench/Bench-8/Bench-8/Bench-8.md
## Modified Code

`timescale 1ns/100ps
module Bench-8 (input a, b, output y);
wire im3, im4, im5, im6;
and #(3,3) (im3, a, b);
and #(4,4) (im4, b, c);
and #(5,5) (im5, c, d);
and #(6,6) (im6, d, e);
or #(2,2) (y, im3, im4, im5, im6);
endmodule`

## New Circuit

![Bench-8 Circuit](Bench-8-circuit.png)

## Original Verilog Code and Variation Instruction:
`timescale 1ns/100ps
module Bench-8 (input a, b, output y);
wire im3, im4, im5, im6;
and #(3,3) (im3, a, b);
and #(4,4) (im4, b, c);
and #(5,5) (im5, c, d);
and #(6,6) (im6, d, e);
or #(2,2) (y, im3, im4, im5, im6);
endmodule`

## Modified Verilog Code:
`timescale 1ns/100ps
module Bench-8 (input a, b, output y);
wire im3, im4, im5, im6;
and #(3,3) (im3, a, b);
and #(4,4) (im4, b, c);
and #(5,5) (im5, c, d);
and #(6,6) (im6, d, e);
or #(2,2) (y, im3, im4, im5, im6);