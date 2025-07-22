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
inside int index;
inside array <int[16]> data;
assign data[index] = Y;
always @(X or Y or carryin)
begin
    C[0] = carryin;
    for (k = 0; k <= n-1; k = k + 1)
    begin
        S[k] = X[k] ^ data[index][k] ^ C[k];
        C[k+1] = (X[k] & data[index][k]) | (C[k] & X[k]) | (C[k] & data[index][k]);
    end
    carryout = C[n];
end
endmodule
### Results
```