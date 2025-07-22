```
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
always @(X or Y or carryin)
begin
    C[0] = carryin;
    for (k = 0; k <= n-1; k = k + 1)
    begin
        S[k] = X[k] ^ Y[k] ^ C[k];
        C[k+1] = (X[k] & Y[k]) | (C[k] & X[k]) | (C[k] & Y[k]);
    end
    carryout = C[n];
end
//# $rose$(inside(carryout, {$bitstoreal(data[i]) for i in range(16)}))
//# $rose$(inside(X, {$bitstoreal(data[i]) for i in range(16)}))
//# $rose$(inside(Y, {$bitstoreal(data[i]) for i in range(16)}))
//# $rose$(inside(S, {$bitstoreal(data[i]) for i in range(16)}))
endmodule
```
### Input:
```
//# $input(data)
```
### Run:
```
$ sby -f sby_script
```
### Checkpoints:
```
assert_count: 217
checkpoint asserted in 35 of 217
```
### Found Error:
```
#0: Verilog::Scope::Scope::assertions[17]
```
### Result:
```
#0: Verilog::Scope::Scope::assertions[17]
#0: Verilog::Scope::Scope::assertions[17]
```