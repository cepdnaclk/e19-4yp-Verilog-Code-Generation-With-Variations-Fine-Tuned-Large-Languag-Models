module tb_dff_inst(clk, rst, D, Q);
input clk, rst;

logic [7:0] D[0];
logic [15:0] Q[0];
logic [0] clk_i;

dff_inst dff_i (
.clk(clk_i),.rst(rst),.D(D[0]),.Q(Q[0]));

initial
begin
clk_i = 1;
rst = 0;
for (int i = 0; i < 5; i = i + 1)
begin
clk_i = ~clk_i;
D[i] = 7'b1000000;
end

always begin
#10 clk_i = 1;
#10 clk_i = 0;
end

endmodule


## Output

#### Testbench Output

## Conclusion

The DFF is very common and easy to understand in Verilog. Thus, this exercise was simple and straightforward. However, more complex designs can be done by expanding Verilog syntax and understanding the Verilog language. The DFF can take in a variety of inputs, as well as, can be expanded to include more components, such as the latch, or the flipflop. Additionally, there is more to Verilog than just this.