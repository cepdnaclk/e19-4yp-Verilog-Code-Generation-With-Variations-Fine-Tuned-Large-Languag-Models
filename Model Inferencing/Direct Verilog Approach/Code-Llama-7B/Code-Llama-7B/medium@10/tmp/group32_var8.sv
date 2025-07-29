module counter(dout, clk);
output[4:0] dout;
input clk;
reg[4:0] dout;
initial
dout=0;
always@(posedge clk)
dout <= dout + 1'b1;
endmodule
### Test vector for simulation:
```VHDL
//testbench code
module tb();
reg [7:0] clk_in;
wire [4:0] x_out;
counter dut(.dout(x_out),.clk(clk_in));
initial
begin
$display("------------------------------------------");
$display("Test vector for Counter with 5 bits");
$display("------------------------------------------");
$display("CLK:    DO:    Result");
$display("--:--    --:    -----");
clk_in=8'b0110110;
#30
clk_in=8'b1110111;
#30
clk_in=8'b0111111;
#30
clk_in=8'b110