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
else case ({s1, s0})
`inside({s1, s0}, {2'b00, 2'b01, 2'b10, 2'b11}): Data_Out <= Data_Out; // Idle
`inside({s1, s0}, {2'b00, 2'b01}): Data_Out <= {MSB_In, Data_Out[3:1]}; // Shift right
`inside({s1, s0}, {2'b00, 2'b10}): Data_Out <= {Data_Out[2:0], LSB_In}; // Shift Left
`inside({s1, s0}, {2'b00, 2'b11}): Data_Out <= Data_In; // Parallel Load
endcase
end
endmodule
```

This code should work the same way as the original code, however, the `inside` function is used to test the `s1`, `s0` control signals against a packed array. This allows you to combine the input signals into a single binary number and then test against the packed array. Keep in mind that this is a very specific simulation environment, Verilog does not natively support this kind of behavior and the `inside` function is part of a specific XM simulation software that provides special simulation capabilities.

Note: This variation may