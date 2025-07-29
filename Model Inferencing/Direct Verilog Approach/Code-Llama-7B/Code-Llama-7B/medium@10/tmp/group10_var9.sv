module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        Q <= D;
endmodule
generate
    reg [3:0] val;
    always @(*) val = 4'b1111;
    integer i;
    always @(posedge Clock) if (Resetn == 0) {
        for(i = 0; i < 4; i = i + 1) begin
            Q[i] <= val[