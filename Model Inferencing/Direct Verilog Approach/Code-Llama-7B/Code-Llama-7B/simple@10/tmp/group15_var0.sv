module sw2led2 #( 
parameter WIDTH=8,
parameter SW=16
) (
input wire [7:0] sw,
output wire [7:0] ld
) ;

		always @(sw) begin
			case (sw)
				8'b00000001: ld = 8'b11111110;
				8'b00000010: ld = 8'b11111111;
				8'b00000100: ld = 8'b11111111;
				8'b00001000: ld = 8'b11111111;
				8'b00010000: ld = 8'b11111111;
				8'b00100000: ld = 8'b11111111;
				8'b01000000: ld = 8'b11111111;
				8'b10000000: ld = 8'b11111111;
				8'b00000000: ld = 8'b00000000;
				default: ld = 8'b00000000;
			endcase
		end
endmodule
### Signed Test Case:
Assume the 16-bit input value: