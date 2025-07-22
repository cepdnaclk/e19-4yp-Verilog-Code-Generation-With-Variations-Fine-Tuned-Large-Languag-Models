module addern(addern_intf in);
parameter n = 16;
input in.carryin;
input [n-1:0] in.X, in.Y;
output [n-1:0] in.S;
output in.carryout;
reg [n-1:0] in.S;
reg [n:0] C;
reg in.carryout;
integer k;
always @(in.X or in.Y or in.carryin)
begin
    C[0] = in.carryin;
    for (k = 0; k <= n-1; k = k + 1)
    begin
        in.S[k] = in.X[k] ^ in.Y[k] ^ C[k];
        C[k+1] = (in.X[k] & in.Y[k]) | (C[k] & in.X[k]) | (C[k] & in.Y[k]);
    end
    in.carryout = C[n];
end
endmodule
### Inputs:
```
in.X: 16'b0000001100110000
in.Y: 16'b0000001100110000
in.carryin: 0
```
### Outputs:
```
in.S: 16'b0000011001000000
in.carryout: 0
```

# Test case 10:
## Instruction:
```
Inside:
Apply `inside` operator to signal `data` using constant index and use an array defined in interface scope.
```
## Code:
### Base Verilog Code:
module addern(carryin, X, Y, S, carryout);
parameter n = 16;
input carryin;
input [n-1:0] X, Y;
output [n-1:0] S;
output carryout;
reg [n-1:0] S;
reg [n:0] C;
reg carryout;
integer k