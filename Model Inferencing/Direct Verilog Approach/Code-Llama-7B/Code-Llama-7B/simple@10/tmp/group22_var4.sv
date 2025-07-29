module test_struct(in, out);
typedef struct {
logic  [7:0] x1;
logic  [7:0] x2;
logic  [7:0] x3;
logic  [7:0] x4;
} test_t;
input  test_t in;
output test_t out;
assign out.all_ones = ^in;
assign out.parity   = ^in;
endmodule
### Testbench Code:
module test_struct_tb();
test_struct  dut(in_struct, out_struct);
logic [7:0] x1, x2, x3, x4;
test_t in_struct, out_struct;
reg [7:0] x1, x2, x3, x4;
initial begin
	//Initialize Inputs
	#10;
	//Wait 100 ns for global reset to finish
	
	while (true) begin
		x1 = $random;
		x2 = $random;
		x3 = $random;
		x4 = $random;
		in_struct.x1 = x1;
		in_struct.x2 = x2;
		in_struct.x3 = x3;
		in_struct.x4 = x4;
		
		#10;
		//Check Outputs
		if (out_struct.all_ones!= $onehot(in_struct)) begin
			$display("ERROR : all_ones mismatch");
		end
		if (out_struct.parity!= $onehot0(in_struct)) begin
			$display("ERROR : parity mismatch");
		end
		$display("all_ones