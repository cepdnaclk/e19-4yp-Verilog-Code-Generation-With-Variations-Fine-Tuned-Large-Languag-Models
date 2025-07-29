```verilog
// File: alu_4bit.sv
module alu_4bit(
	input [3:0] A,
	input [3:0] B,
	input [2:0] ALU_FUNC,
	output [3:0] Y,
	output overflow
);
	always @(A, B, ALU_FUNC)
	begin
		Y = 0;
		case(ALU_FUNC)
			0: Y = A + B;
			1: Y = A - B;
			2: Y = A * B;
			3: 
			begin
				if(A[0] == B[0])
				begin
					Y = A[3:1] + B[3:1];
				end
				else if(A[0] < B[0])
				begin
					Y = A[3:1] - B[3:1];
				end
				else//if(A[0] > B[0])
				begin
					Y = ~(B[3:1]) + 1;
					Y[0] = A[0] ^ B[0];
				end
			end
			4: Y = A & B;
			5: Y = A | B;
			6: Y = A ^ B;
			7: Y = A << B;
			8: Y = A >> B;
		endcase//case(ALU_FUNC)
		if(A[3] == 1 && B[3] == 1 && ALU_FUNC == 8)
		begin
			overflow = 1;
		end
		else
		begin
			overflow = 0;
		end
	end
endmodule
// File: alu_tb.sv
module alu_tb();
	parameter A_WIDTH = 4;