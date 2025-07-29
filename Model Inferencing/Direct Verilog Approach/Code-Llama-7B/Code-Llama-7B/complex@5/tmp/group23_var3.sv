```verilog
module mup (input clk, rst,
input [3:0] d_in,
input [1:0] s_cnt,
input sr, sl, ld,
output reg q );
reg [3:0] int_q;
wire inside;
assign inside = rr.ir inside { 0, 8, 5, 11, 14, 17, 22, 28, 36, 41 };
always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s_cnt;
else int_q = q;
end
always @( posedge clk ) begin: register
if (rst) q <= 0;
else if (inside) q <= int_q;
end
endmodule

```
### Simulation Results:
The simulation results show that the `always` block with the `inside` check is able to latch `int_q` into the output register when `inside` is true.
The image shows the simulation waveform for the `inside` check.
![image](Mup_wf.png)

### Original Code:
```verilog
module shift_reg( input [3:0] d_in, input clk, sr, sl, ld,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s_cnt;
else int_q = q;
end
always @(