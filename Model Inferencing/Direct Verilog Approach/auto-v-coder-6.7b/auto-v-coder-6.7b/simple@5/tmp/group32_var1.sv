```verilog
module Clock_Prog (
input logic clk,
input enum {A, B} rst_n,
output logic out
);

always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        out <= 0;
    end 
    else begin
        out <=!out;
    end
end

endmodule
```
### Code Explanation:
In this code, we’ve extended the clock and reset inputs to cover enum types. 

The `Clock_Prog` module has a parameterized input named `clk`, a parameterized input named `rst_n` which is an enum type with two values: `A` and `B`. The `out` parameterized output is also defined. 

The `always_ff` block is used to describe a flip-flop that is sensitive to `clk` and `rst_n`. 

When `rst_n` is 0 (or `A`), the output `out` is set to 0. 

When `rst_n` is 1 (or `B`), the output `out` is toggled. 

In this way, we can test enum coverage in both `A` and `B` states. 

We also need to modify the testbench to give `rst_n` an initial value:
```verilog
module t_Clock_Prog ();
wire clock;
enum {A, B} resetn;

initial #100 $finish;
Clock_Prog M1 (.clk(clock),.rst_n(resetn),.out());
endmodule
```
This testbench will now handle `resetn` as an enum. 

Make sure to replace `Clock_Prog` with the module name, `clk` with the clock signal, `rst_n` with the reset signal, and `out` with the output signal. The `.clk`, `.rst_n`, and `.out` in the testbench are signals connecting the module.

For `rst_n`, we need to specify the type as enum, and then