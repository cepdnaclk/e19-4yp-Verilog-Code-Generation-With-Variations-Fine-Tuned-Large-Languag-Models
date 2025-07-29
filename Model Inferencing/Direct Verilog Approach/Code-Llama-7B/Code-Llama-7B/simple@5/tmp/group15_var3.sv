module alu_tb();

parameter NBIT = 8;


	parameter [1:0] ADD = 2'b00, SUB = 2'b01, AND = 2'b10, OR = 2'b11, XOR = 2'b100, SLT = 2'b101, SLL = 2'b110, SRL = 2'b111;
	
	reg [NBIT:0] alu_operation ;
	reg [NBIT-1:0] a,b;
	reg [NBIT+1:0] result;
	reg clk, n_rst, start, done, error;
	wire [NBIT+1:0] r;
	wire led [NBIT-1:0] ;
    wire signed [NBIT-1:0] sa, sb ;
    wire [NBIT-1:0] sresult ;
	
	
	alu #(NBIT) the_alu(
	
		.sa(sa),
		.sb(sb),
		.a(a),
		.b(b),
		.alu_operation(alu_operation),
		.clk(clk),
		.n_rst(n_rst),
		.start(start),
		.done(done),
		.r(r),
		.error(error)
	);
	
	sw2led2 sw2led2_0 (
		.sw(alu_operation),
		.ld(led)
	);
	
	
	// Clock and reset
	always begin
		clk = 0;
		#10;
		clk = 1;
		#10;
	end
	
	initial begin
		//reset
		n_rst = 1;
		a = 0;
		b = 0;
		alu_operation = 0;
		
		
		start = 0;
		
		repeat(25) @(posedge clk);
		
		start =