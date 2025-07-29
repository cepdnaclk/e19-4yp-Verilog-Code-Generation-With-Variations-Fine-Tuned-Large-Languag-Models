module latch (input d, c, output reg [7:0] q, q_b );
always begin
wait ( c );
end
endmodule
### Additional Comments:
The packed union is a union containing several different types of data, which can be useful for passing a single value that can be multiple types (most commonly an integer in a union with a single bit representing the value's type--the first packed union in this test).
### Known Unsupported Operations:
- Combinational logic in the form of always_comb. 
- Multi-state latches.
### Passing test cases:
- When the input value is a packed union, the value of the output is the value of the input.
### Failing test cases:
- When the input value is not a packed union, the value of the output is not the value of the input.
- When the input value is a packed union containing more than one element, the value of the output is not the value of the input.
### Expected Output:
Regression output should be identical to original.
### Significance:
The packed union data type allows a single value to be represented in multiple