// Create a module with one input and one output that behaves like a tri-state buffer
module tri_state_buffer_bit( input bit in, output wire out, input bit tri_state );
    // assign out to in if tri_state is 0
    assign out = (tri_state)? 0 : in;
endmodule
### Modified Testbench Code:
// Create a testbench which instantiates, simulates, and