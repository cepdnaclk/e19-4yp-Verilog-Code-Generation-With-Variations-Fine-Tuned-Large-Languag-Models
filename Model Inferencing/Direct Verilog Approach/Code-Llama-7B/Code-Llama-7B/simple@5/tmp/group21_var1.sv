module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
logic [3:0] c;
assign g = (x1 & x3) | (x2 & x4);
assign h = (x1 | x3) & (x2 | x4);
assign f = g | h;
always #10 c = $random;
initial begin
  #100;
  $finish;
end
endmodule