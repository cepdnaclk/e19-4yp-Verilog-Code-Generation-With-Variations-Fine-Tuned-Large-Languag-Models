module t_Universal_Shift_Reg();
wire [3: 0] Data_Out;
reg [3: 0] Data_In;
wire MSB_Out, LSB_Out;
reg MSB_In, LSB_In;
wire s1, s0, rst;

Universal_Shift_Reg M1 (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1,
s0, clk, rst);
Clock_Gen M2(clk);

initial #1000 $finish; initial fork begin #5 rst = 1; #20 rst = 0; end begin #120 rst = 1; #20 rst = 0; end begin #260 rst = 1; #20 rst = 0; end begin #380 rst = 1; #20 rst = 0; end join initial fork join begin // Verify left shift join begin // Verify load join begin // reset join end end endmodule ### Base Verilog Code: module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1, s0, clk, rst); output [3: 0] Data_Out; output MSB_Out, LSB_Out; input [3: 0] Data_In; input MSB_In, LSB_In; reg [3: 0] Data_Out; input s1, s0, clk, rst; assign MSB_Out = Data_Out[3]; assign LSB_Out = Data_Out[0]; always @ (posedge clk) begin if (rst) Data_Out <= 0; else case ({s1, s0}) 0: Data_Out <= Data_Out; // Idle