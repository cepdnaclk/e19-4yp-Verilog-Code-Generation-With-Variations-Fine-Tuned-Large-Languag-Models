module Johnson_Counter (count, enable, clock, reset);
output [3: 0] count;
input enable;
input clock, reset;
reg [3: 0] count;
integer i;
generate
for (genvar i = 0; i < 4; i++) begin : jc
always @ (posedge clock, posedge reset)
if (reset == 1) count <= 0;
else if (enable)
case (count)
4'b0000,
4'b0001,
4'b0011,
4'b0111: count <= {count[2: 0], 1'b1};
4'b1111,
4'b1110,
4'b1100,
4'b1000: count <= {count[2: 0], 1'b0};
default: count <= 0;
endcase
end
endgenerate
generate
for (genvar j = 0; j < 4; j++) begin : jc
always @ (count)
if (count == j && count inside {4'b0000, 4'b0001, 4'b0011, 4'b0111, 4'b1111, 4'b1110, 4'b1100, 4'b1000})
begin
$display("Success, count is %d", j);
end
end
endgenerate
endmodule
### Output:
0: Success, count is 0
1: Success, count is 1
2: Success, count is 2
3: Success, count is 3