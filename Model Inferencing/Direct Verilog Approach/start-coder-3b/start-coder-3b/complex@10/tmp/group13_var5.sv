module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In,
MSB_In, LSB_In, s1, s0, clk, rst);
output [3: 0] Data_Out;
output MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
reg [3: 0] Data_Out; // 10-12-2004
input s1, s0, clk, rst;
wire [1: 0] s1s0;
assign s1s0 = {s1, s0};
assign MSB_Out = Data_Out[3];
assign LSB_Out = Data_Out[0];
always @ (posedge clk) begin
if (rst) Data_Out <= 0;
else case (s1s0)
(0,0): Data_Out <= Data_Out; // Idle
(1,0): Data_Out <= {MSB_In, Data_Out[3:1]}; // Shift right
(1,1): Data_Out <= {Data_Out[2:0], LSB_In}; // Shift Left
(0,1): Data_Out <= Data_In; // Parallel Load
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
module t_Universal_Shift_Reg();
wire [3: 0] Data_Out;
reg [3: 0] Data_In;
wire MSB_Out, LSB_Out;
reg MSB_In, LSB_In;
reg s1, s0, rst;
defparam M2.half_cycle = 5;

Universal_Shift_Reg M1 (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1,
s0, clk, rst);
Clock_Gen M2(clk);

initial #1000 $finish;
initial fork
begin #5 rst = 1; #20 rst = 0;end
begin #120 rst = 1; #20 rst = 0;end
begin #260 rst = 1; #20 rst = 0;end
begin #380 rst = 1; #20 rst = 0;end
join
initial fork
join
begin // Verify left shift
join
begin // Verify load
join
begin // reset
join

join
endmodule
#2017-05-09 

While reading VHDL 2008 book, I read that you can use `inside` on any net, not just `s1`, `s0` in my code. However, I tried to use it on the S1 and S0 nets, to get a packed array of the values, and it didn't work.

### Base Verilog Code:
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
module t_Universal_Shift_Reg();
wire [3: 0] Data_Out;
reg [3: 0] Data_In;
wire MSB_Out, LSB_Out;
reg MSB_In, LSB_In;
reg s1, s0, rst;
defparam M2.half_cycle = 5;

Universal_Shift_Reg M1 (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1,
s0, clk, rst);
Clock_Gen M2(clk);

initial #1000 $finish; initial fork begin #5 rst = 1; #20 rst = 0;end begin #120 rst = 1; #20 rst = 0;end begin #260 rst = 1; #20 rst = 0;end begin #380 rst = 1; #20 rst = 0;end join initial fork join begin // Verify left shift join begin // Verify load join begin // reset join initial fork begin #10 M2.half_cycle + 1$fs $finish;join endmodule ### Variation Instruction: Use `inside` on the `s1`, `s0` control signals and check them against a packed array declared inside the dollar unit scope. ### Modified Code: module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1, s0, clk, rst); output [3: 0] Data_Out; output MSB_Out, LSB_Out; input [3: 0] Data_In; input MSB_In, LSB_In; reg [3: 0] Data_Out; // 10-12-2004 input s1, s0, clk, rst; wire [1: 0] s1s0; assign s1s0 = {s1, s0}; assign MSB_Out = Data_Out[3]; assign LSB_Out = Data_Out[0]; always @ (posedge clk) begin if (rst) Data_Out <= 0; else case (s1s0) (0,0): Data_Out <= Data_Out; // Idle (1,0): Data_Out <= {MSB_In, Data_Out[3:1]}; // Shift right (1,1): Data_Out <= {Data_Out[2:0], LSB_In}; // Shift Left (0,1): Data_Out <= Data_In; // Parallel Load endcase end endmodule /* Test Plan Verify initial reset Verify idle Verify shift right Verify shift left Verify parallel load Verify reset-on-the-fly */ module t_Universal_Shift_Reg(); wire [3: 0] Data_Out; reg [3: 0] Data_In; wire MSB_Out, LSB_Out; reg MSB_In, LSB_In; reg s1, s0, rst; defparam M2.half_cycle = 5; Universal_Shift_Reg M1 (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1, s0, clk, rst); Clock_Gen M2(clk); initial #1000$finish;

initial fork
begin #5 rst = 1; #20 rst = 0;end
begin #120 rst = 1; #20 rst = 0;end
begin #260 rst = 1; #20 rst = 0;end
begin #380 rst = 1; #20 rst = 0;end
join

initial fork
join

begin // Verify left shift
join
begin // Verify load
join
begin // reset
join

join

endmodule
#2017-05-10 

Is this variation still valid? I'm getting an error when trying to use `inside` on the S1 and S0 nets and then checking them against a packed array.

### Base Verilog Code:
module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In,
MSB_In, LSB_In, s1, s0, clk, rst);
output [3: 0] Data_Out;
output MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
reg [3: 0] Data_Out