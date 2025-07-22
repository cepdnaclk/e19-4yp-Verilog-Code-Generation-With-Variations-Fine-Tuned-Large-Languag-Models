module maj3 (a, b, c, y);
input a, b, c;
output y;
wire [1:0] im;
wire im1, im2, im3;
always @*
  begin
    for (int i = 0; i < $size(im); i = i + 1)
      begin im[i] = (i == 0)? a :
                     (i == 1)? b :
                     (i == 2)? c : 1'b0; end
  end
assign im1 = im[1] & im[2];
assign im2 = im[2] & im[0];
assign im3 = im[0] & im[1];
or #(3, 5) (y, im1, im2, im3);
endmodule