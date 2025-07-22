// Create a module with one input and one output that behaves like a wire
module wire_assign( input [1:0] in, output [1:0] out );
    // assign out to in
    assign out = in;
endmodule
### Test Methodology:
* Test the module with different inputs and verify that the output is the same as the input