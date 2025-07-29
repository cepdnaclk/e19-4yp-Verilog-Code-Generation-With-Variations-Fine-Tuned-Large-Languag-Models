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
// inside operator is applied to array data
inside data [0:n-1];
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
### Simulation:
The input signals are
<img src="./fig/18.png" width="500" height="150" />

The output signals are
<img src="./fig/19.png" width="500" height="150" />

As expected from the original verilog code, `carryout` changes to 1 when any bits in `X` or `Y` are 1.

### Exercise Summary:
* Array `data` defined in `module` scope is visible inside the `always` block. Inside `always` block, array `data` is used to access the bit from bit vector `X` or `Y`.
* Inside `always` block, use `inside` operator to access the array in package-qualified expression.

### Note:
The array `data` is created with scope `module`. This means that the array will be visible to the module definition and all instances inside the module. This means that there can be only 1 instance of the array named `data`. This is unlike the case of the signal `S`, where the array `data` is used to access the 1st-index signal or the 2nd-index signal.

### Reference:
* Inside Operator
    * [IEEE Std 1800-2017](https://standards.ieee.org/findstds/standard/1800-2017.html) § 23.7.1
* Using an Array to index a signal or expression
    * [IEEE Std 1800-2017](https://standards.ieee.org/findstds/standard/1800-2017.html) § 23.6.4.2, "Using an Array to Index a Signal or Expression"
* Arrays of a Package
    * [IEEE Std 1800-2017](https://standards.ieee.org/findstds/standard/1800-2017.html) § 23.5.3
* Scope of variables defined by a parameter
    * [IEEE Std 1800-2017](https://standards.ieee.org/findstds/standard/1800-2017.html) § 23.5.2.1, "Scope of variables defined by a parameter"
    * [IEEE Std 1800-2012](https://standards.ieee.org/findstds/standard/1800-2012.html) § 18.5.3.1
* Arrays