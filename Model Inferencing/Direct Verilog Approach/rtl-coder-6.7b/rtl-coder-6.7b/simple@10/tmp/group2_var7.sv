module test;
wire a;
struct packed { reg x, y, z, q, r; } signals;
always begin
    signals.x = #10 a;
end