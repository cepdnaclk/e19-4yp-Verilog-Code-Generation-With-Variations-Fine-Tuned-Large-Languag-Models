module counter (
    input wire clk, rst,
    output wire [3:0] count
);
initial begin
wire [3:0] test;
test <= {count[3], count[2], count[1], count[0]};
end
always @(posedge