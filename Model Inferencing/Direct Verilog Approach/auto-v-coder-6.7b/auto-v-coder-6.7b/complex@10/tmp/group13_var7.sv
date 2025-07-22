```verilog
`define S0_IDLE      2'b00
`define S1_SHIFT_R   2'b01
`define S2_SHIFT_L   2'b10
`define S3_LOAD      2'b11

module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In,
MSB_In, LSB_In, s1, s0, clk, rst);
output [3: 0] Data_Out;
output MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
reg [3: 0] Data_Out; // 10-12-2004
input s1, s0, clk, rst;
assign MSB_Out = Data_Out[3];
assign LSB_Out = Data_Out[0];
always @ (posedge clk) begin
if (rst) Data_Out <= 0;
else case ({s1, s0})
`define S0_IDLE      2'b00: Data_Out <= Data_Out; // Idle
`define S1_SHIFT_R   2'b01: Data_Out <= {MSB_In, Data_Out[3:1]}; // Shift right
`define S2_SHIFT_L   2'b10: Data_Out <= {Data_Out[2:0], LSB_In}; // Shift Left
`define S3_LOAD      2'b11: Data_Out <= Data_In; // Parallel Load
endcase
end
endmodule
```
When the `s1` and `s0` signals are used, they should be matched with one of the predefined control signals, such as `S0_IDLE`, `S1_SHIFT_R`, `S2_SHIFT_L`, or `S3_LOAD`.

```verilog
initial begin
// Test Case 1: Reset
rst = 1; #20 rst = 0;
// Test Case 2