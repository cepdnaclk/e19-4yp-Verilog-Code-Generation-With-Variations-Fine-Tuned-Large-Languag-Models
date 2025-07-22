// Create a module with one input and one output that behaves like a wire
module wire_assign( output [3:0] out );
    // assign out to in
    bit[3:0] in;
    initial
    begin
    $display("Time %t: in = %b", $time, in);
    #10 in = 4'b1010;
    $display("Time %t: in = %b", $time, in);
    #10 in = 4'b1110;
    $display("Time %t: in = %b", $time, in);
    #10 in = 4'b1010;
    $display("Time %t: in = %b", $time, in);
    #10 in = 4'b0010;
    $display("Time %t: in = %b", $time, in);
    end
    assign out = in;
endmodule
### Expected Output:
Time 0.000000ns: in = 0000
Time 10.000000ns: in = 1010
Time 20.000000ns: in = 1110
Time 30.000000ns: in = 1010
Time 40.000000ns: in = 0010