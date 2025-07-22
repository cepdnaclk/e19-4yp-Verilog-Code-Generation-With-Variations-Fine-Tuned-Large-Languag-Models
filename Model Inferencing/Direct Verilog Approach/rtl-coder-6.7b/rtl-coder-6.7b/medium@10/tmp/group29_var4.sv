module muxdff(D0, D1, Sel, Clock, Q);
input D0, D1, Sel, Clock;
output Q;
reg Q;
always @(Sel or posedge Clock)
    if (!Sel)
        Q <= D0;
    else
        Q <= D1;
endmodule
### Variation Instruction:
Use inside in a while loop with the tested operand being a packed array element via function call index.