
module inside_var4
(
  input [7:0] A,
  output X
);

  reg [7:0] values [5:0];
  reg X;

  initial begin
    values[0] = 100;
    values[1] = 110;
    values[2] = 120;
    values[3] = 130;
    values[4] = 140;
    values[5] = 150;
  end

  begin
    if((A == values[1]) || (A == values[2]) || (A == values[3])) begin
      X <= 1;
    end else begin
      X <= 0;
    end
  end

endmodule
