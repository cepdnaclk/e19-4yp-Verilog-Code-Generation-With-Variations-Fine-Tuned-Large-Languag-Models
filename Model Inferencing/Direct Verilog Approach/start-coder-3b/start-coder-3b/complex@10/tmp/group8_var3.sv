module t_Johnson_Counter ();
wire [3: 0] count;
reg enable;
reg clock, reset;
Johnson_Counter M0 (count, enable, clock, reset);
generate
for (i = 0; i < 16; i = i + 1)
Johnson_Counter Mi (count_o_n[i],
enable,
clock,
reset);
always @ (posedge clock, posedge reset)
if (reset == 1) count_o_n <= 0;
else if (enable)
case (count_o_n[i])
4'b0000,
4'