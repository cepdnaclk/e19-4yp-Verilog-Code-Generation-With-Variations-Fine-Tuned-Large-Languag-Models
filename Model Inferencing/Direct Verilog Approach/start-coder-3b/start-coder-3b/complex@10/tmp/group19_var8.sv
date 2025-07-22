```c++
// Module Declaration
module demuxn(S_in, sel, S_out);
parameter n = 4;
input [n-1:0] S_in;
input [n-1:0] sel;
output [n-1:0] S_out;
reg [n-1:0] S;
reg [n-1:0] data[n];
wire [n-1:0] control;
integer i;
integer j;
mod_constant(in: control[i], out: control[0], index: i);
assign data[i] = S_in[i];
endmodule
// Module Declaration
module demuxn(S_in, sel, S_out);
parameter n = 4;
input [n-1:0] S_in;
input [n-1:0] sel;
output [n-1:0] S_out;
reg [n-1:0] S;
integer i;
integer j;
assign S_in[i] = data[i];
endmodule
```
### Comparison
| Location | Code | Verilog |
| -------- | ---- | ------- |
| Base |![base_demux](Pictures/demux/base_demux.png) |![verilog_demux](Pictures/demux/verilog_demux.png) |

## Full Adder
### Base Code:
```c++
// Module Declaration
module full_adder(cin_in, A, B, S, cout);
input cin_in;
input A;
input B;
output S;
output cout;
wire [3:0] S_temp;
wire [3:0] S_cin;
wire [3:0] S_cout;
assign S_cin[0] = cin_in;
assign S_cin[1] = A;
assign S_cin[2] = B;
assign S_cout[0] = S_cin[0] ^ S_cin[1] ^ S_cin[2];
assign S_cout[1] = (S_cin[0] & S_cin[1]) | (S_cin[0] & S_cin[2]) | (S_cin[1] & S_cin[2]);
assign S_temp[0] = S_cin[3];
assign S_temp[1] = S_cout[0];
assign S_temp[2] = S_cout[1];
assign S_temp[3] = S_cin[0];
assign S[0] = S_temp[1];
assign S[1] = S_temp[2];
assign S[2] = S_temp[3];
assign cout = S_cout[2];
endmodule
// Module Declaration
module full_adder(cin_in, A, B, S, cout);
input cin_in;
input A;
input B;
output S;
output cout;
reg [3:0] S;
reg [3:0] cin_in;
reg [3:0] A;
reg [3:0] B;
reg cout;
reg [3:0] S_cin;
reg [3:0] S_cout;
reg [3:0] S_temp;
mod_constant(in: S_cin[0], out: S_cin[0], index: 0);
mod_constant(in: S_cin[1], out: S_cin