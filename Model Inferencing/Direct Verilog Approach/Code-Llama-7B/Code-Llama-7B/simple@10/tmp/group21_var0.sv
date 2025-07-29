module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
assign g = (x1 & x3) | (x2 & x4);
assign h = (x1 | x3) & (x2 | x4);
assign f = g | h;
reg c; c = 0;
always @(posedge clk)
  begin
    $display("c=%b", c);
    if(c == 0)
      c = 1;
    else
      c = 0;
    case(c)
      1:
        begin
          assign g = (x1 & x3) | (x2 & x4);
          assign h = (x1 | x3) & (x2 | x4);
          assign f = g | h;
        end
      0:
        begin
          assign g = (x3 & x1) | (x4 & x2);
          assign h = (x3 | x1) & (x4 | x2);
          assign f = g | h;
        end
    endcase
  end
endmodule
### Final Code including randomization:
module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
reg c; c = 0;
always @(posedge clk)
  begin
    $display("c=%b", c);
    if(c == 0)
      c = 1;
    else
      c = 0;
    case(c)
      1:
        begin
          assign g = (x1 & x3) | (x2 & x4);
          assign h = (x1 | x3) & (x2 | x4);
          assign f = g | h;
        end
      0:
        begin
          assign g = (x3 & x1) | (x4 & x2);
          assign h = (x3 | x1) & (x4 | x2);
          assign f = g