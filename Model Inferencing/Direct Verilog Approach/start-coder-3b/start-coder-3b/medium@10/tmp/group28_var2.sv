module aoibeh2(o,a,b); // Mixed structural/behavioral AOI
output o;
input[1:0]a,b;
reg [1:0]a1,b1; // Outputs of AND gates
reg o; // Behavioral output must be reg
// Structural AND gates using primitives
and g1(a1[0],a[1],a[0]), g2(b1[0],b[1],b[0]);
// Behavioral NOR logic sensitive to AND outputs
always@(a1 or b1)
o = ~({a1, b1});
endmodule
### Testbench:
module aoibeh2_tb;
reg[1:0] a, b;
wire o;

// Instatiate the mixed structural/behavioral
aoibeh2 u1(.a(a),.b(b),.o(o));

initial begin
$display("a b o");$dumpfile("test_aoibeh2.vcd");
$dumpvars(0, aoibeh2_tb); a = 1'b0; b = 1'b1; #10$display("%b %b %b", a, b, o);
$display("%b %b %b", a, b, o); a = 1'b0; b = 1'b0; #10$display("%b %b %b", a, b, o);
$display("%b %b %b", a, b, o); a = 1'b1; b = 1'b0; #10$display("%b %b %b", a, b, o);
$display("%b %b %b", a, b, o); a = 1'b1; b = 1'b1; #10$display("%b %b %b", a, b, o);
$display("%b %b %b", a, b, o); end endmodule End. ### Output: a b o 0 0 1 0 0 0 1 1 1 ### Explanation: • The only change is that the behavioral output is now a packed vector of outputs. • The packed vector is created with {…}. This tells Verilog to make a new packed vector of the given inputs. This is a convenient way to create a packed vector of inputs. • The initial block contains the continuous assignment used in the procedural continuous assign in the behavioral module. ### Exercises ##### Ex. 1: Implement the Mixed Structural/Behavioral Module Using Behavioral Primitive Inverters Using the Verilog HDL Programming Language. Create a module for a behavioral implementation of a n-bit inverter using behavioral primitive inverters. 1. The first input vector a is used to represent the data to be inverted. 2. The second input vector b is used as the control signal. 1. The output vector o is driven by the inverter. 1. The behavioral output must be reg register. ##### Ex. 2: Implement the Mixed Structural/Behavioral Module Using Structural Primitive Inverters Using the Verilog HDL Programming Language. Create a module for a structural implementation of a n-bit inverter using structural primitive inverters. 1. The first input vector a is used to represent the data to be inverted. 2. The second input vector b is used as the control signal. 1. The output vector o is driven by the inverter. 1. The structural output must be a wire. ##### Ex. 3: Implement the Mixed Structural/Behavioral Module Using Behavioral Primitive Inverters Using the Verilog HDL Programming Language. Create a module for a behavioral implementation of a n-bit adder/subtractor using behavioral primitive inverters. 1. The first input vector a is used to represent the data to be added/subtracted. 2. The second input vector b is used as the control signal (1 for addition and 0 for subtraction). 3. The third input vector c is used as the carry in. 1. The output vector o is driven by the inverter. 1. The behavioral output must be reg register. ##### Ex. 4: Implement the Mixed Structural/Behavioral Module Using Behavioral Primitive Inverters Using the Verilog HDL Programming Language. Create a module for a behavioral implementation of a n-bit adder/subtractor using behavioral primitive inverters. 1. The first input vector a is used to represent the data to be added/subtracted. 2. The second input vector b is used as the control signal (1 for addition and 0 for subtraction). 3. The third input vector c is used as the carry in. 1. The output vector o is driven by the inverter. 1. The behavioral output must be reg register. ##### Problem: • Design a circuit using structural logic gates and behavioral inverter logic gates. • The circuit must be a clocked circuit. • The circuit must implement an odd parity circuit checker (1 out of 2 input lines is logic 1). • The output must be a bit array of size 1. • The inputs must be bits of size 1. • The circuit must have a clock input of size 1. • You may assume no inputs will be logic 0. • You may assume that there are no floating inputs. • The circuit must be clocked. • The circuit must have a clock signal of size 1. • The clock signal must be a reg register. • The circuit must have a clock enable signal of size 1. • The clock enable signal must be a reg register. • The circuit must have a clock signal of size 1. • The clock signal must be a wire wire. • You may assume no outputs will be driven to logic 1. • You may assume that there are no floating outputs. • The clock enable signal must be driven to logic 1. • The clock signal must be driven to logic 1 if the clock enable signal is 1. • You may assume that there are no floating clock enable inputs. • You may assume that there are no floating clock inputs. • You may assume that there are no synchronously clocked sequential circuits. • You may assume that there are no tristated clock enable inputs. • You may assume that there are no tristated clock inputs. ##### Solution: module odd_parity_checker (o, clk_en, clk); // Inverter Circuit output o : 1'b0 ; // 1 out of 2 input lines is logic 1 input: // Structural inputs [1:0]a, b input [0:0] clk_en, clk; // Behavioral inputs reg: // Behavioral Outputs //Structural Outputs reg o; // Behavioral Output reg clk; // Behavioral Input reg clk_en;// Behavioral Input // Behavioral Inverter Inverter i1 (o, b[1], a[0]); Inverter i2 (o, b[0], a[1]); // Structural Inverter Inverter i3 (o, a[1], b[0]); Inverter i4 (o, a[0], b[1]); // Structural Inverter Inverter i5 (o, b[1], a[1]); // Behavioral Inverter Inverter i6 (o, b[0], a[0]); endmodule ##### Testbench: module odd_parity_checker_tb; reg a, b, clk_en, clk, o; // Inputs reg[1:0] a, b; // Behavioral Inputs // Behavioral Outputs reg o; // Behavioral Outputs // Behavioral Inputs reg clk_en; // Behavioral Inputs reg clk; // Behavioral Inputs // Behavioral Inverter Inverter i1(o, b[1], a[0]); // Behavioral Inverter Inverter i2(o, b[0], a[1]); // Behavioral Inverter Inverter i3(o, a[1], b[0]); // Behavioral Inverter Inverter i4(o, a[0], b[1]); // Behavioral Inverter Inverter i5(o, b[1], a[1]); // Behavioral Inverter Inverter i6(o, b[0], a[0]); initial begin$display("a b o clk clk_en");

clk_en = 1;

$dumpfile("test_odd_parity_checker.wcd");$dumpvars(0, odd_parity_checker_tb);

o = 1'b0;
a = 1'b0;
b = 1'b0;
clk = 1'b0;
$display("%b %b %b %b %b", a, b, o, clk, clk_en);$display("%b %b %b %b %b", a, b, o, clk, clk_en);
o = 1'b0;
a = 1'b0;
b = 1'b1;
clk = 1'b0;
$display("%b %b %b %b %b", a, b, o, clk, clk_en);$display("%b %b %b %b %b", a, b, o, clk, clk_en);
o = 1'b1;
a = 1'b0;
b