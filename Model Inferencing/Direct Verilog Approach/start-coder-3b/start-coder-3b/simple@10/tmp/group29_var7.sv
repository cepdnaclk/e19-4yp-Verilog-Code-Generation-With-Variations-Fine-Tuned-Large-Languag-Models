module WiredArrayB;
reg [2:0] a;
reg [4:0] b;
reg [2:0] c;
initial
begin
end
always @(a, b) a = b[c];
always @(a, b) b = a[c];
endmodule
### Error Message:
Error: (va8