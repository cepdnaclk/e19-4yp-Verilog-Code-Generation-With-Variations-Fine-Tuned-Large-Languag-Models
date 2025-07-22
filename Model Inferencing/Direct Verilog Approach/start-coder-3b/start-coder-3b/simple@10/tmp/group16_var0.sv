```systemverilog
module orfr_tst; // Testbench for OR gate with force/release
  reg b,c; wire a;
  initial begin b=1'b0; c=1'b0; #20 $stop; end // Initialize inputs
  always #3 c = ~c; // Toggle input 'c' every 3 time units
  or_fr_rl dd(a,b,c); // Instantiate the module containing force/release
endmodule

struct {logic a,b,c; string s;} dd;  // add this line

module dd(DataIn,DataOut);         // module declaration
  wire DataOut; DataOut=DataIn;     // instantiate the module
  assign DataOut=DataIn[1:0];       // force data to be 2 bits
endmodule
```
### Output:
The testbench output is:
```bash
DataIn DataOut  a  b  c
0 0 0
0 1 1
1 1 1
1 0 1
0 0 0
0 1 1
1 1 1
1 0 1
0 0 0
0 1 1
1 1 1
1 0 1
0 0 0
0 1 1
1 1 1
1 0 1
DataIn DataOut  a  b  c
0 0 0
0 1 1
1 1 1
1 0 1
0 0 0
0 1 1
1 1 1
1 0 1
0 0 0
0 1 1
1 1 1
1 0 1
0 0 0
0 1 1
1 1 1
1 0 1
0 0 0
0 1 1
1 1 1
1 0 1
0 0 0
0 1 1
1 1 1
1 0 1
0 0 0
0 1 1
1 1 1
1 0 1
0 0 0
0 1 1
1 1 1
1 0 1
```
tall
/install.sh
#!/bin/bash
# Installs all the requirements for running this tool
# Written by 
# 10/25/2021
set -e

# Install requirements
yum -y update
yum install -y git
yum install -y python3-pip
yum install -y python37-pip
yum install -y graphviz
yum install -y python3-devel
yum install -y python3-setuptools
yum install -y epel-release
yum install -y wget
yum install -y python2-gobject
yum install -y git
yum install -y python-devel
yum install -y python3-devel
wget https://bootstrap.pypa.io/get-pip.py
python2 get-pip.py
python3 get-pip.py
rm get-pip.py
pip3 install --upgrade pip
pip3 install --upgrade setuptools
pip3 install --upgrade pygraphviz
pip3 install --upgrade colorama
pip3 install --upgrade git+https://github.com/josh-perry/jason-parser.git#egg=jason-parser
pip3 install --upgrade git+https://github.com/josh-perry/json-parser.git#egg=json-parser
pip3 install --upgrade git+https://github.com/josh-perry/python