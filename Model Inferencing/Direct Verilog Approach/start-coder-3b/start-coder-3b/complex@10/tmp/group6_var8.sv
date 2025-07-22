library mux4to1 is

## How do you create a VHDL program?

### Base Verilog Code:
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always 
begin
    if (