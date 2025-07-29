module ttst_ttrimux2_1();
reg e;
reg [1:0]i;
generate
begin: triststate
  if ( `tritree_top.tritree_inst.`INST1.s == 1'b1)
  begin
    trinode ttrimux2_1 uut(out,e,i,s);
  end
  else
  begin
    trinode ttrimux2_1 uut(out,e,i,s);
  end
end
`endif

initial
begin
`ifdef tritree_top
 e =0; i = 2'b00; s = 1'b0;
`endif
end

always
begin
end

initial $monitor($time," enable e = %b, s= %b, input i = %b,output out = %b ",e,s,i,out);
initial #48 $stop;
endmodule