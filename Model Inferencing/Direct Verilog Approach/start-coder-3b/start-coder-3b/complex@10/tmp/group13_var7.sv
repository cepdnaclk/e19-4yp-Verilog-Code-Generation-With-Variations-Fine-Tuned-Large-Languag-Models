module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In,MSB_In, LSB_In, s1, s0, clk, rst);
output [3: 0] Data_Out;
output MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
reg [3: 0] Data_Out; // 10-12-2004
input s1, s0, clk;

assign MSB_Out = Data_Out[3];
assign LSB_Out = Data_Out[0];
always begin // reset
if (rst) Data_Out <= 0;
end
always @ (posedge clk) begin
if (~rst) Data_Out <= Data_Out;
else case ({s1, s0})
0: Data_Out <= Data_Out; // Idle
1: Data_Out <= {MSB_In, Data_Out[3:1]}; // Shift right
2: Data_Out <= {Data_Out[2:0], LSB_In}; // Shift Left