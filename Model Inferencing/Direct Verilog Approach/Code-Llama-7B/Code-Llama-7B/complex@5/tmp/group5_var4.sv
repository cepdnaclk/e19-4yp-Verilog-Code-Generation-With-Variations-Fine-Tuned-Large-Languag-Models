always @(negedge Resetn or posedge Clock)
    if (Resetn == 0) y <= A;
    else y <= y + 1'b1;
  end else begin
  inside
    case (y)
    0 : if (w[0])
      z = 0;
    else
      z = 1;
  1 : if (w[1])