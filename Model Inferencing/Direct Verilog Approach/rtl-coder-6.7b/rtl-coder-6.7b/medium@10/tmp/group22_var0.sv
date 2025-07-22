module nil;
reg [7:0] a;
reg b;
initial
begin
a = 8'h00;
b = 1'b0;
$display ("t=%0t display: a = 0x%h, b = %b", $time, a, b); // Added time
end
initial
$monitor("t=%0t monitor: a = 0x%h, b = %b", $time, a, b); // Added time
// Monitor triggers at t=0, t=2, t=5, t=6
always @ (posedge b) // Added always block
begin
a[0:3] <= 4'ha;
$display ("t=%0t display: a = 0x%h, b = %b", $time, a, b); // Added time
end
endmodule