```verilog
typedef enum logic [1:0] {
    Z = 2'b00,
    ST0 = 2'b01,
    ST1 = 2'b10,
    X = 2'b11
} state_t;

module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;
state_t y;

always_comb begin
    y = Z;
    if (c == 0) begin
        y = ST0;
    end else if (c == 1) begin
        y = ST1;
    end else begin
        y = X;
    end
end

assign zn = (y == ST0 || y == X)? a : 1'bz;
assign zp = (y == ST1 || y == X)? a : 1'bz;
endmodule
```
In this modified code, the output pins are still the same as before. The `state_t` enum is used to define the states for the output pins. The `always_comb` block is used to calculate the output based on the input variable `c`. Depending on the value of `c`, the state is set to either ST0, ST1, or X. The output pins are then assigned to the enum state either by passing through the input `a` or high-Z with `1'bz`. ### Testing:

After this change, the module can be tested with various inputs to ensure it behaves as expected. The test bench should include stimulus patterns to drive the inputs and observe the outputs. The testbench should verify the sensitivity of the output pins to changes in the inputs. The output pins `zn` and `zp` should also be checked for their respective high-Z state when `c` is 0 or 1. 

This revised module should now support the verification of enumerated types and the use of the enum in Verilog. The testing can cover the entire range of possible inputs and verify the correct behavior of the output pins.