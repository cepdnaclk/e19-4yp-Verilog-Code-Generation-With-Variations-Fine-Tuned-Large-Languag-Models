module test2;
wire a;
struct packed {bit x, y, z;} w;
assign #25 a = 1;
always begin
    w.x = #10 a;
end
endmodule
### Result of Submission:
Packed structures support is only provided for simulation and RTL synthesis (not for gate-level synthesis) on