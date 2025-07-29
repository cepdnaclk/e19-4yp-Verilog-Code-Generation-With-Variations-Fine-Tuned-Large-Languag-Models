// Create a module with one input and one output that behaves like a wire
module wire_assign( input bit in, output logic out );
    // assign out to in
    assign out = in;
end