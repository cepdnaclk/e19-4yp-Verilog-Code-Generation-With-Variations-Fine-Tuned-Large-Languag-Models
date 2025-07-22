module muxdff(D0, D1, Sel, Clock, Q);
input D0, D1, Sel, Clock;
output Q;
register [1:0] Q;
always @(posedge Clock)
    if (!Sel)
        Q[0] <= D0;
    else
        Q[0] <= D1;
endmodule
### Variation Instruction:
Use inside in