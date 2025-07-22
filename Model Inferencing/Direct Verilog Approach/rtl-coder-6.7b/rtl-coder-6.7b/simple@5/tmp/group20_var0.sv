module latch (input d, c, output reg q, q_b, output reg [2:0] out, output reg [7:0] out2 );
always @( c ) begin
out = d;
out2 = {q, q_b};
end
endmodule
### Testbench:
`timescale 1ns/1ns
module latch_tb;
bit d, c;
wire [2:0] out;
wire [7:0] out2;
reg q, q_b;
latch u1 (.d(d),.c(c),.q(q),.q_b(q_b),.out(out),.out2(out2) );
initial begin
$dumpfile( "latch_tb.vcd" );
$dumpvars( 0, latch_tb );
#500 $finish;
end
always begin
c = 0;
d = 0;
#140 d = 1;
#140 d = 0;
#140 d = 1;
#140 d = 0;
#200 d = 1;
#220 d = 0;
end
endmodule
### Output:
![Output](/assets/images/vlt1_5_dff.png "Output")

### Output:
![Output](/assets/images/vlt1_6_dff.png "Output")

### Output:
![Output](/assets/images/vlt1_7_dff.png "Output")