module jk(j, k, q, reset, clock);
  output q;
  input j, k, reset, clock;
  reg q;
  always @(posedge clock or posedge reset) begin
    case ({j,k})
      1'b1, 1'b0 : q <= 1'b0;
      1'bX, 1'b0 : q <= 1'bX;
      1'bX, 1'b1 : q <= 1'b1;
      1'b1, 1'b1 : q <= ~q;
    endcase
  end
endmodule