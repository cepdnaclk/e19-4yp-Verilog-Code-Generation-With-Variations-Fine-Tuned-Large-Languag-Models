module c_sr (CLK, D, Q);
input CLK;
input D;
output Q;
wire Q_1;
Q_1 = D;
CLKED_1 #(.CLOCK("clk") ) clock_module (CLK, ~Q_1); // Clock module must have a clock named "clk"
endmodule
### Test-bench:
module test_c_sr;
input wire CLK;
input wire D;
output wire Q;
c_sr #(1) mod (CLK, D, Q);
//c_sr #(1) mod (CLK, D, Q);
initial begin
$monitor("clk