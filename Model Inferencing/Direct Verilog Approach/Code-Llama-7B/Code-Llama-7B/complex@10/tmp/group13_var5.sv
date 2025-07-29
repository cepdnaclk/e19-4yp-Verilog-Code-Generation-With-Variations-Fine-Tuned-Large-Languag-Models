module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In,
MSB_In, LSB_In, s1, s0, clk, rst);
output [3: 0] Data_Out;
output MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
reg [3: 0] Data_Out;
input s1, s0, clk, rst;
assign MSB_Out = Data_Out[3];
assign LSB_Out = Data_Out[0];

localparam [1:0] Idle = 0, ShiftRight = 1, ShiftLeft = 2,
ParallelLoad = 3;

always @ (posedge clk) begin
if (rst) Data_Out <= 0;
else if ({s1, s0} inside {Idle, ShiftRight, ShiftLeft, ParallelLoad})
Data_Out <= {MSB_In, Data_Out[3:1]};
end
endmodule
### Test Plan:
Verify initial reset
Verify idle
Verify shift right
Verify shift left
Verify parallel load
Verify reset-on-the-fly