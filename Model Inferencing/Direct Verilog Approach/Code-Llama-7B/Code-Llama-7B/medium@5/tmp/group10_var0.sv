module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
reg [3:0] new_Q[1:0];
initial begin
    Q <= 4'b0000;
    new_Q[1] <= 4'b0000;
    new_Q[0] <= 4'b0000;
    new_Q[2] <= 4'b0000;
    new_Q[3] <= 4'b0000;
end
always @(posedge C