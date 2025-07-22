```verilog
module ha_8(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;

  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a, b *> ca) = dl2;
  endspecify

  // Specify parameter for logic array
  specparam logic_array<0:7> packed_logic_array_s = '0; // specify logic array for path delay s
  specparam logic_array<0:7> packed_logic_array_ca = '0; // specify logic array for path delay ca

  // Add an if statement to check whether the array index is inside of the
  // specified range list
  if((packed_logic_array_s[0] & packed_logic_array_s[1] & packed_logic_array_s[2] & packed_logic_array_s[3] & packed_logic_array_s[4] & packed_logic_array_s[5] & packed_logic_array_s[6] & packed_logic_array_s[7]) == '0) begin
    s = 0;
  end else begin
    s = 1;
  end

  if((packed_logic_array_ca[0] & packed_logic_array_ca[1] & packed_logic_array_ca[2] & packed_logic_array_ca[3] & packed_logic_array_ca[4] & packed_logic_array_ca[5] & packed_logic_array_ca[6] & packed_logic_array_ca[7]) == '0) begin
    ca = 0;
  end else begin
    ca = 1;
  end

  /*xor (s,a,b);
  and (ca,a,b);*/
endmodule
```
/labs/lab3_design/README.md
## Instructions

**Name**: **

**Description**: This repository is for the first lab in a group of lab assignments regarding the design and verification of a 4D packed logic array. The first part of this assignment involved the design and verification of an 8x8 Full Adder, which was completed on a Xilinx Artix-7 FPGA board. The following step required the verification of the 8x8 Full Adder. The final part of this lab involved the design and verification of an 8x8 Half Adder, which required the verification of several different combinational paths.

**Note**: The provided design documents were built using Xilinx ISE, and were used to build the FPGA design. A GTKWave screenshot was generated from an example simulation waveform that was executed using the provided testbench as described in the lab handout.
/.lab_autograder/lab4_design/lab4_design.py
import re

lab_dir = "lab4_design"

def main():
    global lab_dir
    
    print("Validating files for lab4_design...")
    print("")
    print("Running verification for part 1 of lab4_design...")

    # First, check that the required files have been uploaded to the lab4_design directory
    check_files(lab_dir)

    # Verify that the verilog code for the 8x8 full adder is placed in the correct file
    check_full_adder(lab_dir)

    # Verify that the verilog code for the 8x8 full adder is placed in the correct file
    check_half_adder(lab_dir)

    # Verify that the verilog code for the 8x8 full adder is placed in the correct file
    check_testbench(lab_dir)
        
    print("Verification complete.\n")

def check_files(lab_dir):
    # Check that the provided.xdc file exists
    xdc_filename = f"{lab_dir}/{lab_dir}.xdc"
    if os.path.isfile(xdc_filename):
        print("Found: {xdc_filename}")
    else:
        print(f"Required file not found at: {xdc_filename}")
        sys.exit()

    # Check that the provided.gise extension exists
    gise_filename = f"{lab_dir}/{lab_dir}.gise"
    if os.path.isfile(gise_filename):
        print("Found: {gise_filename}")
    else:
        print(f"Required file not found at: {gise_filename}")
        sys.exit()

def check_full_adder(lab_dir):
    # Check that the provided.v file exists
    full_adder_filename = f"{lab_dir}/full_adder.v"
    if os.path.isfile(full_adder_filename):
        print("Found: {full_adder_filename}")
    else:
        print(f"Required file not found at: {full_adder_filename}")
        sys.exit()

    # Check that the full_adder code in full_adder.v matches the expected output in full_adder_v_expected.txt
    full_adder_file = open(full_adder_filename, "r")
    full_adder_code = full_adder_file.read().strip()
    full_adder_file.close()

    full_adder_expected_filename = f"{lab_dir}/full_adder_v_expected.txt"
    full_adder_expected_file = open(full_adder_expected_filename, "r")
    full_adder_expected_code = full_adder_expected_file.read().strip()
    full_adder_expected_file.close()

    if full_adder_code == full_adder_expected_code:
        print("Verilog code matches expected output.")
    else:
        print("Verilog code does not match expected output.")
        print("Expected:")
        print(full_adder_expected_code)
        print("Actual:")
        print(full_adder_code)
        sys.exit()

def check_half_adder(lab_dir):
    # Check that the provided.v file exists
    half_adder_filename = f"{lab_dir}/half_adder.v"
    if os.path.isfile(half_adder_filename):
        print("Found: {half_adder_filename}")
    else:
        print(f"Required file not found at: {half_adder_filename}")
        sys.exit()

    # Check that the half_adder code in half_adder.v matches the expected output in half_adder_v_expected.txt
    half_adder_file = open(half_adder_filename, "r")
    half_adder_code = half_adder_file.read().strip()
    half_adder_file.close()

    half_adder_expected_filename = f"{lab_dir}/half_adder_v_expected.txt"
    half_adder_expected_file = open(half_adder_expected_filename, "r")
    half_adder_expected_code = half_adder_expected_file.read().strip()
    half_adder_expected_file.close()

    if half_adder_code == half_adder_expected_code:
        print("Verilog code matches expected output.")
    else:
        print("Verilog code does not match expected output.")
        print("Expected:")
        print(half_adder_expected_code)
        print("Actual:")
        print(half_adder_code)
        sys.exit()

def check_testbench(lab_dir):
    # Check that the provided.v file exists
    testbench_filename = f"{lab_dir}/testbench.v"
    if os.path.isfile(testbench_filename):
        print("Found: {testbench_filename}")
    else:
        print(f"Required file not found at: {testbench_filename}")
        sys.exit()

    # Check that the testbench code in testbench.v matches the expected output in testbench_v_expected.txt
    testbench_file = open(testbench_filename, "r")
    testbench_code = testbench_file.read().strip()
    testbench_file.close()

    testbench_expected_filename = f"{lab_dir}/testbench_v_expected.txt"
    testbench_expected_file = open(testbench_expected_filename, "r")
    testbench_expected_code = testbench_expected_file.read().strip()
    testbench_expected_file.close()

    if testbench_code == testbench_expected_code:
        print("Verilog code matches expected output.")
    else:
        print("Verilog code does not match expected output.")
        print("Expected:")
        print(testbench_expected_code)
        print("Actual:")
        print(testbench_code)
        sys.exit()

if __name__ == "__main__":
    main()
/labs/lab4_design/README.md
## Instructions

**Name**: **

**Description**: This repository is for the second lab in a group of lab assignments regarding the design and verification of a 4D packed logic array. Each part of the lab assignment had a design and verification, with the exception of