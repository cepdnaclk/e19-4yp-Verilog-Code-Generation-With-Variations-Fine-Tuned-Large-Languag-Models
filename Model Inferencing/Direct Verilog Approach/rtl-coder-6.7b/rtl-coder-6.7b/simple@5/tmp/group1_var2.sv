```
// Verilog code for Problem 4
module XOR_Gate(
    input A, B,
    output Y
);
    for(genvar i = 0; i < 4; i++) begin
        assign Y = A[i] ^ B[i];
    end
endmodule
```
### Output:
![output](./images/Problem 4.png)