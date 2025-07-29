module nil;
reg a, b, c, d;
initial
begin
a = 1'b0;
b = 1'b0;
c = 1'b0;
d = 1'b1;
end
always @*
begin
case(a[1])
1'b0: // a[1] == 0
begin
case(d[1])
1'b0: begin
a = 1'b0;
b = 1'b1;
c = 1'b1;
d = 1'b0;
end
1'b1: begin
a = 1'b1;
b = 1'b0;
c = 1'b0;
d = 1'b1;
end
endcase
end
1'b1: // a[1] == 1
begin
case(d[1])
1'b0: begin
a = 1'b0;
b = 1'b1;
c = 1'b1;
d = 1'b0;
end
1'b1: begin
a = 1'b1;
b = 1'b0;
c = 1'b0;
d = 1'b1;
end
endcase
end
endcase
$display("t=%0t display: a = %b, b = %b,