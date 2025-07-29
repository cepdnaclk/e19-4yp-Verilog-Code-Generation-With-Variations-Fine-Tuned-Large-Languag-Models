module SchedDelayB;
class C;
int var1;
int var2;
var1 = 0;
var2 = 0;
endclass
reg a, b;
reg [31:0] c;
initial
begin
$system("touch c.dat");
$system("touch c1.dat");
end
always @(b) begin
c[b] = c[b] + 1;
c[b+1] = c[b+1] + 1;
end
always @(a) begin
if (c[a]) 
c[a] --;
if (c[a+1]) 
c[a+1] --;
end
always @(c) begin
if (c[a]) 
c[a] --;
if (c[a+1]) 
c[a+1] --;
end
endmodule