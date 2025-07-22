// 10-12-2004
module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In,
s1, s0, clk, rst);
output [3: 0] Data_Out;
output MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
input s1, s0, clk, rst;
reg [3: 0] Data_Out;
assign MSB_Out = Data_Out[3];
assign LSB_Out = Data_Out[0];
reg [1: 0] op;
always @ (posedge clk) begin
if (rst) begin // Reset Operation
Data_Out <= 0;
op <= 2'b00; // Idle
end else begin
op <= {s1, s0};
if (op inside {2'b00, 2'b01}) // Shift Right
Data_Out <= {MSB_In, Data_Out[3:1]};
else if (op == 2'b10) // Shift Left
Data_Out <= {Data_Out[2:0], LSB_In};
else if (op == 2'b11) Data_Out <= Data_In; // Parallel Load
end
end
endmodule
### Final Code
// Note:
// 10-12-2004
// 10-19-2004
module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In,
LSB_In, s1, s0, clk, rst);
output [3: 0] Data_Out;
output MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
input s1, s0, clk, rst;
reg [3: 0] Data_Out;
assign MSB_Out = Data_Out[3];
assign LSB_Out = Data