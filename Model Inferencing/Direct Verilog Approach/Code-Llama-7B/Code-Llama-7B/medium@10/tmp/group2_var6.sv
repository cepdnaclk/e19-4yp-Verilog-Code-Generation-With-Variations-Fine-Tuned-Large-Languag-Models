module example7_4_modified(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
reg [7:0] Qs_packed[15:0];
integer index;
always @(posedge Clock)
begin
    if (index < 15)
        Qs_packed[index] <= D;
    else
        Qs_packed[index] <= 0;
    index <= index + 1;
end
assign Q2 = Qs_packed[index];
assign Q1 = Qs_packed[index - 1];
endmodule
### Testbench Code:
module example7_4_tb;
timeunit    1ns;
timeprecision   1ns;
logic   D = 0;
logic   Clock = 0;
initial Clock = 0;
final Clock = 1;
logic   Q1;
logic   Q2;
example7_4    u0 (D, Clock, Q1, Q2);
initial begin
    D = 1;
    repeat (10) @(posedge Clock);
    D = 0;
    repeat (10) @(posedge Clock);
    D = 1;
    repeat (10) @(posedge Clock);
end
always begin
    #5 Clock = ~Clock;
end
endmodule
### Simulation Result:
### Base Verilog Code
![example7_4_result_base](https://github.com/AoEiuV020/aoeiuv/blob/master/content/snow/vhdl/example7_4_result_base.png)
### Variation Instruction
![example7_4_result_modified](https://github.com/AoEiuV020/aoeiuv/blob/master/content/snow/vhdl/example7_4_result_modified.png)
### Testbench Code
![example7_4_result_tb](https://github.com/AoEiuV020/aoeiuv/blob/master/content/snow/vhdl/example7_4_result_tb.png)
### Sim