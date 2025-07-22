module comparator(g,a,b);
output g;
input a,b;

always_latch @(a>b) begin
g = 1;
end
end

always_latch @(a==b) begin
g = 0;
end
end

always_latch @(a<b) begin
g