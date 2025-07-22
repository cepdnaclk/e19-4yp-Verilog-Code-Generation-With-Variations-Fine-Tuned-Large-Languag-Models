module nil;
reg [1:0] a, b;
initial
begin
a = 2'b00;
b = 2'b11;
$display ("t=%0t display: a = %b, b = %b", $time, a, b);
end
if (1)
always @(a[1])  // Triggered by posedge on a[1]  
$monitor("t=%0t monitor: a = %b, b = %b", $time, a, b);
endmodule