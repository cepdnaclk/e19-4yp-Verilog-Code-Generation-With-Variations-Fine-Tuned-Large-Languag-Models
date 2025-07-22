module contres(o,i1,i2);
input i1,i2;
output o;
generate
genvar ii;
reg [1:0] oo;
initial begin
for(ii=0;ii<2;ii=ii+1)
oo[ii]=i1||i2;
end
endgenerate
endmodule