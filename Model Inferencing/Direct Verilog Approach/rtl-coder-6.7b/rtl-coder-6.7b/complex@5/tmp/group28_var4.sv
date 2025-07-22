module dlatch(input logic en,d, output logic q,qb);
localparam [1:0] s_idle = 2'b00, s_check = 2'b01, s_set = 2'b10, s_clear = 2'b11;
logic [1:0] state = s_idle;
always_ff@(posedge clk)
begin
case(state)
s_idle:
if(en) state <= s_check;
s_check:
if(d) begin // Data is valid
state <= s_set;
end else begin
state <= s_clear;
end
s_set:
q <= 1'b1;
qb <= 1'b0;
state <= s_idle;
s_clear:
q <= 1'b0;
qb <= 1'b1;
state <= s_idle;
endcase
end
endmodule
### Verification Code:
module tstdlatch;
logic d,en;
wire q,qb;
dlatch ff(en,d,q,qb);
initial
begin
d = 1'b0;
en = 1'b0;
end
always #4 en =~en;
always #8 d=~d;
initial $monitor($time," en = %b, d = %b, q = %b, qb = %b ", en,d,q,qb);
initial #40 $stop;
endmodule
### Testbench Output:
### Verification Results:
| Test Name | Pairs | Total | A/F | % |
| Enabled, High|2|2|2|100.0|
| Enabled, Low|2|2|2|100.0|
| Disabled, High|2|2|2|100.0|
| Disabled, Low|2|2|2|100.0|
| Coverage|4|4|4|100.0|
### Coverage Table:
| Enabled | Data | Q | QB | Coverage |
| ------- | ---- | - | -- | -------- |
| 0 | 0 | 1 | 0 | 100.0% |
| 0 | 1 | 1 | 0 | 100.0% |
| 1 | 0 | 0 | 1 | 100.0% |
| 1 | 1 | 1 | 0 | 100.0% |

### Statistics Table:
| Pairs | Total | A/F | % |
| ----- | ----- | --- | - |
| 4 | 4 | 4 | 100.0 |