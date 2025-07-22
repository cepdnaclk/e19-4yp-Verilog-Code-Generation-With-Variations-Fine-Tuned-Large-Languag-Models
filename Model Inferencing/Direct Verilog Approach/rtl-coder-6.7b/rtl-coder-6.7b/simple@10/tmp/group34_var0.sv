// Create a module with two outputs and one input that behaves like a gate
module gate_assign( input wire in, output wire out1, output reg out2 );
    // assign out1 to in
    assign out1 = in;
    // assign out2 to in
    assign out2 = in;
endmodule