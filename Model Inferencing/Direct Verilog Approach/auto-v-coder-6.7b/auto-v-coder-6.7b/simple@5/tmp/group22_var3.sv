```verilog
module test_structs(
    input [7:0] x1,
    input [7:0] x2,
    input [7:0] x3,
    input [7:0] x4,
    output logic out_parity,
    output logic out_all_ones
);

typedef struct packed {
    logic [7:0] x1;
    logic [7:0] x2;
    logic [7:0] x3;
    logic [7:0] x4;
} input_struct;

input_struct inputs;

always_comb begin
    inputs.x1 = x1;
    inputs.x2 = x2;
    inputs.x3 = x3;
    inputs.x4 = x4;

    out_parity = ^inputs;
    out_all_ones = &inputs;
end

endmodule
```
In this code, `input_struct` is a packed structure type that contains the logic fields `x1`, `x2`, `x3`, and `x4`. An instance of `input_struct` called `inputs` is declared. When the `always_comb` block is executed, the `x1`, `x2`, `x3`, and `x4` in the `input_struct` are assigned the input signals `x1`, `x2`, `x3` and `x4`.

The `out_parity` output is calculated using the reduction operator `^`, which calculates the parity of the logic variables within the `input_struct`. The `out_all_ones` output is calculated using the reduction operator `&`, which determines if all the logic variables within the `input_struct` are ones.

You can connect this module to a testbench to test the operation with different input values. The `x1`, `x2`, `x3`, `x4` signals could be connected to random, known and unknown values for testing the module in different scenarios.

Please note that the testbench, which is outside of the module should be written in a separate file. This testbench is not included in this code snippet for simplicity. It should be designed