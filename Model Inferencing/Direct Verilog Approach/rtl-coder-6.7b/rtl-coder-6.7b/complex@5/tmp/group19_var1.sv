module addern(carryin, X, Y, S, carryout);
parameter n = 16;
parameter [(n-1):0] W = {n{1'b0}};
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
endmodule
### Description:
Adder is used as a module in the test bench. This will cause compilation error. This modification will use parameter as an array to use constant index.
### Variation Type:
Parameterized code.
### Related Wiki Link:
[https://github.com/antmicro/yosys/wiki/In-module-constant-indexing](https://github.com/antmicro/yosys/wiki/In-module-constant-indexing)
### Example:
module addern(carryin, X, Y, S, carryout);
parameter n = 16;
input carryin;
input [(n-1):0] X, Y;
output [(n-1):0] S;
output carryout;
wire [(n-1):0] S;
wire carryout;
addern #(.n(n)) adder(carryin, X, Y, S, carryout);
endmodule
```
### Expected Output:
```
Error: "inside" operator in module "addern" at addern:12 is not supported by current backend
```