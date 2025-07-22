~~~~
`ifndef __MUX4TO1_H__
`define __MUX4TO1_H__
`ifndef __MUX4TO1_IN_H__
`define __MUX4TO1_IN_H__
`ifndef __MUX4TO1_OUT_H__
`define __MUX4TO1_OUT_H__

module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
assign f = {w0, w1, w2, w3}[(S.inside({"0", "1"}))];
endmodule

`endif
`endif
`endif
~~~~
This instruction applies to the following Verilog keywords, which allow one to convert a string to a decimal integer using `atoi`:
- `==`
- `==>`
- `==<`
### Notes:
- `S` is an input array. In this case, it is declared as an `input` at module