module test;
wire [3:0] a, b, c;
struct packed {
    reg x;
    reg y;
    reg z;
} test_in;
assign #25 a = test_in;
assign b = #10 a.x;