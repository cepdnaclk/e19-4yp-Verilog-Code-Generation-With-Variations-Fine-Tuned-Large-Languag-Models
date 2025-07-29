module alu_tb;
reg [4:0] op;
wire [31:0] res;
reg [31:0] a, b;
reg [7:0] sw;
wire [7:0] ld;
localparam [3:0] SGN = 4'b1111;

sw2led2 led(sw,ld);

// test code
reg [31:0] expected;

logic [31:0] sw_a, sw_b;
always @(sw) begin
sw_a = {{8{sw[7]}}, sw};
sw_b = {{8{sw[15]}}, sw};
end

initial begin
op = 0;
a = 0;
b = 0;
sw = 0;
$dumpfile("alu.vcd");
$dumpvars();
end
always begin
#5 op = $random();
#5 a = $random();
#5 b = $random();
#5 sw = $random();
#5 if (sw == 0) sw = 1;
#5 end
end

wire signed [31:0] test_res;
always @(op) begin
case (op)
0: test_res = a + b;
1: test_res = a - b;
2: test_res = a * b;
3: test_res = a / b;
4: test_res = a % b;
5: test_res = a & b;
6: test_res = a | b;
7: test_res = a ^ b;
8: test_res = a && b;
9: test_res = a || b;
10: test_res = a <<< 2;
11: test_res = a >>> 2;
12: test_res = a >>> 11;
13: test_res = a <<< 7;
14: test_res = a >>> 7;
15: test_res = ~a;
16: test_res = a + 1;
17: test_res = a - 1;
18: test_res = a <<