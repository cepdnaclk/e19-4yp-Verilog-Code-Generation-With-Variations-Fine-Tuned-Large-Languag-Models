module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);

assign z = 
case (s)
1'b00 : c[0];
1'b01 : c[1];
1'b10 : c[2];
1'b11 : c[3];
endcase;

endmodule
### Testbench:
module mux41b_testbench;
wire [3:0] c;
wire [1:0] s;
wire [3:0] z;

mux41b m (.*);

initial begin
for (int i=0; i<4; i++) begin
	c = {2'b00, i};
	s = 2'b00;
	#200;
	$display("%d ", z);
	s = 2'b01;
	#200;
	$display("%d ", z);
	s = 2'b10;
	#200;
	$display("%d ", z);
	s = 2'b11;
	#200;
	$display("%d ", z);
	s = 2'b00;
	#200;
	$display("%d ", z);
end
end
endmodule
### Verilog Testbench Output:
  0
  1
  2
  3
  0
  1
  2
  3
  0
  1
  2
  3
  0
  1
  2
  3
  0
  1
  2
  3
  0
  1
  2
  3
  0
  1
  2
  3
  0
  1
  2
  3
  0
  1
  2
  3
  0
  1
  2
  3
  0
  1
  2
  3
### Synthesis and Simulation:
1. Above code synthesize and simulate successfully.
2. All cases are tested with success!
### Discussion:
1. In some situation, we have to use case