// Create a module with one input and one output that behaves like a wire
module wire_assign( input [99:0] in, output [99:0] out );
    // assign out to in
    assign out = in;
endmodule
### Expected Outputs:
in: {100'b0}
out: {100'b0}
in: {100'b1}
out: {100'b1}