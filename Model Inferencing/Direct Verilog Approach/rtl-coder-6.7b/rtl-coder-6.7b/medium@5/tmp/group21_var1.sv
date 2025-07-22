module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  initial
    in =1'b1; // Start with input high -> output low
  always
  initial $monitor($time, " in = %b, output = %b ",in,out);
  initial #15 $stop; // Stop simulation
endmodule
/test.py
# -*- coding: utf-8 -*-

import os
import sys
import re
import shutil
import time
import subprocess
import argparse
import numpy as np
import random
import shutil
import multiprocessing 

from collections import deque

def create_parser():
    parser = argparse.ArgumentParser(description='Tool for performing variation testing')
    parser.add_argument("-c", "--code", default="", nargs='?', help="The code to perform variation testing on.  Can be a single file or a folder contain multiple files.")
    parser.add_argument("-d", "--directory", nargs='?', default="", help="Directory where the code is located.")
    parser.add_argument("-s", "--seed", nargs='?', default=0, help="Seed to use for generating variations.")
    parser.add_argument("-n", "--num_in_variations", nargs='?', default=50, help="Number of variations to generate.")
    parser.add_argument("-m", "--multicore", nargs='?', default=False, help="Use multicore processing.")
    parser.add_argument("-w", "--variation_file", nargs='?', default="variations.txt", help="File to write variations to.")
    parser.add_argument("-s1", "--start", nargs='?', default=None, help="Start variation processing from a variation number.")
    parser.add_argument("-e", "--end", nargs='?', default=None, help="End variation processing at a variation number.")
    parser.add_argument("-p", "--parallel", nargs='?', default=False, help="Run multiple processes.")
    parser.add_argument("-th", "--thread", nargs='?', default=1, help="Number of processes to run.  Use with --parallel") 
    parser.add_argument("-r", "--run_test", nargs='?', default="run_test.py", help="Script to run against the individual variation.")
    return parser

def get_code(file, directory):
    # Get the file to perform the variation test on.
    if len(file) == 0:
        if directory == "":
            print("No code and no directory given.")
            sys.exit()
        elif os.path.isdir(directory):
            # Get all the files in directory
            file_list = []
            for root, dirs, files in os.walk(directory):
                for name in files:
                    # Check if the file ends with.v or.sv
                    if re.match("(.*)\.(sv|v)$", name)!= None:
                        file_list.append(os.path.join(root, name))
            if len(file_list) == 0:
                print("No valid files found in directory.")
                sys.exit()
            file = random.choice(file_list)
        else:
            print("No valid code file given.")
            sys.exit()
    return file

def get_directory(file):
    # Get the directory containing the code to perform the variation test on.
    if len(file) == 0:
        print("No directory given.")
        sys.exit()
    else:
        directory = os.path.dirname(file)
    return directory

def main():
    # Create the parser
    parser = create_parser()
    # Parse the arguments
    args = parser.parse_args()
    # Get the code file to perform the variation test on
    file = args.code
    directory = args.directory
    # Validate user arguments
    if len(directory) == 0 and len(file) == 0:
        print("Error: Either code or directory must be provided.")
        return
    if len(directory) > 0 and len(file) > 0:
        print("Error: Code and directory may not be provided at the same time.")
        return
    # Get the directory of the code to perform the variation test.
    directory = get_directory(file)
    # Get the code file to perform the variation test on
    file = get_code(file, directory)
    # Get the starting point to test from
    start = int(args.start) if args.start!= None else 0
    # Get the ending point to test from
    end = int(args.end) if args.end!= None else None
    # Get the number of variations to generate
    num_in_variations = int(args.num_in_variations)
    # Determine the random seed for the variations
    seed = int(args.seed)
    np.random.seed(seed)
    random.seed(seed)
    # Create the variations.txt file
    variation_file = args.variation_file
    variation_file = os.path.abspath(os.path.join(directory, variation_file))
    with open(variation_file, "w") as f:
        # Write the code at the beginning of the variations.txt file
        if len(file) > 0:
            f.write("File: {0}\n".format(file))
        f.write("\n")
    # Run the test for each variation
    # Get the code to run
    run_test = args.run_test
    # Get whether or not to use multicore processing
    multicore = bool(args.multicore)
    # Get whether or not to run in parallel
    parallel = args.parallel
    # Get the number of parallel processes to use.
    thread =