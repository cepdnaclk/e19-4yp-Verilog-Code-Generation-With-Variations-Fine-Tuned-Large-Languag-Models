module nil;
reg a [3:0], b [3:0];
initial
begin
a = 4'b0;
b = 4'b0;
end
always @(posedge clk) // Here clk is a signal for which we are monitoring
begin
if(b[2]