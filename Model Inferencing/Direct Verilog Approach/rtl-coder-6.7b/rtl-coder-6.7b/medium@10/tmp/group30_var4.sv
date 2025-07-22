module partselect;
reg [7:0] a;
reg [7:0] b;
integer i;
initial
begin
for (i = 0; i <= 10; i = i + 1)
begin
a = {$random} % 256;
b = a [3:3];
end
end
endmodule