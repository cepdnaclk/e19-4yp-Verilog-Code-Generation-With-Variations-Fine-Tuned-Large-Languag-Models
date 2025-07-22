module nil;
reg a[2:0];
initial
begin
a[1] = 1'b1;
a[0] = 1'b1;
$display("t=%0t a[0] = %b, a[1] = %b",$time, a[0], a[1]); // Added time
end
always @(a[1:0]) // Changed
$display("t=%0t a[0:1] = %b, a[1] = %b",$time, a[0], a[1]);
initial // Added
begin
a[0] = 1'b1;
a[1] = 1'b1;
$display("t=%0t i = %b, a[0] = %b, a[1] = %b",$time, 0, a[0], a[1]); // Added time
end
always @(a[1:0]) // Changed
begin
$display("t=%0t i = %b, a[0] = %b, a[1] = %b",$time, a[1], a[0], a[1]);
end
initial // Added
begin
a[0] = 2'b0;
a[1] = 2'b0;
$display("t=%0t i = %b, a[0] = %b, a[1] = %b",$time, 1, a[0], a[1]); // Added time
end
always @(a[1:0]) // Changed
begin
$display("t=%0t i = %b, a[0] = %b, a[1] = %b",$time, a[1], a[0], a[1]);
end
initial // Added
begin
a[0] = 3'b0;
a[1] = 3'b0;
$display("t=%