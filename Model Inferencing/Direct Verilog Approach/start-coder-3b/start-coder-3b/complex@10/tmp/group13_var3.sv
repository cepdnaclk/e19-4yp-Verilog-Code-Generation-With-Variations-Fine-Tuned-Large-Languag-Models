module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In,
MSB_In, LSB_In, s1, s0, clk, rst);
output [3: 0] Data_Out;
output MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
wire [7: 0] s_in_pack;
wire s1, s0, clk, rst;
assign s_in_pack = {{s1, s0}, clk, rst};
assign MSB_Out = Data_Out[3];
assign LSB_Out = Data_Out[0];
always @ (posedge clk) begin
if (rst) Data_Out <= 0;
else case (s_in_pack)
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

initial fork begin #5 rst = 1; #20 rst = 0;end
begin #120 rst = 1; #20 rst = 0;end
begin #260 rst = 1; #20 rst = 0;end
begin #380 rst = 1; #20 rst = 0;end
join
initial fork begin #100 rst = 1; #20 rst = 0;end
begin #140 rst = 1; #20 rst = 0;end
begin #220 rst = 1; #20 rst = 0;end
begin #300 rst = 1; #20 rst = 0;end
join
initial fork begin #100 rst = 1; #20 rst = 0;end
begin #140 rst = 1; #20 rst = 0;end
begin #220 rst = 1; #20 rst = 0;end
begin #300 rst = 1; #20 rst = 0;end
join
initial fork begin #100 rst = 1; #20 rst = 0;end
begin #140 rst = 1; #20 rst = 0;end
begin #220 rst = 1; #20 rst = 0;end
begin #300 rst = 1; #20 rst = 0;end
join
initial fork begin #100 rst = 1; #20 rst = 0;end
begin #140 rst = 1; #20 rst = 0;end
begin #220 rst = 1; #20 rst = 0;end
begin #300 rst = 1; #20 rst = 0;end
join
initial fork begin #100 rst = 1; #20 rst = 0;end
begin #140 rst = 1; #20 rst = 0;end
begin #220 rst = 1; #20 rst = 0;end
begin #300 rst = 1; #20 rst = 0;end
join

join

endmodule

## Using inside

The inside keyword is a new feature of Verilog 2001. It can only be used inside the dollar unit scope and has the following syntax:

inside expr

It is not possible to use inside on an expression that has multiple components, such as a concatenation.

The inside keyword will be useful when using multiple instances of the same primitive in your code. In the example below, we are using it on both an instance of the `Clock_Gen` and an instance of the `Universal_Shift_Reg` modules.

module t_Universal_Shift_Reg_D();
wire [3: 0] Data_Out;
reg [3: 0] Data_In;
wire MSB_Out, LSB_Out;
reg MSB_In, LSB_In;
reg s1, s0, rst;
defparam M2.half_cycle = 5;

universal_shift_reg M1 (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1,
s0, clk, rst);
clock_gen M2(clk, inside 1);

initial #1000 $finish; initial fork begin #5 rst = 1; #20 rst = 0;end begin #120 rst = 1; #20 rst = 0;end begin #260 rst = 1; #20 rst = 0;end begin #380 rst = 1; #20 rst = 0;end join initial fork begin #100 rst = 1; #20 rst = 0;end begin #140 rst = 1; #20 rst = 0;end begin #220 rst = 1; #20 rst = 0;end begin #300 rst = 1; #20 rst = 0;end join initial fork begin #100 rst = 1; #20 rst = 0;end begin #140 rst = 1; #20 rst = 0;end begin #220 rst = 1; #20 rst = 0;end begin #300 rst = 1; #20 rst = 0;end join initial fork begin #100 rst = 1; #20 rst = 0;end begin #140 rst = 1; #20 rst = 0;end begin #220 rst = 1; #20 rst = 0;end begin #300 rst = 1; #20 rst = 0;end join initial fork begin #100 rst = 1; #20 rst = 0;end begin #140 rst = 1; #20 rst = 0;end begin #220 rst = 1; #20 rst = 0;end begin #300 rst = 1; #20 rst = 0;end join initial fork begin #100 rst = 1; #20 rst = 0;end begin #140 rst = 1; #20 rst = 0;end begin #220 rst = 1; #20 rst = 0;end begin #300 rst = 1; #20 rst = 0;end join initial fork begin #100 rst = 1; #20 rst = 0;end begin #140 rst = 1; #20 rst = 0;end begin #220 rst = 1; #20 rst = 0;end begin #300 rst = 1; #20 rst = 0;end join initial fork begin #100 rst = 1; #20 rst = 0;end begin #140 rst = 1; #20 rst = 0;end begin #220 rst = 1; #20 rst = 0;end begin #300 rst = 1; #20 rst = 0;end join initial fork begin #100 rst = 1; #20 rst = 0;end begin #140 rst = 1; #20 rst = 0;end begin #220 rst = 1; #20 rst = 0;end begin #300 rst = 1; #20 rst = 0;end join initial fork begin #100 rst = 1; #20 rst = 0;end begin #140 rst = 1; #20 rst = 0;end begin #220 rst = 1; #20 rst = 0;end begin #300 rst = 1; #20 rst = 0;end join initial fork begin #100 rst =