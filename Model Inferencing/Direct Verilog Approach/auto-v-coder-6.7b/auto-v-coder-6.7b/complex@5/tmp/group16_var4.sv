```
// Comparator module
module Comparator(
    input reg [1:0] x,
    output reg equal_to_zero
);
    always @(*) begin
        if (x inside {[0:1]}) begin
            equal_to_zero = 1'b1;
        end
        else begin
            equal_to_zero = 1'b0;
        end
    end
endmodule

// Package storing the constant array
package ConstArray;
    localparam [1:0] ARRAY = {2'b00, 2'b01};
endpackage

// TOP1 module
module TOP1(
    input reg CLK,
    input reg RST_X
);
    reg equal_to_zero;
    wire [1:0] x;  // Assuming x is defined elsewhere
    Comparator comparator_1(.x(x),.equal_to_zero(equal_to_zero));
    
    always @(posedge CLK) begin
        if (RST_X) begin
            x <= #1 2'b00;
        end
        else begin
            x <= #1 x + 1'b1;
        end
    end
endmodule

// Testbench module
module tb_TOP1;
    reg CLK, RST_X;
    TOP1 uut(.CLK(CLK),.RST_X(RST_X));

    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    initial begin
        RST_X = 0; #10;
        RST_X = 1;
    end
endmodule
```
In the `Comparator` module, `x` is compared against the constant array `ARRAY` defined in `ConstArray` package. If `x` is inside this array, `equal_to_zero` is set to 1, otherwise it is set to 0.

In the `TOP1` module, `x` is incremented each clock cycle, resetting it to 0 when `RST_X` is asserted. 

The `tb_TOP1` testbench initial