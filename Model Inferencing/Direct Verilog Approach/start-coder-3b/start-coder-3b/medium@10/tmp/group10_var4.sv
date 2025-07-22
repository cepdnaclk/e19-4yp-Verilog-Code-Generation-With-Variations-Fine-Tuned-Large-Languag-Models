module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
always @(posedge Clock or negedge Resetn) begin
    if (Resetn == 0)
        Q <= 4'b0000;
    else
        begin
            Q[3] <= D[3];
            Q[2] <= D[2];
            Q[1] <= D[1];
            Q[0] <= D[0];
        end
endmodule
### Base Verilog Code:
module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0