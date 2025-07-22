module counter (
    input wire clk, rst,
    output reg [3:0] count
);
reg [3:0] count_buf;
always @(posedge clk or posedge rst) begin
    if (rst) count_buf <= 4'b0000;
    else count_buf <= count_buf + 1;
end
assign count = count_buf;
endmodule
###### Result:
Variation: always
Test Name: array_slice_from_array_slice_in_always_block
Test Inputs: 
--clk:01
--rst:10
Test Outputs: 
--count:0xff00
Test Synthesis:
--Verilog code: counter.sv
--Logic Synthesis: /home/runner/work/variation-checker-sv/vari