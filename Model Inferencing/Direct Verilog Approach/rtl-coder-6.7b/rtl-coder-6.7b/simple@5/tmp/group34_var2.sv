// Create a module with one input and one output that behaves like a wire
module wire_assign( input clk [*], output out );
    // assign out to in
    assign out = clk.inside;
endmodule