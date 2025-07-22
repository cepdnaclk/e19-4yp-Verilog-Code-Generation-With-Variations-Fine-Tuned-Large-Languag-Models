// Create a module with one input and one output that behaves like a wire
module wire_assign_bit( input bit in, output bit out );
    // assign out to in
    assign out = in;
endmodule
### Results:
- The output of in and out are both equal to the input value
### Example Testbench:
`define TEST(v,n,d) v.out_``n`` = v.``d``;
`define CHECK(v,n,d,r) if (v.out_``n``!= v.``d``) begin $display("Error: output ``n`` is %s, expected %s", v.out_``d``, v.``r``); $finish; end

module test;
    // Create a local parameter to define the number of bits for the inputs and outputs
    localparam N = 8;

    // Create a set of wires for the inputs and outputs
    wire [N-1:0] in;
    wire [N-1:0] out;

    // Create an instance of the module
    wire_assign uut (
       .in(in),
       .out(out)
    );

    // Assign the inputs to a known value
    initial begin
        in = 8'b10101010;
        // Write the SystemVerilog bit type syntax to test the bit type
        #10 in = 1'b1;
        in = 8'b11111111;
        #10 in = 8'b00000000;
        #10 in = 8'b10101010;
        #10;
    end

    // Check the outputs are equal to the inputs
    initial begin
        `TEST(uut,0,in)
        `CHECK(uut,0,in,8'b10101010)
        // Write the SystemVerilog bit type syntax to test the bit type
        `TEST(uut,1,in)
        `CHECK(uut,1,in,8'b1)
        `TEST(uut,2,in)
        `CHECK(uut