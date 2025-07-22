// Create a module with one input and one output that behaves like a wire
module wire_assign( bit in, output out );
    // assign out to in
    assign out = in;
endmodule
### Differences:
The assignment `assign out = in;` can be written using the SystemVerilog equivalent, `out <= in;`. The `<=` operator is not available for Verilog, so to perform the same logic you must use the `assign` keyword.
### Base SystemVerilog Code:
// Create a module with one input and one output that behaves like a wire
module wire_assign( input in, output out );
    // assign out to in
    assign out <= in;
endmodule