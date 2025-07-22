```verilog
module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1, s0, clk, rst);
output [3: 0] Data_Out;
output MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
reg [3: 0] Data_Out;
input s1, s0, clk, rst;
assign MSB_Out = Data_Out[3];
assign LSB_Out = Data_Out[0];
reg [1:0] signals = {s1,s0};
always @ (posedge clk) begin
if (rst) begin
Data_Out <= 0;
end
else begin
case (signals) 
0: Data_Out <= Data_Out; // Idle
1: Data_Out <= {MSB_In, Data_Out[3:1]}; // Shift right
2: Data_Out <= {Data_Out[2:0], LSB_In}; // Shift Left
3: Data_Out <= Data_In; // Parallel Load
default: Data_Out <= Data_Out; // Idle
endcase
end
end
endmodule
```
You can add a `default` case to the `case` statement to avoid any undefined outputs when the `s1`, `s0` signals are not 0 or 1.

The `reg [1:0] signals = {s1,s0}` declaration is equivalent to a `s1` and `s0` input array.

Additionally, I added a reset as part of the test plan. I used a `fork-join` to generate a 100-ns long clock and a reset at 120, 260, 380-ns times respectively.###

Verilog code:
```verilog
module Clock_Gen (clk);
output clk;
parameter half_cycle = 5;
reg clk = 0;
initial begin
forever begin
#half_cycle clk = ~clk;
end
end