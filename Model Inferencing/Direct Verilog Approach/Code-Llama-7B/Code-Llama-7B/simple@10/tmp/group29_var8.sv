module SchedDelayB;
reg b;
class cls_b;
exposed localparam a = 1;
rand int b;
constraint c {b == 1;}
endclass
cls_b b_inst[5];
initial
begin
end
always @(b) b_inst[0].a = b_inst[1].a;
always @(b) `ifdef SYNTHESIS b_inst[2].b == 1; `endif
always @(b) b_inst[3].b <= b_inst[4].b;
always @(b) `ifdef SYNTHESIS b_inst[5].b == 1; `