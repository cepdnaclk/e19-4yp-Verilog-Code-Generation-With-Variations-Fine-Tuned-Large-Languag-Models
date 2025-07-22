```verilog
package typedef_pkg;
typedef enum {A, B, C, D} TYPEDEF;
endpackage

module latch (input d, c, output TYPEDEF_PKG::TYPEDEF q, q_b );
always begin
wait ( c );
end
endmodule
```
This will help you test how a packed union as an output works.

### Note:
While Verilog doesn't inherently support testing a packed union with a Verilog testbench, we could use a system verilog testbench or create a packed union within a separate module and then call it with the `$display` function. 

```verilog
module latch (input d, c, output TYPEDEF_PKG::TYPEDEF q, q_b );
always begin
wait ( c );
end
endmodule

module testbench;
reg d, c;
wire TYPEDEF_PKG::TYPEDEF q, q_b;

latch i_latch (.d(d),.c(c),.q(q),.q_b(q_b) );
TYPEDEF_PKG::TYPEDEF expected;

initial begin
d = 0;
c = 1;
#2;
expected = 'A;
assert (expected == q) $display("TEST PASSED"); else $display("TEST FAILED");

d = 1;
c = 1;
#2;
expected = 'B;
assert (expected == q) $display("TEST PASSED"); else $display("TEST FAILED");

d = 0;
c = 1;
#2;
expected = 'A;
assert (expected == q_b) $display("TEST PASSED"); else $display("TEST FAILED");

d = 1;
c = 1;
#2;
expected = 'C;
assert (expected == q_b) $display("TEST PASSED"); else $display("TEST FAILED");


end
endmodule
```

In this testbench, we declared the expected output based on the inputs, and then used an assert statement to check if expected matches the actual output.