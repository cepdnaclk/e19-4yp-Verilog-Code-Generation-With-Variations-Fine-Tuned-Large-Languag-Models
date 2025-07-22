module Anding (input a, b, output y);
and (y, a, b);
dff dff_init (
.init(0),
.init_p(0)
);
endmodule
### Expected Result:
Two warnings:
Warning: DFF instantiation and initialization values are both zero.
Warning: DFF initialization is being overridden by the DFF instantiation.



## Test 7.2
### Base Verilog Code:
module Anding (input a, b, output y);
and (y,