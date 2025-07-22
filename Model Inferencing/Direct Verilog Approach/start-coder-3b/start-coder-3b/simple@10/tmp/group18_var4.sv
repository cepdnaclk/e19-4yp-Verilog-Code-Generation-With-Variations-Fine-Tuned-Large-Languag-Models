module show_cc(ao,ai,bo,bi); // NOT gate with delay 2
  output ao; input ai; output bo; input bi;
  wire [7:0] packed_ai; assign packed_ai = ai;
  wire [7:0] packed_bi; assign packed_bi = bi;
  not #2 (ao,packed_ai);
  not #2 (bo,packed_bi);
endmodule
/README.md
# 121_hw5

**Authors:**,, 

**Files:**

* [tests.v](tests.v): contains the instruction set and logic to run each instruction
* [test_scripts/test_all.tcl](test_scripts/test_all.tcl): contains the script that tests every test
* [test_scripts/test_all_sim.tcl](test_scripts/test_all_sim.tcl): contains the script that runs the test simulations
* [test_scripts/test_all_mem.tcl](test_scripts/test_all_mem.tcl): contains the script that runs the test memories
* [test_scripts/test.tcl](test_scripts/test.tcl): a script that runs the test simulation for a single test
* [test_scripts/run_all.sh](test_scripts/run_all.sh): a script that runs the test simulation for all tests
* [test_scripts/run_mem_all.sh](test_scripts/run_mem_all.sh): a script that runs the test memory for all tests
* [test_scripts/run_sim_all.sh](test_scripts/run_sim_all.sh): a script that runs all tests
* [test_scripts/run_all_and_mem.sh](test_scripts/run_all_and_mem.sh): a script that runs all tests and their memories
* [test_scripts/runmem.sh](test_scripts/runmem.sh): a script that runs all tests' memories
* [test_scripts/runsim.sh](test_scripts/runsim.sh): a script that runs all tests' memories

**Instructions:**

* To run the test, enter `bash <script_name>` (or `bash run_all.sh` with the `.sh` extensions removed). 
* To run only the test script, just enter `bash test.tcl` (or `bash test.tcl` with the `.tcl` extensions removed) with the name of the test in the `test.tcl`. The test scripts will be located in the `test_scripts` folder. 
* To run the test simulations, enter `bash run_sim_all.sh` (or `bash run_sim_all.sh` with the `.sh` extensions removed).
* To run the test memories, enter `bash run_mem_all.sh` (or `bash run_mem_all.sh` with the `.sh` extensions removed).
* To run the test simulations and memories, enter `bash run_all_and_mem.sh` (or `bash run_all_and_mem.sh` with the `.sh` extensions removed).
* To run all tests except the memories, enter `bash run_all.sh` (or `bash run_all.sh` with the `.sh` extensions removed).
* To run all memories except the tests, enter `bash runmem.sh` (or `bash runmem.sh` with the `.sh` extensions removed).
* To run the tests' memories, enter `bash run_all_mem.sh` (or `bash run_all_mem.sh` with the `.sh` extensions removed).
* To run the tests' simulations, enter `bash run_all_sim.sh` (or `bash run_all_sim.sh` with the `.sh` extensions removed).

**Notes:**

* The test cases are in the `test_scripts` folder. To run a simulation, you can copy/paste the base simulation code in `test_scripts/test_mem_base.v` into a new file. To run a memory, you can copy/paste the base memory code in `test_scripts/test_mem_base.v` into a new file.
* Each test case is in a `test_<test_type>.v` file.
* You can comment out a test case by putting a `/*` before and after the test case in the `tests.v` file.