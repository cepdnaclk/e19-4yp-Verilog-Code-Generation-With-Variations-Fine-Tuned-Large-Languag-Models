module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
endmodule

module FA;
	output y, cin;
	input  x, cin_old;

	always @(x, cin_old) 
	begin
		cin = { cin_old, x };
		y = cin;
	end
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
endmodule

module FA;
	output y, cin;
	input  x, cin_old;

	always @(x, { cin_old[3], cin_old[2], cin_old[1], cin_old[0] }) 
	begin
		cin = { cin_old, x };
		y = cin;
	end
endmodule
import os
import sys
import re
import subprocess

from symbiyosys.module import Module
from symbiyosys.stratixiv import StratixIV
from symbiyosys.write_verilog import write_verilog
from symbiyosys.write_xdc import write_xdc
from symbiyosys.write_sdf import write_sdf
from symbiyosys.write_synth_constraints import write_synth_constraints

from symbiyosys.write_scf import write_scf
from symbiyosys.write_tcl import write_tcl
from symbiyosys.write_xdc import write_xdc
from symbiyosys.write_xdc import write_xdc

from symbiyosys.write_scf import write_scf
from symbiyosys.write_tcl import write_tcl
from symbiyosys.write_xdc import write_xdc
from symbiyosys.write_xdc import write_xdc

class Test(Module):

    def generate(self):
        self.io.x.output()
        self.io.cin_old.input()
        self.io.cin.output()
        self.io.y.output()
        self.assign(self.io.cin, self.io.cin_old)
        self.assign(self.io.y, self.io.cin)
## Generate Testbench

First, we generate a simple testbench to simulate this test.tb = Test()
write_verilog('test.v', tb)

with open('test_testvectors.txt', 'w') as f:
    f.write('x1 x2 cin_old cin y \n')
    f.write('0 0 0 0 0 \n')
    f.write('0 0 0 1 1 \n')
    f.write('0 1 0 1 1 \n')
    f.write('1 0 1 1 1 \n')
    f.write('1 1 1 0 0 \n')## Running Yosys

### Running yosys with a script

1. Create a script called `run_yosys.tcl` with the following code:

```
read_verilog test.v
synth
report -assert
```

2. Run `yosys run_yosys.tcl test.v` and check for errors.### Running yosys with a python script


Next, we create the following python script and run yosys.

```python
from symbiyosys.write_tcl import write_tcl

write_tcl('run_yosys.tcl', ['read_verilog test.v',
                           'synth',
                           'report -assert'])

subprocess.run(['yosys', 'run_yosys.tcl'])
```

We run the script below and check the error messages.from symbiyosys.write_tcl import write_tcl

write_tcl('run_yosys.tcl', ['read_verilog test.v',
                           'synth',
                           'report -assert'])

subprocess.run(['yosys', 'run_yosys.tcl'])### Running yosys with a python script


Next, we create the following python script and run yosys.

```python
from symbiyosys.write_tcl import write_tcl

write_tcl('run_yosys.tcl', ['read_verilog test.v',
                           'synth',
                           'report -assert'])

subprocess.run(['yosys', 'run_yosys.tcl'])
```

We run the script below and check the error messages.from symbiyosys.write_tcl import write_tcl

write_tcl('run_yosys.tcl', ['read_verilog test.v',
                           'synth',
                           'report -assert'])

subprocess.run(['yosys', 'run_yosys.tcl'])## Running Pythonic Test

Next, we create a script called `run_test.py` with the following code.import os
import sys
import re
import subprocess

# Create the testbench module.
from symbiyosys.module import Module
from symbiyosys.stratixiv import StratixIV
from symbiyosys.write_verilog import write_verilog
from symbiyosys.write_xdc import write_xdc
from symbiyosys.write_sdf import write_sdf
from symbiyosys.write_synth_constraints import write_synth_constraints

from symbiyosys.write_scf import write_scf
from symbiyosys.write_tcl import write_tcl
from symbiyosys.write_xdc import write_xdc
from symbiyosys.write_xdc import write_xdc

from symbiyosys.write_scf import write_scf
from symbiyosys.write_tcl import write_tcl
from symbiyosys.write_xdc import write_xdc
from symbiyosys.write_xdc import write_xdc

class Test(Module):

    def generate(self):
        self.io.x.output()
        self.io.cin_old.input()
        self.io.cin.output()
        self.io.y.output()
        self.assign(self.io.cin, self.io.cin_old)
        self.assign(self.io.y, self.io.cin)

# Generate the testbench.
tb = Test()
write_verilog('test.v', tb)

# Generate test vectors.
with open('test_testvectors.txt', 'w') as f:
    f.write('x1 x2 cin_old cin y \n')
    f.write('0 0 0 0 0 \n')
    f.write('0 0 0 1 1 \n')
    f.write('0 1 0 1 1 \n')
    f.write('1 0 1 1 1 \n')
    f.write('1 1 1 0 0 \n')

# Generate the script for yosys.
write_tcl('run_yosys.tcl', ['read_verilog test.v',
                           'synth',
                           'report -assert'])

# Finally run the test.
subprocess.run(['yosys', 'run_yosys.tcl'])## Running py-verilog Test

Next, we create a script called `run_test.py` with the following code.import os
import sys
import re
import subprocess

# Create the testbench module.
from symbiyosys.module import Module
from symbiyosys.stratixiv import StratixIV
from symbiyosys.write_verilog import write_verilog
from symbiyosys.write_xdc import write_xdc
from symbiyosys.write_sdf import write_sdf
from symbiyosys.write_synth_constraints import write_synth_constraints

from symbiyosys.write_scf import write_scf
from symbiyosys.write_tcl import write_tcl
from symbiyosys.write_xdc import write_xdc
from symbiyosys.write_xdc import write_xdc

from symbiyosys.write_scf import write_scf
from symbiyosys.write_tcl import write_tcl
from symbiyosys.write_xdc import write_xdc
from symbiyosys.write_xdc import write_xdc

class Test(Module):

    def generate(self):
        self.io.x.output()
        self.io.cin_old.input()
        self.io.cin.output()
        self.io.y.output()
        self.assign(self.io.cin, self.io.cin