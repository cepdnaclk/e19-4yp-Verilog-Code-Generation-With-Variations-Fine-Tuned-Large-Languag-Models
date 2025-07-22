// Create a module with one input and one output that behaves like a wire
module wire_assign(input [1:0] in, output [1:0] out);
    // assign out to in
    assign out = in;
endmodule