```
module hex_7seg (
	.x(x),
	.y(y)
);
	wire [3:0] x;
	wire [6:0] y;
	wire[3:0] const_array [0: 15];
	reg [3:0] counter, next_counter;
	reg sel_bit_1, next_sel_bit_1;
	reg sel_bit_2, next_sel_bit_2;
	reg sel_bit_3, next_sel_bit_3;
	reg sel_bit_4, next_sel_bit_4;
	reg sel_bit_5, next_sel_bit_5;
	reg sel_bit_6, next_sel_bit_6;
	reg sel_bit_7, next_sel_bit_7;
	reg sel_bit_8, next_sel_bit_8;
	wire[3:0] const_array [0: 15] = {1'b1,1'b0,2'b10,1'b1,2'b01,1'b1,2'b10,1'b1,
								2'b01,1'b1,2'b10,1'b1,1'b0,2'b10,1'b1};

	always @ (posedge clock) if (reset) begin
		sel_bit_1 <= 1'b0;
		sel_bit_2 <= 1'b0;
		sel_bit_3 <= 1'b0;
		sel_bit_4 <= 1'b0;
		sel_bit_5 <= 1'b0;
		sel_bit_6 <= 1'b0;
		sel_bit_7 <= 1'b0;
		sel_bit_8 <= 1'b0;
		counter <= 4'd0;
	end
	else begin
		sel_bit_1 <= next_sel_bit_1;
		sel_bit_2 <= next_sel_bit_2;