module func1(x1, x2, x3, f);
input x1, x2, x3;
output logic signed f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
### Verilog Testbench:
module func1_tb;
reg x1, x2, x3;
wire f;
func1 uut(.x1(x1),.x2(x2),.x3(x3),.f(f));
initial
begin
$monitor("%b | %b | %b | %b", x1, x2, x3, f);
x1 = 0; x2 = 0; x3 = 0; #1;
x1 = 1; x2 = 0; x3 = 0; #1;
x1 = 0; x2 = 1; x3 = 0; #1;
x1 = 1; x2 = 1; x3 = 0; #1;
x1 = 0; x2 = 0; x3 = 1; #1;
x1 = 1; x2 = 0; x3 = 1; #1;
x1 = 0; x2 = 1; x3 = 1; #1;
x1 = 1; x2 = 1; x3 = 1; #1;
end
initial
begin
#1;
$dumpfile("func1.vcd");
$dumpvars();
#100;
$finish;
end
endmodule
### Logic Analyzer Testbench:
The following code snippet shows how the logic analyzer test bench was created.
```
module func1_LATB;
reg signed [3:0] x1, x2, x3;
wire signed [3:0] f;
func1 uut(.x1(x1),.x2(x2),.x3(x3),.f(f));
initial
begin
$monitor("%b | %b | %b | %b", x1, x2, x3, f);
x1 = 4'b0000; x