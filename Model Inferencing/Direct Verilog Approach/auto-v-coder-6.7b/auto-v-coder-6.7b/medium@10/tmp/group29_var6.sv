```verilog
function automatic [DATA_WIDTH - 1:0] muxdff(input [DATA_WIDTH - 1:0] D0, D1,
                                              input Sel, Clock);
    reg [DATA_WIDTH - 1:0] Q;
    always @(posedge Clock)
        if (!Sel)
            Q <= D0;
        else
            Q <= D1;
    end
    return Q;
endfunction

module test_muxdff(..., D0, D1, Sel, Clock,...);
    input [DATA_WIDTH - 1:0] D0, D1;
    input Sel, Clock;
    output [DATA_WIDTH - 1:0] Q;

    always @(*) begin
        Q = muxdff(D0, D1, Sel, Clock);
    end
endmodule
```

Remember, this variation should be used with caution as it might lead to unintended behavior if the muxdff function is called multiple times in the same clock cycle. The muxdff function is not suitable for cases where the function needs to be called with the same operands at the same clock cycle. For such cases, it is recommended to use a register as an intermediate storage or use a sequential logic block to achieve the desired behavior. This is particularly important when the D0 and D1 values are function inputs that are not constant.

Also, make sure the data width DATA_WIDTH of D0 and D1 is same to avoid width mismatches.

Lastly, make sure that 'DATA_WIDTH' is defined as a positive integer before the module definition. The 'function' should be defined inside a module for Verilog. However, in this example, it is declared in a seperate module for a better illustration of how the 'function' can be used in a Verilog module. 

Remember using 'input' for function arguments is recommended for clarity and good coding practices. Always use 'always @ (*) begin' for combinational logic blocks to avoid timing path issues. `Endfunction` and `Endmodule` keywords are used to close the function and module respectively.

Please replace the dots (...) with the appropriate inputs and outputs according to your module