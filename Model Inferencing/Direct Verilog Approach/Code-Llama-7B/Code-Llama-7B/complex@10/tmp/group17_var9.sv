```
module comp
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);
always @(*) // Combinational logic
begin
// Default outputs to 0
gt = 1'b0;
eq = 1'b0;
lt = 1'b0;
if(x > y)
gt = 1'b1;
if(x == y)
eq = 1'b1;
if(x < y)
lt = 1'b1;
end
endmodule
module comp #(parameter N = 4)
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);
generate
if(N == 4) // For N=4
begin
assign gt = (x[3:0] > y[3:0])? 1'b1 : 1'b0;
assign eq = (x[3:0] == y[3:0])? 1'b1 : 1'b0;
assign lt = (x[3:0] < y[3:0])? 1'b1 : 1'b0;
end
else if(N == 8) // For N=8
begin
assign gt = (x[7:0] > y[7:0])? 1'b1 : 1'b0;
assign eq = (x[7:0] == y[7:0])? 1'b1 : 1'b0;
assign lt = (x[7:0] < y[7:0])? 1'b1 : 1'b0;
end
else if(N == 16) // For N=16
begin
assign gt = (x[15:0] > y[15:0])? 1'b1 : 1'b0;
assign eq = (x[15:0] == y[15:0])? 1