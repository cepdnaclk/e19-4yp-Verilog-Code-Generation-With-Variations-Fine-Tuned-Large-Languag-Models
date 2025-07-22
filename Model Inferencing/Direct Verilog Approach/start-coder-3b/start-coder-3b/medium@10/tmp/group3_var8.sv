module FA;
	input[1:0] D;
	input S;
	output reg Q;

	always @(D,S) begin
		if (D[1]) begin
			Q = ~S;
		end else begin
			if (D[0]) begin
				Q = ~S;
			end else begin
				Q = ~Q;
			end
		end
	end
endmodule

module Ripple_Add;
	FA fa0();
	FA fa1();
	FA fa2();
	FA fa3();
endmodule

module FA;
	input[1:0]