module tst_dec2_4beh();
wire [3:0]o;
reg [1:0] i;
//reg en; // Enable not used in dec2_4beh
reg [7:0] o2;
dec2_4beh dec(o2,i);
assign o = o2[3:0];
initial
begin
i =2'b00;
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
initial #14 $stop; // Stop simulation
endmodule

### Original Code
module dec2_4beh (o, i);
// Regs (1 bit)
// 				   in			 out
//			|			|			|
//			1st bit			2nd bit			3rd bit			4th bit
//			|			|			|			|
//  +-------+			+-------+			+-------+			+-------+
//	|					|				|				|			|
//	V					V				V				V			V
//			|			|			|			|			|
//		o2	1			o2	2			o2	3			o2	4
//			|			|			|			|			|
//	+----+			+----+			+----+			+----+			+----+
//	|					|				|				|			|
//	V					V				V				V			V
//			|			|			|			|			|
//		o1	1			o1	2			o1	3			o1	4
//			|			|			|			|			|
//	+----+			+----+			+----+			+----+			+----+
//	|					|				|				|			|
//	V					V				V				V			V
//			|			|			|			|			|
//		o0	1			o0	2			o0	3			o0	4
//			|			|			|			|			|
//	+----+			+----+			+----+			+----+			+----+
//	|					|				|				|			|
//	V					V				V				V			V
//			|			|			|			|			|
//		o	1			o	2			o	3			o	4
//			|			|			|			|			|
//	+----+			+----+			+----+			+----+			+----+
//	|					|				|				|			|
//	V					V				V				V			V
//			|			|			|			|			|
//	i		1			i			2			i			3
//			|			|			|			|			|
//  +-------+			+-------+			+-------+			+-------+
//	|					|				|				|			|
//	V					V				V				V