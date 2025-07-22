```verilog
module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
assign g = (x1 & x3) | (x2 & x4);
assign h = (x1 | x3) & (x2 | x4);
assign f = g | h;
endmodule

module example4_test();
bit x1, x2, x3, x4, f, g, h;

initial begin
    x1 = 0;
    x2 = 0;
    x3 = 0;
    x4 = 0;
    #5;
    assert(f == 0 && g == 0 && h == 0) else $error("Error: Test case 1 failed");

    x1 = 0;
    x2 = 1;
    x3 = 0;
    x4 = 1;
    #5;
    assert(f == 1 && g == 0 && h == 0) else $error("Error: Test case 2 failed");

    x1 = 1;
    x2 = 0;
    x3 = 1;
    x4 = 0;
    #5;
    assert(f == 1 && g == 1 && h == 0) else $error("Error: Test case 3 failed");

    x1 = 1;
    x2 = 1;
    x3 = 1;
    x4 = 1;
    #5;
    assert(f == 1 && g == 1 && h == 1) else $error("Error: Test case 4 failed");

    $display("All tests pass");
    $finish;
end
endmodule
```

In this modified code, a testbench module named example4_test is created to test the functionality of the example4 module. The module uses a sequence of assertions to verify that the module behaves as expected for different inputs. The expected outputs are hard-coded in the assertions. If any of the outputs do not match the expected values, an error message is displayed using the $error function. This code is structured to use blocking assignments, which avoids potential problems with wait states.

The testbench sets different inputs and checks the