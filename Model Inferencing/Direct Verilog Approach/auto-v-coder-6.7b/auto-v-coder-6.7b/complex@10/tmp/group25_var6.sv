```verilog
module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;

reg [3:0] Adjr;
always @(*) begin
    case (BCD_in)
        4'b0000 : Adjr = 4'b0;
        4'b0001 : Adjr = 4'b1;
        4'b0010 : Adjr = 4'b2;
        4'b0011 : Adjr = 4'b3;
        4'b0100 : Adjr = 4'b4;
        4'b0101 : Adjr = 4'b5;
        4'b0110 : Adjr = 4'b6;
        4'b0111 : Adjr = 4'b7;
        4'b1000 : Adjr = 4'b8;
        4'b1001 : Adjr = 4'b9;
        4'b1010 : Adjr = 4'b0;
        4'b1011 : Adjr = 4'b1;
        4'b1100 : Adjr = 4'b2;
        4'b1101 : Adjr = 4'b3;
        4'b1110 : Adjr = 4'b4;
        4'b1111 : Adjr = 4'b5;
        default : Adjr = 4'bz;
    endcase
end

assign Excess_3_out = BCD_in + Adjr;
endmodule

module t_encoder();
reg [3:0] BCD_in;
wire [3:0] Excess_3_out;
encoder M0(BCD_in, Excess_3_out);
initial
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);

initial begin