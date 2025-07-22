```verilog
module Problem8(input [3:0] a, b, output [2:0] diff);

  struct packed {
    reg [1:0] x;
    reg [1:0] y;
    reg z;
  } diff_struct;

  assign diff_struct.x = a[3:2];
  assign diff_struct.y = a[1:0];
  assign diff_struct.z = a[0];

  assign diff = {diff_struct.x, diff_struct.y, diff_struct.z};

endmodule
```

In this revision, a packed structure is introduced, diff_struct, which contains 3 signals: x, y, and z. Each signal is a 2-bit wide signal with the required logic assignments. Then, the outputs (x, y, z) are packed together and assigned to the output 'diff'. 

This variation tests the capability of packed structures handling within Verilog.

Note: In Verilog, packed structures are used in situations where the signals can be packed into a single wire, which can make the design more efficient. However, packed structures are useful primarily in situations where the signals have different wire widths, or need to be packed as an array within a larger structure. In this case, since we're dealing with 4-bit inputs and 3-bit outputs, we don't necessarily see the benefits of packed structures. However, this example demonstrates how packed structures can be used in such scenarios. In general, packed structures are used when we need to ensure that the signals are packed together, but this example is an illustration of the syntax and concept, and not meant to represent real application scenarios.```verilog
module Problem8(input [3:0] a, b, output [2:0] diff);

  assign diff = a - b;

endmodule
```
The original code simply assigns the difference between 'a' and 'b' to the 'diff' output. The logic to perform the 'a - b' operation is a built-in Verilog arithmetic operation, which does exactly what we need. In this case, we don't need to use packed structures, as the width of the output matches the width of the inputs and can be directly assigned. This