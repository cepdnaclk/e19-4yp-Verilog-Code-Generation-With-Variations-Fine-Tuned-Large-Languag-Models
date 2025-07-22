```verilog
module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1, s0, clk, rst);
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
else begin
   case ({s1, s0})
   2'b00:  // Idle
   Data_Out <= Data_Out;

   2'b01:  // Shift right
   Data_Out <= {MSB_In, Data_Out[3:1]};

   2'b10:  // Shift Left
   Data_Out <= {Data_Out[2:0], LSB_In};

   2'b11:  // Parallel Load
   Data_Out <= Data_In;
   endcase
end
end
endmodule
```
### Test Plan:
The test plan should be modified to match the control signals (s1, s0) with the correct case in the `universal_shift_reg` module.
### Modified Test Plan:
```verilog
module t_Universal_Shift_Reg();
wire [3: 0] Data_Out;
reg [3: 0] Data_In;
wire MSB_Out, LSB_Out;
reg MSB_In, LSB_In;
reg s1, s0, rst;

// Instantiate the DUT
Universal_Shift_Reg M1 (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1, s0, clk, rst);