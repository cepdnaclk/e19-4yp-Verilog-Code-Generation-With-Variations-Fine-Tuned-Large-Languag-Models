// Verilog code for Problem 11
module MSI(
    input clock, reset,
    input [8:0] A, B,
    output logic [7:0] S,
    output logic C
);
    Full_Subtractor_with_Borrow FSB1(.A(B),.B(A),.Cin(C),.Sum(S),.Carry(Cout)); // Instantiate the full-subtractor module
    Full_Adder FA3(.A(A),.B(S),.Cin(Cout),.Sum(C),.Cout(Cout)); // Instantiate the full-adder module
    assign C = Cout;
endmodule
/FinalCode/final.py
from sympy import FiniteSet, ProductSet
from sympy.abc import a, b, n
from veriloggen import *

class full_adder_128(object):
	def __init__(self):
		self.v = VerilogGenerator()
		self.v.entity("Full_Adder", [("A", "logic[7:0]", In), ("B", "logic[7:0]", In), ("C_in", "logic[7:0]", In), ("S_out", "logic[7:0]", Out), ("Cout", "logic", Out)])
	def build(self):
		self.v.code("")
		self.v.code("module Full_Adder #(parameter WIDTH = 8) (\n\
			input A,\n\
			input B,\n\
			input C_in,\n\
			output reg [WIDTH-1:0] S_out,\n\
			output reg Cout\n\
		);\n\
		wire [WIDTH-1:0] Sb = A ^ B;\n\
		wire [WIDTH-1:0] Cb = A & B;\n\
		assign S_out = Sb;\n\
		assign Cout = Cout | Cb;\n\
		endmodule")
		self.v.end_entity()

class full_adder_8(object):
	def __init__(self):
		self.v = VerilogGenerator()
		self.v.entity("Full_Adder", [("A", "logic[7:0]", In), ("B", "logic[7:0]", In), ("C_in", "logic", In), ("S_out", "logic[7:0]", Out), ("Cout", "logic", Out)])
	def build(self):
		self.v.code("")
		self.v.code("module Full_Adder (\n\
			input A,\n\
			input B,\n\
			input C_in,\n\