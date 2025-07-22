module alu_test_m;

import "C:\Users\HP\Desktop\lab5\Lab5\testbench_alu_m.v"

integer i;

module test_module (
input clk,
input rst,
input [7:0] a,
input [3:0] op,
input [7:0] b,
output [7:0] res
);

ALU alu_module (
.clk (clk),
.a (a),
.b (b),
.op (op),
.res (res)
);

endmodule

assign res = alu_module.res;

endmodule

### Testbench Code:
module alu_test (
input clk,
input rst,
input [7:0] a,
input [3:0] op,
input [7:0] b,
output [7:0] res
);

ALU alu_module (
.clk (clk),
.a (a),
.b (b),
.op (op),
.res (res)
);

assign alu_module.op = 8'b00000001;

assign alu_module.op = 8'b10000111;

endmodule

assign alu_module.op = 8'b01000001;

endmodule

assign alu_module.op = 8'b10101011;

endmodule

assign alu_module.op = 8'b10101001;

endmodule

assign alu_module.op = 8'b10000001;

endmodule

assign alu_module.op = 8'b00000001;

endmodule

assign alu_module.op = 8'b11101011;

endmodule

assign alu_module.op = 8'b11001011;

endmodule

assign alu_module.op = 8'b11001001;

endmodule

assign alu_module.op = 8'b00000011;

endmodule

assign alu_module.op = 8'b11101001;

endmodule

assign alu_module.op = 8'b10100001;

endmodule

assign alu_module.op = 8'b10100011;

endmodule

assign alu_module.op = 8'b10100011;

endmodule

assign alu_module.op = 8'b10000011;

endmodule

assign alu_module.op = 8'b00000011;

endmodule

assign alu_module.op = 8'b01100011;

endmodule

assign alu_module.op = 8'b00100011;

endmodule

assign alu_module.op = 8'b01100001;

endmodule

assign alu_module.op = 8'b10100001;

endmodule

assign alu_module.op = 8'b01100001;

endmodule

assign alu_module.op = 8'b10100101;

endmodule

assign alu_module.op = 8'b10000101;

endmodule

assign alu_module.op = 8'b00000101;

endmodule

assign alu_module.op = 8'b11100101;

endmodule

assign alu_module.op = 8'b00000101;

endmodule

assign alu_module.op = 8'b11000101;

endmodule

assign alu_module.op = 8'b11000101;

endmodule

assign alu_module.op = 8'b10101011;

endmodule

assign alu_module.op = 8'b01101011;

endmodule

assign alu_module.op = 8'b10101001;

endmodule

assign alu_module.op = 8'b01101001;

endmodule

assign alu_module.op = 8'b10001001;

endmodule

assign alu_module.op = 8'b00001001;

endmodule

assign alu_module.op = 8'b11101001;

endmodule

assign alu_module.op = 8'b11001001;

endmodule

assign alu_module.op = 8'b10101011;

endmodule

assign alu_module.op = 8'b00101011;

endmodule

assign alu_module.op = 8'b10101001;

endmodule

assign alu_module.op = 8'b00101001;

endmodule

assign alu_module.op = 8'b10001001;

endmodule

assign alu_module.op = 8'b00001001;

endmodule

assign alu_module.op = 8'b01101001;

endmodule

assign alu_module.op = 8'b00101001;

endmodule

assign alu_module.op = 8'b01101011;

endmodule

assign alu_module.op = 8'b00101011;

endmodule

assign alu_module.op = 8'b10101011;

endmodule

assign alu_module.op = 8'b11101011;

endmodule

assign alu_module.op = 8'b11001011;

endmodule

assign alu_module.op = 8'b10001011;

endmodule

assign alu_module.op = 8'b00001011;

endmodule

assign alu_module.op = 8'b11101011;

endmodule

assign alu_module.op = 8'b01101011;

endmodule

assign alu_module.op = 8'b10101011;

endmodule

assign alu_module.op = 8'b11001011;

endmodule

assign alu_module.op = 8'b11001001;

endmodule

assign alu_module.op = 8'b01101001;

endmodule

assign alu_module.op = 8'b10101011;

endmodule

assign alu_module.op = 8'b11101011;

endmodule

assign alu_module.op = 8'b01101011;

endmodule

assign alu_module.op = 8'b00101011;

endmodule

assign alu_module.op = 8'b10101011;

endmodule

assign alu_module.op = 8'b01101011;

endmodule

assign alu_module.op = 8'b11101001;

endmodule

assign alu_module.op = 8'b11001001;

endmodule

assign alu_module.op = 8'b101