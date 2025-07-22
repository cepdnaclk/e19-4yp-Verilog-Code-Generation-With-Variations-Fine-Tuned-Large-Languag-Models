module adder(a, b, cout, sum);
input [3:0] a;
input [3:0] b;
input cout;
output [3:0] sum;
wire [1:0] packed_a;
wire [1:0] packed_b;
assign packed_a[0] = a[0];
assign packed_a[1] = a[1];
assign packed_b[0] = b[0];
assign packed_b[1] = b[1];
assign sum = packed_a[0]+packed_b[0]+cout+packed_a[1]+packed_b[1];
endmodule

### Base Verilog Code:
module decoder(in, out0, out1, out2, out3);
input [3:0] in