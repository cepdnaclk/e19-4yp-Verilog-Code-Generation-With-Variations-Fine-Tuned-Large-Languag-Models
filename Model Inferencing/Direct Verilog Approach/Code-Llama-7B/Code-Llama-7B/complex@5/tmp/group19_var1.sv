module addern(carryin, X, Y, S, carryout);
parameter n = 16;
input carryin;
input [n-1:0] X, Y;
output [n-1:0] S;
output carryout;
reg [n-1:0] S;
reg [n:0] C;
reg carryout;
integer k;
assign data[0] = {X[15],X[14],X[13],X[12],X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0]};
always @(data[0])
begin
    C[0] = carryin;
    for (k = 0; k <= n-1; k = k + 1)
    begin
        S[k] = data[0][k] ^ data[1][k] ^ C[k];
        C[k+1] = (data[0][k] & data[1][k]) | (C[k] & data[0][k]) | (C[k] & data[1][k]);
    end
    carryout = C[n];
end