module muxdff(D0, D1, Clock, i, Sel, Q);
input D0, D1, Clock, i, Sel;
output Q;
reg Q;
always @(posedge Clock)
    if (!Sel) begin
        i = 0; Q <= D0;
    end else begin
        i++; Q <= D1;
    end
endmodule
### Re-sourced Verilog Code:
module muxdff(D0, D1, Clock, i, Sel, Q);
input D0, D1, Clock, i, Sel;
output Q;
reg Q;
always @(posedge Clock)
    if (!Sel) begin
        i = 0; Q <= D0;