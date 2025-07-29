module DFF (input [15:0] in_un,
output [15:0] out_un);

package My_Pkg;
	union packed {

	logic [15:0] in_u1;
	logic [15:0] in_u2;
    } input_union_u1;

endpackage


import My_Pkg::*;
input_union_u1 = '0;
input_union_u1.in_u1 = in_un;

always @(input_union_u1)