```verilog
class c1;
rand bit x1, x2, x3, x4;
bit f, g, h;

constraint c1 {x1 dist {1'b0 := 1, 1'b1 := 3};}

function void print();
    $display("x1=%0d, x2=%0d, x3=%0d, x4=%0d, f=%0d, g=%0d, h=%0d", x1, x2, x3, x4, f, g, h);
endfunction

function void do_calc();
    g = (x1 & x3) | (x2 & x4);
    h = (x1 | x3) & (x2 | x4);
    f = g | h;
endfunction

endclass

module example4_mod(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;

c1 c1_inst;

initial begin
    c1_inst = new();
    c1_inst.randomize();
    c1_inst.print();
end

assign f = c1_inst.f;
assign g = c1_inst.g;
assign h = c1_inst.h;

endmodule
```
In this modified code, the variables x1, x2, x3, x4, f, g, and h are defined as rand members in the c1 class. The class is instantiated and randomized before printing the values. The calculated f, g, and h values will be assigned to the wires in the module example4_mod, which are connected to the class object. The do_calc function is used to calculate the values of f, g, and h. This modification allows the code to be randomized and produce different results each time it is run. 

Note: Be aware that the randomization of rand variables are very random, so the results can vary each time you run the code. The constraint c1 {x1 dist {1'b0 := 1, 1'b1 := 3};} is used to