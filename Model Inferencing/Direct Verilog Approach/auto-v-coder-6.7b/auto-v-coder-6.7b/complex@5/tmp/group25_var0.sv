```verilog
package counter_pkg;
    reg [3:0] Adjr;
endpackage

module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;

reg [3:0] Adjr;

always @(*) begin
    case (BCD_in)
        4'b0000: Adjr = 4'd0;
        4'b0001: Adjr = 4'd1;
        4'b0010: Adjr = 4'd2;
        4'b0011: Adjr = 4'd3;
        4'b0100: Adjr = 4'd4;
        4'b0101: Adjr = 4'd5;
        4'b0110: Adjr = 4'd6;
        4'b0111: Adjr = 4'd7;
        4'b1000: Adjr = 4'd8;
        4'b1001: Adjr = 4'd9;
        4'b1010: Adjr = 4'd10;
        4'b1011: Adjr = 4'd11;
        4'b1100: Adjr = 4'd12;
        4'b1101: Adjr = 4'd13;
        4'b1110: Adjr = 4'd14;
        4'b1111: Adjr = 4'd15;
    endcase
end

assign Excess_3_out = BCD_in + Adjr;

endmodule

module t_encoder();
reg [3:0] BCD_in;
wire [3:0] Excess_3_out;
encoder M0(BCD_in, Excess_3_out);
initial
$monitor($time,,"BCD = %b, Excess-3 Code = %b",