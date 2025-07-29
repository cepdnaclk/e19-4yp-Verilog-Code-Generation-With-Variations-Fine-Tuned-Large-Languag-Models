module nil;
reg [1:0] a, b;
initial
begin
a = 2'b0;
b = 2'b0;
$display ("t=%0t display: a = %b, b = %b", $time, a, b);
end
always @ (*)
begin
if(a[1])
begin
$display("t=%0t inside: a = %b", $time, a[0]);
$display("t=%0t inside: a = %b", $time, a[1]);
end
end
endmodule