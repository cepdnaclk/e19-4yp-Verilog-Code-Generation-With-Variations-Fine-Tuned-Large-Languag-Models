module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;
parameter [1:0] HiCount = {BC,AB,AA,00};

reg [3:0] Adjr;
wire [3:0] Excess_4_out;

reg [3:0] HiCount_local;

wire [3:0] Excess_3_out_local;

generate
begin
Excess_4_out = Excess_3_out + HiCount;
end
endgenerate
assign Excess_3_out = (HiCount_local == 0)? BCD_in : (HiCount_local == 1)? Excess_4_out[1:0] : (HiCount_local == 2)? Excess_4_out[2:0] : (HiCount_local == 3)? Excess_4_out[3:0] : 0;
endgenerate
assign Excess_3_out = (HiCount_local == 0)? BCD_in : (HiCount_local == 1)? Excess_4_out[1:0] : (HiCount_local == 2)? Excess_4_out[2:0] : (HiCount_local == 3)? Excess_4_out[3:0] : 0;
endgenerate
assign Excess_3_out = (HiCount_local == 0)? BCD_in : (HiCount_local == 1)? Excess_4_out[1:0] : (HiCount_local == 2)? Excess_4_out[2:0] : (HiCount_local == 3)? Excess_4_out[3:0] : 0;
endgenerate
assign Excess_3_out = (HiCount_local == 0)? BCD_in : (HiCount_local == 1)? Excess_4_out[1:0] : (HiCount_local == 2)? Excess_4_out[2:0] : (HiCount_local == 3)? Excess_4_out[3:0] : 0;
endgenerate
assign Excess_3_out = (HiCount_local == 0)? BCD_in : (HiCount_local == 1)? Excess_4_out[1:0] : (HiCount_local == 2)? Excess_4_out[2:0] : (HiCount_local == 3)? Excess_4_out[3:0] : 0;
endgenerate
assign Excess_3_out = (HiCount_local == 0)? BCD_in : (HiCount_local == 1)? Excess_4_out[1:0] : (HiCount_local == 2)? Excess_4_out[2:0] : (HiCount_local == 3)? Excess_4_out[3:0] : 0;
endgenerate
assign Excess_3_out = (HiCount_local == 0)? BCD_in : (HiCount_local == 1)? Excess_4_out[1:0] : (HiCount_local == 2)? Excess_4_out[2:0] : (HiCount_local == 3)? Excess_4_out[3:0] : 0;
endgenerate
assign Excess_3_out = (HiCount_local == 0)? BCD_in : (HiCount_local == 1)? Excess_4_out[1:0] : (HiCount_local == 2)? Excess_4_out[2:0] : (HiCount_local == 3)? Excess_4_out[3:0] : 0;
endgenerate
assign Excess_3_out = (HiCount_local == 0)? BCD_in : (HiCount_local == 1)? Excess_4_out[1:0] : (HiCount_local == 2)? Excess_4_out[2:0] : (HiCount_local == 3)? Excess_4_out[3:0] : 0;
endgenerate
assign Excess_3_out = (HiCount_local == 0)? BCD_in : (HiCount_local == 1)? Excess_4_out[1:0] : (HiCount_local == 2)? Excess_4_out[2:0] : (HiCount_local == 3)? Excess_4_out[3:0] : 0;
endgenerate
assign Excess_3_out = (HiCount_local == 0)? BCD_in : (HiCount_local == 1)? Excess_4_out[1:0] : (HiCount_local == 2)? Excess_4_out[2:0] : (HiCount_local == 3)? Excess_4_out[3:0] : 0;
endgenerate
assign Excess_3_out = (HiCount_local == 0)? BCD_in : (HiCount_local == 1)? Excess_4_out[1:0] : (HiCount_local == 2)? Excess_4_out[2:0] : (HiCount_local == 3)? Excess_4_out[3:0] : 0;
endgenerate
assign Excess_3_out = (HiCount_local == 0)? BCD_in : (HiCount_local == 1)? Excess_4_out[1:0] : (HiCount_local == 2)? Excess_4_out[2:0] : (HiCount_local == 3)? Excess_4_out[3:0] : 0;
endgenerate
assign Excess_3_out = (HiCount_local == 0)? BCD_in : (HiCount_local == 1)? Excess_4_out[1:0] : (HiCount_local == 2)? Excess_4_out[2:0] : (HiCount_local == 3)? Excess_4_out[3:0] : 0;
endgenerate
assign Excess_3_out = (HiCount_local == 0)? BCD_in : (HiCount_local == 1)? Excess_4_out[1:0] : (HiCount_local == 2)? Excess_4_out[2:0] : (HiCount_local == 3)? Excess_4_out[3:0] : 0;
endgenerate
assign Excess_3_out = (HiCount_local == 0)? BCD_in : (HiCount_local == 1)? Excess_4_out[1:0] : (HiCount_local == 2)? Excess_4_out[2:0] : (HiCount_local == 3)? Excess_4_out[3:0] : 0;
endgenerate
assign Excess_3_out = (HiCount_local == 0)? BCD_in : (HiCount_local == 1)? Excess_4_out[1:0] : (HiCount_local == 2)? Excess_4_out[2:0] : (HiCount_local == 3)? Excess_4_out[3:0] : 0;
endgenerate
assign Excess_3_out = (HiCount_local == 0)? BCD_in : (HiCount_local == 1)? Excess_4_out[1:0] : (HiCount_local == 2)? Excess_4_out[2:0] : (HiCount_local == 3)? Excess_4_out[3:0] : 0;
endgenerate
assign Excess_3_out = (HiCount_local == 0)? BCD_in : (HiCount_local == 1)? Excess_4_out[1:0] : (HiCount_local == 2)? Excess_4_out[2:0] : (HiCount_local == 3)? Excess_4_out[3:0] : 0;
endgenerate
assign Excess_3_out = (HiCount_local == 0)? BCD_in : (HiCount_local == 1)? Excess_4_out[1:0] : (HiCount_local == 2)? Excess_4_out[2:0] : (HiCount_local == 3)? Excess_