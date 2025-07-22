module testbench ();
generate
generate struct test_struct (
rand int rand_1;
);
endgenerate
process data;
endprocess
endmodule
### Testbench Output:
testbench.cpp:5:35: error: testbench is not declared in this scope
rand int rand_1;
^
testbench.cpp:6:5: error: ‘struct’ does not name a type
struct test_struct (
^
testbench.cpp:6:7: error: ‘rand_1’ was not declared in this scope
rand_1;
^
testbench.cpp:6:9: error: ‘rand’ was not declared in this scope
int rand_1;
^
testbench.cpp:6:12: error: expected ‘;’ before ‘rand_1’
int rand_1;
^
testbench.cpp:6:14: error: expected ‘;’ before ‘(’ token
int rand_1;
^
testbench.cpp: At global scope:
testbench.cpp:6:14: error: expected primary-expression before ‘)’ token
int rand_1;
^
testbench.cpp:6:14: error: expected ‘)’ before ‘;’ token
int rand_1;
^
testbench.cpp:6:14: error: expected ‘;’ before ‘)’ token
int rand_1;
^
testbench.cpp:6:26: error: expected ‘)’ before ‘)’ token
int rand_1;
^
testbench.cpp: At global scope:
testbench.cpp:6:26: error: expected ‘)’ before ‘)’ token
int rand_1;
^
testbench.cpp:6:26: error: expected primary-expression before ‘)’ token
int rand_1;
^
testbench.cpp:6:42: error: expected ‘;’ before ‘(’ token
int rand_1;
^
testbench.cpp:6:43: error: expected primary-expression before ‘;’ token
int rand_1;
^
testbench.cpp:6:43: error: expected ‘;’ before ‘)’ token
int rand_1;
^
testbench.cpp:6:43: error: expected ‘;’ before ‘(’ token
int rand_1;
^
testbench.cpp:6:68: error: expected primary-expression before ‘;’ token
int rand_1;
^
testbench.cpp:6:68: error: expected ‘;’ before ‘)’ token
int rand_1;
^
21 errors generated.
### Verilog Test Output:
Verilog syntax check failed

[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 160 found, but not used
[Warning 191]: Variable 64 found, but not used
[Warning 191]: Variable 64 found, but not used
[Warning 191]: Variable 64 found, but not used
[Warning 191]: Variable 64 found, but not used
[Warning 191]: Variable 64 found, but not used
[Warning 191]: Variable 64 found, but not used
[Warning 191]: Variable 64 found, but not used
[Warning 191]: Variable 64 found, but not used
[Warning 191]: Variable 64 found, but not used
[Warning 191]: Variable 64 found, but not used
[Warning 191]: Variable 64 found, but not used
[Warning 191]: Variable 64 found, but not used
[Warning 191]: Variable 64 found, but not used
[Warning 191]: Variable 64 found, but not used
[Warning 191]: Variable 64 found, but not used
[Warning 191]: Variable 64 found, but not used
[Warning 191]: Variable 64 found, but not used
[Warning 191]: Variable 64 found, but not used
[Warning 191]: Variable 64 found, but not used
[Warning 191]: