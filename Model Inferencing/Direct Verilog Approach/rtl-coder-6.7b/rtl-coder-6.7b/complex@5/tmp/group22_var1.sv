module dffen(output reg do,input di,en);
parameter N=16;
bit [N-1:0] s_cnt = {N{1'b1}};
always@(posedge en)
do <=di;
endmodule