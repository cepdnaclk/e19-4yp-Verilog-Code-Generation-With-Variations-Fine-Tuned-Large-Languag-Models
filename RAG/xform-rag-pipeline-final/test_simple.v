// test_simple.v - Simple module for basic transformation tests
module simple_test(
    input wire clk,
    input wire reset,
    input wire [7:0] data_in,
    output wire [7:0] data_out,
    output wire valid
);
    wire [7:0] internal_signal;
    wire processing_done;
    
    assign internal_signal = data_in + 8'h01;
    assign data_out = internal_signal;
    assign valid = processing_done;
    assign processing_done = (internal_signal != 8'h00);
    
endmodule