module Universal_Shift_Reg(
output  Data_Out,
output  MSB_Out,
output  LSB_Out,
input   Data_In,
input   MSB_In,
input   LSB_In,
input   s1,
input   s0,
input   clk,
input   rst
);
output [3: 0] Data_Out;
output MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
reg [3: 0] Data_Out;

reg s1, s0;
reg rst;

reg [3: 0] [2: 0] states = {0, 0, 0, 1};
reg [1: 0] [3: 0] s = {1, 1};
assign MSB_Out = Data_Out[3];
assign LSB_Out = Data_Out[0];
always @ (posedge clk) begin
if (rst) begin
Data_Out <= 0;
s0 <= 0;
s1 <= 0;
end
else begin
Data_Out <=
{s[1][s0], Data_Out[3:1]};
end
end

always @ (posedge clk) begin
s0 <= s[1][s0];
if (s0 == 1) s1 <= s[0][s1];
end

endmodule
/*
Test Plan
Verify initial reset
Verify idle
Verify shift right
Verify shift left
Verify parallel load
Verify reset-on-the-fly
*/
module t_Universal_Shift_Reg();
wire [3: 0] Data_Out;
reg [3: 0] Data_In;
wire MSB_Out, LSB_Out;
reg MSB_In, LSB_In;
reg s1, s0, rst;
defparam M2.half_cycle = 5;

Universal_Shift_Reg M1(
Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1, s0, clk, rst);
Clock_Gen M2(clk);

initial #1000 $finish; initial fork begin #5 rst = 1; #20 rst = 0; end begin #120 rst = 1; #20 rst = 0; end begin #260 rst = 1; #20 rst = 0; end begin #380 rst = 1; #20 rst = 0; end join initial fork begin #450 rst = 1; #20 rst = 0; end join begin // Verify left shift join begin // Verify load join begin // reset join endmodule ### Variation Instruction: A `reg` is defined as a packed array of size 2, then each `reg` is assigned to one of its array elements. Use `inside` on the `s0`, `s1` control signals and check them against a packed array declared inside the dollar unit scope. ### Modified Code: module Universal_Shift_Reg ( output Data_Out, output MSB_Out, output LSB_Out, input Data_In, input MSB_In, input LSB_In, input s1, input s0, input clk, input rst); output [3: 0] Data_Out; output MSB_Out, LSB_Out; input [3: 0] Data_In; input MSB_In, LSB_In; reg [3: 0] Data_Out; reg s1, s0; reg [1: 0] [3: 0] s = {1, 1}; reg rst; assign MSB_Out = Data_Out[3]; assign LSB_Out = Data_Out[0]; always @ (posedge clk) begin if (rst) begin Data_Out <= 0; s0 <= 0; s1 <= 0; end else begin Data_Out <= {s[1][s0], Data_Out[3:1]}; end end always @ (posedge clk) begin s0 <= s[1][s0]; if (s0 == 1) s1 <= s[0][s1]; end endmodule /* Test Plan Verify initial reset Verify idle Verify shift right Verify shift left Verify parallel load Verify reset-on-the-fly */ module t_Universal_Shift_Reg(); wire [3: 0] Data_Out; reg [3: 0] Data_In; wire MSB_Out, LSB_Out; reg MSB_In, LSB_In; reg s1, s0, rst; defparam M2.half_cycle = 5; Universal_Shift_Reg M1( Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1, s0, clk, rst); Clock_Gen M2(clk); initial #1000$finish;
initial fork
begin #5 rst = 1;
#20 rst = 0;
end
begin #120 rst = 1;
#20 rst = 0;
end
begin #260 rst = 1;
#20 rst = 0;
end
begin #380 rst = 1;
#20 rst = 0;
end
join
initial fork
join
begin // Verify left shift
join
begin // Verify load
join
begin // reset
join
endmodule

Published on 27-Sep-2021 08:45:19