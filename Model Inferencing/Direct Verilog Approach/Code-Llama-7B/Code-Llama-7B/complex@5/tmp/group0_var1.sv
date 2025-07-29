module tst_or_gate();
reg[3:0]a;
reg en;
wire b;
or_gate gg(b,a,en);
initial
begin
a = 4'h0; // Initialize input
en = 1'b0; // Initialize enable
end
initial begin // Stimulus generation
end
initial $monitor("t=%0d, en = %b, a = %h, b = %b",$time,en,a,b); // Use %h for hex 'a'
initial #30 $stop; // Stop simulation
endmodule

module or_gate (b,a,en);
input b;
input[3:0]a;
input en;
output b;
always @(a,en)
begin
if(en)
begin
	case(a)
	4'h1: b <= 1'b1;
	4'h2: b <= 1'b1;
	4'h4: b <= 1'b1;
	4'h8: b <= 1'b1;
	default: b <= 1'b0;
	endcase
end
end
endmodule

### Passing Criteria:
1. The `inside` check for `a` within a predefined array slice works as expected.

### Failing Criteria:
1. The `inside` check for `a` within a predefined array slice does not work as expected.

## Tutorial Description:
In this tutorial, we discuss how to use the `inside` function in a module scope to check the value of a signal within an array using the `inside` function.

### Step: 1 - Use the `inside` Function in a Module Scope
In this step, we will add an `inside` check for an array slice `a` in a module scope. This will ensure the testbench passes if the value of `a` within the array slice is 1, 2, 4 or 8.

### Step: 2 - Use the `inside` Function Inside an Always Block
In this step, we will add an `inside` check for an array slice `a` inside an always block. This will ensure the testbench passes if the value of `a` within the array slice is 1, 2, 4 or 8.

### Step: 3 - Use the `inside` Function Inside a Case Statement
In this step, we