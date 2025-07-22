module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In,
MSB_In, LSB_In, s1, s0, clk, rst);
output [3: 0] Data_Out;
output MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
reg [3: 0] Data_Out; // 10-12-2004

// 10-21-2004
input s1, s0, clk, rst;
assign MSB_Out = Data_Out[3];
assign LSB_Out = Data_Out[0];

// 10-21-2004
always @ (posedge clk) begin
if (rst) Data_Out <= 0;
else case ({s1, s0})
0: Data_Out <= Data_Out; // Idle
1: Data_Out <= {MSB_In, Data_Out[3:1]}; // Shift right
2: Data_Out <= {Data_Out[2:0], LSB_In}; // Shift Left
3: Data_Out <= Data_In; // Parallel Load
endcase
end
endmodule
module t_Universal_Shift_Reg();
wire [3: 0] Data_Out;
reg [3: 0] Data_In;
wire MSB_Out, LSB_Out;
reg MSB_In, LSB_In;
reg s1, s0, rst;
defparam M2.half_cycle = 5;

Universal_Shift_Reg M1 (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1, s0, clk, rst);
Clock_Gen M2(clk);

initial #1000 $finish; initial fork begin #5 rst = 1; #20 rst = 0;end begin #120 rst = 1; #20 rst = 0;end begin #260 rst = 1; #20 rst = 0;end begin #380 rst = 1; #20 rst = 0;end join initial fork begin #5 s1 = 1; begin #5 s0 = 0; s1 = 1; s0 = 1; end end join join begin // Verify left shift join join begin // Verify load join join begin // reset join endmodule ### Difference: Use the `inside` keyword on all control signals (s1, s0) declared inside the `always` statement to avoid having a separate array declaration. Use `$unit::` in the `always_comb` block to ensure that the control signals match those in the `always` statement.

## 11.3.11.4. Module Template: Universal_Shift_Reg_2¶

Use the following file as a template:

module Universal_Shift_Reg_2( Data_Out, MSB_Out, LSB_Out, Data_In,
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
0: Data_Out <= Data_Out; // Idle
1: Data_Out <= {MSB_In, Data_Out[3:1]}; // Shift right
2: Data_Out <= {Data_Out[2:0], LSB_In}; // Shift Left
3: Data_Out <= Data_In; // Parallel Load
endcase
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
module t_Universal_Shift_Reg_2();
wire [3: 0] Data_Out;
reg [3: 0] Data_In;
wire MSB_Out, LSB_Out;
reg MSB_In, LSB_In;
reg s1, s0, rst;
defparam M2.half_cycle = 5;

Universal_Shift_Reg_2 M1 (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1,
s0, clk, rst);
Clock_Gen M2(clk);

initial #1000 $finish; initial fork begin #5 rst = 1; #20 rst = 0;end begin #120 rst = 1; #20 rst = 0;end begin #260 rst = 1; #20 rst = 0;end begin #380 rst = 1; #20 rst = 0;end join initial fork begin #5 s1 = 1; begin #5 s0 = 0; s1 = 1; s0 = 1; end end join join begin // Verify left shift join join begin // Verify load join join begin // reset join endmodule ### Variation Instruction: Use the `inside` keyword to declare the s1 and s0 control signals in the `always` statement. ### Modified Code: module Universal_Shift_Reg_2( Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1, s0, clk, rst); output [3: 0] Data_Out; output MSB_Out, LSB_Out; input [3: 0] Data_In; input MSB_In, LSB_In; reg [3: 0] Data_Out; // 10-12-2004 input s1, s0, clk, rst; assign MSB_Out = Data_Out[3]; assign LSB_Out = Data_Out[0]; always @ (posedge clk, inside s1, inside s0) begin if (rst) Data_Out <= 0; else case ({s1, s0}) 0: Data_Out <= Data_Out; // Idle 1: Data_Out <= {MSB_In, Data_Out[3:1]}; // Shift right 2: Data_Out <= {Data_Out[2:0], LSB_In}; // Shift Left 3: Data_Out <= Data_In; // Parallel Load endcase end endmodule module t_Universal_Shift_Reg_2(); wire [3: 0] Data_Out; reg [3: 0] Data_In; wire MSB_Out, LSB_Out; reg MSB_In, LSB_In; reg s1, s0, rst; defparam M2.half_cycle = 5; Universal_Shift_Reg_2 M1 //(Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1, s0, clk, rst); Clock_Gen M2(clk); initial #1000$finish;
initial fork
begin #5 rst = 1; #20 rst = 0;
end
begin #120 rst = 1; #20 rst = 0;
end
begin #260 rst = 1; #20 rst = 0;
end
begin #380 rst = 1; #20 rst = 0;
end
join
initial fork
begin #5 s1 = 1;
begin #5 s0 = 0;
s1 = 1;
s0 = 1;
end
end
join
join
begin // Verify left shift
join
begin // Verify load
join
begin // reset
join

endmodule

## 11.3.11.5. Module Template: Universal_Shift_Reg_3¶

Use the following file as a template:

module Universal_Shift_Reg_3( Data_Out, MSB_Out, LSB_Out, Data_In,
MSB_In, LSB_In, s1, s0, clk, rst);
output [3: 0] Data_Out;
output MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
reg [3: 0] Data_Out; // 10-12-2004
input s1, s0, clk, rst;
assign MSB_Out = Data_Out[