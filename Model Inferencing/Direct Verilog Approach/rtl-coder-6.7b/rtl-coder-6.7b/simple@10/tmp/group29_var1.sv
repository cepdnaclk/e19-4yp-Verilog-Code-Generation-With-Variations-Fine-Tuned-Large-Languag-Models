module SchedDelayA;
reg a, b;
initial
begin
end
input [7:0]  in1, in2;
input [7:0]  inputs [*];
input [7:0]  in3, in4;
input [7:0]  inputs [*];
always @(b)
begin
    a = b;
end
always @(a)
begin
    b <= a;
end
endmodule
### Expectation Verification Code:
reg [7:0] in1_check;
reg [7:0] in2_check;
reg [7:0] in3_check;
reg [7:0] in4_check;
reg [7:0] inputs_check [*];
`ifdef SIMULATE
`endif
`ifdef VERILATOR
`endif
reg [7:0] out_check;
integer index;
`ifdef VERILATOR
`endif
`ifdef SIMULATE
`endif
end