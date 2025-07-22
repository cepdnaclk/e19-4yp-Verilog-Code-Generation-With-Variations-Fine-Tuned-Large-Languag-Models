```verilog
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
else case ({s1, s0}) inside
[2'b00]: Data_Out <= Data_Out; // Idle
[2'b01]: Data_Out <= {MSB_In, Data_Out[3:1]}; // Shift right
[2'b10]: Data_Out <= {Data_Out[2:0], LSB_In}; // Shift Left
[2'b11]: Data_Out <= Data_In; // Parallel Load
endcase
end
endmodule
```