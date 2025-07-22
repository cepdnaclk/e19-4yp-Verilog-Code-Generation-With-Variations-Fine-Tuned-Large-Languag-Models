```verilog
module par_struct(in, out);
input [7:0] in;
output out;

// Define struct type
typedef struct packed {
  logic [2:0] field1;
  logic [2:0] field2;
  logic [2:0] field3;
  logic [2:0] field4;
} par_struct_t;

// Convert input to struct type
par_struct_t in_struct;
assign in_struct = in;

// Apply operations
logic parity, all_ones;
assign parity = ^in_struct;
assign all_ones = &in_struct;

// Output as single bit
assign out = all_ones & parity;
endmodule
```

This code first defines a struct type `par_struct_t` with 4 packed fields. Then, it assigns the packed array `in` to the struct type `in_struct`. Finally, it performs parity check (`^in_struct`) and all ones check (`&in_struct`) to get `parity` and `all_ones`. It outputs the combined result of `all_ones` and `parity` as a single bit `out`.

This code will test structure-based logic operations, particularly testing the behavior when packed logic arrays are assigned to struct types and performing operations on these structs.

Note: The unpacked struct doesn't make sense in this case because the struct's field are packed arrays with 8 bits, so you can't unpack them as a struct with 8 bits. You need to unpack them first to individual bit signals, then perform operations on those signals. This code applies exactly that.

Also, the `out` output bit signal is set to be the AND of `all_ones` and `parity`. This is just a placeholder, you can replace it with whatever logic you want to test on the struct fields. For example, you could replace `out = all_ones & parity` with:
```verilog
logic [7:0] out_array;
assign out_array = {all_ones, parity, in_struct};
assign out = out_array[0];
```
This would set `out` based on `all_ones`