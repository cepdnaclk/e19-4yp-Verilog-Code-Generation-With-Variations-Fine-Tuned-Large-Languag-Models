module demux4_top (
input wire a,
input wire [3:0] sel,
input wire [2:0] b,
output wire c
);
case (sel)
4'd4: c[2] = sel[2];
default: c[2] = b[2];
3'd3: c[1] = sel[1];
default: c[1] = b[1];
2'd2: c[0] = sel[0];
default: c[0] = b[0];
endcase // Priority Case
endmodule

## Example 8: Adder with Single-Cycle

### Base Verilog Code:
module adder4_top(
input wire [4:0] a,
input wire [4:0] b,
output wire [8:0] s
);
xor4 out0(
.a(a[4]),
.b(a[3]),
.out(s[7])
);
xor4 out1(
.a(a[4]),
.b(a[2]),
.out(s[6])
);
xor4 out2(
.a(a[4]),
.b(a[1]),
.out(s[5])
);
xor4 out3(
.a(a[4]),
.b(a[0]),
.out(s[4])
);
and4 in0(
.x(b[4]),
.y(b[3]),
.z(b[2]),
.out(s[3])
);
and4 in1(
.x(b[4]),
.y(b[3]),
.z(b[1]),
.out(s[2])
);
and4 in2(
.x(