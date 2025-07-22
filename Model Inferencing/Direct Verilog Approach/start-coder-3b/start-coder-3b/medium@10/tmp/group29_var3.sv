module muxdff(D0, D1, Sel, Clock, Q);
input D0, D1, Sel, Clock;
output Q;
reg Q;
always @(posedge Clock)
    Q <= mux(D0, D1, {D0[0][3:0], D1[0][3:0], Sel});
endmodule

### Function Code:

module mux(