module test_k;
wire q, clock, j, k, preset, clear;
reg j, k;
logic [9:0] [3:0] logic_array [15:0];
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
reset_ff;
logic_array[0][0] = 1;
logic_array[0][1] = 2;
logic_array[0][2] = 3;
logic_array[0][3] = 4;
logic_array[1][0] = 4;
logic_array[1][1] = 3;
logic_array[1][2] = 2;
logic_array[1][3] = 1;
logic_array[2][0] = 1;
logic_array[2][1] = 2;
logic_array[2][2] = 3;
logic_array[2][3] = 4;
logic_array[3][0] = 1;
logic_array[3][1] = 2;
logic_array[3][2] = 3;
logic_array[3][3] = 4;
logic_array[4][0] = 1;
logic_array[4][1] = 2;
logic_array[4][2] = 3;
logic_array[4][3] = 4;
logic_array[5][0] = 1;
logic_array[5][1] = 2;
logic_array[5][2] = 3;
logic_array[5][3] = 4;
logic_array[6][0] = 1;
logic_array[6][1] = 2;
logic_array[6][2] = 3;
logic_array[6][3] = 4;
logic_array[7][0] = 1;
logic_array[7][1] = 2;
logic_array[7][2] = 3;
logic_array[7][3] = 4;
logic_array[8][0] = 1;
logic_array[8][1] = 2;
logic_array[8][2] = 3;
logic_array[8][3] = 4;
logic_array[9][0] = 1;
logic_array[9][1] = 2;
logic_array[9][2] = 3;
logic_array[9][3] = 4;
logic_array[10][0] = 1;
logic_array[10][1] = 2;
logic_array[10][2] = 3;
logic_array[10][3] = 4;
logic_array[11][0] = 1;
logic_array[11][1] = 2;
logic_array[11][2] = 3;
logic_array[11][3] = 4;
logic_array[12][0] = 1;
logic_array[12][1] = 2;
logic_array[12][2] = 3;
logic_array[12][3] = 4;
logic_array[13][0] = 1;
logic_array[13][1] = 2;
logic_array[13][2] = 3;
logic_array[13][3] = 4;
logic_array[14][0] = 1;
logic_array[14][1] = 2;
logic_array[14][2] = 3;
logic_array[14][3] = 4;
logic_array[15][0] = 1;
logic_array[15][1] = 2;
logic_array[15][2] = 3;
logic_array[15][3] = 4;
for(int i = 0; i < 16; i++)
begin : jk_loop
q = logic_array[i][j];
for(int ii = 0; ii < 4; ii++)
begin : k_loop
k = logic_array[i][ii];
end
end
end : jk_loop
end
m555 timer(clock);
endmodule
### Expected Verilog Code:
module test_k;
wire q, clock, j, k, preset, clear;
reg j, k;
reg [1:0] logic_array [3:0];
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
reset_ff;
logic_array[0] = 1;
logic_array[1] = 2;
logic_array[2] = 3;
logic_array[3] = 4;
for(int i = 0; i < 16; i++)
begin : jk_loop
q = logic_array[j];
for(int ii = 0; ii < 4; ii++)
begin : k_loop
k = logic_array[ii];
end
end
end : jk_loop
end
m555 timer(clock);
endmodule
`