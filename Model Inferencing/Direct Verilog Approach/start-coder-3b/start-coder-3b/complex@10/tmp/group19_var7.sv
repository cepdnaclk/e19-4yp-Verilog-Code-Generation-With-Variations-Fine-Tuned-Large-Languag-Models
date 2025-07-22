```
module addern(carryin, data[16], S, carryout);
parameter n = 16;
input carryin;
input [16] data;
output [n-1:0] S;
output carryout;
reg [n-1:0] S;
reg [n:0] C;
reg carryout;
integer i;
always @(carryin or data or C)
begin
    C[0] = carryin;
    for (i = 0; i <= n - 1; i = i + 1)
    begin
        S[i] = data[i] ^ C[i];
        C[i+1] = (data[i] & C[i]);
    end
    carryout = C[n];
end
endmodule
```
### Verilog Code:
```
module addern(carryin, data[16], S, carryout);
parameter n = 16;
input carryin;
input [16] data;
output [n-1:0] S;
output carryout;
reg [n-1:0] S;
reg [n:0] C;
reg carryout;
integer i;
always @(carryin or data or C)
begin
    C[0] = carryin;
    for (i = 0; i <= n - 1; i = i + 1)
    begin
        S[i] = data[i] ^ C[i];
        C[i+1] = (data[i] & C[i]);
    end
    carryout = C[n];