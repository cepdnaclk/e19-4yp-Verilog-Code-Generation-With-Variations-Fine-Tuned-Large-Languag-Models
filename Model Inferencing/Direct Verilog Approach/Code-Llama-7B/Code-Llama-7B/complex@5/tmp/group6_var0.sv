```vhdl
module mux4to1(w0, w1, w1, w3, S, f);
input w0, w1, w1, w3;
input [1:0] S; // S is now a 2-bit packed vector
output f;
reg f;
reg [2:0] const = 3'b000; // declared outside mux

always @(w0 or w1 or w2 or w3 or S)
    if (inside(S, const))
        f = w0;
    else if (inside(S, const+1))
        f = w1;
    else if (inside(S, const+2))
        f = w2;
    else if (inside(S, const+3))
        f = w3;
endmodule
```
### Output:
![](./images/mux4to1.png)
### Notes:
* The inside function returns true if the bit position specified by the 1st argument is equal to the constant value specified by the 2nd argument.
* The packed vector (const) is declared at module