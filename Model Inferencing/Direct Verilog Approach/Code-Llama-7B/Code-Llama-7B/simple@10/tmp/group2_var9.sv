module test;
wire a;
packed struct {
    reg x;
    reg y;
    reg z;
} p;
packed struct {
    wire a;
    wire b;
} q;
assign #2