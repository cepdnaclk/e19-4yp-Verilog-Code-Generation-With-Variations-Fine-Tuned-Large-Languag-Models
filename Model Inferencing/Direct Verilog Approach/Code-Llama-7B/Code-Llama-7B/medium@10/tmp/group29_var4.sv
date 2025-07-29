module muxdff(D0, D1, Sel, Clock, Q[1:0,1:0]);
input D0, D1, Sel, Clock;
output Q[1:0,1:0];
reg Q[1:0,1:0];
always @(posedge Clock)
    if (!Sel)
        Q[0,0] <= D0;
    else
        Q[0,0] <= D1;
endmodule
### Example Code:
module tb;
wire D0, D1, Sel, Clock, Q[1:0,1:0];
muxdff dut(D0, D1, Sel, Clock, Q);
initial begin
    D0 = 1'b0;
    D1 = 1'b0;
    Sel = 1'b0;
    Clock = 1'b0;
    #10