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
wire [n-1:0] data[n-1:0];
assign data = {X, Y};
always @(data or carryin)
begin
    C[0] = carryin;
    for (k = 0; k <= n-1; k = k + 1)
    begin
        S[k] = data[k] ^ C[k];
        C[k+1] = (data[k] & C[k]) | (C[k] & data[k]);
    end
    carryout = C[n];
end
endmodule
```
### Comparison Result:
```
$ diff before.v after.v
Only in before: addern
Only in after: addern
13c13
< reg [n-1:0] S;
---
> reg [n:0] S;
14c14
< reg [n:0] C;
---
> reg [n-1:0] C;
19c19
< wire [n-1:0] data[n-1:0];
---
> wire [n-1:0] data[n-1:0];
21c21
< assign data = {X, Y};
---
> assign data = {X, Y};
32d31
< for (k = 0; k <= n-1; k = k + 1)
---
> for (k = 0; k <= n-1; k = k + 1)
33,36c32,35
< S[k] = data[k] ^ C[k];
< C[k+1] = (data[k] & C[k]) | (C[k] & data[k]);
---
< S[k] = data[k] ^ C[k];
< C[k] = (data[k] & C[k]) | (C[k] & data[k]);

$ diff before.v after.v
Only in before: addern
Only in after: addern
13c13
< reg [n-1:0] S;
---
> reg [n:0] S;
14c14
< reg [n:0] C;
---
> reg [n-1:0] C;
19c19
< wire [n-1:0] data[n-1:0];
---
> wire [n-1:0] data[n-1:0];
21c21
< assign data = {X, Y};
---
> assign data = {X, Y};
32d31
< for (k = 0; k <= n-1; k = k + 1)
---
> for (k = 0; k <= n-1; k = k + 1)
33,36c32,35
< S[k] = data[k] ^ C[k];
< C[k+1] = (data[k] & C[k]) | (C[k] & data[k]);
---
< S[k] = data[k] ^ C[k];
< C[k] = (data[k] & C[k]) | (C[k] & data[k]);
```
### Observations:
- The only thing that was modified is the declaration of `reg` in line 14.
- The declaration of `C` was also modified, but it was not in the loop.
- The variable `k` was also moved from declaration to a constant.
- Line 32 was also moved from declaration to a constant.
- Line 33 was also moved from declaration to a constant.
- In line 21, `data` was moved from declaration to an expression.
- The loop was modified with the proper index.
- The values of `S` and `C` are still the same.

# 1.4 - Arithmetic Operations

## Exercises
1. What is the sum of the following:
```
1100010 + 1100100 =?
```
2. Simplify:
```
(x + ~x) + (~x + x) =?
```
3. Write an expression that, given the 8-bit value A, produces the 12-bit value A * 4 - A / 2.
4. Given the following expression for a 16-bit adder, which operation or operations should be added to make it work as the 32-bit adder shown on the right?
```
A
B
-B
+A
+B
~B
~A
-A
-B
```
![Addition Table](./img/addition_table.PNG)
5. What is the sum of the following:
```
1100010 + 1100100 =?
```
6. Find the 8-bit value of the following expression:
```
~01010101 + 001100110 =?
```
7. Is the sum of two 16-bit numbers the same as the sum of the two 8-bit numbers? If not, why?
8. Is the product of two 16-bit numbers the same as the product of the two 8-bit numbers? If not, why?
9. Given the following expression for a 16-bit adder, which operation or operations should be added to make it work as the 32-bit adder shown on the right?
```
B
A
-B
A
+B
~B
~A
-A
-B
```

![Addition Table](./img/addition_table.PNG)

## Notes
- Arithmetic operations can be expressed in the following way:
```
result[i-j+1: j] = A[i-j+1: j] op B[i-j+1: j]
```
- `result` and `A` are the operands, `op` is the operator, `i` is the maximum bit of `A` and `j` is the minimum bit of `A`.
- For example, for `i-j+1:j`, for an operand `A` of `32 bits`, `j = 1` and `i = 32`, `i-j+1:j` means from bit 2 to bit 1.
- For example, for `i-j+1:j`, for an operand `A` of `8 bits`, `j = 3` and `i = 7`, `i-j+1:j` means from bit 4 to bit 3.
- For example, for `A[i-j+1:j]`, for an operand `A` of `32 bits`, `j = 1` and `i = 32`, `A[i-j+1:j]` means from bit 31 to bit 1.
- For example, for `A[i-j+1:j]`, for an operand `A` of `8 bits`, `j = 3` and `i = 7`, `A[i-j+1:j]` means from bit 7 to bit 3.
- For example, for `A[i-j+1:j]`, for an operand `A` of `16 bits`, `j = 4` and `i = 15`, `A[i-j+1:j]` means from bit 15 to bit 4.
- The results of the above expression are `result` and `B`.
- For example, for `result[i-j+1:j] = A[i-j+1:j] op B[i-j+1:j]` with `op = ~`, `j = 1` and `i = 32`, `result[i-j+1:j]` is `(0 - 1) = -1`.
- For example, for `result[i-j+1:j] = A[i-j+1:j] op B[i-j+1:j]` with `op = +`, `j = 1` and `i = 32`, `result[i-j+1:j]` is `10000000000000000000000000000001 + 1111111111111111111