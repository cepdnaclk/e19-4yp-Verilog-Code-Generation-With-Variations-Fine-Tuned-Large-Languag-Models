module addern(carryin, data, S, carryout);
parameter n = 16;
input carryin, data[n-1:0];
output carryout;
output [n-1:0] S;
reg [n-1:0] S;
reg [n:0] C;
reg carryout;
integer k;
always @(data or carryin)
begin
    C[0] = carryin;
    for (k = 0; k <= n-1; k = k + 1)
    begin
        inside data[k]: S[k];
        C[k+1] = (data[k] & data[k]) | (C[k] & data[k]) | (C[k] & data[k]);
    end
    carryout = C[n];
end
endmodule
### Input Files:
adder.v