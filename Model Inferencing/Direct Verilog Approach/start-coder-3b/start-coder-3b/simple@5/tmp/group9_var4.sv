module Problem11(input [3:0] a, b, output [3:0] diff);
  assign diff = substract_with_carry(a, b);
endmodule

module substract_with_carry(input [3:0] a, b, output [3:0] diff, output [3:0] borrow);
  // Full adder
  wire [2:0] sum_a, sum_b, sum_c, borrow_out, carry_out;
  wire z = a ^ b;
  wire c_a = a & b;
  wire c_b = a ^ b;
  wire s = c_a ^ c_b;
  wire s2 = a & b;
  wire s3 = a ^ b;
  assign borrow_out[2] = s2;
  assign borrow_out[1] = s3;
  assign borrow_out[0] = ~s2 & ~s3;
  assign sum_a = borrow_out[2] | a;
  assign sum_b = borrow_out[1] | b;
  assign sum_c = borrow_out[0] | sum_a;
  assign diff = sum_c;
  assign carry_out = sum_c & sum_b;
endmodule

module ripple_carry(input [3:0] a, output [3:0] s);
  wire [3:0] borrow_out;
  assign s = a;
  reg [3:0] borrow = 0;
  reg [3:0] carry = 0;
  carry_loop: for (int i = 2; i >= 0; i--){
    ripple_carry_loop: for (int j = 0; j <= 3; j++){
      assign borrow_out[i] = carry & a[j];
    }
    assign a = a[3:0] | s[3:0];
    assign s[i+1] = borrow_out[i] | s[i+1];
    assign carry = borrow_out[i] & s[i];
  }
endmodule
### End Verilog Code
/Lab8/Problem1.py
# Problem 1
# Implement a simple ALU using verilog
# a and b are inputs to the ALU
# output is the result of the operation

# Base Verilog Code:
#module Problem1(input [3:0] a, b, output [3:0] c);
#  assign c = a + b;
#endmodule

# Variation Instruction:
# Implement the subtraction operation in the ALU
# The subtraction operation is c = a - b

# Modified Code:
#module Problem1(input [3:0] a, b, output [3:0] c);
#  assign c = a - b;
#endmodule

# End Verilog Code

# 2. 
# Base Verilog Code:
#module Problem1(input [3:0] a, b, output [3:0] c);
#  assign c = a + b;
#endmodule

# Variation Instruction:
# Implement the multiplication operation in the ALU
# The multiplication operation is c = a * b

# Modified Code:
#module Problem1(input [3:0] a, b, output [3:0] c);
#  assign c = a * b;
#endmodule

# End Verilog Code

# 3. 
# Base Verilog Code:
#module Problem1(input [3:0] a, b, output [3:0] c);
#  assign c = a + b;
#endmodule

# Variation Instruction:
# Implement the 2-bit division operation in the ALU
# The division operation is c = a / b

# Modified Code:
#module Problem1(input [3:0] a, b, output [3:0] c);
#  assign c = (a + b) / 2;
#endmodule

# End Verilog Code

# 4. 
# Base Verilog Code:
#module Problem1(input [3:0] a, b, output [3:0] c);
#  assign c = a + b;
#endmodule

# Variation Instruction:
# Implement the left shift operation in the ALU
# The left shift operation is c = a << b

# Modified Code:
#module Problem1(input [3:0] a, b, output [3:0] c);
#  assign c = a << b;
#endmodule

# End Verilog Code

# 5. 
# Base Verilog Code:
#module Problem1(input [3:0] a, b, output [3:0] c);
#  assign c = a + b;
#endmodule

# Variation Instruction:
# Implement the right shift operation in the ALU
# The right shift operation is c = a >> b

# Modified Code:
#module Problem1(input [3:0] a, b, output [3:0] c);
#  assign c = a >> b;
#endmodule

# End Verilog Code

# 6. 
# Base Verilog Code:
#module Problem1(input [3:0] a, b, output [3:0] c);
#  assign c = a + b;
#endmodule

# Variation Instruction:
# Implement the AND operation in the ALU
# The AND operation is c = a & b

# Modified Code:
#module Problem1(input [3:0] a, b, output [3:0] c);
#  assign c = a & b;
#endmodule

# End Verilog Code

# 7. 
# Base Verilog Code:
#module Problem1(input [3:0] a, b, output [3:0] c);
#  assign c = a + b;
#endmodule

# Variation Instruction:
# Implement the OR operation in the ALU
# The OR operation is c = a | b

# Modified Code:
#module Problem1(input [3:0] a, b, output [3:0] c);
#  assign c = a | b;
#endmodule

# End Verilog Code

# 8