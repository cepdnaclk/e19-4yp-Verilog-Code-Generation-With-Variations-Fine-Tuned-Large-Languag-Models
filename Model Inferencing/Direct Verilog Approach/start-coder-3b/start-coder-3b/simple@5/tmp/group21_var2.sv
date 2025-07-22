module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
typedef struct rand {
logic f, g, h;
} rand_t;
rand_t r;
assign g = (x1 & x3) | (x2 & x4);
assign h = (x1 | x3) & (x2 | x4);
assign f = g | h;

initial begin
r.f = x1;
r.g = x2;
r.h = x3;
end

initial begin
wait;
end

endmodule

### Verifier:
module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
assign g = (x1 & x3) | (x2 & x4);
assign h = (x1 | x3) & (x2 | x4);
assign f = g | h;
endmodule

module testbench;
bit x1;
bit x2;
bit x3;
bit x4;
bit f;
bit g;
bit h;

initial begin
x1 = 0;
x2 = 0;
x3 = 0;
x4 = 0;
f = 0;
g = 0;
h = 0;
end

initial begin
x1 = 1;
x2 = 1;
x3 = 1;
x4 = 1;
f = 1;
g = 1;
h = 1;
end

initial begin
x1 = 1;
x2 = 1;
x3 = 0;
x4 = 1;
f = 0;
g = 0;
h = 1;
end

initial begin
x1 = 1;
x2 = 1;
x3 = 1;
x4 = 0;
f = 1;
g = 1;
h = 0;
end

initial begin
x1 = 1;
x2 = 0;
x3 = 1;
x4 = 0;
f = 1;
g = 1;
h = 1;
end

initial begin
x1 = 1;
x2 = 0;
x3 = 0;
x4 = 1;
f = 1;
g = 1;
h = 0;
end

initial begin
x1 = 1;
x2 = 0;
x3 = 0;
x4 = 0;
f = 0;
g = 0;
h = 0;
end

initial begin
x1 = 0;
x2 = 1;
x3 = 1;
x4 = 0;
f = 0;
g = 0;
h = 1;
end

initial begin
x1 = 0;
x2 = 1;
x3 = 0;
x4 = 1;
f = 0;
g = 1;
h = 0;
end

initial begin
x1 = 0;
x2 = 0;
x3 = 1;
x4 = 1;
f = 0;
g = 1;
h = 0;
end

initial begin
x1 = 0;
x2 = 0;
x3 = 1;
x4 = 0;
f = 0;
g = 1;
h = 1;
end

initial begin
x1 = 0;
x2 = 0;
x3 = 0;
x4 = 1;
f = 0;
g = 0;
h = 1;
end

initial begin
x1 = 0;
x2 = 0;
x3 = 0;
x4 = 0;
f = 1;
g = 0;
h = 0;
end

initial begin
x1 = 0;
x2 = 1;
x3 = 1;
x4 = 1;
f = 0;
g = 0;
h = 0;
end

initial begin
x1 = 0;
x2 = 1;
x3 = 1;
x4 = 0;
f = 1;
g = 0;
h = 0;
end

initial begin
x1 = 0;
x2 = 1;
x3 = 0;
x4 = 0;
f = 1;
g = 0;
h = 1;
end

initial begin
x1 = 0;
x2 = 0;
x3 = 1;
x4 = 0;
f = 1;
g = 0;
h = 1;
end

initial begin
x1 = 0;
x2 = 0;
x3 = 1;
x4 = 1;
f = 1;
g = 1;
h = 1;
end

initial begin
x1 = 0;
x2 = 0;
x3 = 0;
x4 = 0;
f = 1;
g = 1;
h = 1;
end

initial begin
x1 = 1;
x2 = 1;
x3 = 1;
x4 = 1;
f = 1;
g = 1;
h = 1;
end

initial begin
x1 = 1;
x2 = 1;
x3 = 1;
x4 = 1;
f = 1;
g = 1;
h = 1;
end

initial begin
x1 = 0;
x2 = 0;
x3 = 0;
x4 = 0;
f = 1;
g = 1;
h = 1;
end

initial begin
x1 = 1;
x2 = 0;
x3 = 1;
x4 = 0;
f = 1;
g = 0;
h = 1;
end

initial begin
x1 = 1;
x2 = 0;
x3 = 0;
x4 = 1;
f = 1;
g = 0;
h = 0;
end

initial begin
x1 = 1;
x2 = 0;
x3 = 0;
x4 = 0;
f = 0;
g = 0;
h = 1;
end

initial begin
x1 = 0;
x2 = 0;
x3 = 0;
x4 = 1;
f = 0;
g = 1;
h = 0;
end

initial begin
x1 = 0;
x2 = 0;
x3 = 1;
x4 = 0;
f = 0;
g = 1;
h = 1;
end

initial begin
x1 = 0;
x2 = 1;
x3 = 0;
x4 = 1;
f = 0;
g = 1;
h = 0;
end

initial begin
x1 = 1;
x2 = 1;
x3 = 0;
x4 = 1;
f = 0;
g = 0;
h = 0;
end

initial begin
x1 = 0;
x2 = 0;
x3 = 0;
x4 = 0;
f = 1;
g = 1;
h = 0;
end

initial begin
x1 = 1;
x2 = 0;
x3 = 1;
x4 = 1;
f = 1;
g = 0;
h = 1;
end

initial begin
x1 = 1;
x2 = 0;
x3 = 1;
x4 = 0;
f = 1;
g = 0;
h = 0;
end

initial begin
x1 = 1;
x2 = 0;
x3 = 0;
x4 = 0;
f = 1;
g = 1;
h = 0;
end

initial begin
x1 = 1;
x2 = 1;
x3 = 0;
x4 = 0;
f =