```vhdl
module mux6_3x4(input wire [3:0] a [3:0], input wire s, output reg [3:0] y [3:0]);
always @(*)
if(s == 0)
begin
for (i=0; i<4; i=i+1)
begin
y[i] =a[i];
end
end
else
begin
for (i=0; i<4; i=i+1)
begin
y[i] =b[i];
end
end
end
else
begin
for (i=0; i<4; i=i+1)
begin
y[i] =c[i];
end
end
end
else
begin
for (i=0; i<4; i=i+1)
begin
y[i] =d[i];
end
end
endmodule
```
### Original Design:
```vhdl
module mux8_2x4(input wire [3:0] a [3:0], input wire s, output reg [3:0] y [3:0]);
always @(*)
if(s == 0)
begin
for (i=0