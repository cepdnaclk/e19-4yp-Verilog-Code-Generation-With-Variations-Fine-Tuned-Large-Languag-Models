```
function [1:0] mux(wire [1:0] D0, wire [1:0] D1, wire [1:0] Sel);
reg [1:0] Q;

always @(posedge clock)
    if (Sel[1])
        Q <= D0;
    else if (Sel[0])
        Q <= D1;
    else if (Sel[1] && Sel[0])
        Q <= D0;
endfunction

```
Upvotes: 0