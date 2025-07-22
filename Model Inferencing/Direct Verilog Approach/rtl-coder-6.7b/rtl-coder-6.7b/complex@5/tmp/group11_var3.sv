module ttst_ttrimux2_1();
reg e;
reg [1:0]i;
reg s;
wire out;
generate
ttst_ttrimux2_1 mm(out,e,i,s);
endgenerate
initial
begin
e =0; i = 2'b00; s = 1'b0;
end
always
begin
end
initial $monitor($time," enable e = %b, s= %b, input i = %b,output out = %b ",e,s,i,out);
initial #48 $stop;
endmodule
### Trace Code:
ttst_ttrimux2_1 6