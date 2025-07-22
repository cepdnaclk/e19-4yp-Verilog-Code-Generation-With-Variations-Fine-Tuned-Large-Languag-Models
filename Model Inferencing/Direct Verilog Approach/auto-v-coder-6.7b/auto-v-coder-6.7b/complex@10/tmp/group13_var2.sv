```Verilog
module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1, s0, clk, rst);
output [3: 0] Data_Out;
output MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
reg [3: 0] Data_Out; // 10-12-2004
input s1, s0, clk, rst;
assign MSB_Out = Data_Out[3];
assign LSB_Out = Data_Out[0];

reg [1:0] s;
integer i;
always @ (posedge clk) begin
if (rst) Data_Out <= 0;
else begin
s <= {s1, s0};
for (i = 0; i < 4; i = i + 1) begin
if (s == i) begin
case (i)
0: Data_Out <= Data_Out; // Idle
1: Data_Out <= {MSB_In, Data_Out[3:1]}; // Shift right
2: Data_Out <= {Data_Out[2:0], LSB_In}; // Shift Left
3: Data_Out <= Data_In; // Parallel Load
endcase
end
end
end
end
endmodule
```
In the above code, the unpacked array `s` is used to hold the `s1` and `s0` control signals. The loop then checks each of the four states (0 to 3) against the unpacked `s`. If the `s` equals to the index of a loop, the corresponding operation is performed. 

This approach ensures that the correct operation is performed as per the current control signal values. The `s` value is always updated at the rising edge of the clock, ensuring that the correct operation is executed as per the latest `s1`, `s0` values. The `rst` signal is checked at the rising edge of the clock, and the `Data_Out` is reset to 0 if `rst` is high. If `rst` is