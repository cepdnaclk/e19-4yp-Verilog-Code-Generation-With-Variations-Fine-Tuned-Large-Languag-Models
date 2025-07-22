module reg4(D, Clock, Resetn, Q);
input [3:0] D;
input Clock, Resetn;
output [3:0] Q;
reg [3:0] Q;
reg [31:0] Q_i;
initial begin
    Q_i = {4{1'b0}};
end
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q_i <= {4{1'b0}};
    else begin
        foreach (Q_i[i])
            if (i==D)
                Q_i[i] <= 1'b1;
            else
                Q_i[i] <= 1'b0;
    end
assign Q = Q_i[3:0];
endmodule