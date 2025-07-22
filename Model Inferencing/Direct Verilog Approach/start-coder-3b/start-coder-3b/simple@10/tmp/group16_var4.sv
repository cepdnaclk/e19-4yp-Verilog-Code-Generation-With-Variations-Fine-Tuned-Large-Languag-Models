module or_fr_rl(DataIn, DataOut, a, b, c); // OR gate with force/release
	parameter O_MASK = 4'b1111; // 4 bit register mask
	parameter F_MASK = 4'b1111; // 4 bit register mask
	// Register outputs are the outputs of the mux, OR function, and mux
	output reg [3:0] O_mux;
	output reg [3:0] O_OR;
	output reg [3:0] O_mux_sel;
	// Register inputs are the inputs of the muxes
	input [3:0] I_mux_1;
	input [3:0] I_mux_2;
	// Register forces and releases are the data in and out of the registers
	input [3:0] F_mux_1;
	input [3:0] F_mux_2;
	input [3:0] F_mux_3;
	input [3:0] F_mux_4;
	input [3:0] F_mux_5;
	input [3:0] F_mux_6;
	input [3:0] F_mux_7;
	input [3:0] F_mux_8;
	input [3:0] F_mux_9;
	input [3:0] F_mux_10;
	input [3:0] F_mux_11;
	input [3:0] F_mux_12;
	input [3:0] F_mux_13;
	input [3:0] F_mux_14;
	input [3:0] F_mux_15;

	assign O_mux = I_mux_1;
	assign O_mux_sel = I_mux_2;

	assign O_OR = O_mux ^ O_mux_sel;

	assign F_mux_1 = |DataIn.A & ~DataIn.F;
	assign F_mux_2 = |DataIn.B & ~DataIn.F;
	assign F_mux_3 = |DataIn.C & ~DataIn.F;
	assign F_mux_4 = |DataIn.D & ~DataIn.F;
	assign F_mux_5 = |DataIn.E & ~DataIn.F;
	assign F_mux_6 = |DataIn.F & ~DataIn.F;
	assign F_mux_7 = |DataIn.G & ~DataIn.F;
	assign F_mux_8 = |DataIn.H & ~DataIn.F;
	assign F_mux_9 = |DataIn.I & ~DataIn.F;
	assign F_mux_10 = |DataIn.J & ~DataIn.F;
	assign F_mux_11 = |DataIn.K & ~DataIn.F;
	assign F_mux_12 = |DataIn.L & ~DataIn.F;
	assign F_mux_13 = |DataIn.M & ~DataIn.F;
	assign F_mux_14 = |DataIn.N & ~DataIn.F;
	assign F_mux_15 = |DataIn.O & ~DataIn.F;

	assign DataOut.A = F_mux_1;
	assign DataOut.B = F_mux_2;
	assign DataOut.C = F_mux_3;
	assign DataOut.D = F_mux_4;
	assign DataOut.E = F_mux_5;
	assign DataOut.F = F_mux_6;
	assign DataOut.G = F_mux_7;
	assign DataOut.H = F_mux_8;
	assign DataOut.I = F_mux_9;
	assign DataOut.J = F_mux_10;
	assign DataOut.K = F_mux_11;
	assign DataOut.L = F_mux_12;
	assign DataOut.M = F_mux_13;
	assign DataOut.N = F_mux_14;
	assign DataOut.O = F_mux_15;
endmodule

### Generated Testbench Code:
orfr_tst orfr_tb;
or_fr_rl orfr_inst(.DataIn(orfr_tb.DataIn),.DataOut(orfr_tb.DataOut),.a(orfr_tb.a),.b(orfr_tb.b),.c(orfr_tb.c));
### Input Testbench Code:
test orfr_tb
	input a, b, c;
	input [31:0] DataIn[2:0];
	output reg [31:0] DataOut[2:0];

	reg [4:0] DataIn_A;
	reg [4:0] DataIn_B;
	reg [4:0] DataIn_C;
	reg [4:0] DataIn_D;
	reg [4:0] DataIn_E;
	reg [4:0] DataIn_F;
	reg [4:0] DataIn_G;
	reg [4:0] DataIn_H;
	reg [4:0] DataIn_I;
	reg [4:0] DataIn_J;
	reg [4:0] DataIn_K;
	reg [4:0] DataIn_L;
	reg [4:0] DataIn_M;
	reg [4:0] DataIn_N;
	reg [4:0] DataIn_O;

	initial begin
		DataIn_A = {DataIn[0], DataIn[1], DataIn[2], DataIn[3]};
		DataIn_B = {DataIn[4], DataIn[5], DataIn[6], DataIn[7]};
		DataIn_C = {DataIn[8], DataIn[9], DataIn[10], DataIn[11]};
		DataIn_D = {DataIn[12], DataIn[13], DataIn[14], DataIn[15]};
		DataIn_E = {DataIn[16], DataIn[17], DataIn[18], DataIn[19]};
		DataIn_F = {DataIn[20], DataIn[21], DataIn[22], DataIn[23]};
		DataIn_G = {DataIn[24], DataIn[25], DataIn[26], DataIn[27]};
		DataIn_H = {DataIn[28], DataIn[29], DataIn[30], DataIn[31]};
		DataIn_I = {DataIn[32], DataIn[33], DataIn[34], DataIn[35]};
		DataIn_J = {DataIn[36], DataIn[37], DataIn[38], DataIn[39]};
		DataIn_K = {DataIn[40], DataIn[41], DataIn[42], DataIn[43]};
		DataIn_L = {DataIn[44], DataIn[45], DataIn[46], DataIn[47]};
		DataIn_M = {DataIn[48], DataIn[49], DataIn[50], DataIn[51]};
		DataIn_N = {DataIn[52], DataIn[53], DataIn[54], DataIn[55]};
		DataIn_O = {DataIn[56], DataIn[57], DataIn[58], DataIn[59]};
	end

	initial begin
		$monitor(DataOut, DataIn_A, DataIn_B, DataIn_C, DataIn_D, DataIn_E, DataIn_F, DataIn_G, DataIn_H, DataIn_I, DataIn_J, DataIn_K, DataIn_L, DataIn_M, DataIn_N, DataIn_O);
		$monitor(DataOut, DataIn_A ^ DataIn_B, DataIn_C ^ DataIn_D, DataIn_E ^ DataIn_F, DataIn_G ^ DataIn_H, DataIn_I ^ DataIn_J, DataIn_K ^ DataIn_L, DataIn_M ^ DataIn_N, DataIn_O ^ DataIn_O);
		#10 #stop;
	end

	initial begin
		$monitor(DataOut, a, b, c);
		$monitor(DataOut, a, b ^ c);
		$monitor(DataOut, a, b & c);
		$monitor(DataOut, a, b | c);
		#10 #stop;