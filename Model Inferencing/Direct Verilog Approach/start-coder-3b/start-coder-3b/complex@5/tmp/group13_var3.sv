module Counter (Cout, Count_Out, Reset);
input [7: 0] Count_Out;
output [7: 0] Cout;
input Reset;
reg [7: 0] Cout = 0; // 10-12-2004
reg [7: 0] Count_Out = 0;
assign Cout = Count_Out;
reg [1: 0] Control_Instruction = 0;
reg [7: 2] Control_Instruction_Packed = 0;
assign Cout = Count_Out;
always @ (posedge Reset) begin
if (Control_Instruction_Packed == 0) Count_Out <= 0;
else Count_Out <= Count_Out + 1;
end
endmodule
### Test bench:
module t_Counter();
wire [7: 0] Cout;
reg [7: 0] Count_Out = 0;
wire Reset;
defparam M1.half_cycle = 5;

Counter M1(Cout, Count_Out, Reset);
Clock_Gen M1(clk);

initial #1000 $finish; initial fork begin #5 Reset = 1; #20 Reset = 0; end begin #120 Reset = 1; #20 Reset = 0; end join initial fork join begin // Reset-on-the-Fly join join begin // Verify reset begin // Verify increment begin join join initial // Reset-on-the-Fly join join begin initial // Verify increment begin join join initial // Reset-on-the-Fly join join begin initial // Verify increment begin join join endmodule ### Code Review: • The `Control_Instruction_Packed` reg and array should have only one entry (`0`) at the start of the code. • The `Control_Instruction` reg should not be used because the `Control_Instruction_Packed` reg should be used in place of it. • The test bench doesn't seem to be complete. • The test bench is not showing that the counter is disabled for R-O-T-F. ## 2.3 Assignment 3: Write a verilog module which implements a 5-bit adder with the following functionality : • The 5-bit adder is a sum of two numbers A and B. • A is a binary number given as an 8-bit input. • B is a binary number given as an 8-bit input. • The output of the adder is the sum of A and B. • Both A and B are reset to 0 on the rising edge of the reset signal. • A and B are added on the rising edge of the clock. ### Base Verilog Code: module Adder5 (Sum, Cout, A_In, B_In, Reset); output [4: 0] Sum; output Cout; input [7: 0] A_In; input [7: 0] B_In; input Reset; reg [4: 0] A_In = 0; //10-12-2004 reg [4: 0] B_In = 0; //10-12-2004 reg [4: 0] Sum = 0; reg Cout = 0; // 10-12-2004 always @ (posedge Reset) begin if (Reset == 1) begin A_In <= 0; B_In <= 0; end else begin B_In <= B_In; A_In <= A_In; end end always @ (posedge Reset) begin if (Reset == 1) begin Sum <= 0; Cout <= 0; end else begin Sum <= A_In + B_In; Cout <= (A_In + B_In > 31); end end always @ (posedge Reset) begin if (Reset == 1) begin Sum <= 0; Cout <= 0; end else begin Sum <= A_In + B_In; Cout <= (A_In + B_In > 31); end end always @ (posedge Reset) begin if (Reset == 1) begin Sum <= 0; Cout <= 0; end else begin Sum <= A_In + B_In; Cout <= (A_In + B_In > 31); end end endmodule ### Variation Instruction: Use `inside` on the `Control_Instruction` reg and check it against a packed array declared inside the dollar unit scope. ### Modified Code: module Adder5 (Sum, Cout, A_In, B_In, Reset); output [4: 0] Sum; output Cout; input [7: 0] A_In; input [7: 0] B_In; input Reset; reg [4: 0] A_In = 0; //10-12-2004