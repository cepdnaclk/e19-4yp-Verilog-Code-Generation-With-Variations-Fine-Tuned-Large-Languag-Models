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
else case ({s1, s0})
0: Data_Out <= Data_Out; // Idle
1: Data_Out <= {MSB_In, Data_Out[3:1]}; // Shift right
2: Data_Out <= {Data_Out[2:0], LSB_In}; // Shift Left
3: Data_Out <= Data_In; // Parallel Load
endcase
end
endmodule
```
Modified Testbench:
```verilog
module t_Universal_Shift_Reg();
reg [3: 0] Data_In = 4'b1111;
wire [3: 0] Data_Out;
reg MSB_In = 0, LSB_In = 1;
reg s1 = 0, s0 = 0, rst = 0;
wire MSB_Out, LSB_Out;
wire clk;

Universal_Shift_Reg M1 (Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1,
s0, clk, rst);
Clock_Gen M2(clk);

initial begin
    #1000 $finish;
    fork
        begin
            #5 rst = 1; #20 rst = 0;
            s0 = 1; s1 = 0; // shift right