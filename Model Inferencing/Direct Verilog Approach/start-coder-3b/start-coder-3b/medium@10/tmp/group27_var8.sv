```
module aoi_gate (o, a1, a2, b1, b2);
input a1, a2, b1, b2;
output o;

wire [2:0] a1_b1;
wire [2:0] a1_a2;
wire [2:0] a2_b2;
wire [2:0] b1_a1;
wire [2:0] b1_b2;
wire [2:0] b2_a2;
wire [2:0] a1_b1_b2_a2;
wire [2:0] a1_b1_a2_b2;
wire [2:0] a2_b2_a1_b1;
wire [2:0] a2_b2_b1_a1;

and g1(o, a1, b1);
and g2(o, a2, b2);
and g3(o, a1, a2);
and g4(o, b1, b2);

assign a1_b1 = {b1, a1};
assign a1_a2 = {a2, a1};
assign a2_b2 = {b2, a2};
assign b1_a1 = {a1, b1};
assign b1_b2 = {b2, b1};
assign b2_a2 = {a2, b2};

assign a1_b1_b2_a2 = {b2_a2, a1_b1};
assign a1_b1_a2_b2 = {a2_b2, a1_b1};
assign a2_b2_a1_b1 = {a1_b1, a2_b2};
assign a2_b2_b1_a1 = {b1_a1, a2_b2};

case ({b1, b2, a1, a2})
1'b0, 3'b000 : o <= (g1.o & g4.o);
1'b0, 3'b001 : o <= (g2.o & g4.o);
1'b0, 3'b010 : o <= (g2.o & g3.o);
1'b0, 3'b011 : o <= (g1.o & g3.o);
1'b0, 3'b100 : o <= (g2.o & g1.o & g3.o);
1'b0, 3'b101 : o <= (g1.o & g2.o & g3.o);
1'b0, 3'b110 : o <= (g1.o & g2.o & g4.o);
1'b0, 3'b111 : o <= (g1.o & g3.o & g4.o);
1'b1, 3'b000 : o <= (g3.o & g4.o);
1'b1, 3'b001 : o <= (g2.o & g4.o);
1'b1, 3'b010 : o <= (g1.o & g4.o);
1'b1, 3'b011 : o <= (g1.o & g3.o);
1'b1, 3'b100 : o <= (g2.o & g1.o & g3.o);
1'b1, 3'b101 : o <= (g2.o & g1.o & g4.o);
1'b1, 3'b110 : o <= (g2.o & g3.o & g4.o);
1'b1, 3'b111 : o <= (g3.o & g4.o & g1.o & g2.o);
default : o <= 1'b0;
endcase
endmodule
```
### Testbench:
```
module aoi_gate_tb;
reg a1, a2, b1, b2;
reg a1_b1_a2_b2;
reg a2_b2_a1_b1;
wire o;

module aoi_gate (o, a1, a2, b1, b2);
input a1, a2, b1, b2;
output o;

wire [2:0] a1_b1;
wire [2:0] a1_a2;
wire [2:0] a2_b2;
wire [2:0] b1_a1;
wire [2:0] b1_b2;
wire [2:0] b2_a2;
wire [2:0] a1_b1_b2_a2;
wire [2:0] a1_b1_a2_b2;
wire [2:0] a2_b2_a1_b1;
wire [2:0] a2_b2_b1_a1;

and g1(o, a1, b1);
and g2(o, a2, b2);
and g3(o, a1, a2);
and g4(o, b1, b2);

assign a1_b1 = {b1, a1};
assign a1_a2 = {a2, a1};
assign a2_b2 = {b2, a2};
assign b1_a1 = {a1, b1};
assign b1_b2 = {b2, b1};
assign b2_a2 = {a2, b2};

assign a1_b1_b2_a2 = {b2_a2, a1_b1};
assign a1_b1_a2_b2 = {a2_b2, a1_b1};
assign a2_b2_a1_b1 = {a1_b1, a2_b2};
assign a2_b2_b1_a1 = {b1_a1, a2_b2};

case ({b1, b2, a1, a2})
1'b0, 3'b000 : o <= (g1.o & g4.o);
1'b0, 3'b001 : o <= (g2.o & g4.o);
1'b0, 3'b010 : o <= (g2.o & g3.o);
1'b0, 3'b011 : o <= (g1.o & g3.o);
1'b0, 3'b100 : o <= (g2.o & g1.o & g3.o);
1'b0, 3'b101 : o <= (g1.o & g2.o & g3.o);
1'b0, 3'b110 : o <= (g1.o & g2.o & g4.o);
1'b0, 3'b111 : o <= (g1.o & g3.o & g4.o);
1'b1, 3'b000 : o <= (g3.o & g4.o);
1'b1, 3'b001 : o <= (g2.o & g4.o);
1'b1, 3'b010 : o <= (g1.o & g4.o);
1'b1, 3'b011 : o <= (g1.o & g3.o);
1'b1, 3'b100 : o <= (g2.o & g1.o & g3.o);
1'b1, 3'b101 : o <= (g2.o & g1.o & g4.o);
1'b1, 3'b110 : o <= (g2.o & g3.o & g4.o);
1'b1, 3'b111 : o <= (g3.o & g4.o & g1.o & g2.o);
default : o <= 1'b0;
endcase

endmodule

always
begin
a1 = 0;
a2 = 0;
b1 = 0;
b2 = 0;
a1_b1_a2_b2 = 0;
a2_b2_a1_b1 = 0;
#