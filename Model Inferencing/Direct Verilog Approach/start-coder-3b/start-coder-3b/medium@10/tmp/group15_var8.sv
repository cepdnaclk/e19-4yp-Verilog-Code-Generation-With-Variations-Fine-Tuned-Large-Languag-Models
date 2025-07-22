```verilog
`timescale 1ns/100ps
module counter (input [5:0] clk, clock, output reg cnt);
reg [5:0] tmp;
always @(posedge clock or posedge clk[4:0]) begin
  tmp <= tmp + clk;
end
always @* begin
  cnt <= tmp;
end
endmodule
```

## 03_06: The Counter_4
In this exercise, the author wanted to show that the CPLD (which is FPGA) can be used to make a counter that counts the number of pulses for 10 seconds.

![Screenshot