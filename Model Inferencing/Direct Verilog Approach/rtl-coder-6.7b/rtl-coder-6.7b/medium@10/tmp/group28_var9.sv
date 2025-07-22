module aoibeh2(o,a,b);
output o;
input[1:0]a,b;
wire a1,b1;
reg o;
and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
initial begin // Initial block
$display("VCD info");
$vcdplusfile("aoibeh2.vcd");
$vcdpluson();
$vcdplusmemon();
$vcdplusdelcare();
end
always@(a1 or b1)
o = ~(a1 || b1);
endmodule
### Modified Code with ANSI Code:
module aoibeh2(o,a,b);
output o;
input[1:0]a,b;
wire a1,b1;
reg o;
and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
initial begin
$display("VCD info");
$vcdplusfile("aoibeh2.vcd");
$vcdpluson();
$vcdplusmemon();
$vcdplusdecl(a,b,a1,b1,o);
end
always@(a1 or b1)
o = ~(a1 || b1);
endmodule
### Modified Code with SVA Code:
module aoibeh2(o,a,b); // Mixed structural/behavioral AOI
output o;
input[1:0]a,b;
wire a1,b1;
reg o;
and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
initial begin
$display("VCD info");
$vcdplusfile("aoibeh2.vcd");
$vcdpluson();
$vcdplusmemon();
$vcdplusdecl(a,b,a1,b1,o);
end
always@(a1 or b1)
o = ~(a1 || b1);
endmodule