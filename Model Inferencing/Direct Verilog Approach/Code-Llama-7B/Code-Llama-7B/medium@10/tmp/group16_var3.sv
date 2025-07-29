module mux24b(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
generate
for(genvar i = 0; i < 4; i = i + 1) begin:for_gen_i
for(genvar j = 0; j < 4; j = j + 1) begin:for_gen_j
if(j == i) begin:for_gen_j_j_eq_i
if(i == 0) begin:for_gen_j_j_eq_i_i_eq_0
always @(*)
begin:for_gen_j_j_eq_i_i_eq_0_always_1
if(s == 0)
y[i] = a[i];
else
y[i] = b[i];
end
end:for_gen_j_j_eq_i_i_eq_0_always_1
end:for_gen_j_j_eq_i_i_eq_0
else
begin:for_gen_j_j_eq_i_i_neq_0
always @(*)
begin:for_gen_j_j_eq_i_i_neq_0_always_2
if(s == 0)
y[i] = a[i];
else
y[i] = b[i];
end
end:for_gen_j_j_eq_i_i_neq_0_always_2
end:for_gen_j_j_eq_i_i_neq_0
end:for_gen_j_j_eq_i
end:for_gen_j
end:for_gen_i
endgenerate
endmodule
### Base Verilog Code:
module mux4b(
input wire [1:0] a,
input wire s,
output reg y
);
always @(*)
begin
if(s == 0)
y = a[0];
else
y = a[1];
end
endmodule
### Vari