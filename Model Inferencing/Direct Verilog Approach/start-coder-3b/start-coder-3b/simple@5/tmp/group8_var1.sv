module IR ( input [1:0] data_in, input load, clk,
output reg [1:0] data_out );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= data_in;
endmodule
### Verilog Code:
module IR ( input [7:0] data_in, input load, clk,
output reg [7:0] data_out );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= data_in;
endmodule
## 16.1.2.2.3. Packing Arrays¶

The packing rule above is a special form of array packing. Unlike the 1D packing rule, it can only be used at the top level of the packed array declaration. Its use should be obvious: arrays are not packed by default, so using a packed array is the only way to pack them.

The example below shows how to declare a 4D packed array. It is identical to the example in section 16.1.2.2.2, except that the packing rule has been changed to apply only to the top-level array declaration.

 module IR ( input [1:0] data_in, input load, clk,
output reg [1:0] data_out );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= data_in;
endmodule

## 16.1.2.2.4. Inside Operator¶

The inside operator is used to access packed array elements. The syntax is

inside(array_name, n, m)

where array_name is a 4D packed array, and n and m are indices for the 2D array subscripts.

The example below shows some examples of the inside operator. The first one is straightforward:

 module IR ( input [1:0] data_in, input load, clk,
output reg [1:0] data_out );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= data_in;
endmodule

The inside operator can also be used to do multi-dimensional array access (as in section 16.1.2.2.2).

The inside operator can be used to access arrays packed in the same module (or even a different module) with different declarations. The declarations must have compatible vector types:

 module IR ( input [1:0] data_in, input load, clk,
output reg [1:0] data_out );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= data_in;
endmodule

## 16.1.2.2.5. Unpacking Arrays¶

Arrays packed in other modules (or themselves) can be unpacked in a 2D array, or a 4D packed array, or a 1D packed array. The unpacked representation is not packed. Packed arrays can be packed again. In all cases, the packing rule applies.

The unpacked representation of a packed array has the same dimensions as the packed array. The unpacked representation can be unpacked into a packed array if the dimensions are compatible. The unpacked representation can be unpacked into a 1D array. The unpacked representation can be packed into a 4D array.

The following example unpacks the array A into a 2D array, which is packed. The unpacked representation can be packed again into a 4D array.

 module Top_Level ( input [1:0] data_in, input load, clk,
output reg [1:0] data_out );

module IR ( input [1:0] data_in, input load, clk,  // Instruction Register
output reg [1:0] data_out );

module A ( input [1:0] a, input [1:0] b, // 2D array
output reg [1:0] result );
assign result = a + b;
endmodule

module IR ( input [1:0] data_in, input load, clk,
output reg [1:0] data_out );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= data_in;
endmodule
endmodule // Top Level

The following example unpacks the array A into a 1D array, which is unpacked. The unpacked representation can be packed into a 4D array.

 module Top_Level ( input [1:0] data_in, input load, clk,
output reg [1:0] data_out );

module IR ( input [1:0] data_in, input load, clk,
output reg [1:0] data_out );

module A ( input [1:0] a, input [1:0] b,
output reg [1:0] result );
assign result = a + b;
endmodule

module IR ( input [1:0] data_in, input load, clk,
output reg [1:0] data_out );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= data_in;
endmodule
endmodule // Top Level

## 16.1.2.2.6. Using 1D Packed Arrays as Registers¶

A 1D packed array can be used as a register, just like a 1D array. When it is loaded, the packed array is unpacked into an unpacked 1D array.

The following example uses 1D packed arrays as registers that are loaded on posedge clk:

 module Top_Level ( input [1:0] data_in, input load, clk,
output reg [1:0] data_out );

module IR ( input [1:0] data_in, input load, clk,
output reg [1:0] data_out );

module A ( input [1:0] a, input [1:0] b,
output reg [1:0] result );
assign result = a + b;
endmodule

module IR ( input [1:0] data_in, input load, clk,
output reg [1:0] data_out );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= data_in;
endmodule
endmodule // Top Level

## 16.1.2.2.7. Multiple Assignment¶

Multiple assignment can be used to assign to packed arrays.

The following example assigns to packed arrays. The first assignment to the packed array is a multiple assignment. The second assignment is a single assignment.

 module IR ( input [1:0] data_in, input load, clk,
output reg [1:0] data_out );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= data_in;
endmodule

## 16.1.2.2.8. Packing with the inside Operator¶

If the inside operator is used to declare a packed array within a non-packed array, the packing rule applies to that declaration.

The following example uses the inside operator to declare a packed array within a 1D array.

 module Top_Level ( input [1:0] data_in, input load, clk,
output reg [1:0] data_out );

module IR ( input [1:0] data_in, input load, clk,
output reg [1:0] data_out );

module A ( input pack [1:0] a, input pack [1:0] b,
output reg [1:0] result );
assign result = a + b;
endmodule

module IR ( input [1:0] data_in, input load, clk,
output reg [1:0] data_out );
// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= data_in;
endmodule
endmodule // Top Level

## 16.1.2.2.9. Packing with the inside Operator in a Submodule¶

If the inside operator is used to declare a packed array within a packed array, the packing rule applies to that declaration.

The following example uses the inside operator to declare a packed array within a packed array.

 module Top_Level ( input [1:0] data_in, input load, clk,