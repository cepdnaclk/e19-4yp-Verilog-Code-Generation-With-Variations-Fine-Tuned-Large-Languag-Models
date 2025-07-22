module full_adder_4 (input A, B, C_in, output sum [1:1], output C_out);
reg [1:0] S, C;
always @(A, B, C_in) begin
S=A ^ B;
C=A & B;
end
assign C_out = C | C_in;
endmodule

### Test Bench:
module full_adder_4_tb ( );

reg A, B, C_in;
wire sum [1:1], C_out;
full_adder_4 uut (.A(A),.B(B),.C_in(C_in),.sum(sum),.C_out(C_out) );

initial begin
A = 0; B = 0; C_in = 0; $display("Input A: %h", A);$display("Input B: %h", B);
$display("Input C_in: %h", C_in); #5; A = 0; B = 1; C_in = 0;$display("Input A: %h", A);
$display("Input B: %h", B);$display("Input C_in: %h", C_in);
#5;
A = 0; B = 1; C_in = 1;
$display("Input A: %h", A);$display("Input B: %h", B);
$display("Input C_in: %h", C_in); #5; A = 1; B = 0; C_in = 0;$display("Input A: %h", A);
$display("Input B: %h", B);$display("Input C_in: %h", C_in);
#5;
A = 1; B = 0; C_in = 1;
$display("Input A: %h", A);$display("Input B: %h", B);
$display("Input C_in: %h", C_in); #5; A = 1; B = 1; C_in = 0;$display("Input A: %h", A);
$display("Input B: %h", B);$display("Input C_in: %h", C_in);
#5;
A = 1; B = 1; C_in = 1;
$display("Input A: %h", A);$display("Input B: %h", B);
$display("Input C_in: %h", C_in); #5; A = 0; B = 0; C_in = 1;$display("Input A: %h", A);
$display("Input B: %h", B);$display("Input C_in: %h", C_in);
#5;
A = 0; B = 1; C_in = 1;
$display("Input A: %h", A);$display("Input B: %h", B);
$display("Input C_in: %h", C_in); #5; A = 1; B = 0; C_in = 1;$display("Input A: %h", A);
$display("Input B: %h", B);$display("Input C_in: %h", C_in);
#5;
A = 1; B = 1; C_in = 1;
$display("Input A: %h", A);$display("Input B: %h", B);
$display("Input C_in: %h", C_in); #5; A = 0; B = 0; C_in = 0;$display("Input A: %h", A);
$display("Input B: %h", B);$display("Input C_in: %h", C_in);
#5;
A = 0; B = 1; C_in = 0;
$display("Input A: %h", A);$display("Input B: %h", B);
$display("Input C_in: %h", C_in); #5; A = 1; B = 0; C_in = 0;$display("Input A: %h", A);
$display("Input B: %h", B);$display("Input C_in: %h", C_in);
#5;
A = 1; B = 1; C_in = 0;
$display("Input A: %h", A);$display("Input B: %h", B);
$display("Input C_in: %h", C_in); #5; A = 0; B = 0; C_in = 1;$display("Input A: %h", A);
$display("Input B: %h", B);$display("Input C_in: %h", C_in);
#5;
A = 0; B = 1; C_in = 1;
$display("Input A: %h", A);$display("Input B: %h", B);
$display("Input C_in: %h", C_in); #5; A = 1; B = 0; C_in = 1;$display("Input A: %h", A);
$display("Input B: %h", B);$display("Input C_in: %h", C_in);
#5;
A = 1; B = 1; C_in = 1;
$display("Input A: %h", A);$display("Input B: %h", B);
$display("Input C_in: %h", C_in); #5; initial #500; endmodule ### Output: Input A: 0 Input B: 0 Input C_in: 0 Input A: 0 Input B: 1 Input C_in: 0 Input A: 1 Input B: 0 Input C_in: 0 Input A: 1 Input B: 1 Input C_in: 0 Input A: 0 Input B: 0 Input C_in: 1 Input A: 0 Input B: 1 Input C_in: 1 Input A: 1 Input B: 0 Input C_in: 1 Input A: 1 Input B: 1 Input C_in: 1 Input A: 0 Input B: 0 Input C_in: 0 Input A