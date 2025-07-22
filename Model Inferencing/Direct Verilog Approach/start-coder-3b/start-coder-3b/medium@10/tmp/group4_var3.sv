module nor3NMOS(in1,in2,in3,b); // 3-input NMOS NOR
  output b;
  input in1,in2,in3;
  supply0 a; // Ground
  wire b; // Output wire (should be just output b;)
  // Parallel NMOS transistors connect output to ground
  nmos (b, a, in1);
  nmos (b, a, in2);
  nmos (b, a, in3);
  pullup (b); // Pullup device on the output
  assign b = inside(in1,in2,in3);
endmodule
### Output:
![output_image](https://github.com/arun-kumar-jha/Verilog/blob/master/nor3NMOS.png)
### Reference:
[NMOS](https://www.allaboutcircuits.com/technical-articles/a-look-at-the-nmos-transistor/)
/pullup.py
import pyvcd
import vcdlib
import math
import numpy as np
import pylab

# Define NMOS class
class nmos:
	def __init__(self,name,output,input,vdd):
		self.name = name
		self.output = output
		self.input = input
		self.supply0 = vdd

# Define pullup class
class pullup:
	def __init__(self,output,vdd,gnd):
		self.output = output
		self.supply0 = vdd
		self.supply1 = gnd

# Class to handle simulation and output data
class sim:
	def __init__(self,filename,vcdname,data,t):
		self.filename = filename
		self.vcdname = vcdname
		self.data = data
		self.t = t
		self.vcd = vcdlib.vcdlib.VCD()
		self.vcd.open(self.vcdname)
		self.vcd.dump(self.t,self.data[0],self.data[1])
		self.vcd.close(self.vcdname)

# Function to handle simulation
def simulation(filename,data,t):
	f = open(filename,'r')
	lines = f.readlines()
	f.close()

	# To hold the VDD value
	vdd = ''

	# Array to hold all nmos objects
	nmos_list = []

	# Array to hold all pullup objects
	pullup_list = []

	# To hold the input signal
	input = ''

	# To hold the output variable
	output = ''

	# To hold the nmos value
	nmos_val = ''

	# To hold the pullup value
	pullup_val = ''

	# To hold the pullup value
	pullup_val_1 = ''

	# To hold the nmos value
	nmos_val_1 = ''

	# To hold the nmos value
	nmos_val_2 = ''

	# To hold the nmos value
	nmos_val_3 = ''

	# To contain the current state of the gate
	input_state = ''

	# To hold the supply value
	supply = ''

	# To hold the supply value
	supply_1 = ''

	# To hold the supply value
	supply_2 = ''

	# To hold the supply value
	supply_3 = ''

	# To hold the supply value
	supply_4 = ''

	# To hold the supply value
	supply_5 = ''

	# To hold the supply value
	supply_6 = ''

	# To hold the supply value
	supply_7 = ''

	# To hold the supply value
	supply_8 = ''

	# To hold the supply value
	supply_9 = ''

	# To hold the supply value
	supply_10 = ''

	# To hold the supply value
	supply_11 = ''

	# To hold the supply value
	supply_12 = ''

	# To hold the supply value
	supply_13 = ''

	# To hold the supply value
	supply_14 = ''

	# To hold the supply value
	supply_15 = ''

	# To hold the supply value
	supply_16 = ''

	# To hold the supply value
	supply_17 = ''

	# To hold the supply value
	supply_18 = ''

	# Counter to go through all the lines
	i = 0

	for each_line in lines:
		if each_line.find('input') >= 0:
			input = each_line
			input = input.strip()
			input = input.split()
			input = input[3]
		elif each_line.find('output') >= 0:
			output = each_line
			output = output.strip()
			output = output.split()
			output = output[1]
		elif each_line.find('NMOS') >= 0:
			nmos_val = each_line
			nmos_val = nmos_val.replace('\t','')
			nmos_val = nmos_val.split()
			nmos_list.append(nmos(nmos_val[2],nmos_val[1],nmos_val[3],vdd))
		elif each_line.find('PULLUP') >= 0:
			nmos_val_1 = each_line
			nmos_val_1 = nmos_val_1.replace('\t','')
			nmos_val_1 = nmos_val_1.split()
			pullup_list.append(pullup(nmos_val_1[1],vdd,vdd))
		elif each_line.find('SUPPLY0') >= 0:
			vdd_val = each_line
			vdd = vdd_val.strip()
			vdd = vdd.split()
			vdd = vdd[1]
		elif each_line.find('SUPPLY1') >= 0:
			pullup_val = each_line
			pullup_val = pullup_val.strip()
			pullup_val = pullup_val.split()
			pullup_val = pullup_val[1]
		elif each_line.find('assign') >= 0:
			pullup_val_1 = each_line
			pullup_val_1 = pullup_val_1.strip()
			pullup_val_1 = pullup_val_1.split()
			pullup_val_1 = pullup_val_1[0]
			pullup_val_1 = pullup_val_1.split('(')
			pullup_val_1 = pullup_val_1[1]
			pullup_val_1 = pullup_val_1.split(')')
			pullup_val_1 = pullup_val_1[0]
			for i in range(0,len(pullup_list)):
				if pullup_list[i].output == pullup_val_1:
					pullup_list[i].supply0 = pullup_val
		elif each_line.find('assign') >= 0:
			pullup_val_2 = each_line
			pullup_val_2 = pullup_val_2.strip()
			pullup_val_2 = pullup_val_2.split()
			pullup_val_2 = pullup_val_2[0]
			pullup_val_2 = pullup_val_2.split('(')
			pullup_val_2 = pullup_val_2[1]
			pullup_val_2 = pullup_val_2.split(')')
			pullup_val_2 = pullup_val_2[0]
			for i in range(0,len(pullup_list)):
				if pullup_list[i].output == pullup_val_2:
					pullup_list[i].supply1 = pullup_val
		elif each_line.find('assign') >= 0:
			nmos_val_2 = each_line
			nmos_val_2 = nmos_val_2.strip()
			nmos_val_2 = nmos_val_2.split()
			nmos_val_2 = nmos_val_2[0]
			nmos_val_2 = nmos_val_2.split('(')
			nmos_val_2 = nmos_val_2[1]
			nmos_val_2 = nmos_val_2.split(')')
			nmos_val_2 = nmos_val_2[0]
			for i in range(0,len(nmos_list)):