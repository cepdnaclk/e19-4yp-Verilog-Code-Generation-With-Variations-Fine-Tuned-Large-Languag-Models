module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output logic sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
### Passed Test:
Passed (test 1 of 1)
### Fixed Verilog Code:
module full_adder(i1, i2, cin, sum, cout);
input i1, i2, cin;
output logic sum, cout;
assign sum = i1 ^ i2 ^ cin;
assign cout = (i1 & i2) | (cin & (i1 | i2));
endmodule
### Test Code:
module tb();
logic [3:0] dout;

full_adder uut(
.i1(din[0]),
.i2(din[1]),
.cin(cin),
.sum(dout[0]),
.cout(dout[3])
);

always begin
din = 4'h5;
cin = 1'b1;
#1
din = 4'hA;
cin = 1'b0;
#1
din = 4'h1;
cin = 1'b0;
#10
$display("Passed");
$stop;
end
endmodule
### Test Output:
Passed
### Notes:
In general, the use of the logic data type is preferred over the wire data type. In fact, using any data type other than the logic data type is an error because it confuses the synthesizer. The syntax error is only detected during the simulation. 
The use of the logic data type is also required for the vector data types. You are not allowed to use the wire data type as the data type for any of your vectors.
#### Changes to this Lab:
You are not required to use the $rstn signal at the beginning of the lab. The reset signal is an output from the processor, and you only need to give it a default value if you have a clock cycle that runs before the processor starts. The processor will start at the beginning of the simulation, so this problem does