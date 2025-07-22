```verilog
module packed_struct(x1, x2, x3, x4, all_ones, parity);
input [31:0] x1, x2, x3, x4; 
output logic all_ones, parity;

// Define a packed struct
typedef struct packed {
    logic [7:0] x1, x2, x3, x4;
} packed_in;

// Instantiate the struct
packed_in packed_input;
assign packed_input = {x2, x1, x4, x3};

// Apply operations on the struct
assign parity = ^packed_input;
assign all_ones = &packed_input;
    
endmodule
```
Note: This code assumes that input `x1`, `x2`, `x3`, and `x4` are 32-bit input vectors. The packed struct is defined to hold four 8-bit values, and the input vectors are arranged as {`x2`, `x1`, `x4`, `x3`}. The `^` operator is the bitwise XOR operator, which returns `1` only if count of 1s in the bit is odd, and the `&` operator returns `1` only if all bits in the bit are `1`s. 

The output 'all_ones' indicates whether all the elements in the packed struct are `1`s and 'parity' indicates the parity of all the elements in the struct.

This code can be used to test the struct-based logic operations in Verilog.

Please revise the struct definition according to your requirements. If you require different packing or unpacking of the input vectors, you may have to change the unpacking or packing methods accordingly in the `packed_input` assignment.

Please also note that Verilog does not support the bitwise operators directly on packed structs. In this example, we are using the `^` and `&` operators on the packed struct rather than applying the operation to the 32-bit input vectors directly. Also, the packed struct should not contain any unpacked data types (like struct) as it does not support unpacked operations.

Note: This is a base Verilog code, there