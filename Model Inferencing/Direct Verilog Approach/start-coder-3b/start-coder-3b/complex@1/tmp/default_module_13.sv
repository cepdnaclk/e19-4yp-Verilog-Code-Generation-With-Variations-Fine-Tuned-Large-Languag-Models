module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In,
MSB_In, LSB_In, s1, s0, clk, rst);
output [3: 0] Data_Out;
output MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
reg [3: 0] Data_Out; // 10-12-2004
input clk, s1, s0, rst;
assign MSB_Out = Data_Out[3];
assign LSB_Out = Data_Out[0];
always @ (posedge clk)
begin
if (rst) Data_Out <= 0;
else case (s1, s0)
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
reg [2: 0] s1, s0, rst;
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
## Demonstration

The following demonstration of the `Universal_Shift_Reg` module shows the `Universal_Shift_Reg` module in action. Note that the reset signal is toggled at every cycle of the clock input to the module. The testbench and the module are given below. The reset signal is toggled at the half-cycle where the module is instantiated. This is done by assigning the `rst` signal in the `t_Universal_Shift_Reg` instance declaration.

### Testbench:
module t_Universal_Shift_Reg();
wire [3: 0] Data_In;
wire [3: 0] Data_Out;
wire MSB_Out, LSB_Out;
reg [3: 0] Data_In;
reg MSB_In, LSB_In;
reg s1, s0, rst;
defparam M2.half_cycle = 5;

Universal_Shift_Reg M1 (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1,
s0, clk, rst);
Clock_Gen M2(clk);

initial #1000 $finish; initial fork begin #5 rst = 1; #20 rst = 0;end begin #120 rst = 1; #20 rst = 0;end begin #260 rst = 1; #20 rst = 0;end begin #380 rst = 1; #20 rst = 0;end join initial fork join begin // Verify left shift join join begin // Verify load join join begin // reset join join join join join join join join join join join join join join join join join join join join join join join join endmodule ### Module Instantiation: module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1, s0, clk, rst); output [3: 0] Data_Out; output MSB_Out, LSB_Out; input [3: 0] Data_In; input MSB_In, LSB_In; reg [3: 0] Data_Out; input clk, s1, s0, rst; assign MSB_Out = Data_Out[3]; assign LSB_Out = Data_Out[0]; always @ (posedge clk) begin if (rst) Data_Out <= 0; else case ({s1, s0}) 0: Data_Out <= Data_Out; // Idle 1: Data_Out <= {MSB_In, Data_Out[3:1]}; // Shift right 2: Data_Out <= {Data_Out[2:0], LSB_In}; // Shift Left 3: Data_Out <= Data_In; // Parallel Load endcase end endmodule ## Results The following shows the result of the demonstration. Notice how the left shift moves the left-most digit to the MSB of the output, while the right shift moves the right-most digit to the LSB of the output. The results of the test plan are shown as comments at the end of the testbench. The testbench results are as follows: ### Testbench Results: M1-clk M1-s1 M1-s0 M1-rst M1-Data_In M1-Data_Out M1-MSB_Out M1-LSB_Out # 0b0000 1 1 1 0b1000 0b1000 0b0000 0b1000 # 0b0000 1 1 0 0b1000 0b1000 0b0000 0b1000 # 0b0000 0 1 1 0b1000 0b0000 0b1000 0b0000 # 0b0