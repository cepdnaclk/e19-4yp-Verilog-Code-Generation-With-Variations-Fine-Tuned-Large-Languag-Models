module SchedDelayA;
class B;
rand bit a;
endclass
B b;
`ifndef VERILATOR
initial
begin
end
always @(b.a) b.a = b.a;
always @(b.a) b.a <= b.a;
`else
initial
begin
end
`endif
endmodule