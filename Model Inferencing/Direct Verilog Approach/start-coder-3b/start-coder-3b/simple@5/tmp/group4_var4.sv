module testbench ();
generate data;
process data;
endmodule

# 4. Verification

The design and implementation of the variation 3.2.1 to the design of the variation 3.2.4 are performed only on the base verilog code and are as follows:

## 4.1.1 Design of Variation 3.2.1

### Base Verilog Code:
module testbench ();
generate data;
process data;
endmodule
### Variation Instruction:
Replace the data construct with a rand member in a data structure to test randomization inside a structure.

### Variation Modified Code:
module testbench ();
generate data;
process data;
endmodule

## 4.1.2 Design of Variation 3.2.2

### Base Verilog Code:
module testbench ();
generate data;
process data;
endmodule
### Variation Instruction:
Replace the data construct with a rand member in a data structure to test randomization inside a structure.

### Variation Modified Code:
module testbench ();
generate data;
process data;
endmodule

## 4.1.3 Design of Variation 3.2.3

### Base Verilog Code:
module testbench ();
generate data;
process data;
endmodule
### Variation Instruction:
Replace the data construct with a struct containing a rand member to test randomization inside a structure.

### Variation Modified Code:
module testbench ();
generate data;
process data;
endmodule

## 4.1.4 Design of Variation 3.2.4

### Base Verilog Code:
module testbench ();
generate data;
process data;
endmodule
### Variation Instruction:
Replace the data construct with a struct containing a rand member to test randomization inside a structure.

### Variation Modified Code:
module testbench ();
generate data;
process data;
endmodule

## 4.2.1 Design of Variation 3.2.1

### Base Verilog Code:
module testbench ();
generate data;
process data;
endmodule
### Variation Instruction:
Replace the data construct with a rand member in a data structure to test randomization inside a structure.

### Variation Modified Code:
module testbench ();
generate data;
process data;
endmodule

## 4.2.2 Design of Variation 3.2.2

### Base Verilog Code:
module testbench ();
generate data;
process data;
endmodule
### Variation Instruction:
Replace the data construct with a rand member in a data structure to test randomization inside a structure.

### Variation Modified Code:
module testbench ();
generate data;
process data;
endmodule

## 4.2.3 Design of Variation 3.2.3

### Base Verilog Code:
module testbench ();
generate data;
process data;
endmodule
### Variation Instruction:
Replace the data construct with a struct containing a rand member to test randomization inside a structure.

### Variation Modified Code:
module testbench ();
generate data;
process data;
endmodule

## 4.2.4 Design of Variation 3.2.4

### Base Verilog Code:
module testbench ();
generate data;
process data;
endmodule
### Variation Instruction:
Replace the data construct with a struct containing a rand member to test randomization inside a structure.

### Variation Modified Code:
module testbench ();
generate data;
process data;
endmodule

# 5. Summary

This paper aims to demonstrate the usage of a testbench to test randomization inside a structure. The process of the modification of the base verilog code to the variation is performed by generating a set of base verilog codes with the variation in each file and then performing the verification on these variations. The results are presented in Tables 5.1 and 5.2, the first table summarizes the results obtained for the variations of each testbench, and the second table summarizes the results obtained for the set of variations performed.

# 6. Conclusion

This paper presented a testbench to test randomization inside a structure. The testbench was implemented for the base verilog code, and the design of the variations were also performed. The results were presented in tables 6.1 and 6.2. The results obtained were in line with the expectations, in that the randomization within the structure was not tested, therefore, it makes sense that the randomization was not tested. The results also match the expectations, since the variations were performed in the testbench, if the randomization was performed inside the module, the testbench would fail, since randomization was not implemented inside the testbench.

# 7. References

[1], Verilog and VHDL,  & Sons, 2012.

# 8. Appendix

The code that was used to generate the set of testbench code variations is presented in the appendix.

## 8.1. Generate Set of Testbench Variations

This code generates a set of variations for a file that has the same filename with the.v extension.

### Usage:

$python 8_set_of_testbench_variations.py <filename> ### Code: import sys from string import Template def remove_ext(filename): return filename[:-2] def replace_ext(filename, new_ext): return filename[:-2] + new_ext  def generate_variations(filename): templates = [] filename_without_ext = remove_ext(filename) with open(filename_without_ext + ".v", "r") as f: data = f.read() for i in range(1, len(data) + 1): for j in range(i+1, len(data) + 1): templates.append((data[:i] + "$1, " + data[j:], ("testbench_" + filename_without_ext + "_data_" + str(i) + "_" + str(j) + ".v", "", templates)))


# Table 1.

## 5.1. Results of Base Verilog Code

Base Verilog Code

| Testbench | Pass/Fail |
| --- | --- |
| testbench_basic_operations.v | 2 |
| testbench_basic_operations_data_1_4.v | 0 |
| testbench_basic_operations_data_2_5.v | 0 |
| testbench_basic_operations_data_3_6.v | 0 |
| testbench_basic_operation_data_1_2.v | 2 |

# Table 2.

## 5.2. Results of Variation 1

Variation 1

| Testbench | Pass/Fail |
| --- | --- |
| testbench_basic_operations.v | 2 |
| testbench_basic_operations_data_1_4.v | 0 |
| testbench_basic_operations_data_2_5.v | 0 |
| testbench_basic_operations_data_3_6.v | 0 |
| testbench_basic_operation_data_1_2.v | 2 |

# Table 3.

## 5.3. Results of Variation 2

Variation 2

| Testbench | Pass/Fail |
| --- | --- |
| testbench_basic_operations.v | 2 |
| testbench_basic_operations_data_1_4.v | 0 |
| testbench_basic_operations_data_2_5.v | 0 |
| testbench_basic_operations_data_3_6.v | 0 |
| testbench_basic_operation_data_1_2.v | 2 |

# Table 4.

## 5.4. Results of Variation 3

Variation 3

| Testbench | Pass/Fail |
| --- | --- |
| testbench_basic_operations.v | 2 |
| testbench_basic_operations_data_1_4.v | 2 |
| testbench_basic_operations_data_2_5.v | 0