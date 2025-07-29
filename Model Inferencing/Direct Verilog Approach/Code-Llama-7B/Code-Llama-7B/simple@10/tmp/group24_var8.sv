module Anding (input uni [2:0] in, output y);
and (y, in[0], in[1]);
endmodule
### Original Code:
initial begin
    $display("Input: %b", 2'b00);
    #30 $display("Output: %b", anding_1.y);
    #30;
    $display("Input: %b", 2'b01);
    #30 $display("Output: %b", anding_1.y);
    #30;
    $display("Input: %b", 2'b10);
    #30 $display("Output: %b", anding_1.y);
    #30;
    $display("Input: %b", 2'b