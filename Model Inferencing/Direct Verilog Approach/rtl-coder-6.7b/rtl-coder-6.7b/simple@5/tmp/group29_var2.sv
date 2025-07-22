module SchedDelayA;
reg a, b;
class c;
rand bit[0:1] c;
endclass
c c0, c1;
initial
begin
end
always @(c0.c) a = c0.c;
always @(c1.c) b <= c1.c;
endmodule