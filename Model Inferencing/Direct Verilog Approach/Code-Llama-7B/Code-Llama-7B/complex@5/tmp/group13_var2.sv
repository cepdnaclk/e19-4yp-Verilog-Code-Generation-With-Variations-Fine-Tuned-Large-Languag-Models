```Verilog
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

module t_Universal_Shift_Reg();
wire [3: 0] Data_Out;
reg [3: 0] Data_In;
wire MSB_Out, LSB_Out;
reg MSB_In, LSB_In;
reg s1, s0, rst;
defparam M2.half_cycle = 5;

Universal_Shift_Reg M1 (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1,
s0, clk, rst);
int i;
Clock_Gen M2(clk);

initial begin
$dumpfile("Test_Variation_1.vcd");
$dumpvars(2, Universal_Shift_Reg);
end
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
```

### Result:
![Test_Variation_1](./Test_Variation_1.PNG?raw=true "Test Variation 1")

### Variation Instruction:
Include the `s1`, `s0` signals in the packed array. Assign the value (0,1,2,3) to those signals.
### Result:
![Test_Variation_2](./Test_Variation_2.PNG?raw=true "Test Variation 2")

### Variation Instruction:
Use `eq` on `s1`, `s0` to compare it to the packed array.
### Result:
![Test_Variation_3](./Test_Variation_3.PNG?raw=true "Test Variation 3")

### Variation Instruction:
Use `not` on `s1`, `s0` to compare it with the packed array.
### Result:
![Test_Variation_4](./Test_Variation_4.PNG?raw=true "Test Variation 4")

### Test Plan:
Verify initial reset
Verify idle
Verify shift right
Verify shift left
Verify parallel load
Verify reset-on-the-fly
### Base Verilog Code:
```Verilog
module Universal_Shift_Reg (Data_Out, MSB_Out, LSB_Out, Data_In,
MSB_In, LSB_In, s1, s0, clk, rst);
output [3: 0] Data_Out;
output MSB_Out, LSB_Out;
input [3: 0] Data_In;
input MSB_In, LSB_In;
reg [3: 0] Data_Out; // 10-1