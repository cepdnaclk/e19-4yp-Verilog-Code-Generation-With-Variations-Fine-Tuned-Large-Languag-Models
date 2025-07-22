// Verilog code for Problem 5
module Half_Adder(
    input logic A, logic B,
    output logic [7:0] Sum,
    output logic Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule
### Code Modification:
In addition to modifying the output type, a new output logic variable was added to the module. The variable will later be used in the module's instantiations.
### Results:
The output of these two modules will be added together to produce the full adder.
### Output of this Module:
//Verilog code for problem 6
module Full_Adder(
    input logic A, input logic B, input logic Cin,
    output logic [7:0] Sum,
    output logic Cout
);
    wire Sum, Carry;
    Half_Adder ha1(A, B, Sum, Carry);
    Half_Adder ha2(Cout, Cin, Sum, Carry);

    assign Cout = Carry;
endmodule
### Results:
The Sum and Cout outputs will be used in the full_adder module to produce the output of the full adder circuit.

# Problem 7:
The 4-bit full adder circuit can be extended to the 7-bit full adder using the same method as Problem 6.

# Problem 8: 
Create a circuit for a 16-bit full adder.

# Problem 9: 
Use the full adder to add two 16-bit numbers.

# Problem 10:
Use the full adder to add two 16-bit numbers in parallel.

# Problem 11:
Design a circuit to add two 16-bit numbers. The answer should be 16-bits, using the full adder and a 16-bit adder.

# Problem 12:
Create a circuit for a 16-bit full adder.

# Problem 13:
Use the full adder to add two 16-bit numbers.

# Problem 14:
Use the full adder to add two 16-bit numbers in parallel.

# Problem 15:
Design a circuit to add two 16-bit numbers. The answer should be 16-bits, using the full adder and a 16-bit adder.

# Problem 16:
Create a circuit for a 16-bit full adder.

# Problem 17:
Use the full adder to add two 16-bit numbers.

# Problem 18:
Use the full adder to add two 16-bit numbers in parallel.

# Problem 19:
Design a circuit to add two 16-bit numbers. The answer should be 16-bits, using the full adder and a 16-bit adder.

# Problem 20:
16-bit full adder verilog code:

import math

# define a class to hold variables:
class fulladder(struct):

  def __init__(self, name, a, b, cin, sum, cout):
    self.name = name
    self.a = a
    self.b = b
    self.cin = cin
    self.sum = sum
    self.cout = cout

  def connect_inputs(self, adderInput, **kwargs):
    if type(adderInput) is not list:
      adderInput = [adderInput]

    for adder_input in adderInput:
      if adder_input.a!= None:
        self.a(adder_input.a)
      if adder_input.b!= None:
        self.b(adder_input.b)
      if adder_input.cin!= None:
        self.cin(adder_input.cin)

  def connect_outputs(self, adderOutput, **kwargs):
    if type(adderOutput) is not list:
      adderOutput = [adderOutput]

    for adder_output in adderOutput:
      if adder_output.cout!= None:
        self.cout(adder_output.cout)
      if adder_output.sum!= None:
        self.sum(adder_output.sum)

  #def propagate_outputs(self, **kwargs):
    #self.sum.assign(self.a ^ self.b ^ self.cin)
    #self.cout.assign(self.a & self.b & self.cin)

# define the full adder module
fullAdder = fulladder("fullAdder", 0, 0, 0, 0, 0)

# define the input ports of the full adder:
a = input("a: ")
b = input("b: ")
cin = input("cin: ")

# define the output ports of the full adder:
sum = output("sum: ")
cout = output("cout: ")

# connect the ports
fullAdder.connect_inputs(a, b, cin)
fullAdder.connect_outputs(sum, cout)

# create two full adder instances
adder1 = fulladder("adder1", a, b, cin, sum, cout)
adder2 = fulladder("adder2", a, b, cout, sum, cout)

# print out the input ports
print(f"Full Adder 1 input ports: {adder1.input}")
print(f"Full Adder 2 input ports: {adder2.input}")
print(f"Full Adder 1 output ports: {adder1.output}")
print(f"Full Adder 2 output ports: {adder2.output}")

# instantiate the adder with input ports
adder1(a, b, cin, sum, cout)
adder2(a, b, cout, sum, cout)

# simulate the adder
fullAdder.simulate_adder()

# print the adder's results
print(f"Full Adder 1 results: {adder1.result}")
print(f"Full Adder 2 results: {adder2.result}")
/Lab8/Lab 8 V1/Lab 8 V3/Lab8v3.py
# Lab 8 V2

import math
from random import randint

def gen_random_number():
    return randint(0, 99999999)

def get_binary(num):
    #convert number to binary
    binary = str(bin(int(num)))
    
    #remove the "0b" from the beginning of the string
    if binary[2] == '0':
        binary = binary[3:]

    #make sure there is a 0 in front of the binary
    if len(binary) % 3 == 2:
        binary = '0' + binary
        
    #make sure there are 8 digits
    if len(binary) < 8:
        len_diff = 8 - len(binary)
        for i in range(len_diff):
            binary = binary + '0'

    return binary

def get_decimal(num):
    #convert binary to decimal
    return int(num, 2)

#returns a list of the 3 most significant bits of a number
def get_first_three_bits(num):
    return num[0:6]

#returns a list of the 3 least significant bits of a number
def get_last_three_bits(num):
    return num[3:6]

#returns a list of the 11 bits of a number
def get_full_bitstring(num):
    return num[:11]

#returns a list of just the 1 digit bit of a number
def get_L1_bit(num):
    return num[11:12]

#returns a list of just the 0 digit bit of a number
def get_L0_bit(num):
    return num[12:13]

#returns a list of just the 2nd bit
def get_2nd_bit(num):
    return num[13:14]

#returns a list of just the 1st bit
def get_1st_bit(num):
    return num[14:15]

#returns a list of just the 0th bit
def get_0th_bit(num):
    return num[15:16]


def gen_bitstring(num):
    #convert num to binary
    num_bin = get_binary(num)

    #generate the first 3 bits of the number
    first_three = get_first_three_bits(num_bin)

    #generate the last 3 bits
    last_three = get_last_three_bits(num_bin)

    #generate the 11 bits of the number
    full_bitstring = get_full_bitstring(num_bin)

    #generate the 1 bit of the number
    L1_bit = get_L1_bit(num_bin)

    #generate the 0 bit of the number
    L