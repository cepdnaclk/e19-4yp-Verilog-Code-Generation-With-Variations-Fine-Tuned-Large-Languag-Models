module muxdff2(D0, D1, Sel, Clock, Q);
input D0, D1, Sel, Clock;
output Q;
reg Q;
reg D0_save;
reg D1_save;
reg Sel_save;
reg Clock_save;
always @(posedge Clock)
    if (!Sel)
        Q <= D0_save;
    else
        Q <= D1_save;
endmodule
### Original Code:
module mux