```
module hex_to_seven_seg_decoder(out,in);
output [6:0] out;
input [3:0] in;
reg [6:0] Seven_Seg_Out;
always@(in)
begin
case(in)
4'b0000: Seven_Seg_Out = 7'b0000001; //to display 0
4'b0001: Seven_Seg_Out = 7'b1001111; //to display 1
4'b0010: Seven_Seg_Out = 7'b0010010; //to display 2
4'b0011: Seven_Seg_Out = 7'b0000110; //to display 3
4'b0100: Seven_Seg_Out = 7'b1001100; //to display 4
4'b0101: Seven_Seg_Out = 7'b0100100; //to display 5
4'b0110: Seven_Seg_Out = 7'b0100000; //to display 6
4'b0111: Seven_Seg_Out = 7'b0001111; //to display 7
4'b1000: Seven_Seg_Out = 7'b0000000; //to display 8
4'b1001: Seven_Seg_Out = 7'b0000100; //to display 9
4'b1010: Seven_Seg_Out = 7'b0001000; //to display A
4'b1011: Seven_Seg_Out = 7'b1100000; //to display b
4'b1100: Seven_Seg_Out = 7'b0110001; //to display C
4'b1101: Seven_Seg_Out = 7'b1000010; //to display d
4'b1110: Seven_Seg_Out = 7'b0110000; //to display E
4'b1111: Seven_Seg_Out = 7'b0111000; //to display F
endcase
end
assign out = Seven_Seg_Out;
endmodule

```