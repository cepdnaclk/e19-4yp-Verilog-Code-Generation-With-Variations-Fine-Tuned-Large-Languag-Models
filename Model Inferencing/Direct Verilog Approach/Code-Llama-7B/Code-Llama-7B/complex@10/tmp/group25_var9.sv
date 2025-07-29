module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;

reg [3:0] HiCount;
wire [3:0] Adjr, Incr;

always @(HiCount)
 if (HiCount[3:2] == 2'b10) Adjr = 2'b10;
 else if (HiCount[3:2] == 2'b01) Adjr = 2'b01;

generate
 case (HiCount[1:0])
 2'b10 : Incr = 4'b0000;
 2'b01 : Incr = 4'b0010;
 default : Incr = 4'b0100;
 endcase
endgenerate

always @(*)
 begin
  Excess_3_out = BCD_in + Adjr + Incr;
 end

always @(BCD_in)
begin
 HiCount = BCD_in[3:0];
end
endmodule