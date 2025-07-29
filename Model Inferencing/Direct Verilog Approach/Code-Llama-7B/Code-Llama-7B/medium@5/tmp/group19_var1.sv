module counter (
    input wire clk, rst,
    output reg [3:0] count
);
always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else begin
        count[1:0] <= count[1:0] + 2'b01;
        count[3:2] <= count[3:2] + 2'b10;
    end
end
endmodule

### Expected output:
### Counter with array slicing
* The counter module has a 4-bit counter.
* The count value is assigned to a wire named count.