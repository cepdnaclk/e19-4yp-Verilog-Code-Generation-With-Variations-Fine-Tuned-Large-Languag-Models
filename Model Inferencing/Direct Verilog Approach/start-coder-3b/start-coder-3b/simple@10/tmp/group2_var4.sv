```Verilog
module test;
wire a;
reg y;
initial begin
    #30 y, a = 1;
end
endmodule
```

/Chapter1/README.md
# Ch1. Synchronous Signal Flow/Chapter14/README.md
# Ch14. Blocking and Nonblocking Assignments/Chapter23/README.md
# Ch23. 7 and 8-bit Logic Comparisons/README.md
# Verilog Design Examples

Example Verilog designs from the book: *Verilog HDL: A Practical Guide for Designers, Engineers, and Architects* by **
/Chapter15/README.md
# Ch15. Comparison and Arithmetic Operators/Chapter20/README.md
# Ch20. Conditional and Blocking Assignment/Chapter4/README.md
# Ch4. Logic and Truth Values/Chapter20/ex_20_8.v

// Verilog Code:
// a 20-bit unsigned integer is being multiplied with a 1-bit unsigned 
//   integer. The result is being assigned to a 40-bit unsigned integer. 
//   Show the truth table of the multiplied and assign statement.
module test(a, b, c);
input [19:0] a;
input b;
output [39:0] c;
assign c = (a * b);
endmodule

/Chapter17/README.md
# Ch17. 2-Bit 1-Wire Shift Register/Chapter18/ex_18_7.v

// Verilog Code:
// Write a verilog module that accepts two input signals, m and n, 
// and emits a single output signal, out, that is 1 when the inputs 
// are equal, and 0 if the inputs differ.
module test(m,n,out);
input m,n;
output out;
assign out = (m == n)? 1 : 0;
endmodule

/Chapter3/README.md
# Ch3. Wire and Register Declarations/Chapter19/README.md
# Ch19. 3-Bit Arithmetic/Chapter16/README.md
# Ch16. 3-Bit Comparator/Chapter10/ex_10_5.v

// Verilog Code:
// Use the Verilog conditional operator, the ternary operator,
// or the built-in function, $min($value(v), $value(w)) to find
// the