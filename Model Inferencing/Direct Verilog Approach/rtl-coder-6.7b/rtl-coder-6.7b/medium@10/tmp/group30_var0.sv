module top;
wire [2:0]a;
initial
begin
if(a inside {0, 1, 2, 3, 4, 5, 6, 7})
if(a inside {4, 5, 6, 7})
end
endmodule
### Simulation Output:
### Validation Code:
module top;
reg a [2:0];
wire [2:0]a;
initial
begin
$monitor("a = %b", a);
a = 3'b101;
a = 3'b001;
a = 3'b010;
a = 3'b111;
a = 3'b110;
a = 3'b100;
a = 3'b000;
a = 3'b100;
end
endmodule