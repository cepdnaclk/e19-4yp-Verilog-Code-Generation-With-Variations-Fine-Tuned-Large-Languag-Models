module netdelay(x, y);
input  bit [1:0] x;
output reg signed [1:0] y;
reg    a, b;
always @ (posedge clk) begin
x <= ~x;
end
endmodule
### Result:
![Result_2](https://github.com/D0D4L0G/Verilog_Examples/blob/main/Images/Result_2.PNG)