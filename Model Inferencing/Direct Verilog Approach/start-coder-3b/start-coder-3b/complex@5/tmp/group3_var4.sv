module Prob_6_4_Counter;
// Counter
output [7: 0] Count_out;
reg [7: 0] Count;
reg [7: 0] Count_in, next_count, count_load;
wire [7: 0] Shift_Right;
wire [7: 0] Shift_Left;
reg [7: 0] Shift_in;
always @ (posedge clk)begin
next_count = count_load;
if (count_load == 0) next_count = Count_in + 1;
else if ((Count_in == 0) && (count_load!= 0)) next_count = count_load;
end
always @* begin
count_load <= 0;
end
always @ (posedge clk) if (rst == 0) count_load <= 0; else count_load <= 1;
always @ (posedge clk) Shift_in = Count_in;
always @ (posedge clk) Shift_Left = Count;
always @ (Shift_Right) begin
Count_out = Shift_Right;
Count_in = Shift_Left;
end
endmodule
### Results:
![Prob_6_4_Counter_Schematic_Diagram](/assets/posts_pic/2021-05-23-Post-5-Digital-System-Desiciptor-Schematic-Schematic-Diagram/Prob_6_4_Counter_Schematic_Diagram.png)
![Prob_6_4_Counter_Simulation](/assets/posts_pic/2021-05-23-Post-5-Digital-System-Desiciptor-Schematic-Schematic-Diagram/Prob_6_4_Counter_Simulation.png)
## Problem 7
### Base Verilog Code:
module Prob_7_1_Counter (Count_out, Count_in, clk, rst, count_load, count_enable);
// Counter
output [7: 0] Count_out;
reg [7: 0] Count;
reg [7: 0] Count_in