module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
wire g_r, h_r, f_r;
struct rand {
rand();
reg g_r, h_r, f_r;
always @(x1 or x2 or x3 or x4) begin
g_r <= (x1 & x3) | (x2 & x4);
h_r <= (x1 | x3) & (x2 | x4);
f_r <= g_r | h_r;
end
assign f = f_r;
endmodule
### Explanation:
In this program, we can see that the output f is simply the sum of g and h. Thus to test the behaviour of the output f, we need to provide a test case where g and h are different from each other. As g and h are random variables, we can specify it as an input parameter to the test harness. We can use the following code to assign an input parameter to a module called example4.
### Test Harness:
def test_example4():
dut = example4(x1=5, x2=6, x3=11, x4=12)
def setup():
yield dut.x1.next, 5
yield dut.x2.next, 6
yield dut.x3.next, 11
yield dut.x4.next, 12
def test():
yield dut.g.next, 4
yield dut.h.next, 3
yield dut.f.expect, 7
run_ simulation()

There are some limitations in using the structure in this case, however, we can create this structure by using a structural replacement rule. In case we want a random variable to be a structural member, we need to declare them as wire.

### Exercise 1

Write a structural replacement rule that generates a random variable for each structural member.

• The structural replacement rule should be called rand_member.
• It should take in a module as the first argument and a structure as the second argument.
• It should create a wire variable that is called rand_member and should be of the same type and size of the structure member.
• The value of rand_member should be random.
• It should assign the value of the rand_member to the structure member and should be a blocking assignment.
import pyverilog.vparser.parser as parser
import pyverilog.vpgen.random as random
import random
from collections import OrderedDict
def rand_member(module, structure):
random_var = random.random_wire(structure)
return (random_var, random_var.type, random_var.bits)

The module should have one structural member rand_member and we can test it as the following.
from random import randint
def test():
yield dut.rand_member.next, 5
yield dut.rand_member.expect, 5
yield dut.rand_member.next, 6
yield dut.rand_member.expect, 6
run_simulation()

Similar to what we have done before, we can also create a function that generates random wires of all the structural members in the module and assign them to the outputs of the module so that we can test the outputs.

### Exercise 2

Write a structural replacement rule that generates random wires for all the structural members and assigns it to the outputs of a module.

• The structural replacement rule should be called rand_module.
• It should take in a module as the first argument and it should not take in a structure as the second argument.
• It should return a dictionary of wires as the outputs.
def rand_module(module):
wire_dict = OrderedDict()
for name, member in module.structural.items():
wire_dict[name] = rand_member(module, member)
return wire_dict

The module should have three structural members rand_member, rand_module, and rand_struct. We can test it as the following.
def setup():
yield dut.rand_module.next, 4
yield dut.rand_struct.next, 3
yield dut.rand_member.expect, 4
yield dut.rand_struct.expect, 3

The module that we use for testing should be defined as the following.
module test(rand_module, rand_struct, rand_member);
input rand_module;
input rand_struct;
input rand_member;
wire rand_module;
wire rand_struct;
wire rand_member;
assign rand_module = rand_module;
assign rand_struct = rand_struct;
assign rand_member = rand_member;
endmodule

The test harness should be defined as the following.
def test():
dut = test(rand_module=1, rand_struct=2, rand_member=3)
yield dut.rand_module.expect, 1
yield dut.rand_struct.expect, 2
yield dut.rand_member.expect, 3
run_simulation()

To test the behaviour of the module test, we can run it.

### Exercise 3

Write a structural replacement rule that generates a random variable for each structure member and assigns it to the inputs of a module.

• The structural replacement rule should be called rand_struct.
• It should take in a module as the first argument and a structure as the second argument.
• It should create a wire variable that is called rand_struct and should be of the same type and size of the structure member.
• The value of rand_struct should be random.
• It should assign the value of the rand_struct to the structure member and should be a blocking assignment.
def rand_struct(module, structure):
random_var = random.random_wire(structure)
return (random_var, random_var.type, random_var.bits)

The module should have one structural member rand_member and we can test it as the following.
def test():
dut = test(rand_module=1, rand_struct=2, rand_member=3)
yield dut.rand_module.expect, 1
yield dut.rand_struct.expect, 2
yield dut.rand_member.expect, 3
run_simulation()

The module that we use for testing should be defined as the following.
module test(rand_module, rand_struct, rand_member);
input rand_module;
input rand_struct;
input rand_member;
wire rand_module;
wire rand_struct;
wire rand_member;
assign rand_module = rand_module;
assign rand_struct = rand_struct;
assign rand_member = rand_member;
endmodule

The test harness should be defined as the following.
def test():
dut = test(rand_module=1, rand_struct=2, rand_member=3)
yield dut.rand_module.expect, 1
yield dut.rand_struct.expect, 2
yield dut.rand_member.expect, 3
run_simulation()

To test the behaviour of the module test, we can run it.

There is a limitation in the way we have created these functions. To test the behaviour of a module that has a structural member, we need to assign it to a wire. However, if we have a random variable as the structural member, the assignment will not be a blocking assignment. A structural member is a random variable that is assigned to the structural member. So we need to create a function that returns a blocking assignment instead of a random variable.

### Exercise 4

Modify the function rand_member to create a blocking assignment.

• The blocking assignment should be created by using a structural replacement rule called rand_member_assign.
• It should take in a module as the first argument and a structure as the second argument.
• It should create a wire variable and assign the value of the rand_member to it.
• It should assign the value of the assigned wire to the structure member.
• The function should return the assigned wire.
import pyverilog.vparser.parser as parser
import pyverilog.vpgen.random as random
import random
from collections import OrderedDict
def rand_member_assign(module, structure):
assign_wire = random.random_wire(structure)
assign_wire.assign_to(structure)
return assign_wire

The module should have one structural member rand_member and we can test it as the following.
def test():
dut = test(rand_module=1, rand_struct=2, rand_member=3)
yield dut.rand_module.expect, 1
yield dut.rand_struct.expect, 2
yield dut.rand_member.expect, 3
run_simulation()

The module that we use for testing should be defined as the following.
module test(rand_module, rand_struct