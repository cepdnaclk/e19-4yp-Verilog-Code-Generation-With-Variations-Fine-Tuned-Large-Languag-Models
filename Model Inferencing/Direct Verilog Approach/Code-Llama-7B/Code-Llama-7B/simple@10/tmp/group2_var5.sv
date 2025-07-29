```
module test;
wire a;
struct packed_struct {wire b[3:0]; wire c[3:0]; wire d;} a;
assign #10 a.b[0] = 1;
always begin
    a.b[1] = #10 a.b[0];
    a.b[2] = #10 a.b[1];
    a.b[3] = #10 a.b[2];
    a.c[0] = #10 a.b[3];
    a.c[1] = #10 a.c[0];
    a.c[