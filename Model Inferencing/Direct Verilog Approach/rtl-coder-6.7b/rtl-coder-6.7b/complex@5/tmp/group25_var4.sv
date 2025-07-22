module comparator (input logic [3:0] A, B, output logic HiCount, LoCount, Equal);
wire [4:0] Adjr, Adja;
wire [2:0] HiCoun, LoCoun, Equal;
assign Adjr = 4'({1'b0, A});
assign Adja = 4'({1'b0, B});
assign HiCoun = (Adjr > Adja);
assign LoCoun = (Adjr < Adja);
assign Equal = (Adjr == Adja);
always @(*) begin
  case ({HiCoun, LoCoun, Equal})
  3'b100: HiCount = 1'b1;
  3'b010: LoCount = 1'b1;
  3'b001: Equal = 1'b1;
  3'b000: HiCount = LoCount = Equal = 1'b0;
  endcase
end
endmodule