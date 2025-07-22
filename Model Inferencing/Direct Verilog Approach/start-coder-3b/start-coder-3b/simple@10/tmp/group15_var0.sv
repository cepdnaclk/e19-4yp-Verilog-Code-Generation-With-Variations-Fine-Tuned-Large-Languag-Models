module ALU_TB (
input wire [7:0] a,
input wire [7:0] b,
input wire [3:0] ctrl,
output wire [7:0] y
);

// Instantiate the two ALU modules using the module instantiator
// module ALU_TB_instantiation_module();
// Instantiate the ALU modules with initial values
ALU sw2led2_test_inst(
.a(a),
.b(b),
.ctrl(ctrl),
.y(y)
);

ALU sw2led2_inst(
.a(a),
.b(b),
.ctrl(ctrl),
.y(y)
);
// Instantiate the ALU modules with initial values
ALU_TB_instantiation_module(
.a(a),
.b(b),
.ctrl(ctrl),
.y(y)
);
assign a = 2’b1000;
assign b = 2’b0101;
assign ctrl = 6’b0111;
endmodule
module ALU (
input wire [3:0] ctrl,
input wire [7:0] a,
input wire [7:0] b,
output wire [7:0] y
);

// Instantiate the ALU
// module ALU_instantiation_module();

case (ctrl)
6’b0000:
y = a + b;
endcase
6’b0001:
y = a - b;
endcase
6’b0010:
y = a & b;
endcase
6’b0011:
y = a | b;
endcase
6’b0100:
y = a ^ b;
endcase
6’b0101:
y = ~a;
endcase
6’b0110:
y = a << 1;
endcase
6’b0111:
y = a >> 1;
endcase
6’b1000:
y = a * b;
endcase
6’b1001:
y = a / b;
endcase
6’b1010:
y = a & b;
endcase
6’b1011:
y = a | b;
endcase
6’b1100:
y = a ^ b;
endcase
6’b110