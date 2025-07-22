module aoibeh3(o,a,b); // Mixed structural/behavioral AOI
output o;
input[1:0]a,b;
wire a1,b1; // Outputs of AND gates
reg o; // Behavioral output must be reg
// Structural AND gates using primitives
and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
// Behavioral NOR logic sensitive to AND outputs
always@(a1 or b1)
begin // Procedural continuous assign
a1 = a[1];  // Pack the bitslice to a1
b1 = b[1];  // Pack the bitslice to b1
end
// Behavioral NOR logic sensitive to AND outputs
always@(a1 or b1)
o = ~(a1 || b1);
endmodule
### Comments:
The procedural continuous assigns are used to assign the outputs of the AND gates from the inputs. This can be done with a for loop.
### Test:
module aoibeh3_test;
// Instantiate top-level testbench module
// Instantiate top-level module
aoibeh3 top(o,a,b);
// Instantiate stimulus generator
gen var g;
genvar i;
// Instantiate two stimulus values
genvar i0, i1;
// Instantiate a, b signals
wire[1:0] a, b;
// Instantiate top-level testbench output
reg q;
// Instantiate an internal clock
always #5 clk = ~clk;
// Initialize internal clock to zero
initial clk = 0;
// Generate stimulus for a and b
// a and b are packed into wires
gen begin
i0 = 0;
i1 = 1;
a <= {i0,i1};
b <= {i1,i1};
end
// Initialize q to zero
initial q = 0;
// Print the initial stimulus
initial
$write("%d\n", a); // Print the initial stimulus$write("%d\n", b);
// Print the initial output
$write("%d\n", q); // Initialize testbench stimulus loop forever begin #5$finish;
end
endmodule
### Expected Output:
module aoibeh3_test;
// Instantiate top-level testbench module
// Instantiate top-level module
aoibeh3 top(o,a,b);
// Instantiate stimulus generator
gen var g;
genvar i;
// Instantiate two stimulus values
genvar i0, i1;
// Instantiate a, b signals
wire[1:0] a, b;
// Instantiate top-level testbench output
reg q;
// Instantiate an internal clock
always #5 clk = ~clk;
// Initialize internal clock to zero
initial clk = 0;
// Generate stimulus for a and b
// a and b are packed into wires
gen begin
i0 = 0;
i1 = 1;
a <= {i0,i1};
b <= {i1,i1};
end
// Initialize q to zero
initial q = 0;
// Print the initial stimulus
initial
$write("%d\n", a); // Print the initial stimulus$write("%d\n", b);
// Print the initial output
$write("%d\n", q); // Initialize testbench stimulus loop forever begin #5$finish;
end
endmodule

### Simulate Testbench

In GHDL, the simulation script is named aoibeh3_test.tcl. The script contains the following commands:
ghdl -a a