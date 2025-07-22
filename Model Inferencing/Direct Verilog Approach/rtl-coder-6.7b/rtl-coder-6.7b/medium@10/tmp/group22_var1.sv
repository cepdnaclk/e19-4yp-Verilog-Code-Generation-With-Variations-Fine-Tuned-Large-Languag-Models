module nil;
reg [15:0] a;
initial
begin
a = 16'h0;
$display ("t=%0t display: a.1 = %b, a[1:1] = %b", $time, a.1, a[1:1]); // Added time
end
initial
begin
a = 16'h0;
$monitor("t=%0t monitor: a.1 = %b, a[1:1] = %b", $time, a.1, a[1:1]);
end
endmodule