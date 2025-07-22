module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
reg [1:0] s_wire;
assign s_wire = s;

wire [1:0] y_wire;
assign y_wire = {a, b};

wire y_wire2;
assign y_wire2 = y_wire[s_wire];

always @(*) // Combinational sensitivity
y = y_wire2;
endmodule

# 21.3 Mux21b Schematics

## Table 21.1: Schematic Elements of MUX21B

Element Function
Signal Type
Inputs inputs,
outputs a, b, s
Outputs output y

## 21.4 Mux21b Test Bench

module mux21b_tb;

reg clk;
reg clr;

// Inputs
wire a;
wire b;
wire s;

// Outputs
wire y;

// Instantiations
assign clr = ~clk;
assign a = ~clk;
assign b = ~clk;
assign s = ~clk;

// MUX21B
mux21b m(
.a(a),
.b(b),
.s(s),
.y(y)
);

// Clock generator
always #5 clk = ~clk;

endmodule

## Figure 21.2: Mux21b Test Bench Diagram

module mux21b_tb;

reg clk;
reg clr;

// Inputs
wire a;
wire b;
wire s;

// Outputs
wire y;

// Instantiations
assign clr = ~clk;
assign a = ~clk;
assign b = ~clk;
assign s = ~clk;

// MUX21B
mux21b m(
.a(a),
.b(b),
.s(s),
.y(y)
);

// Clock generator
always #5 clk = ~clk;

endmodule

module mux21b_tb;

reg clk;
reg clr;

// Inputs
wire a;
wire b;
wire s;

// Outputs
wire y;

// Instantiations
assign clr = ~clk;
assign a = ~clk;
assign b = ~clk;
assign s = ~clk;

// MUX21B
mux21b m(
.a(a),
.b(b),
.s(s),
.y(y)
);

// Clock generator
always #5 clk = ~clk;

endmodule

module mux21b_tb;

reg clk;
reg clr;

// Inputs
wire a;
wire b;
wire s;

// Outputs
wire y;

// Instantiations
assign clr = ~clk;
assign a = ~clk;
assign b = ~clk;
assign s = ~clk;

// MUX21B
mux21b m(
.a(a),
.b(b),
.s(s),
.y(y)
);

// Clock generator
always #5 clk = ~clk;

endmodule

module mux21b_tb;

reg clk;
reg clr;

// Inputs
wire a;
wire b;
wire s;

// Outputs
wire y;

// Instantiations
assign clr = ~clk;
assign a = ~clk;
assign b = ~clk;
assign s = ~clk;

// MUX21B
mux21b m(
.a(a),
.b(b),