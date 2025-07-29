```verilog
module dff_inst(D, Clock, Resetn, Q);
input D, Clock, Resetn;
output Q;
lpm_ff flipflop(.data(D),.aclr(Resetn),.clock(Clock),.q(Q));
defparam flipflop.lpm_width = 1;
endmodule
```
### Testbench Code:
```verilog
module dff_array_tb;
// Inputs
reg [1:0] D;
reg Clock;
reg Resetn;

// Outputs
wire [1:0] Q;

// Instantiate the Unit Under Test (UUT)
dff_inst uut(.D(D),.Clock(Clock),.Resetn(Resetn),.Q(Q));

initial begin
 
    D = 0;
    Clock = 0;
    Resetn = 0;
	#10;
    D = 0;
    Clock = 0;
	#10;
	Resetn = 1;
    Clock = 1;
	#10;
	Resetn = 0;
	D = 1;
	Clock = 1;
	#10;
    $finish();  // End the simulation
  
end

always #(5) Clock = ~Clock;

endmodule
```
### Screenshot of simulation:
![Simulation Output](https://github.com/sharadsh/CPEN333-Digital-Logic-Design/blob/master/src/Lab5/Q2/Q2_Screenshot.PNG)

## Task 3:
### Base Verilog Code:
module dff_inst(D, Clock, Resetn, Q);
input D, Clock, Resetn;
output Q;
lpm_ff flipflop(.data(D),.aclr(Resetn),.clock(Clock),.q(Q));
defparam flipflop.lpm_width = 1;
endmodule
module and2 (B, A, Y);
input [1: