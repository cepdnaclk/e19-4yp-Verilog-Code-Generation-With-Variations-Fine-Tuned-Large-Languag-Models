module ttst_ttrimux2_1();
reg e;
reg [1:0]i;
reg s;
wire out;
// ttrimux2_1 mm(out,e,i,s);
initial begin
e=0,i=0,s=0;
end
always begin
end
initial
begin
#2 e =0,i = 2'b00,s = 1'b0;
#3 e =1,i = 2'b01,s = 1'b1;
#5 e =0,i = 2'b10,s = 1'b0;
#7 e =1,i = 2'b10,s = 1'b1;
#9 e =0,i = 2'b10,s = 1'b1;
#11 e =1,i = 2'b01,s = 1'b0;
#12 e =0,i = 2'b10,s = 1'b1;
#14 e =0,i = 2'b00,s = 1'b0;
#16 e =1,i = 2'b11,s = 1'b1;
#18 e =1,i = 2'b00,s = 1'b1;
#20 e =0,i = 2'b11,s = 1'b1;
#22 e =1,i = 2'b10,s = 1'b0;
#24 e =1,i = 2'b11,s = 1'b1;
#26 e =1,i = 2'b0,s = 1'b1;
#28 e =0,i = 2'b10,s = 1'b0;
#30 e =0,i = 2'b11,s = 1'b0;
e =0; i = 2'b00; s = 1'b0;
end
initial
$monitor($time," enable e = %b, s= %b, input i = %b,output out = %b ",e,s,i,out);
initial #48 $stop;