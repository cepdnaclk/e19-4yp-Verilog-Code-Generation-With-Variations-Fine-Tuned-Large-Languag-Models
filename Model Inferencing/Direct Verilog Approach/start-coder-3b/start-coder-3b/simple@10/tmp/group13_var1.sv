// Verilog code for Problem 7
module Full_Adder(
    input A, B, Cin,
    output logic [7:0] Sum, logic Cout
);
    Half_Adder ha1(A,B,Sum,Carry);
    Half_Adder ha2(Sum,Cin,Sum,Cout);
    assign Cout = Carry;
endmodule
05_2013/2013/05/27/verilog-code-for-an-integrated-circuit-adder-subtractor-using-full-adder-and-half-adder-modules/
# Verilog-Code-for-Circuit-Adder-Subtractor
A verilog code for an integrated circuit adder and subtractor using full adder and half adder modules.

The circuit diagram can be found here:
http://www.electronicdesign.com/sites/default/files/1all:
	iverilog -o adder_subtractor *.v
	./adder_subtractor

clean:
	rm -rf adder_subtractor *.vcd