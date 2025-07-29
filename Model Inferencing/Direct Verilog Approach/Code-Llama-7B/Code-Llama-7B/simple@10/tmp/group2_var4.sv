module test;
wire a;
struct packed {
    reg x;
    reg y;
    reg z;
} d;
assign #25 a = 1;
assign #10 d.y = a;
endmodule