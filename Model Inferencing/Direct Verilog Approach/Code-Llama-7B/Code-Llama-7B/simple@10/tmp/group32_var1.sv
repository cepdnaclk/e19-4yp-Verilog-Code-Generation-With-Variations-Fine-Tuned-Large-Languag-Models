always @(posedge clock) begin
  a_reg <= a_next;
  b_reg <= b_next;
end
### Original Code:
always @(posedge clock) begin
  if (resetn == 1'b0) begin
    a_reg <= 1'b0;
  end else begin
    a_reg <= a_next;
  end