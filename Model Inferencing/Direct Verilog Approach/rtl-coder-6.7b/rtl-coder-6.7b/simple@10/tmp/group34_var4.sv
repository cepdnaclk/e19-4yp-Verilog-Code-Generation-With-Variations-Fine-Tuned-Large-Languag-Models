module wire_assign( input [0:2] in, output out );
    wire local_in;
    // access index 1 of the input array
    assign local_in = in[1];
    // assign out to local_in
    assign out = local_in;
endmodule
### Expected Output:
wire_assign:
wire_assign.sv:10: assign out = local_in;
wire_assign.sv:10: out always assigned to local_in
wire_assign.sv:11: assign out = in;
wire_assign.sv:11: out always assigned to in