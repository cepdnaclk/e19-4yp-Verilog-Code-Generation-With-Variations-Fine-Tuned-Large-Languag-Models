module example8_2(Y, X);
input [4:0] X[7:0];
output [2:0] Y;
wire [3:0] t;
integer i;
assign Y = X[0];
assign t = X[0];
assign i = 1;
while (i < 3)
begin
    with (t)
    begin
        assign t = X[i];
        assign Y = t;
    end
    assign i = i + 1;
end
endmodule
### Reference Code:
module example8_3(Y, X);
input [4:0] X[7:0];
output [2:0] Y;
wire [3:0] t;
integer i;
assign Y = X[0];
assign t = X[0];
assign i = 1;
while (i < 4)
begin
    with (t)
    begin
        assign t = X[i];
        assign Y = t;
    end
    assign i = i + 1;
end
endmodule
### Design Discussion:
This example is identical to example 8.