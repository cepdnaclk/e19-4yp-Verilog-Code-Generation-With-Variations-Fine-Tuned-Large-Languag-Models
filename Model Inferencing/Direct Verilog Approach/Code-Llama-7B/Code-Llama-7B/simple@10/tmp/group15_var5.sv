module ALU_tb ();
reg [7:0] in1; reg [7:0] in2; reg [3:0] aluctl; reg [7:0] alu_out;
wire [7:0] led_out;reg [7:0] out_sw;

sw2led2 test(.sw(out_sw),.ld(led_out));

always @ (posedge in1 or in2 or aluctl) begin
	in1=!in1;
	$display ("in1 = %d, in2 = %d, aluctl = %d",in1,in2,aluctl);
end

ALU DUT (.in1 (in1),.in2 (in2),.aluctl (aluctl),.alu_out (alu_out) );

initial begin
	in1=8'b1111_1111;
	in2=8'b1111_1110;
	aluctl=4'b1000;
	out_sw=8'b0000_0001;
	$display("in1 = %d, in2 = %d, aluctl = %d",in1,in2,aluctl);
	#10 $display("in1 = %d, in2 = %d, aluctl = %d",in1,in2,aluctl);
	in1=8'b1010_1011;
	in2=8'b1010_1010;
	aluctl=4'b0000;
	out_sw=8'b0000_0000;
	$display("in1 = %d, in2 = %d, aluctl = %d",in1,in2,aluctl);
	#10 $display("in1 = %d, in2 = %d, aluctl = %d",in1,in2,aluctl);
	#10 $display("in1 = %d, in2 = %d, aluctl = %d",in1,in2,aluctl);
	#10 $display("in1 =