// Verilog code for Problem 9
module Multiplexer(
    input [1:0] A [0:3], B,
    output C
);
    assign C = (A[1:0] == 2'h01)? B : A[0];
endmodule
### Verification:
```v
$vvp multiplexer_mod.v
$v