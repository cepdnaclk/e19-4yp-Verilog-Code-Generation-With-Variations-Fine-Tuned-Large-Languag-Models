```systemverilog
module comparator(
    input logic [3:0] x,
    output logic [1:0] y
);
    import package::*;

    always_comb begin
        for (int i = 0; i < ARRAY_SIZE; i++) begin
            if (x == arra[i]) begin
                y = i;
            end
        end
    end
endmodule
```
### Verilator Output:
- Verilator should find the error.
### Solution:
- This error is caused because the inside operator is used to compare x against a constant array defined in a package, which is not allowed in Verilator.
- To fix this error, either use the traditional array comparison method or remove the `package::` import statement.