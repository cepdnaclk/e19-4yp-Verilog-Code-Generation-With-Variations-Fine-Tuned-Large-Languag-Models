module sw2led2 (
input wire [7:0] sw,
output wire [7:0] ld
) ;
assign ld = sw;
endmodule
### Testbench Code:
module alu_testbench () ;
wire [7:0] a, b, c;
reg [7:0] a_sig, b_sig;
alu test(a,b,c);
initial begin
#10;
a_sig = $random;
b_sig = $random;
a = a_sig;
b = b_sig;
$display("Add a = %d b = %d c = %d",a_sig, b_sig, c );

#10;
a_sig = $random;
b_sig = $random;
a = a_sig;
b = b_sig;
$display("Add a = %d b = %d c = %d",a_sig, b_sig, c );

#10;
a_sig = $random;
b_sig = $random;
a = a_sig;
b = b_sig;
$display("Add a = %d b = %d c = %d",a_sig, b_sig, c );

#10;
a_sig = $random;
b_sig = $random;
a = a_sig;
b = b_sig;
$display("Add a = %d b = %d c = %d",a_sig, b_sig, c );

#10;
a_sig = $random;
b_sig = $random;
a = a_sig;
b = b_sig;
$display("Add a = %d b = %d c = %d",a_sig, b_sig, c );

initial begin
#10;
a_sig = $random;
b_sig = -$random;
a = a_sig;
b = b_sig;
$display("Add a = %d b = %d c = %d",a_sig, b_sig, c );
#10;
a_sig = $random;
b_sig = -$random;
a = a_sig;
b = b_sig;
$display("Add a