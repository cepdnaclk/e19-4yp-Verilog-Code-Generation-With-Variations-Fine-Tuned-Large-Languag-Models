module test_k;
logic q;
logic [0:1][0:1] mda_2d;
wire q, clock, j, k, preset, clear;
reg j, k;
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
reset_ff;
j = 1;
k = 0;
//mda_2d[1][1] = 0;
end
m555 timer(clock);
endmodule
### Testing:
The code is compiled with MDA off, and no change is made to the logic array. The simulation was run and the simulation resulted in an X for q. The code is compiled with MDA on, and the statement is added to test MDA behavior. The simulation was run again and the simulation resulted in no change. The code without MDA was compiled with the above statement and the simulation was run again. The simulation resulted in a valid output q.