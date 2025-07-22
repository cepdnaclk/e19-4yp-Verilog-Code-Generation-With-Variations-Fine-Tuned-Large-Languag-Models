module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( s )
begin
end else if ( inside_constant )
begin
deassign q;
deassign q_b;
end
end
always @( r ) begin : force_a_0
if( r )
begin
end else
begin
deassign q;
deassign q_b;
end
end
always @( posedge clk ) begin : clocked
end
endmodule
module d_ff_tb (
input clk,
output d,
input r,
input s,
output q,
output q_b
);

parameter s = 1;
wire q;
wire q_b;
wire clk_b;
d_ff uut_mod (.d(d),.clk(clk),.s(s),.r(r),.clk_b(clk_b),.q(q),.q_b(q_b) );

parameter r = 1;

initial begin
clk = 0;
d = 0;
$dumpfile("d_ff.vcd");$dumpvars(0, d_ff);
end

always @(posedge clk) begin
if(clk == 0) begin
clk = 1;
end else if (clk == 1) begin
clk = 0;
d = r;
end
end
endmodule
### Output:
Error: d_ff_tb.v:26:27: Error: Assertion failed: Assertion failed at d_ff_tb.v:26:27
Inside the assertion, the input parameter is not a constant and can't be used in the expression.
### Verilator Output:
d_ff_tb.cpp:115
d_ff_tb: Assertion failed!

# 7. `inside_constant`
### Base Verilog Code:
module d_ff (input d, clk, s, r, output reg