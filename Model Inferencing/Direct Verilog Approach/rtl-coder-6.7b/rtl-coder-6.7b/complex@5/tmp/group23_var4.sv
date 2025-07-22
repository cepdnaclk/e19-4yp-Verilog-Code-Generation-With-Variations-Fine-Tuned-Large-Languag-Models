module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
reg [3:0] allowed_ins = { 'h2, 'h23, 'h3, 'h13, 'h31, 'h131, 'h311, 'h1311 };
always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if(!(rr.ir inside allowed_ins) ) int_q = q;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s_cnt;
else int_q = q;
end
always @( posedge clk ) begin: register
if (rst) q <= 0;
else q <= int_q;
end
endmodule
### Result:
| **Instruction** | **Score** | **Execution times** | **Execution time** | **Average score** |
| --- | --- | --- | --- | --- |
| Original | 10.000 ns | 20 | 40.000 ns | 20.000 ns |
| Uninstructionalized | 2.000 ns | 1 | 2.000 ns | 2.000 ns |
| Uninstructionalized (without branch) | 1.000 ns | 1 | 1.000 ns | 1.000 ns |
| Synthesis | 1.000 ns | 1 | 1.000 ns | 1.000 ns |
| Synthesis (without branch) | 1.000 ns | 1 | 1.000 ns | 1.000 ns |
### Final result:
| **Instruction** | **Score** | **Execution times** | **Execution time** | **Average score** |
| --- | --- | --- | --- | --- |
| Original | 10.000 ns | 20 | 40.000 ns | 20.000 ns |
| Uninstructionalized | 2.000 ns | 1 | 2.000 ns | 2.000 ns |
| Uninstructionalized (without branch) | 1.000 ns | 1 | 1.000 ns | 1.000 ns |
| Synthesis | 1.000 ns | 1 | 1.000 ns | 1.000 ns |
| Synthesis (without branch) | 1.000 ns | 1 | 1.000 ns | 1.000 ns |