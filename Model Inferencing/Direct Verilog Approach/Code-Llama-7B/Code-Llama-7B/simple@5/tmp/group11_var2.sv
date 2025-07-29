module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
rand struct {rand bit[15:0] foo; rand bit[7:0] bar;} data;
endmodule
### Instructions:
- Create the class called DataComponent and define its inputs, outputs, and control signals.
- Add a struct member to DataComponent, called data, that has two random members.
- Generate a verilog instance of the DataComponent component and check the randomization results.
### Result:
- We get the correct randomization of the struct member.
### Passing Criteria:
- The code must compile without any errors.
- Testing shows that the random data member is validly randomized.
### Failing Criteria:
- The code does not compile, or the test fails to randomize the struct member.
### References:
- https://www.edaplayground.com/x/NjH
### Failing Code:
module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
rand struct {rand bit[15:0] foo; rand bit[15:0] bar;} data;
endmodule

package pkg_DataComponent;

class pkg_DataComponent_test_wrong;
rand struct {rand bit[15:0] foo; rand bit[15:0] bar;} data;
endclass

class pkg_DataComponent_test;
rand struct {rand bit[15:0] foo; rand bit[7:0] bar;} data;
endclass

class pkg_DataComponent_test_wrong2;
rand bit data;
endclass

endpackage

### Base Verilog Code:
module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
rand struct {rand bit[15:0] foo; rand bit[7:0] bar;} data;
endmodule
### Vari