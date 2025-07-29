module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In,
MSB_In, LSB_In, s1, s0, clk, rst);
wire [3: 0] Data_Out;
output MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
reg [3: 0] Data_Out; // 10-12-2004
input s1, s0, clk, rst;

reg [2: 0] s1_s0;
MSB_Out <= MSB_Out;
LSB_Out <= LSB_Out;
always @ (posedge clk) begin
if (rst) begin
Data_Out <= 0;
s1_s0 <= 0;
end
else case ({s1, s0})
0: begin
Data_Out <= Data_Out; // Idle
s1_s0 <= s1_s0;
end
1: begin
Data_Out[3:1] <= MSB_In;
Data_Out[0] <= LSB_Out;
s1_s0 <= 2'b00;
end
2: begin
Data_Out[3:1] <= Data_Out[3:1];
Data_Out[0] <= LSB_In;
s1_s0 <= 2'b01;
end
3: begin
Data_Out <= Data_In;
s1_s0 <= 2'