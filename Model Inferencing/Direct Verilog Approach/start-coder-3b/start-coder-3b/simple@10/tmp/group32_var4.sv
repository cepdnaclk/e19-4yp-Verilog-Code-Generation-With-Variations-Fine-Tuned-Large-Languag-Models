module t_Clock_Prog ();
wire clock;

initial #100 $finish;
Clock_Prog M1 (clk);
endmodule
### Results:
![image](https://user-images.githubusercontent.com/39609900/54275994-229d3f00-45b6-11e9-9488-73316d34bf74.png)
/Vivado/Testing/Clock_Prog/Clock_Prog_0.py
#!/usr/bin/env python
# coding: utf-8

# In[1]:


# import the module
import os
import shutil
from pathlib import Path
import sys
import argparse
from math import *
import numpy as np
import pandas as pd
import re
import subprocess
import time
import collections 
from collections import OrderedDict
from datetime import datetime
from time import gmtime, strftime
import string
from scipy import stats
import random


# In[2]:


def main():

	# Initialize variables
	args = parse_args()
	print_args(args)
	project_dir = args.project_dir
	dir_name = args.dir_name
	base_proj = args.base_proj
	dir_path = str(Path(project_dir, dir_name))
	temp_verilog_path = str(Path(project_dir, base_proj.replace('.xise', '_Temp.xise')))

	print("\n\n")
	print("################################################")
	print("Running script for folder {} in directory {}".format(dir_name, project_dir))
	print("################################################")
	print("\n\n")

	# run main files
	build_temp_verilog_file(project_dir, dir_path, dir_name, base_proj, temp_verilog_path)
	run_tests(project_dir, dir_path, dir_name, base_proj, temp_verilog_path)

	# end of script
	print("\n\n")
	print("################################################")
	print("Completed running script for folder {} in directory {}".format(dir_name, project_dir))
	print("################################################")
	print("\n\n")


# In[3]:


def parse_args():
	"""Command-line interface (argument parser)."""
	parser = argparse.ArgumentParser(description='This is the command line interface for running the main script')
	parser.add_argument('-p', '--project_dir', required=True, help='The root directory for the project.')
	parser.add_argument('-d', '--dir_name', required=True, help='The name of the directory where the test files are located.')
	parser.add_argument('-b', '--base_proj', required=True, help='The base file name of the project')

	return parser.parse_args()


# In[4]:


def print_args(args):
	"""Print command line arguments."""
	print('Project directory: {}'.format(args.project_dir))
	print('Directory name: {}'.format(args.dir_name))
	print('Base file name: {}'.format(args.base_proj))


# In[5]:


def build_temp_verilog_file(project_dir, dir_path, dir_name, base_proj, temp_verilog_path):
	"""Copy base projcet to new folder with new file names and changes to base file"""
	# Make new directory
	print("Creating directory for {}/ folder".format(dir_name))
	os.mkdir(dir_path)

	# Copy base project to new folder
	shutil.copyfile(base_proj, temp_verilog_path)

	# Change file name in base verilog file
	print("Changing file name in base verilog file")
	replace_string = base_proj.replace('.xise', '_Temp')
	with open(temp_verilog_path, 'r') as input_file:
	    lines = input_file.readlines()
	with open(temp_verilog_path, 'w') as output_file:
	    for line in lines:
	        output_file.write(line.replace(base_proj, replace_string))

	print("Done changing file name in base verilog file")

	# Change directory references in base verilog file
	print("Changing directory references in base verilog file")
	with open(temp_verilog_path, 'r') as input_file:
	    lines = input_file.readlines()
	with open(temp_verilog_path, 'w') as output_file:
	    for line in lines:
	        output_file.write(line.replace('$(TOPLEVEL_PROJECT)', dir_name))

	print("Done changing directory references in base verilog file")

	# Change file name in test file
	print("Changing file names in test file")
	test_file_path = str(Path(dir_path, dir_name + '.xise'))
	with open(test_file_path, 'r') as input_file:
	    lines = input_file.readlines()
	with open(test_file_path, 'w') as output_file:
	    for line in lines:
	        output_file.write(line.replace(base_proj, replace_string))

	print("Done changing file names in test file")


# In[6]:


def run_tests(project_dir, dir_path, dir_name, base_proj, temp_verilog_path):
	"""Run tests in new folder"""
	print("Running tests in new folder")
	os.chdir(dir_path)

	# Create project name
	project_name = dir_name + "Test"

	# Run vivado
	print("Running vivado")
	os.system("vivado -mode tcl -source run_vivado_script.tcl -tclargs " + str(dir_name) + " " + str(base_proj.replace('.xise', '.srcs')) + " " + str(project_dir) + " " + str(project_name) + " ")

	# Run xvlog
	print("Running xvlog")
	os.system("xvlog -sv " + str(dir_name) + ".sv " + str(dir_name) + "_Main.v " + str(dir_name) + "_Interface.v " + str(project_name) + ".srcs " + str(project_name) + ".tcl")

	# Run xelab
	print("Running xelab")
	os.system("xelab " + str(dir_name) + "_Main " + str(dir_name) + "_Interface -l " + str(project_name) + "_log")

	# Run xsim
	print("Running xsim")
	os.system("xsim " + str(dir_name) + "_Main " + str(dir_name) + "_Interface " + str(project_name) + "_log -gui")

	# Remove project
	print("Removing project")
	os.chdir(project_dir)
	os.system("rm -r " + str(project_dir) + "/" + str(project_name))

	print("Done running tests in new folder")


# In[7]:


if __name__ == '__main__':
	main()
/Vivado/Testing/Multiport_Mux/Multiport_Mux_1.py
#!/usr/bin/env python
# coding: utf-8

# In[1]:


# import the module
import os
import shutil
from pathlib import Path
import sys
import argparse
from math import *
import numpy as np
import pandas as pd
import re
import subprocess
import time
import collections 
from collections import OrderedDict
from datetime import datetime
from time import gmtime, strftime
import string
from scipy import stats
import random


# In[2]:


def main():

	# Initialize variables
	args = parse_args()
	print_args(args)
	project_dir = args.project_dir
	dir_name = args.dir_name
	base_proj = args.base_proj
	dir_path = str(Path(project_dir, dir_name))
	temp_verilog_path = str(Path(project_dir, base_proj.replace('.xise', '_Temp.xise')))

	print("\n\n")
	print("################################################")
	print("Running script for folder {} in directory {}".format(dir_name, project_dir))
	print("################################################")
	print("\n\n")

	# run main files
	build_temp_verilog_file(project_dir, dir_path, dir_name, base_proj, temp_verilog_path)
	run_tests(project_dir, dir_path, dir_name, base