module test;
wire a;
struct packed {reg x, y, z;} signals;
assign #25 signals.a = 1;
always begin
    signals.x = #10 a;
end
endmodule