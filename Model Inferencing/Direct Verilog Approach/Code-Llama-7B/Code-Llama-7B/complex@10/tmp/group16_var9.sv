//module top_level;
package comparator_pkg;
    parameter data_width = 16;
    parameter data [data_width-1:0] = {3, 7, 11, 15};
endpackage

module comparator #(parameter data_width = 16) (input signed [data_width-1:0] x, output reg signed equal);
    wire signed [data_width-1:0] data [data_width-1:0];
    assign data = comparator_pkg::data;
    
    always@(*) begin
        equal = 0;
        for(integer i = 0; i < data_width; i++) begin
            if (x == data[i]) begin
                equal = 1;
                break;
            end
        end
    end
endmodule
### Modified Testbench:
module testbench;
    parameter data_width = 16;
    reg clk;
    reg signed [data_width-1:0] x;
    wire signed equal;
    comparator #(.data_width(data_width)) uut(.x(x),.equal(equal));
    
    initial begin
        clk <= 0;
        forever #5 clk <= ~clk;
    end
    
    initial begin
        x <= 0; #10;
        x <= 3; #10;
        x <= 7; #10;
        x <= 11; #10;
        x <= 15; #10;
        x <= 2; #10;
        x <= 13; #10;
        x <= 0; #10;
    end
endmodule
### Initialization File:
`timescale 1ns / 1ps
`include "comparator_pkg.sv"
`include "testbench.sv"
### Testbench Output:
### Test Cases:
1. Check that equal is output as 1 when x is equal to one of the elements in the data array.
2. Check that equal is output as 0 when x is not equal to any of the elements in the data array.
3. Check that the testbench correctly handles the case where x is equal to multiple elements in the data array