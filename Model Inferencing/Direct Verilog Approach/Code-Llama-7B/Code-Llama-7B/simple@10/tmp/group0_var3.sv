// Create a module with one input and one output that behaves like a wire
module wire_assign( input bit in, output out );
    // assign out to in
    assign out = in;
endmodule
### Test Benches:
// Test the module with a simple test bench
module wire_assign_tb;
    bit in;
    bit out;
    wire_assign dut (.in (in),.out(out) );

    initial begin
        // Assert input value
        in = 1'b1;
        // wait 100 ns then deassert
        #(100)
        in = 0;
    end
endmodule
### Expected Result:
The following waveforms are expected when the input in is set to 1
![waveform](../images/wire_assing_1.png)