```verilog
module IR ( input logic [1:0] A [0:3], input B [0:3], input load, clk,
output reg [7:0] data_out );

// Simple register loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= A[0] + B[0];
endmodule
```

In the above code, the inputs A and B are replaced with arrays of 1D packed logic-vector and the inside operator is used with fixed 4D range to test multi-dimensional array handling. The `load` signal loads the data into `data_out`, which is a register that stores the sum of the first element of array `A` and `B`.

The module `IR` takes two packed 1D logic-vector arrays `A` and `B`, a `load` signal and a `clk` signal as inputs and produces an 8-bit output `data_out`.

The `always` block ensures that the sum is loaded into `data_out` on every positive edge of the `clk` signal and when `load` is high. 

The `if` statement inside the `always` block ensures that the sum is only loaded into `data_out` when `load` is high.

Note that the sum of the first elements of the two input arrays is taken, because indices 0 and 0 are used. 

Also, this code assumes that the two 1D arrays have the same size and that the packed logic vectors inside the arrays have the same size. If this is not the case, additional error checking or size conversion would need to be added.

This code should be synthesizable in Verilog-2001 if it is followed by all Verilog-2001 syntax and semantics. It can be synthesized in a simulator but it may not give the expected output for all inputs due to the nature of the summing operation. 

Remember that Verilog is not a programming language, but a hardware description language designed to describe digital hardware. It's important to adhere to the specific coding style and requirements when using Verilog to design hardware. 

Lastly, this code should not be used for actual hardware implementation