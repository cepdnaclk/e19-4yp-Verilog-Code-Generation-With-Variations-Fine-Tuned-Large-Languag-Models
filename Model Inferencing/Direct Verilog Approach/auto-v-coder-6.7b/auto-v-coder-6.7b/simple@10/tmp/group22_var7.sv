```verilog
// Define struct
typedef struct packed{
    logic [3:0] x1;
    logic [3:0] x2;
    logic [3:0] x3;
    logic [3:0] x4;
} my_struct;

// Module for struct operations
module struct_op(in, parity, all_ones);
// Input struct
input my_struct in;
// Outputs
output parity, all_ones;

// Assign parity and all_ones properties
assign parity = ^in;
assign all_ones = &in;

endmodule
```

This code creates a new struct type, my_struct, with fields x1, x2, x3, and x4, all packed. The struct_op module takes my_struct as its input, calculates the parity of the struct, and calculates whether all the bits of each field are 1.

To test this, you could instantiate this module with a test bench that initializes a variable of type my_struct, and assigns specific values to each field. Then you can observe the output parity and all_ones.

Please note that you need to add the necessary signals in your test bench to monitor the output signals.

This code doesn't cover creating a test bench or initializing the data, as these vary based on the specific test case you want to run. For instance, you may initialize the struct with specific values, or generate random values to test the module. However, these details are outside the scope of this question.

Also, the module struct_op doesn't cover other operations on the struct. You would need to add other logic as per your requirement. Similarly, this module doesn't demonstrate how you can handle a struct in an array or an unpacked array. It's just a demonstration on how you can handle structs in Verilog.

Note: It's important to note that `^` operator is used to calculate the bitwise XOR and `&` operator is used to check whether the bits are 1. As per the Verilog LRM, `^` and `&` operate on single bit or bus widths, but not on struct types. For this reason you have to convert the struct to a bit array before you use the operation `