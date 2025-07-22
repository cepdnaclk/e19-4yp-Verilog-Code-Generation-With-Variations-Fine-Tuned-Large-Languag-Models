We assume that the size of packed arrays a and b is 2×2, as 2-bit signals a, b are 2x2 array.
```verilog
module mux21b (
input wire [1:0] a,
input wire [1:0] b,
input wire [1:0] s,
output reg [1:0] y // Output must be reg for procedural assignment
);

always @(*) begin
case(s) 
2'b00: y = a; // Select a if s=0
2'b01: y = a; // Select a if s=1
2'b10: y = b; // Select b if s=2
2'b11: y = b; // Select b if s=3
default: y = 2'b00; // Default to 00
endcase
end
endmodule
```

The case statement was used to implement the desired priority-based mux functionality. The packed 2D array for a and b are being used as operands. The output y is also a 2D array. This approach is designed to handle 2-bit wide arrays as operands and 2-bit wide signals as selectors. The output y is also 2-bit wide. In the case of a match, the selected value is put into the output y. If no match is found, it defaults to 00.

If you need to have a 4-bit wide mux, you would simply change the case statement to 2'b00: y = a;, 2'b01: y = a;, 2'b10: y = b;, 2'b11: y = b;  and the input/output dimensions accordingly.